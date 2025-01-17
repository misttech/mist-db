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

const DotZig = @import(".zig");

pub fn build(b: *std.Build) void {
    // A compile error stack trace of 10 is arbitrary in size but helps with debugging.
    b.reference_trace = 10;

    std.log.info("Zig compiler v{s}", .{builtin.zig_version_string});
    comptime {
        if (!std.mem.eql(u8, builtin.zig_version_string, DotZig.zig_required_version)) {
            @compileError(
                "" ++
                    "mist-db requires Zig version " ++ DotZig.zig_required_version,
            );
        }
    }

    var deps = [_]*std.Build.Dependency{b.dependency("mist_db", .{})};

    for (&deps) |dep| {
        b.default_step.dependOn(dep.builder.default_step);
    }
}
