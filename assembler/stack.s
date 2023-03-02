
ROM-OUT SP-IN 0x20 ; Pointer address register
ROM-OUT SO-IN 0x00 ; Stack offset register

; Jump to add

SO-OUT  A-IN  0xFF ; Fetch SO
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SO-IN 0xFF ; Store

ALU-OUT A-IN  0xFF ; Fetch new SO
SP-OUT  B-IN  0xFF ; Add SP
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

ROM-OUT FLAGS-IN      0x00 ; Get top address
SP-OUT  A-IN          0xFF ; Fetch SP
SO-OUT  B-IN          0xFF ; Fetch SO
ALU-OUT RAM-ADDR-U-IN 0xFF ; Add them and store in RAM address
RAM-OUT C-IN          0xFF ; Store top address in C register

ROM-OUT FLAGS-IN      0x80 ; Pop the top element of the stack
SO-OUT  A-IN          0xFF ; Fetch SO
ROM-OUT B-IN          0x01 ; Subtract one
ALU-OUT SO-IN         0xFF ; Store in SO

C-OUT   ROM-ADDR-U-IN 0xFF ; Jump back
F-OUT   JMP           0xFF




