ROM-OUT RAM-IN        0x00 ; Initialize Values
ROM-OUT RAM-ADDR-U-IN 0x01
ROM-OUT RAM-IN        0x01

ROM-OUT RAM-ADDR-U-IN 0x00 ; Load Value 0 Into A Register
RAM-OUT A-IN          0xFF 

ROM-OUT RAM-ADDR-U-IN 0x01 ; Load Value 1 Into B Register
RAM-OUT B-IN          0xFF

ROM-OUT RAM-ADDR-U-IN 0x02 ; Store ALU Value Into RAM at address 2
ALU-OUT RAM-IN        0xFF

ROM-OUT RAM-ADDR-U-IN 0x01 ; Move Value 1 into value 0
RAM-OUT C-IN          0xFF
ROM-OUT RAM-ADDR-U-IN 0x00
C-OUT   RAM-IN        0xFF

ROM-OUT RAM-ADDR-U-IN 0x02 ; Move Value 2 into value 1
RAM-OUT C-IN          0xFF
ROM-OUT RAM-ADDR-U-IN 0x01
C-OUT   RAM-IN        0xFF

ROM-OUT RAM-ADDR-U-IN 0x00 ; Load Value 0 into A register
RAM-OUT A-IN          0xFF

ROM-OUT RAM-ADDR-U-IN 0x01 ; Load Value 1 into B register
RAM-OUT B-IN          0xFF

ROM-OUT RAM-ADDR-U-IN 0x00 ; Output value 0 into output register
RAM-OUT OUTPUT-IN     0xFF 

ROM-OUT ROM-ADDR-U-IN 0x00 ; Reset if value gets to high
F-OUT   JC            0xFF

ROM-OUT ROM-ADDR-U-IN 0x03 ; Repeat
F-OUT   JMP           0xFF


