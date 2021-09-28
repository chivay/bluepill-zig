const std = @import("std");
const CrossTarget = std.zig.CrossTarget;
usingnamespace @import("stm32f103.zig");

pub const memory_map = struct {
    pub const flash = struct {
        pub const size = 128 * 1024;
        pub const offset = 0;
    };

    pub const sram = struct {
        pub const size = 20 * 1024;
        pub const offset = 0x20000000;
    };
};

pub const target = CrossTarget{
    .cpu_arch = .thumb,
    .cpu_model = CrossTarget.CpuModel{ .explicit = &std.Target.arm.cpu.cortex_m3 },
    .os_tag = .freestanding,
    .abi = .none,
};
