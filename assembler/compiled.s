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
ROM-OUT RAM-IN        2; Store literal value in RAM
;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        $out-Na08q20aHvA1U158GKvPQNIZnYcmhj  ; Store address after jump in ram

;
; Arguments
; 

;
; Get From Stack
;

; Get value of variable a

ROM-OUT FLAGS-IN      0x80 ; Subtract Mode
SE-OUT  A-IN          0xFF ; Fetch SE
ROM-OUT B-IN          1 ; Subtract Position Of Variable In Stack
ALU-OUT RAM-ADDR-U-IN 0xFF ; Set RAM Address To Position Of Variable In RAM
ROM-OUT FLAGS-IN      0x00 ; Add Mode
RAM-OUT C-IN          0xFF ; Put Variable Value In C Register

;
; Push To Top Of Stack
;

; Add One To SE

ROM-OUT B-IN          0x01
ALU-OUT SE-IN         0xFF
SE-OUT  RAM-ADDR-U-IN 0xFF
C-OUT   RAM-IN        0xFF


;
; Jump
;
ROM-OUT ROM-ADDR-U-IN $out  ; Jump to function label
F-OUT   JMP           0xFF ; Jump to function

out-Na08q20aHvA1U158GKvPQNIZnYcmhj:

;
; Stack
;

; Increment Stack Pointer

SE-OUT  A-IN  0xFF ; Fetch SE
ROM-OUT B-IN  0x01 ; Add 1
ALU-OUT SE-IN 0xFF ; Store

; Store in top stack pointer

ALU-OUT RAM-ADDR-U-IN 0xFF ; Store in RAM address
ROM-OUT RAM-IN        $exit-1L1NyZSqMjqVTGkbtk0jFGx54U0yb8  ; Store address after jump in ram

;
; Arguments
; 



;
; Jump
;
ROM-OUT ROM-ADDR-U-IN $exit  ; Jump to function label
F-OUT   JMP           0xFF ; Jump to function

exit-1L1NyZSqMjqVTGkbtk0jFGx54U0yb8:

ROM-OUT FLAGS-IN 0x80
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
exit:
F-OUT JMP 0xFF

