; LCD_test_4bit.asm: Initializes and uses an LCD in 4-bit mode
; using the most common procedure found on the internet.
$NOLIST
$MODLP51
$LIST

org 0000H
    ljmp myprogram

; These 'equ' must match the hardware wiring
LCD_RS equ P1.1
LCD_RW equ P1.2 ; Not used in this code
LCD_E  equ P1.3
LCD_D4 equ P3.2
LCD_D5 equ P3.3
LCD_D6 equ P3.4
LCD_D7 equ P3.5

; When using a 22.1184MHz crystal in fast mode
; one cycle takes 1.0/22.1184MHz = 45.21123 ns

;---------------------------------;
; Wait 40 microseconds            ;
;---------------------------------;
Wait40uSec:
    push AR0
    mov R0, #177
L0:
    nop
    nop
    djnz R0, L0 ; 1+1+3 cycles->5*45.21123ns*177=40us
    pop AR0
    ret

;---------------------------------;
; Wait 'R2' milliseconds          ;
;---------------------------------;
WaitmilliSec:
    push AR0
    push AR1
L3: mov R1, #45
L2: mov R0, #166
L1: djnz R0, L1 ; 3 cycles->3*45.21123ns*166=22.51519us
    djnz R1, L2 ; 22.51519us*45=1.013ms
    djnz R2, L3 ; number of millisecons to wait passed in R2
    pop AR1
    pop AR0
    ret

;---------------------------------;
; Toggles the LCD's 'E' pin       ;
;---------------------------------;
LCD_pulse:
    setb LCD_E
    lcall Wait40uSec
    clr LCD_E
    ret

;---------------------------------;
; Writes data to LCD              ;
;---------------------------------;
WriteData:
    setb LCD_RS
    ljmp LCD_byte

;---------------------------------;
; Writes command to LCD           ;
;---------------------------------;
WriteCommand:
    clr LCD_RS
    ljmp LCD_byte

;---------------------------------;
; Writes acc to LCD in 4-bit mode ;
;---------------------------------;
LCD_byte:
    ; Write high 4 bits first
    mov c, ACC.7
    mov LCD_D7, c
    mov c, ACC.6
    mov LCD_D6, c
    mov c, ACC.5
    mov LCD_D5, c
    mov c, ACC.4
    mov LCD_D4, c
    lcall LCD_pulse

    ; Write low 4 bits next
    mov c, ACC.3
    mov LCD_D7, c
    mov c, ACC.2
    mov LCD_D6, c
    mov c, ACC.1
    mov LCD_D5, c
    mov c, ACC.0
    mov LCD_D4, c
    lcall LCD_pulse
    ret

;---------------------------------;
; Configure LCD in 4-bit mode     ;
;---------------------------------;
LCD_4BIT:
    clr LCD_E   ; Resting state of LCD's enable is zero
    clr LCD_RW  ; We are only writing to the LCD in this program

    ; After power on, wait for the LCD start up time before initializing
    ; NOTE: the preprogrammed power-on delay of 16 ms on the AT89LP51RC2
    ; seems to be enough.  That is why these two lines are commented out.
    ; Also, commenting these two lines improves simulation time in Multisim.
    ; mov R2, #40
    ; lcall WaitmilliSec

    ; First make sure the LCD is in 8-bit mode and then change to 4-bit mode
    mov a, #0x33
    lcall WriteCommand
    mov a, #0x33
    lcall WriteCommand
    mov a, #0x32 ; change to 4-bit mode
    lcall WriteCommand

    ; Configure the LCD
    mov a, #0x28
    lcall WriteCommand
    mov a, #0x0c
    lcall WriteCommand
    mov a, #0x01 ;  Clear screen command (takes some time)
    lcall WriteCommand

    ;Wait for clear screen command to finish. Usually takes 1.52ms.
    mov R2, #2
    lcall WaitmilliSec
    ret

;---------------------------------;
; Main loop.  Initialize stack,   ;
; ports, LCD, and displays        ;
; letters on the LCD              ;
;---------------------------------;
myprogram:
  mov SP, #7FH
    lcall LCD_4BIT
    mov a, #0x80 ; KINGSTON CHEN
    lcall WriteCommand
    mov a, #'K'
    lcall WriteData
    
    mov a, #0x81 
    lcall WriteCommand
    mov a, #'I'
    lcall WriteData
    
    mov a, #0x82 
    lcall WriteCommand
    mov a, #'N'
    lcall WriteData
    
    mov a, #0x83
    lcall WriteCommand
    mov a, #'G'
    lcall WriteData
    
    mov a, #0x84 ; 
    lcall WriteCommand
    mov a, #'S'
    lcall WriteData
    
    mov a, #0x85
    lcall WriteCommand
    mov a, #'T'
    lcall WriteData
    
    mov a, #0x86
    lcall WriteCommand
    mov a, #'O'
    lcall WriteData
    
    mov a, #0x87
    lcall WriteCommand
    mov a, #'N'
    lcall WriteData
    
    mov a, #0x89
    lcall WriteCommand
    mov a, #'C'
    lcall WriteData
    
    mov a, #0x8A
    lcall WriteCommand
    mov a, #'H'
    lcall WriteData
    
    mov a, #0x8B
    lcall WriteCommand
    mov a, #'E'
    lcall WriteData
    
    mov a, #0x8C
    lcall WriteCommand
    mov a, #'N'
    lcall WriteData
    
    mov a, #0x8D
    lcall WriteCommand
    mov a, #'!'
    lcall WriteData
    
    mov a, #0xC0 ; 25028549
    lcall WriteCommand
    mov a, #'2'
    lcall WriteData
    mov a, #0xC1 
    lcall WriteCommand
    mov a, #'5'
    lcall WriteData
    mov a, #0xC2 
    lcall WriteCommand
    mov a, #'0'
    lcall WriteData
    mov a, #0xC3
    lcall WriteCommand
    mov a, #'2'
    lcall WriteData
    mov a, #0xC4 
    lcall WriteCommand
    mov a, #'8'
    lcall WriteData
    mov a, #0xC5
    lcall WriteCommand
    mov a, #'5'
    lcall WriteData
    mov a, #0xC6 
    lcall WriteCommand
    mov a, #'4'
    lcall WriteData
    mov a, #0xC7 
    lcall WriteCommand
    mov a, #'9'
    lcall WriteData
    

forever:

    cpl P3.7 ; LED
   
    mov a, #0x93 ; winky
    lcall WriteCommand
    mov a, #0x3B
    lcall WriteData
    mov a, #0x94
    lcall WriteCommand
    mov a, #0x29
    lcall WriteData
    
    mov R2, #200
    lcall WaitmilliSec
    
    mov a, #0x93 ; winky so the eyes changes 
    lcall WriteCommand
    mov a, #0x3A
    lcall WriteData
    mov a, #0x94
    lcall WriteCommand
    mov a, #0x29
    lcall WriteData
    
    mov R2, #200
    lcall WaitmilliSec
    
    mov a, #0x1A ; shif to the left
    lcall WriteCommand
    sjmp forever

END

