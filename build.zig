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
const Step = std.Build.Step;

const DotZig = @import(".zig");

pub fn build(b: *std.Build) void {
    // A compile error stack trace of 10 is arbitrary in size but helps with debugging.
    b.reference_trace = 10;

    std.log.info("Zig compiler v{s}", .{builtin.zig_version_string});
    //comptime {
    //    if (!std.mem.eql(u8, builtin.zig_version_string, DotZig.zig_required_version)) {
    //        @compileError(
    //            "" ++
    //               "mist-db requires Zig version " ++ DotZig.zig_required_version,
    //       );
    //   }
    //}

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    var version = std.SemanticVersion.parse("0.0.0-dev") catch unreachable;
    var code: u8 = undefined;
    if (b.runAllowFail(
        &.{ "git", "rev-parse", "HEAD" },
        &code,
        .Ignore,
    )) |output| {
        version.build = output[0..9];
    } else |_| {}

    const options = b.addOptions();
    options.addOption(std.SemanticVersion, "version", version);

    const mist_db = b.addModule("mist-db", .{
        .root_source_file = b.path("src/mist-db/lib/root.zig"),
        .imports = &.{
            .{ .name = "build-options", .module = options.createModule() },
        },
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addStaticLibrary(.{
        .name = "mist-db",
        .root_module = mist_db,
    });

    b.installArtifact(lib);

    const zigline = b.dependency("zigline", .{
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "mist-db",
        .root_module = blk: {
            const module = b.createModule(.{
                .root_source_file = b.path("src/mist-db/bin/cli.zig"),
                .imports = &.{
                    .{ .name = "mist-db", .module = mist_db },
                    .{ .name = "zigline", .module = zigline.module("zigline") },
                },
                .target = target,
                .optimize = optimize,
            });
            break :blk module;
        },
    });

    b.installArtifact(exe);

    // This *creates* a Run step in the build graph, to be executed when another
    // step is evaluated that depends on it. The next line below will establish
    // such a dependency.
    const run_cmd = b.addRunArtifact(exe);

    // By making the run step depend on the install step, it will be run from the
    // installation directory rather than directly from within the cache directory.
    // This is not necessary, however, if the application depends on other installed
    // files, this ensures they will be present and in the expected location.
    run_cmd.step.dependOn(b.getInstallStep());

    // This allows the user to pass arguments to the application in the build
    // command itself, like this: `zig build run -- arg1 arg2 etc`
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // This creates a build step. It will be visible in the `zig build --help` menu,
    // and can be selected like this: `zig build run`
    // This will evaluate the `run` step rather than the default, which is "install".
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    // Creates a step for unit testing. This only builds the test executable
    // but does not run it.
    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/mist-db/lib/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/mist-db/bin/cli.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    // Similar to creating the run step earlier, this exposes a `test` step to
    // the `zig build --help` menu, providing a way for the user to request
    // running the unit tests.
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&run_exe_unit_tests.step);
}
