const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = trim(u8, @embedFile("data/day02.txt"), " \n");

pub fn main() !void {
    var lines = split(u8, data, "\n");
    var score_part1: u32 = 0;
    var score_part2: u32 = 0;
    while (lines.next()) |line| {
        if (line.len == 0) break;
        const abc = line[0];
        const xyz = line[2];
        switch (abc) {
            'A' => switch (xyz) {
                'X' => {
                    score_part1 += (1 + 3);
                    score_part2 += (0 + 3);
                },
                'Y' => {
                    score_part1 += (2 + 6);
                    score_part2 += (3 + 1);
                },
                'Z' => {
                    score_part1 += (3 + 0);
                    score_part2 += (6 + 2);
                },
                else => unreachable,
            },
            'B' => switch (xyz) {
                'X' => {
                    score_part1 += (1 + 0);
                    score_part2 += (0 + 1);
                },
                'Y' => {
                    score_part1 += (2 + 3);
                    score_part2 += (3 + 2);
                },
                'Z' => {
                    score_part1 += (3 + 6);
                    score_part2 += (6 + 3);
                },
                else => unreachable,
            },
            'C' => switch (xyz) {
                'X' => {
                    score_part1 += (1 + 6);
                    score_part2 += (0 + 2);
                },
                'Y' => {
                    score_part1 += (2 + 0);
                    score_part2 += (3 + 3);
                },
                'Z' => {
                    score_part1 += (3 + 3);
                    score_part2 += (6 + 1);
                },
                else => unreachable,
            },
            else => unreachable,
        }
    }
    print("part1: {}\npart2: {}\n", .{ score_part1, score_part2 });
}

// Useful stdlib functions
const tokenize = std.mem.tokenize;
const split = std.mem.split;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const min = std.math.min;
const min3 = std.math.min3;
const max = std.math.max;
const max3 = std.math.max3;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.sort;
const asc = std.sort.asc;
const desc = std.sort.desc;

// Generated from template/template.zig.
// Run `zig build generate` to update.
// Only unmodified days will be updated.
