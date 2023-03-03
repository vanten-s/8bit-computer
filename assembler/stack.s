
ROM-OUT SP-IN 0x20 ; Stack pointer start address register
ROM-OUT SE-IN 0x20 ; Stack pointer end address register

; Jump to add

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN $after ; Store address of after label in ram

; Define arguments
ROM-OUT A-IN 20
ROM-OUT B-IN 2

ROM-OUT ROM-ADDR-U-IN $add
F-OUT   JMP           0xFF

after:
ROM-OUT RAM-ADDR-U-IN 0x00
RAM-OUT OUTPUT-IN     0xFF

ROM-OUT ROM-ADDR-U-IN $loop

loop:
F-OUT JMP 0xFF

add:
; Can be whatever
ROM-OUT FLAGS-IN      0x00 
ROM-OUT RAM-ADDR-U-IN 0x00
ALU-OUT RAM-IN        0xFF

; Has to be this

SE-OUT  C-IN          0xFF ; Store top address in C register
ROM-OUT RAM-IN        0x00 ; Store 0 in RAM

ROM-OUT FLAGS-IN      0x80 ; Pop the top element of the stack
SE-OUT  A-IN          0xFF ; Fetch SE
ROM-OUT B-IN          0x01 ; Subtract one
ALU-OUT SE-IN         0xFF ; Store in SE

C-OUT   ROM-ADDR-U-IN 0xFF ; Jump back
F-OUT   JMP           0xFF

