const BusType = enum {
    AHB,
    APB1,
    APB2,
};

pub const RCC = struct {
    // 7.3.11 RCC register map
    pub const bus: BusType = .AHB;

    const base = 0x4002_1000;
    pub const CR = @intToPtr(*volatile u32, base + 0x0);
    pub const CFGR = @intToPtr(*volatile u32, base + 0x4);
    pub const CIR = @intToPtr(*volatile u32, base + 0x8);
    pub const APB2RSTR = @intToPtr(*volatile u32, base + 0xc);
    pub const APB1RSTR = @intToPtr(*volatile u32, base + 0x10);
    pub const AHBENR = @intToPtr(*volatile u32, base + 0x14);
    pub const APB2ENR = @intToPtr(*volatile u32, base + 0x18);
    pub const APB1ENR = @intToPtr(*volatile u32, base + 0x1c);
    pub const BDCR = @intToPtr(*volatile u32, base + 0x20);
    pub const CSR = @intToPtr(*volatile u32, base + 0x24);
};

pub const GPIO = struct {
    // 9.5 GPIO and AFIO register maps
    pub const bus: BusType = .APB2;

    pub const A = makePort(0x4001_0800);
    pub const B = makePort(0x4001_0C00);
    pub const C = makePort(0x4001_1000);
    pub const D = makePort(0x4001_1400);
    pub const E = makePort(0x4001_1800);
    pub const F = makePort(0x4001_1C00);
    pub const G = makePort(0x4001_2000);

    fn makePort(comptime base: usize) type {
        return struct {
            pub const CRL = @intToPtr(*volatile u32, base + 0x0);
            pub const CRH = @intToPtr(*volatile u32, base + 0x4);
            pub const IDR = @intToPtr(*volatile u32, base + 0x8);
            pub const ODR = @intToPtr(*volatile u32, base + 0xc);
            pub const BSRR = @intToPtr(*volatile u32, base + 0x10);
            pub const BRR = @intToPtr(*volatile u32, base + 0x14);
            pub const LCKR = @intToPtr(*volatile u32, base + 0x18);
        };
    }
};
