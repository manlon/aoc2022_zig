const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = trim(u8, @embedFile("data/day03.txt"), " \n");

pub fn main() !void {
    var lines = split(u8, data, "\n");
    var list = List([]const u8).init(gpa);
    while (lines.next()) |line| {
        try list.append(line);
    }
    var total_score: u32 = 0;
    for (list.items) |item| {
        var left = item[0..(item.len / 2)];
        var right = item[(item.len / 2)..];
        var common = try intersection(left, right);
        total_score += score(common[0]);
    }
    print("{d}\n", .{total_score});

    var i: usize = 0;
    total_score = 0;
    while (i < list.items.len) {
        var common = try (intersection(list.items[i + 0], list.items[i + 1]));
        common = try intersection(common, list.items[i + 2]);
        total_score += score(common[0]);
        i += 3;
    }
    print("{d}\n", .{total_score});
}

fn score(c: u8) u8 {
    if (c > 'a') {
        return c - 'a' + 1;
    } else {
        return c - 'A' + 27;
    }
}

fn intersection(s1: []const u8, s2: []const u8) ![]u8 {
    var chars = List(u8).init(gpa);
    for (s1) |c1| {
        for (s2) |c2| {
            if (c1 == c2) {
                try chars.append(c1);
            }
        }
    }
    return chars.toOwnedSlice();
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
