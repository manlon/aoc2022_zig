const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("data/day01.txt");

pub fn main() !void {
    var elves = split(u8, data, "\n\n");
    var maxes = [_]u32{ 0, 0, 0 };
    while (elves.next()) |elf| {
        var foods = tokenize(u8, elf, "\n");
        var sum: u32 = 0;
        while (foods.next()) |food| {
            sum += try parseInt(u32, food, 10);
        }
        if (sum > maxes[2]) {
            maxes[2] = sum;
            sort(u32, &maxes, {}, comptime desc(u32));
        }
    }
    var top3: u32 = 0;
    for (maxes) |m| {
        top3 += m;
    }
    print("part 1: {d}\n", .{maxes[0]});
    print("part 2: {d}\n", .{top3});
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
