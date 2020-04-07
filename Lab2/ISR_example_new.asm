; Kingston Chen 25028549
; ISR_example.asm: a) Increments/decrements a BCD variable every half second using
; an ISR for timer 2; b) Generates a 2kHz square wave at pin P3.7 using
; an ISR for timer 0; and c) in the 'main' loop it displays the variable
; incremented/decremented using the ISR for timer 2 on the LCD.  Also resets it to 
; zero if the 'BOOT' pushbutton connected to P4.5 is pressed.
$NOLIST
$MODLP51
$LIST

; There is a couple of typos in MODLP51 in the definition of the timer 0/1 reload
; special function registers (SFRs), so:

TIMER0_RELOAD_L DATA 0xf2
TIMER1_RELOAD_L DATA 0xf3
TIMER0_RELOAD_H DATA 0xf4
TIMER1_RELOAD_H DATA 0xf5

CLK           EQU 22118400 ; Microcontroller system crystal frequency in Hz
TIMER0_RATE   EQU 4096     ; 2048Hz squarewave (peak amplitude of CEM-1203 speaker)
TIMER0_RELOAD EQU ((65536-(CLK/TIMER0_RATE))) 
TIMER2_RATE   EQU 1000     ; 1000Hz, for a timer tick of 1ms
TIMER2_RELOAD EQU ((65536-(CLK/TIMER2_RATE)))

BOOT_BUTTON   equ P4.5 
SOUND_OUT     equ P3.7 ; This is the port for speaker 
UPDOWN        equ P0.0 ; Seconds
HRUP		  equ P0.1 ; adjust hour
MINUP		  equ P0.2 ; adjust minute
ALARM1HR      equ P0.3 ; alarm1 hour
ALARM1MIN     equ P0.4 ; alarm1 min
ALARM2HR      equ P0.5 ; alarm2 hour
ALARM2MIN     equ P0.6 ; alarm2 min

; Reset vector
org 0x0000
    ljmp main

; External interrupt 0 vector (not used in this code)
org 0x0003
	reti

; Timer/Counter 0 overflow interrupt vector
org 0x000B
	ljmp Timer0_ISR

; External interrupt 1 vector (not used in this code)
org 0x0013
	reti

; Timer/Counter 1 overflow interrupt vector (not used in this code)
org 0x001B
	reti

; Serial port receive/transmit interrupt vector (not used in this code)
org 0x0023 
	reti
	
; Timer/Counter 2 overflow interrupt vector
org 0x002B
	ljmp Timer2_ISR

; In the 8051 we can define direct access variables starting at location 0x30 up to location 0x7F
dseg at 0x30
Count1ms:     ds 2 ; Used to determine when half second has passed
BCD_min:      ds 1 ; min
BCD_hr:       ds 1 ; hour
BCD_counter:  ds 1 
BCD_m: 		  ds 1 ; am pm
BCD_day1:	  ds 1 ; S
BCD_day2:	  ds 1 ; U
BCD_day3:	  ds 1 ; N
BCD_min_arm1: ds 1 
BCD_hr_arm1:  ds 1
BCD_m_arm1:   ds 1 ; am pm
BCD_min_arm2: ds 1 
BCD_hr_arm2:  ds 1
BCD_m_arm2:   ds 1

; In the 8051 we have variables that are 1-bit in size.  We can use the setb, clr, jb, and jnb
; instructions with these variables.  This is how you define a 1-bit variable:
bseg
s_flag:            dbit 1 ; Set to one in the ISR every time 1000 ms had passed
min_flag:          dbit 1 
hr_flag:           dbit 1
pm_flag: 		   dbit 1
day_flag:		   dbit 1

cseg
; These 'equ' must match the wiring between the microcontroller and the LCD!
LCD_RS equ P1.1
LCD_RW equ P1.2
LCD_E  equ P1.3
LCD_D4 equ P3.2
LCD_D5 equ P3.3
LCD_D6 equ P3.4
LCD_D7 equ P3.5
$NOLIST
$include(LCD_4bit.inc) ; A library of LCD related functions and utility macros
$LIST

;                     1234567890123456    <- This helps determine the location of the counter
Initial_Message:  db '  :  :   M', 0
msg2: 			  db '  :   M   :   M', 0

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 0                     ;
;---------------------------------;
Timer0_Init:
	mov a, TMOD
	anl a, #0xf0 ; Clear the bits for timer 0
	orl a, #0x01 ; Configure timer 0 as 16-timer
	mov TMOD, a
	mov TH0, #high(TIMER0_RELOAD)
	mov TL0, #low(TIMER0_RELOAD)
	; Set autoreload value
	mov TIMER0_RELOAD_H, #high(TIMER0_RELOAD)
	mov TIMER0_RELOAD_L, #low(TIMER0_RELOAD)
	; Enable the timer and interrupts
    setb ET0  ; Enable timer 0 interrupt
    setb TR0  ; Start timer 0
	ret

;---------------------------------;
; ISR for timer 0.  Set to execute;
; every 1/4096Hz to generate a    ;
; 2048 Hz square wave at pin P3.7 ;
;---------------------------------;
Timer0_ISR:
	;clr TF0  ; According to the data sheet this is done for us already.
	cpl SOUND_OUT ; Connect speaker to P3.7!
	reti

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 2                     ;
;---------------------------------;
Timer2_Init:
	mov T2CON, #0 ; Stop timer/counter.  Autoreload mode.
	mov TH2, #high(TIMER2_RELOAD)
	mov TL2, #low(TIMER2_RELOAD)
	; Set the reload value
	mov RCAP2H, #high(TIMER2_RELOAD)
	mov RCAP2L, #low(TIMER2_RELOAD)
	; Init One millisecond interrupt counter.  It is a 16-bit variable made with two 8-bit parts
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Enable the timer and interrupts
    setb ET2  ; Enable timer 2 interrupt
    setb TR2  ; Enable timer 2
	ret

;---------------------------------;
; ISR for timer 2                 ;
;---------------------------------;
Timer2_ISR:
	clr TF2  ; Timer 2 doesn't clear TF2 automatically. Do it in ISR
	cpl P3.6 ; To check the interrupt rate with oscilloscope. It must be precisely a 1 ms pulse.
	
	; The two registers used in the ISR must be saved in the stack
	push acc
	push psw
	
	; Increment the 16-bit one mili second counter
	inc Count1ms+0    ; Increment the low 8-bits first
	mov a, Count1ms+0 ; If the low 8-bits overflow, then increment high 8-bits
	jnz Inc_Done
	inc Count1ms+1

Inc_Done:
	; Check if one second has passed
	mov a, Count1ms+0
	cjne a, #low(1000), Timer2_ISR_done ; Warning: this instruction changes the carry flag!
	mov a, Count1ms+1
	cjne a, #high(1000), Timer2_ISR_done
	
	setb s_flag ; Let the main program know second had passed
	;cpl TR0 ; Enable/disable timer/counter 0. This line creates a beep-silence-beep-silence sound.
	; Reset to zero the milli-seconds counter, it is a 16-bit variable
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	
	; Increment the BCD counter
	mov a, BCD_counter
	jnb UPDOWN, Timer2_ISR_decrement

	cjne a, #0x59, Timer2_ISR_da_s
	mov a, #0
	da a
	mov BCD_counter, a
	jnb min_flag,min_inc ; if min is low then go incr min
	
min_inc:
	mov a, BCD_min
	jnb UPDOWN,Timer2_ISR_decrement
	cjne a,#0x59, Timer2_ISR_da_min
	mov a, #0
	da a 
	mov BCD_min, a
	jnb hr_flag,hr_inc

hr_inc:
	mov a, BCD_hr
	jnb UPDOWN,Timer2_ISR_decrement
	cjne a,#0x11, Timer2_ISR_da_hr 
	mov a, #12
	da a 
	mov BCD_hr, a
	jnb pm_flag,ampm

ampm:
	mov a, BCD_m
	jnb UPDOWN,Timer2_ISR_decrement
	cjne a,#0x50, Timer2_ISR_da_ampm
	mov a, #'A'
	mov BCD_m, a
	jnb day_flag, day_inc

day_inc:
	mov r0, BCD_day1
	mov r1, BCD_day2
	mov r2, BCD_day3
	jnb UPDOWN,Timer2_ISR_decrement
	cjne r1, #0b01000001, Timer2_ISR_da_dayj
	mov r0, #0b01010011
	mov r1, #0b01010101
	mov r2, #0b01001110
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	sjmp alarm1check
Timer2_ISR_da_dayj:
	ljmp Timer2_ISR_da_day
Timer2_ISR_decrement:
	add a, #0x59 ; Adding the 10-complement of -1 is like subtracting 1.
Timer2_ISR_da_s:
	add a, #0x01
	da a 
	mov BCD_counter, a
	sjmp alarm1check
Timer2_ISR_done:
	pop psw
	pop acc
	reti
Timer2_ISR_da_min: 
	add a, #0x01
	da a
	mov BCD_min, a
	sjmp alarm1check
alarm1check: ;s/s
	mov a, BCD_hr
	mov b, BCD_hr_arm1
	cjne a, b, alarm2check
	mov a, BCD_min
	mov b, BCD_min_arm1
	cjne a, b, alarm2check
	mov a, BCD_m
	mov b, BCD_m_arm1
	cjne a, b, alarm2check
	mov a, BCD_day1
	cjne a, #0b01010011, alarm2check
	cpl TR0
	sjmp alarm2check
Timer2_ISR_da_hr: 
	cjne a,#0x12, Timer2_ISR_da_hr2 
	mov a, #0x01
	da a
	mov BCD_hr, a
	sjmp alarm1check
Timer2_ISR_da_ampm: 
	mov a, #0x50 
	mov BCD_m, a
	sjmp alarm1check
alarm2check: ;m-f
	mov a, BCD_hr
	mov b, BCD_hr_arm2
	cjne a,b, Timer2_ISR_done
	mov a, BCD_min
	mov b, BCD_min_arm2
	cjne a,b, Timer2_ISR_done
	mov a, BCD_m
	mov b, BCD_m_arm2
	cjne a,b, Timer2_ISR_done
	mov a, BCD_day1
	cjne a, #0b01010011, alarm2check2
	sjmp Timer2_ISR_done
alarm2check2:
	cpl TR0	
	sjmp Timer2_ISR_done
Timer2_ISR_da_hr2:
	add a, #0x01
	da a
	mov BCD_hr, a
	sjmp alarm1check
alarm1checkj:
	ljmp alarm1check	
Timer2_ISR_da_day:
	cjne r0, #0b01010011, Timer2_ISR_da_day2 
	mov r0, #0b01001101
	mov r1, #0b01001111
	mov r2, #0b01001110
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	sjmp alarm1check
Timer2_ISR_da_day2:
	cjne r0, #0b01001101, Timer2_ISR_da_day3 
	mov r0, #0b01010100
	mov r1, #0b01010101
	mov r2, #0b01000101
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	sjmp alarm1check
Timer2_ISR_da_day3:
	cjne r2, #0b01000101, Timer2_ISR_da_day4 
	mov r0, #0b01010111
	mov r1, #0b01000101
	mov r2, #0b01000100
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	sjmp alarm1checkj
Timer2_ISR_da_day4:
	cjne r0, #0b01010111, Timer2_ISR_da_day5
	mov r0, #0b01010100
	mov r1, #0b01001000
	mov r2, #0b01010101
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp Timer2_ISR_done
Timer2_ISR_da_day5:
	cjne r1, #0b01001000, Timer2_ISR_da_day6
	mov r0, #0b01000110
	mov r1, #0b01010010
	mov r2, #0b01001001
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp alarm1check
Timer2_ISR_da_day6:
	mov r0, #0b01010011
	mov r1, #0b01000001
	mov r2, #0b01010100
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp alarm1check
;---------------------------------;
; Main program. Includes hardware ;
; initialization and 'forever'    ;
; loop.                           ;
;---------------------------------;
main:
	; Initialization
    mov SP, #0x7F
    lcall Timer0_Init
    lcall Timer2_Init
    ; In case you decide to use the pins of P0, configure the port in bidirectional mode:
    mov P0M0, #0
    mov P0M1, #0
    setb EA   ; Enable Global interrupts
    lcall LCD_4BIT
    ; For convenience a few handy macros are included in 'LCD_4bit.inc':
	Set_Cursor(1, 1)
    Send_Constant_String(#Initial_Message)
    Set_Cursor(2, 1)
    Send_Constant_String(#msg2)
    setb s_flag
    setb min_flag
    setb hr_flag
    setb pm_flag
    setb day_flag
    clr TR0	
    clr P3.7
	mov BCD_counter, #0x00
	mov BCD_min, #0x00
	mov BCD_hr, #0x12
	mov BCD_m, #0x41
	mov BCD_day1, #0b01010011
	mov BCD_day2, #0b01010101
	mov BCD_day3, #0b01001110
	mov	BCD_min_arm1, #0x02
	mov	BCD_hr_arm1,  #0x12
	mov BCD_m_arm1,   #'A'
	mov	BCD_min_arm2, #0x02
	mov	BCD_hr_arm2,  #0x12
	mov BCD_m_arm2,   #'P'
	; After initialization the program stays in this 'forever' loop
loop:
	jb BOOT_BUTTON, loop_a  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb BOOT_BUTTON, loop_a  ; if the 'BOOT' button is not pressed skip
	jnb BOOT_BUTTON, $		; Wait for button release.  The '$' means: jump to same instruction.
	; A valid press of the 'BOOT' button has been detected, reset the BCD counter.
	; But first stop timer 2 and reset the milli-seconds counter, to resync everything.
	clr TR0
	clr TR2                 ; Stop timer 2
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Now clear the BCD counter
	mov BCD_counter, a
	setb TR2                ; Start timer 2
	ljmp loop_b             ; Display the new value
loop_e:
	jnb s_flag, loop
loop_a:
	jb HRUP, loop_c  
	Wait_Milli_Seconds(#50)
	jb HRUP, loop_c  
	jnb HRUP, $	
	clr TR0
	sjmp loop_a1
loop_a1:
	mov a, BCD_hr
	cjne a,#0x11, loop_a2
	mov a, #12
	da a 
	mov BCD_hr, a
	sjmp loop_d
loop_a2: 
	cjne a,#0x12, loop_a3
	mov a, #0x01
	da a
	mov BCD_hr, a
	sjmp loop_b
loop_a3:
	mov a,BCD_hr
	add a, #0x01
	da a
	mov BCD_hr, a
	sjmp loop_b
loop_d:
	mov a, BCD_m
	cjne a,#'P', loop_d2
	mov a, #'A'
	mov BCD_m, a
	ljmp loop_f	
loop_d2: 
	mov a, #'P'
	mov BCD_m, a
	sjmp loop_b
loop_c:
	ljmp loop_cj
loop_b:
    clr s_flag ; We clear this flag in the main loop, but it is set in the ISR for timer 2
	Set_Cursor(1, 7)     ; the place in the LCD where we want the BCD counter value
	Display_BCD(BCD_counter) ; This macro is also in 'LCD_4bit.inc'
	Set_Cursor(1, 4)     
	Display_BCD(BCD_min) 
	Set_Cursor(1, 1)     
	Display_BCD(BCD_hr) 
	Set_Cursor(1, 9)     
	Display_char(BCD_m)
	Set_Cursor(1, 14)     
	Display_char(BCD_day1)
	Set_Cursor(1, 15) 
	Display_char(BCD_day2)
	Set_Cursor(1, 16) 
	Display_char(BCD_day3)
	Set_Cursor(2, 1) 
	Display_BCD(BCD_hr_arm1)
	Set_Cursor(2, 4) 
	Display_BCD(BCD_min_arm1)
	Set_Cursor(2, 6) 
	Display_char(BCD_m_arm1)
	Set_Cursor(2, 9) 
	Display_BCD(BCD_hr_arm2)
	Set_Cursor(2, 12) 
	Display_BCD(BCD_min_arm2)
	Set_Cursor(2, 14) 
	Display_char(BCD_m_arm2)
    ljmp loop
loop_cj:
	jb MINUP, loop_x 
	Wait_Milli_Seconds(#50)
	jb MINUP, loop_x  
	jnb MINUP, $
	clr TR0
	mov a, BCD_min
	cjne a,#0x59, loop_c2
	mov a, #0
	da a 
	mov BCD_min, a
	ljmp loop_a1
loop_c2:
	mov a, BCD_min
	add a, #0x01
	da a
	mov BCD_min, a
	ljmp loop_b	
loop_x:
	jb ALARM1HR, loop_c1
	jb ALARM1HR, loop_c1  
	Wait_Milli_Seconds(#50)
	jb ALARM1HR, loop_c1  
	jnb ALARM1HR, $	
	clr TR0
	sjmp loop_a11
loop_a11:
	mov a, BCD_hr_arm1
	cjne a,#0x11, loop_a21
	mov a, #12
	da a 
	mov BCD_hr_arm1, a
	sjmp loop_d1
loop_a21: 
	cjne a,#0x12, loop_a31
	mov a, #0x01
	da a
	mov BCD_hr_arm1, a
	ljmp loop_b
loop_a31:
	mov a,BCD_hr_arm1
	add a, #0x01
	da a
	mov BCD_hr_arm1, a
	ljmp loop_b
loop_d1:
	mov a, BCD_m_arm1
	cjne a,#'P', loop_d21
	mov a, #'A'
	mov BCD_m_arm1, a
	ljmp loop_b
loop_d21: 
	mov a, #'P'
	mov BCD_m_arm1, a
	ljmp loop_b
loop_c1:
	jb ALARM1MIN, loop_y
	Wait_Milli_Seconds(#50)
	jb ALARM1MIN, loop_y 
	jnb ALARM1MIN, $
	clr TR0
	mov a, BCD_min_arm1
	cjne a,#0x59, loop_c21
	mov a, #0
	da a 
	mov BCD_min_arm1, a
	sjmp loop_a11	
loop_c21:
	mov a, BCD_min_arm1
	add a, #0x01
	da a
	mov BCD_min_arm1, a
	ljmp loop_b
loop_b1:
	ljmp loop_b
loop_y:
	jb ALARM2HR, loop_c10
	jb ALARM2HR, loop_c10  
	Wait_Milli_Seconds(#50)
	jb ALARM2HR, loop_c10 
	jnb ALARM2HR, $	
	clr TR0
	sjmp loop_a110
loop_a110:
	mov a, BCD_hr_arm2
	cjne a,#0x11, loop_a210
	mov a, #12
	da a 
	mov BCD_hr_arm2, a
	sjmp loop_d10
loop_a210: 
	cjne a,#0x12, loop_a310
	mov a, #0x01
	da a
	mov BCD_hr_arm2, a
	ljmp loop_b
loop_a310:
	mov a,BCD_hr_arm2
	add a, #0x01
	da a
	mov BCD_hr_arm2, a
	ljmp loop_b
loop_d10:
	mov a, BCD_m_arm2
	cjne a,#'P', loop_d210
	mov a, #'A'
	mov BCD_m_arm2, a
	ljmp loop_b
loop_d210: 
	mov a, #'P'
	mov BCD_m_arm2, a
	ljmp loop_b
loop_c10:
	jb ALARM2MIN, loop_b1
	Wait_Milli_Seconds(#50)
	jb ALARM2MIN, loop_b1
	jnb ALARM2MIN, $
	clr TR0
	mov a, BCD_min_arm2
	cjne a,#0x59, loop_c210
	mov a, #0
	da a 
	mov BCD_min_arm2, a
	sjmp loop_a110	
loop_c210:
	mov a, BCD_min_arm2
	add a, #0x01
	da a
	mov BCD_min_arm2, a
	ljmp loop_b	
loop_f:
	mov r0, BCD_day1
	mov r1, BCD_day2
	mov r2, BCD_day3
	cjne r1, #0b01000001, loop_f1
	mov r0, #0b01010011
	mov r1, #0b01010101
	mov r2, #0b01001110
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp loop_b	
loop_f1:
	cjne r0, #0b01010011, loop_f2
	mov r0, #0b01001101
	mov r1, #0b01001111
	mov r2, #0b01001110
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp loop_b
loop_f2:
	cjne r0, #0b01001101, loop_f3
	mov r0, #0b01010100
	mov r1, #0b01010101
	mov r2, #0b01000101
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp loop_b
loop_f3:
	cjne r2, #0b01000101, loop_f4 
	mov r0, #0b01010111
	mov r1, #0b01000101
	mov r2, #0b01000100
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp loop_b
loop_f4:
	cjne r0, #0b01010111, loop_f5
	mov r0, #0b01010100
	mov r1, #0b01001000
	mov r2, #0b01010101
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp loop_b
loop_f5:
	cjne r1, #0b01001000, loop_f6
	mov r0, #0b01000110
	mov r1, #0b01010010
	mov r2, #0b01001001
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp loop_b
loop_f6:
	mov r0, #0b01010011
	mov r1, #0b01000001
	mov r2, #0b01010100
	mov BCD_day1, r0
	mov BCD_day2, r1
	mov BCD_day3, r2
	ljmp loop_b
END
