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
const Allocator = std.mem.Allocator;

const mist_db = @import("mist-db");

const Editor = @import("zigline").Editor;

const repl_preamble = std.fmt.comptimePrint(
    \\mist-db {[mist_db]} [Zig {[zig]}] on {[os]s}
    \\Enter ".help" for usage hints.
    \\Use {[eof]s} to exit.
    \\
, .{
    .mist_db = mist_db.version,
    .zig = builtin.zig_version,
    .os = @tagName(builtin.os.tag),
    .eof = if (builtin.os.tag == .windows) "Ctrl+Z followed by Enter" else "Ctrl+D",
});

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const stdout = std.io.getStdOut().writer();

    try stdout.writeAll(repl_preamble);

    var editor = Editor.init(allocator, .{});
    defer editor.deinit();

    while (true) {
        const source_text = editor.getLine("mist-db> ") catch |err| switch (err) {
            error.Eof => break,
            else => return err,
        };
        defer allocator.free(source_text);
    }
}
