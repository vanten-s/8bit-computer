
import sys

OUT_COMMANDS = {
        "ROM-OUT":  0x2,
        "ALU-OUT":  0x3,
        "C-OUT":    0x4,
        "D-OUT":    0x5,
        "RAM-OUT":  0x8,
        "NAND-OUT": 0x9,
        "NOT-OUT":  0xA,
        "AND-OUT":  0xB,
        "F-OUT":    0xf,
}

IN_COMMANDS = {
        "A-IN":          0x0,
        "B-IN":          0x1,
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

if len( sys.argv ) != 2:
    print( "ERROR: provide input file" )
    exit( 1 )

with open( sys.argv[1], "r" ) as f:
    lines = f.read( ).strip( ).split( "\n" )

out = b""
for line in lines:
    if ";" in line:
        line = line[ 0:line.index( ";" ) ]

    words = line.split( )
    if len( words ) != 3:
        continue

    out_command = OUT_COMMANDS[ words[0] ]
    in_command  = IN_COMMANDS [ words[1] ]
    value       = eval( words[2] )

    instruction = b""
    instruction += value.to_bytes                            ( 1, 'big' )
    instruction += ( out_command + 16 * in_command ).to_bytes( 1, 'big' )
    out += instruction

with open( "out.bin", "wb" ) as f:
    f.write( out )





