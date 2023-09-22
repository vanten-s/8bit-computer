#!/usr/bin/python3

import sys

OUT_COMMANDS = {
        "ROM-OUT":  0x2,
        "ALU-OUT":  0x3,
        "C-OUT":    0x4,
        "D-OUT":    0x5,
        "SP-OUT":   0x6,
        "SO-OUT":   0x7,
        "RAM-OUT":  0x8,
        "NAND-OUT": 0x9,
        "NOT-OUT":  0xA,
        "AND-OUT":  0xB,
        "INST-H-O": 0xC,
        "INST-L-O": 0xD,
        "INPUT-O":  0xE,
        "F-OUT":    0xF,
}

IN_COMMANDS = {
        "A-IN":          0x0,
        "B-IN":          0x1,
        "SP-IN":         0x2,
        "SO-IN":         0x3,
        "C-IN":          0x4,
        "D-IN":          0x5,
        "RAM-ADDR-L-IN": 0x6,
        "RAM-ADDR-U-IN": 0x7,
        "RAM-IN":        0x8,
        "JMP":           0x9,
        "JC":            0xA,
        "OUTPUT-IN":     0xB,
        "ROM-ADDR-L-IN": 0xC,
        "ROM-ADDR-U-IN": 0xD,
        "FLAGS-IN":      0xE,
        "JZ":            0xF,
        "F-IN":          0x2,
}
