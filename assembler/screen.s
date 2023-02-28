
ROM-OUT FLAGS-IN      0x00    ; 01 Flags

ROM-OUT RAM-ADDR-U-IN 0x00    ; 02 X position
ROM-OUT RAM-IN        0x00    ; 03

ROM-OUT RAM-ADDR-U-IN 0x01    ; 04 Y position
ROM-OUT RAM-IN        0x00    ; 05

ROM-OUT ROM-ADDR-U-IN 0x15    ; 06 Jump to start
F-OUT   JMP           0xFF    ; 07

ROM-OUT RAM-IN        0x00    ; 08 Store 0 in X position
ROM-OUT RAM-ADDR-U-IN 0x01    ; 09 Fetch Y position
RAM-OUT A-IN          0xFF    ; 0A 
ROM-OUT B-IN          0x01    ; 0B Add 1
ALU-OUT RAM-IN        0xFF    ; 0C Store in Y position
ROM-OUT ROM-ADDR-U-IN 0x15    ; 0D 
F-OUT   JMP           0xFF    ; 0E Jump back

ROM-OUT RAM-ADDR-U-IN 0x00    ; 0F Fetch X position
RAM-OUT A-IN          0xFF    ; 10
ROM-OUT B-IN          0x01    ; 11 Add 1
ALU-OUT RAM-IN        0xFF    ; 12 store in X position
ROM-OUT ROM-ADDR-U-IN 0x07    ; 13
ROM-OUT B-IN          0xC1    ; 14 Add C1 in order to Detect things
F-OUT   JC            0xFF    ; 15 Jump to Y increment if carry

ROM-OUT OUTPUT-IN     0x00    ; 16 
ROM-OUT OUTPUT-IN     0x00+64 ; 17 Select Color

ROM-OUT RAM-ADDR-U-IN 0x01    ; 18 Select Y position
RAM-OUT OUTPUT-IN     0xFF    ; 19 Output
RAM-OUT A-IN          0xFF    ; 1A Fetch into A register
ROM-OUT B-IN          0x40    ; 1B Add 0x40 to clock the shift register
ALU-OUT OUTPUT-IN     0xFF    ; 1C Output

ROM-OUT RAM-ADDR-U-IN 0x00    ; 1D Select Y position
RAM-OUT OUTPUT-IN     0xFF    ; 1E Output
RAM-OUT A-IN          0xFF    ; 1F Fetch into A register
ROM-OUT B-IN          0x40    ; 20 Add 0x40 to clock the shift register
ALU-OUT OUTPUT-IN     0xFF    ; 21 Output

ROM-OUT OUTPUT-IN     0x80    ; 22 
ROM-OUT OUTPUT-IN     0x00    ; 23 Clock the displays clock

ROM-OUT ROM-ADDR-U-IN 0x0E    ; 24
F-OUT   JMP           0xFF    ; 25


