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
    const opcodes_h_f = wf.addCopyFile(opcodes_h, "gen/opcodes.h");
    const opcodes_c_f = wf.addCopyFile(opcodes_c, "gen/opcodes.c");
    wf.step.dependOn(&gen_parse_c.step);

    const parse_lib = b.addStaticLibrary(.{
        .name = "parse",
        .target = target,
        .optimize = optimize,
    });
    parse_lib.step.dependOn(&gen_parse_c.step);
    parse_lib.step.dependOn(&wf.step);
    parse_lib.addIncludePath(opcodes_h_f.dirname());
    parse_lib.addCSourceFile(.{ .file = sqlite.path("src/parse.c") });
    parse_lib.addCSourceFile(.{ .file = opcodes_c_f });

    b.installArtifact(parse_lib);
    b.installArtifact(lemon);
}
