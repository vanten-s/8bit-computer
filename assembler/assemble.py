
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

labels = { }

def parse_label( line: str, line_i: int ):
    line = line.strip( )
    if not line.endswith( ":" ): return

    labels[line[ 0:-1 ]] = line_i

    return

def parse( line: str ):
    # Parse Instruction
    if ";" in line:
        line = line[ 0:line.index( ";" ) ]

    words = line.split( )
    if len( words ) != 3:
        return b""

    out_command = OUT_COMMANDS[ words[0] ]
    in_command  = IN_COMMANDS [ words[1] ]
    try:
        value       = eval( words[2] )

    except SyntaxError:
        pass

    if words[2].startswith( "$" ):
        value = labels[ words[2][1:] ]

    print(value)

    instruction = b""
    instruction += value.to_bytes                            ( 1, 'big' )
    instruction += ( out_command + 16 * in_command ).to_bytes( 1, 'big' )

    return instruction


if len( sys.argv ) != 2:
    print( "ERROR: provide input file" )
    exit( 1 )

with open( sys.argv[1], "r" ) as f:
    lines = f.read( ).strip( ).split( "\n" )

# Preproccesing

i = 0
while i < len( lines ):
    lines[i] = lines[i].strip( )

    remove = False

    if ";" in lines[i]:
        lines[i] = lines[i][ 0 : lines[i].index( ";" ) ]

    if lines[i].startswith( ";" ): remove = True
    if lines[i] == "":             remove = True

    if lines[i].endswith( ":" ):
        parse_label( lines[i], i )
        remove = True

    if remove:
        lines.remove( lines[i] )

    else:
        i += 1

print( "\n".join( lines ) )

out = b""
for line in lines:
    instruction = parse( line )
    out += instruction

with open( "out.bin", "wb" ) as f:
    f.write( out )





