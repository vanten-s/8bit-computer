
; Turn off subtract flag
ROM-OUT FLAGS-IN 0b00000000 ; 1

ROM-OUT RAM-ADDR-U-IN 0x00 ; 2 Nominator
ROM-OUT RAM-IN        0x07 ; 3
RAM-OUT C-IN          0xFF ; 4

ROM-OUT RAM-ADDR-U-IN 0x01 ; 5 Denominator
ROM-OUT RAM-IN        0x02 ; 6

ROM-OUT RAM-ADDR-U-IN 0x02 ; 7 Remainder
C-OUT   RAM-IN        0xFF ; 8

ROM-OUT RAM-ADDR-U-IN 0x03 ; 9 Quotient
ROM-OUT RAM-IN        0xFF ; A

; Loop while R >= D

ROM-OUT FLAGS-IN      0x00 ; B Turn off subtract flag

ROM-OUT B-IN          0x01 ; C Q := Q + 1
ROM-OUT RAM-ADDR-U-IN 0x03 ; D Fetch Quotient
RAM-OUT A-IN          0xFF ; E Add 1
ALU-OUT RAM-IN        0xFF ; F Store in RAM

; R := R - D
ROM-OUT FLAGS-IN      0x80 ; 10 Turn on subtract flag
ROM-OUT RAM-ADDR-U-IN 0x01 ; 11 Fetch Denominator
RAM-OUT B-IN          0xFF ; 12
ROM-OUT RAM-ADDR-U-IN 0x02 ; 13 Fetch Remainder
RAM-OUT A-IN          0xFF ; 14
ALU-OUT RAM-IN        0xFF ; 15 Store Result

ROM-OUT ROM-ADDR-U-IN 0x0A ; 17
F-OUT   JC            0xFF ; 18

ROM-OUT ROM-ADDR-U-IN 0x19 ; 19
F-OUT   JMP           0xFF ; 1A

