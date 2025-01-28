// Copyright 2025 Mist Tecnologia LTDA
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const sqlite = b.dependency("sqlite", .{});

    const mksourceid = b.addExecutable(.{
        .name = "mksourceid",
        .root_module = blk: {
            const module = b.createModule(.{
                .target = b.graph.host,
                .optimize = optimize,
            });
            module.addCSourceFile(.{ .file = sqlite.path("tool/mksourceid.c") });
            break :blk module;
        },
    });

    const mksqlite3h = b.addSystemCommand(&.{
        "tclsh",
        sqlite.path("tool/mksqlite3h.tcl").getPath(b),
    });
    mksqlite3h.step.dependOn(&mksourceid.step);
    mksqlite3h.addDirectoryArg(sqlite.path(""));
    mksqlite3h.setCwd(mksourceid.getEmittedBinDirectory());
    const sqlite3_h = mksqlite3h.captureStdOut();

    const mkkeywordhash = b.addExecutable(.{
        .name = "mkkeywordhash",
        .root_module = blk: {
            const module = b.createModule(.{
                .target = b.graph.host,
                .optimize = optimize,
            });
            module.addCSourceFile(.{ .file = sqlite.path("tool/mkkeywordhash.c") });
            break :blk module;
        },
    });
    const keywordhash_h = b.addRunArtifact(mkkeywordhash).captureStdOut();

    const lemon = b.addExecutable(.{
        .name = "lemon",
        .root_module = blk: {
            const module = b.createModule(.{
                .target = b.graph.host,
                .optimize = optimize,
            });
            module.addCSourceFile(.{ .file = sqlite.path("tool/lemon.c") });
            break :blk module;
        },
    });

    const gen_parse_c = b.addRunArtifact(lemon);
    gen_parse_c.addArg("-S");
    gen_parse_c.addPrefixedFileArg("-T", sqlite.path("tool/lempar.c"));
    gen_parse_c.addFileArg(sqlite.path("src/parse.y"));

    // Rules to build opcodes.c and opcodes.h
    const cat = b.addSystemCommand(&.{
        "cat",
    });
    cat.addFileArg(sqlite.path("src/parse.c"));
    cat.addFileArg(sqlite.path("src/vdbe.c"));
    const cat_file = cat.captureStdOut();

    const mkopcodesh = b.addSystemCommand(&.{
        "tclsh",
        "tool/mkopcodeh.tcl",
    });
    mkopcodesh.setCwd(sqlite.path(""));
    mkopcodesh.setStdIn(.{ .lazy_path = cat_file });
    const opcodes_h = mkopcodesh.captureStdOut();

    const mkopcodesc = b.addSystemCommand(&.{
        "tclsh",
        "tool/mkopcodec.tcl",
    });
    mkopcodesc.setCwd(sqlite.path(""));
    mkopcodesc.addFileArg(opcodes_h);
    const opcodes_c = mkopcodesc.captureStdOut();

    const wf = b.addWriteFiles();
    wf.step.dependOn(&gen_parse_c.step);
    _ = wf.addCopyFile(sqlite3_h, "gen/sqlite3.h");
    _ = wf.addCopyFile(keywordhash_h, "gen/keywordhash.h");
    const opcodes_h_f = wf.addCopyFile(opcodes_h, "gen/opcodes.h");
    const opcodes_c_f = wf.addCopyFile(opcodes_c, "gen/opcodes.c");

    const parser = b.addModule("parser", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const parse_lib = b.addStaticLibrary(.{
        .name = "parse",
        .root_module = parser,
    });
    parse_lib.step.dependOn(&gen_parse_c.step);
    parse_lib.step.dependOn(&wf.step);
    parse_lib.addIncludePath(opcodes_h_f.dirname());
    parse_lib.addIncludePath(sqlite.path("src"));
    parse_lib.addCSourceFiles(.{
        .root = sqlite.path(""),
        .files = &.{
            "src/parse.c",
            "src/tokenize.c",
        },
        .flags = &.{"-DSQLITE_PRIVATE=\"\""},
    });
    parse_lib.linkLibC();
    parse_lib.addCSourceFile(.{ .file = opcodes_c_f });

    b.installArtifact(parse_lib);

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    lib_unit_tests.step.dependOn(&gen_parse_c.step);
    lib_unit_tests.step.dependOn(&wf.step);
    lib_unit_tests.addIncludePath(opcodes_h_f.dirname());
    lib_unit_tests.addIncludePath(sqlite.path("src"));
    lib_unit_tests.addCSourceFiles(.{
        .root = sqlite.path(""),
        .files = &.{
            "src/parse.c",
            "src/tokenize.c",
            "src/global.c",
        },
        .flags = &.{"-DSQLITE_PRIVATE=\"\""},
    });
    lib_unit_tests.linkLibC();
    lib_unit_tests.addCSourceFile(.{ .file = opcodes_c_f });
    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
}
