
ROM-OUT FLAGS-IN      0x00    ; Flags

ROM-OUT RAM-ADDR-U-IN 0x00    ; X position
ROM-OUT RAM-IN        0x00    

ROM-OUT RAM-ADDR-U-IN 0x01    ; Y position
ROM-OUT RAM-IN        0x00   

ROM-OUT ROM-ADDR-U-IN $mainloop
F-OUT   JMP           0xFF    ; Jump to start

inc_y:
ROM-OUT RAM-IN        0x00    ; Store 0 in X position
ROM-OUT RAM-ADDR-U-IN 0x01    ; Fetch Y position
RAM-OUT A-IN          0xFF    ; 
ROM-OUT B-IN          0x01    ; Add 1
ALU-OUT RAM-IN        0xFF    ; Store in Y position
ROM-OUT ROM-ADDR-U-IN $mainloop 
F-OUT   JMP           0xFF    ; Jump back

inc_x:
ROM-OUT RAM-ADDR-U-IN 0x00    ; Fetch X position
RAM-OUT A-IN          0xFF    
ROM-OUT B-IN          0x01    ; Add 1
ALU-OUT RAM-IN        0xFF    ; store in X position
ROM-OUT ROM-ADDR-U-IN $inc_y 
ROM-OUT B-IN          0xC1    ; Add C1 in order to Detect things
F-OUT   JC            0xFF    ; Jump to Y increment if carry

mainloop:
ROM-OUT OUTPUT-IN     0x0E    ; Select Color
ROM-OUT OUTPUT-IN     0x0E+64 

ROM-OUT RAM-ADDR-U-IN 0x01    ; Select Y position
RAM-OUT OUTPUT-IN     0xFF    ; Output
RAM-OUT A-IN          0xFF    ; Fetch into A register
ROM-OUT B-IN          0x40    ; Add 0x40 to clock the shift register
ALU-OUT OUTPUT-IN     0xFF    ; Output

ROM-OUT RAM-ADDR-U-IN 0x00    ; Select Y position
RAM-OUT OUTPUT-IN     0xFF    ; Output
RAM-OUT A-IN          0xFF    ; Fetch into A register
ROM-OUT B-IN          0x40    ; Add 0x40 to clock the shift register
ALU-OUT OUTPUT-IN     0xFF    ; Output

ROM-OUT OUTPUT-IN     0x80    
ROM-OUT OUTPUT-IN     0x00    ; Clock the displays clock

ROM-OUT ROM-ADDR-U-IN $inc_x  
F-OUT   JMP           0xFF    ; Jump back to inc_x


