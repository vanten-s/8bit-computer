;
; INFO
;
; Paddle is 5 wide and 1 in from the left
;

ROM-OUT SP-IN 0x20 ; Stack pointer start address register
ROM-OUT SE-IN 0x20 ; Stack pointer end address register

;
; Call
;

; ; Increment the stack pointer
; SE-OUT  A-IN  0xFF
; ROM-OUT B-IN  0x01
; ALU-OUT SE-IN 0xFF

; ; Add current location
; ALU-OUT RAM-ADDR-U-IN 0xFF
; ROM-OUT RAM-IN        $retpoint
; retpoint:

;
; Return
;

; ; Get return address
; SE-OUT  RAM-ADDR-U-IN 0xFF 
; RAM-OUT ROM-ADDR-U-IN 0xFF

; ; Subtract one
; SE-OUT  A-IN     0xFF
; ROM-OUT B-IN     0xFF
; ALU-OUT SE-IN    0xFF

; ; Jump
; F-OUT JMP 0xFF

change_pixel:
    ; 0x00: color, 0x01: y, 0x02: x



    ;
    ; Return
    ;

    ; Get return address
    SE-OUT  RAM-ADDR-U-IN 0xFF 
    RAM-OUT ROM-ADDR-U-IN 0xFF

    ; Subtract one
    SE-OUT  A-IN     0xFF
    ROM-OUT B-IN     0xFF
    ALU-OUT SE-IN    0xFF
    
    ; Jump
    F-OUT JMP 0xFF

