const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = trim(u8, @embedFile("data/day04.txt"), " \n");

pub fn main() !void {
    var lines = split(u8, data, "\n");
    var count_contained: u32 = 0;
    var count_overlap: u32 = 0;
    while (lines.next()) |line| {
        var pairs = split(u8, line, ",");
        var pair1 = pairs.next().?;
        var pair2 = pairs.next().?;
        var nums1 = split(u8, pair1, "-");
        var nums2 = split(u8, pair2, "-");
        var pair1a = try parseInt(u32, nums1.next().?, 10);
        var pair1b = try parseInt(u32, nums1.next().?, 10);
        var pair2a = try parseInt(u32, nums2.next().?, 10);
        var pair2b = try parseInt(u32, nums2.next().?, 10);

        if ((pair1a <= pair2a and pair1b >= pair2b) or (pair2a <= pair1a and pair2b >= pair1b)) {
            count_overlap += 1;
        }
        if (pair1a <= pair2b and pair2a <= pair1b) {
            count_contained += 1;
        }
    }
    print("{}\n{}\n", .{ count_overlap, count_contained });
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
