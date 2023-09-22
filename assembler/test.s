main:

;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        $out-kCnM1aszKDIe5P6ZIUK0pYuckZqWzQ  ; Store address after jump in ram

;
; Arguments
; 


;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        42; Store literal value in RAM

;
; Jump
;
ROM-OUT ROM-ADDR-U-IN $out  ; Jump to function label
F-OUT   JMP           0xFF ; Jump to function

out-kCnM1aszKDIe5P6ZIUK0pYuckZqWzQ:


;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        $out-VOefZ9BB8M7st3vVsJuy9My38twGwW  ; Store address after jump in ram

;
; Arguments
; 



;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        42; Store literal value in RAM

;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        3; Store literal value in RAM

SE-OUT  RAM-ADDR-U-IN 0xFF ; Set ram address to stack end
RAM-OUT C-IN          0xFF ; Output top address onto output register

ROM-OUT FLAGS-IN      0x80 ; Subtract mode
SE-OUT  A-IN          0xFF ; Fetch SE
ROM-OUT B-IN          0x01 ; Subtract one
ALU-OUT SE-IN         0xFF ; Store in SE

SE-OUT  RAM-ADDR-U-IN 0xFF ; Set ram address to stack end
RAM-OUT D-IN          0xFF ; Output top address onto output register

ROM-OUT FLAGS-IN      0x80 ; Subtract mode
SE-OUT  A-IN          0xFF ; Fetch SE
ROM-OUT B-IN          0x01 ; Subtract one
ALU-OUT SE-IN         0xFF ; Store in SE
ROM-OUT FLAGS-IN      0x00 ; Add mode

ROM-OUT FLAGS-IN      0x80 ; Subtract mode
C-OUT   B-IN          0xFF ; Move temporary values into a register for alu computation 
D-OUT   A-IN          0xFF ; Move temporary values into a register for alu computation 
ALU-OUT C-IN          0xFF ; Move ALU output into temporary register
ROM-OUT FLAGS-IN      0x00 ; Add mode

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
C-OUT   RAM-IN        0xFF ; Store address after jump in ram


;
; Jump
;
ROM-OUT ROM-ADDR-U-IN $out  ; Jump to function label
F-OUT   JMP           0xFF ; Jump to function

out-VOefZ9BB8M7st3vVsJuy9My38twGwW:


;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        $exit-fbVfXdfuZnBR8m8qPx9tCemlwK8lF7  ; Store address after jump in ram

;
; Arguments
; 



;
; Jump
;
ROM-OUT ROM-ADDR-U-IN $exit  ; Jump to function label
F-OUT   JMP           0xFF ; Jump to function

exit-fbVfXdfuZnBR8m8qPx9tCemlwK8lF7:


exit:
F-OUT JMP 0xFF

out:
;
; Pop the argument of the stack
;

SE-OUT  RAM-ADDR-U-IN 0xFF ; Set ram address to stack end
RAM-OUT OUTPUT-IN     0xFF ; Output top address onto output register

ROM-OUT FLAGS-IN      0x80 ; Subtract mode
SE-OUT  A-IN          0xFF ; Fetch SE
ROM-OUT B-IN          0x01 ; Subtract one
ALU-OUT SE-IN         0xFF ; Store in SE
ROM-OUT FLAGS-IN      0x00 ; Add mode

;
; Pop the return address of the stack
;

SE-OUT  RAM-ADDR-U-IN 0xFF ; Set ram address to stack end
RAM-OUT ROM-ADDR-U-IN 0xFF ; Store top address in ROM jump address

ROM-OUT FLAGS-IN      0x80 ; Subtract mode
SE-OUT  A-IN          0xFF ; Fetch SE
ROM-OUT B-IN          0x01 ; Subtract one
ALU-OUT SE-IN         0xFF ; Store in SE
ROM-OUT FLAGS-IN      0x00 ; Add mode

F-OUT   JMP           0xFF
