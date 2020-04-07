$MODLP51
org 0000H
   ljmp MainProgram


dseg at 0x30
volt_BCD:   ds 1
x:   ds 4
y:   ds 4
bcd: ds 5
Result: ds 2


BSEG
mf: dbit 1

$NOLIST
$include(math32.inc)
$LIST

; These 'equ' must match the hardware wiring
; They are used by 'LCD_4bit.inc'
LCD_RS equ P1.1
LCD_RW equ P1.2
LCD_E  equ P1.3
LCD_D4 equ P3.2
LCD_D5 equ P3.3
LCD_D6 equ P3.4
LCD_D7 equ P3.5

CLK  EQU 22118400
BAUD equ 115200
BRG_VAL equ (0x100-(CLK/(16*BAUD)))
; These EQU  must match the wiring between the microcontroller and ADC
CE_ADC EQU P2.0
MY_MOSI EQU P2.1
MY_MISO EQU P2.2
MY_SCLK EQU P2.3

$NOLIST
$include(LCD_4bit.inc)
$LIST

temp:  db 'temperature: xxC','\r', '\n', 0
Spacer:	db '\r','\n', 0

CSEG
; Configure the serial port and baud rate
InitSerialPort:
    ; Since the reset button bounces, we need to wait a bit before
    ; sending messages, otherwise we risk displaying gibberish!
    mov R1, #222
    mov R0, #166
    djnz R0, $   ; 3 cycles->3*45.21123ns*166=22.51519us
    djnz R1, $-4 ; 22.51519us*222=4.998ms
    ; Now we can proceed with the configuration
	orl	PCON,#0x80
	mov	SCON,#0x52
	mov	BDRCON,#0x00
	mov	BRL,#BRG_VAL
	mov	BDRCON,#0x1E ; BDRCON=BRR|TBCK|RBCK|SPD;
    ret

; Send a character using the serial port
putchar:
    jnb TI, putchar
    clr TI
    mov SBUF, a
    ret

; Send a constant-zero-terminated string using the serial port
SendString:
    clr A
    movc A, @A+DPTR
    jz SendStringDone
    lcall putchar
    inc DPTR
    sjmp SendString
SendStringDone:
    ret
    
Send_BCD mac
	push ar0
	mov r0, %0
	lcall ?Send_BCD
	pop ar0
endmac
    
?Send_BCD:
	push acc
	; Write most significant digit
	mov a, r0
	swap a
	anl a, #0fh
	orl a, #30h
	lcall putchar
	; write least significant digit
	mov a, r0
	anl a, #0fh
	orl a, #30h
	lcall putchar
	pop acc
	ret
	
	
Hello_World:
    DB  'Hello, World!', '\r', '\n', 0

INIT_SPI:
 	setb MY_MISO ; Make MISO an input pin
 	clr MY_SCLK ; For mode (0,0) SCLK is zero
 	ret

DO_SPI_G:
 	push acc
 	mov R1, #0 ; Received byte stored in R1
 	mov R2, #8 ; Loop counter (8-bits)
DO_SPI_G_LOOP:
 	mov a, R0 ; Byte to write is in R0
 	rlc a ; Carry flag has bit to write
 	mov R0, a
	mov MY_MOSI, c
 	setb MY_SCLK ; Transmit
 	mov c, MY_MISO ; Read received bit
 	mov a, R1 ; Save received bit in R1
 	rlc a
 	mov R1, a
 	clr MY_SCLK
 	djnz R2, DO_SPI_G_LOOP
 	pop acc
 	ret

Read_ADC_Channel MAC
	mov b, #%0
	lcall _Read_ADC_Channel
ENDMAC

_Read_ADC_Channel:
	clr CE_ADC
	mov R0, #00000001B ; Start bit:1
	lcall DO_SPI_G
	mov a, b
	swap a
	anl a, #0F0H
	setb acc.7 ; Single mode (bit 7).
	mov R0, a
	lcall DO_SPI_G
	mov a, R1 ; R1 contains bits 8 and 9
	anl a, #00000011B ; We need only the two least significant bits
	mov R7, a ; Save result high.
	mov R0, #55H ; It doesn't matter what we transmit...
	lcall DO_SPI_G
	mov a, r1
	mov r6, a ; R1 contains bits 0 to 7. Save result low.
	setb CE_ADC
	ret



MainProgram:
    setb CE_ADC  
    mov SP, #7FH ; Set the stack pointer to the begining of idata
    mov P3M1, #0 
    mov P2M1, #0 
    
    lcall InitSerialPort
    lcall INIT_SPI
    lcall LCD_4BIT
	
	Set_Cursor(1,1) 
	Send_Constant_String(#temp)  
 
loop: 
 	Read_ADC_Channel(0)
 	mov x, R6
 	mov x+1, R7
    Load_y(4096)
    lcall mul32
    load_y(10230)
    lcall div32 
    load_y(273)
    lcall sub32
    lcall hex2bcd
  	mov a, bcd
  	
 	
    Send_BCD(bcd)
    Set_Cursor(1,14)
    Display_BCD(bcd)   
    
    mov a, bcd
    ;Send_BCD(a);uhu
	mov DPTR, #Spacer
	lcall SendString;juihu
    subb a, #0x30
    jc toohot
    setb P3.7
loop2:  
	mov a, bcd  
    subb a, #0x27
    jnc toocold 
    setb P2.7
   
   
loop3:    
    Wait_Milli_Seconds(#50)
    Wait_Milli_Seconds(#50)
    Wait_Milli_Seconds(#50)
    Wait_Milli_Seconds(#50)
    Wait_Milli_Seconds(#50)
     
    ljmp loop 
    
toohot: 
	clr P3.7
	ljmp loop2
	
toocold: 
	clr P2.7    
    ljmp loop3
   
END
