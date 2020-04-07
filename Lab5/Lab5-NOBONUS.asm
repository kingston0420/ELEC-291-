;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Mon Mar 02 12:00:19 2020
;--------------------------------------------------------
$name Lab5_NOBONUS
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _Get_ADC
	public _getsn
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _TIMER0_Init
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _waitms
	public _Timer3us
	public _InitADC
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _getsn_PARM_2
	public _LCDprint_PARM_2
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LCDprint_PARM_2:
	ds 1
_getsn_PARM_2:
	ds 2
_getsn_buff_1_95:
	ds 3
_getsn_sloc0_1_0:
	ds 2
_main_v_1_103:
	ds 8
_main_sign_1_103:
	ds 4
_main_half_period_1_103:
	ds 4
_main_zero_diff_1_103:
	ds 4
_main_delay_1_103:
	ds 2
_main_buff_1_103:
	ds 3
_main_sloc0_1_0:
	ds 4
_main_sloc1_1_0:
	ds 4
_main_sloc2_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
_main_String1_1_103:
	ds 16
_main_String2_1_103:
	ds 16
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:28: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:31: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:32: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:33: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:35: VDM0CN |= 0x80;
	orl	_VDM0CN,#0x80
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:36: RSTSRC = 0x02;
	mov	_RSTSRC,#0x02
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:43: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:44: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:45: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:66: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:67: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:68: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:69: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:70: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:71: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:76: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:78: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:79: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:80: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:86: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:87: CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	mov	_CKCON0,_CKCON0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:88: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:89: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:90: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:91: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:92: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:93: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:95: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:98: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:100: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:101: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:102: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:103: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:104: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:105: ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:106: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:107: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:111: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:116: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:118: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:119: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:121: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:122: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:124: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:125: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:122: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:127: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:130: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:133: for(j=ms; j!=0; j--)
L005001?:
	cjne	r2,#0x00,L005010?
	cjne	r3,#0x00,L005010?
	ret
L005010?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:135: Timer3us(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	lcall	_Timer3us
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:136: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:137: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:138: Timer3us(250);
	mov	dpl,#0xFA
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:133: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L005011?
	dec	r3
L005011?:
	sjmp	L005001?
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:144: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:147: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L006013?
L006011?:
	add	a,acc
L006013?:
	djnz	b,L006011?
	mov	r3,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:148: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:149: switch (portno)
	cjne	r2,#0x00,L006014?
	sjmp	L006001?
L006014?:
	cjne	r2,#0x01,L006015?
	sjmp	L006002?
L006015?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:150: {case 0: // P0.0 and P0.3 can not be used for analog input
	cjne	r2,#0x02,L006005?
	sjmp	L006003?
L006001?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:151: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:152: P0|=mask; // Set the bit associated with the pin in the Pn register to 1
	mov	a,r3
	orl	_P0,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:153: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:154: break;
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:155: case 1:
	sjmp	L006005?
L006002?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:156: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:157: P1|=mask; // Set the bit associated with the pin in the Pn register to 1
	mov	a,r3
	orl	_P1,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:158: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:159: break;
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:160: case 2: // P2.0 and P2.7 can not be used for analog input
	sjmp	L006005?
L006003?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:161: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:162: P2|=mask; // Set the bit associated with the pin in the Pn register to 1
	mov	a,r3
	orl	_P2,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:163: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:167: }
L006005?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:168: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:171: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:174: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:175: while (ADBUSY); // Wait for dummy conversion to finish
L007001?:
	jb	_ADBUSY,L007001?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:176: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:177: while (ADBUSY); // Wait for conversion to complete
L007004?:
	jb	_ADBUSY,L007004?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:178: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:181: float Volts_at_Pin( unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:183: return ((ADC_at_Pin(pin)*VDD)/16383.0);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xC6A8
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:186: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:188: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:189: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:190: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:193: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:195: LCD_E=1;
	setb	_P2_5
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:196: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:197: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:200: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:203: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:204: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P2_1,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:205: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P2_2,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:206: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P2_3,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:207: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_4,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:208: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:209: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:210: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:211: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:212: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:213: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:214: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:215: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:218: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:220: LCD_RS=1;
	setb	_P2_6
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:221: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:222: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:225: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:227: LCD_RS=0;
	clr	_P2_6
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:228: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:229: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:232: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:234: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_5
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:236: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:238: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:239: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:240: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:243: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:244: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:245: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:246: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:249: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:253: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L015013?
	mov	r5,#0xC0
	sjmp	L015014?
L015013?:
	mov	r5,#0x80
L015014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:254: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:255: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L015003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L015006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L015003?
	inc	r6
	sjmp	L015003?
L015006?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:256: if(clear) for(; j<16; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L015011?
	mov	ar2,r5
	mov	ar3,r6
L015007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L015011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L015007?
	inc	r3
	sjmp	L015007?
L015011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;len                       Allocated with name '_getsn_PARM_2'
;buff                      Allocated with name '_getsn_buff_1_95'
;j                         Allocated with name '_getsn_sloc0_1_0'
;c                         Allocated to registers r3 
;sloc0                     Allocated with name '_getsn_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:259: int getsn (char * buff, int len)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
	mov	_getsn_buff_1_95,dpl
	mov	(_getsn_buff_1_95 + 1),dph
	mov	(_getsn_buff_1_95 + 2),b
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:264: for(j=0; j<(len-1); j++)
	clr	a
	mov	_getsn_sloc0_1_0,a
	mov	(_getsn_sloc0_1_0 + 1),a
	mov	a,_getsn_PARM_2
	add	a,#0xff
	mov	r7,a
	mov	a,(_getsn_PARM_2 + 1)
	addc	a,#0xff
	mov	r0,a
	mov	r1,#0x00
	mov	r2,#0x00
L016005?:
	clr	c
	mov	a,r1
	subb	a,r7
	mov	a,r2
	xrl	a,#0x80
	mov	b,r0
	xrl	b,#0x80
	subb	a,b
	jnc	L016008?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:266: c=getchar();
	push	ar2
	push	ar7
	push	ar0
	push	ar1
	lcall	_getchar
	mov	r3,dpl
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:267: if ( (c=='\n') || (c=='\r') )
	cjne	r3,#0x0A,L016015?
	sjmp	L016001?
L016015?:
	cjne	r3,#0x0D,L016002?
L016001?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:269: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_95
	mov	r4,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_95 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_95 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:270: return j;
	mov	dpl,_getsn_sloc0_1_0
	mov	dph,(_getsn_sloc0_1_0 + 1)
	ret
L016002?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:274: buff[j]=c;
	mov	a,r1
	add	a,_getsn_buff_1_95
	mov	r4,a
	mov	a,r2
	addc	a,(_getsn_buff_1_95 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_95 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:264: for(j=0; j<(len-1); j++)
	inc	r1
	cjne	r1,#0x00,L016018?
	inc	r2
L016018?:
	mov	_getsn_sloc0_1_0,r1
	mov	(_getsn_sloc0_1_0 + 1),r2
	sjmp	L016005?
L016008?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:277: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_95
	mov	r2,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_95 + 1)
	mov	r3,a
	mov	r4,(_getsn_buff_1_95 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:278: return len;
	mov	dpl,_getsn_PARM_2
	mov	dph,(_getsn_PARM_2 + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_ADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:281: unsigned int Get_ADC (void)
;	-----------------------------------------
;	 function Get_ADC
;	-----------------------------------------
_Get_ADC:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:283: ADBUSY = 1;
	setb	_ADBUSY
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:284: while (ADBUSY); // Wait for conversion to complete
L017001?:
	jb	_ADBUSY,L017001?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:285: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v                         Allocated with name '_main_v_1_103'
;sign                      Allocated with name '_main_sign_1_103'
;half_period               Allocated with name '_main_half_period_1_103'
;zero_diff                 Allocated with name '_main_zero_diff_1_103'
;delay                     Allocated with name '_main_delay_1_103'
;VD                        Allocated to registers 
;buff                      Allocated with name '_main_buff_1_103'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;sloc2                     Allocated with name '_main_sloc2_1_0'
;String1                   Allocated with name '_main_String1_1_103'
;String2                   Allocated with name '_main_String2_1_103'
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:288: void main (void) 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:301: LCD_4BIT();
	lcall	_LCD_4BIT
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:302: TIMER0_Init();
	lcall	_TIMER0_Init
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:304: waitms(500); // Give PuTTY a chance to start.
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:307: InitPinADC(1,6); // Configure P1.6 as analog input this is TEST
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:308: InitPinADC(1,7); // Configure P1.7 as analog input this is REF
	mov	_InitPinADC_PARM_2,#0x07
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:309: InitADC();
	lcall	_InitADC
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:311: while (1)
L018061?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:313: ADC0MX=QFP32_MUX_P1_7;
	mov	_ADC0MX,#0x0D
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:314: ADBUSY=1;
	setb	_ADBUSY
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:315: while (ADBUSY); // Wait for conversion to complete
L018001?:
	jb	_ADBUSY,L018001?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:317: TL0=0;
	mov	_TL0,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:318: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:319: while (Get_ADC()!=0); // Wait for the signal to be zero
L018004?:
	lcall	_Get_ADC
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	L018004?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:320: while (Get_ADC()==0); // Wait for the signal to be positive
L018007?:
	lcall	_Get_ADC
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L018007?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:321: TR0=1; // Start the timer 0
	setb	_TR0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:322: while (Get_ADC()!=0); // Wait for the signal to be zero again
L018010?:
	lcall	_Get_ADC
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	L018010?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:323: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:324: half_period=TH0*256.0+TL0; // The 16-bit number [TH0-TL0]
	mov	dpl,_TH0
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	_main_half_period_1_103,dpl
	mov	(_main_half_period_1_103 + 1),dph
	mov	(_main_half_period_1_103 + 2),b
	mov	(_main_half_period_1_103 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:326: delay = (int)(half_period/12.0); //this is how much time you want to delay
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,_main_half_period_1_103
	mov	dph,(_main_half_period_1_103 + 1)
	mov	b,(_main_half_period_1_103 + 2)
	mov	a,(_main_half_period_1_103 + 3)
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fs2sint
	mov	_main_delay_1_103,dpl
	mov	(_main_delay_1_103 + 1),dph
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:328: while(Get_ADC()!=0); // Wait for the signal to be zero
L018013?:
	lcall	_Get_ADC
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	L018013?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:329: while(Get_ADC()==0); // Wait for the signal to be positive
L018016?:
	lcall	_Get_ADC
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	L018016?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:330: if(delay<1000){
	clr	c
	mov	a,_main_delay_1_103
	subb	a,#0xE8
	mov	a,(_main_delay_1_103 + 1)
	xrl	a,#0x80
	subb	a,#0x83
	clr	a
	rlc	a
	mov	r4,a
	jz	L018020?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:331: Timer3us(delay);
	mov	dpl,_main_delay_1_103
	push	ar4
	lcall	_Timer3us
	pop	ar4
	sjmp	L018021?
L018020?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:334: waitms(delay/1000);
	mov	__divsint_PARM_2,#0xE8
	mov	(__divsint_PARM_2 + 1),#0x03
	mov	dpl,_main_delay_1_103
	mov	dph,(_main_delay_1_103 + 1)
	push	ar4
	lcall	__divsint
	lcall	_waitms
	pop	ar4
L018021?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:336: v[0] = Volts_at_Pin(QFP32_MUX_P1_7); // meausre the peak value of ref
	mov	dpl,#0x0D
	push	ar4
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r2,a
	pop	ar4
	mov	_main_v_1_103,r5
	mov	(_main_v_1_103 + 1),r6
	mov	(_main_v_1_103 + 2),r7
	mov	(_main_v_1_103 + 3),r2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:338: while(Volts_at_Pin(QFP32_MUX_P1_6)!=0); // Wait for the signal to be zero
L018022?:
	mov	dpl,#0x0C
	push	ar4
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r5,b
	mov	r6,a
	pop	ar4
	mov	a,r2
	orl	a,r3
	orl	a,r5
	mov	b,r6
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L018022?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:339: while(Volts_at_Pin(QFP32_MUX_P1_6)==0); // Wait for the signal to be positive
L018025?:
	mov	dpl,#0x0C
	push	ar4
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r5,b
	mov	r6,a
	pop	ar4
	mov	a,r2
	orl	a,r3
	orl	a,r5
	mov	b,r6
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jz	L018025?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:340: if(delay<1000){
	mov	a,r4
	jz	L018029?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:341: Timer3us(delay);
	mov	dpl,_main_delay_1_103
	lcall	_Timer3us
	sjmp	L018030?
L018029?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:344: waitms(delay/1000);
	mov	__divsint_PARM_2,#0xE8
	mov	(__divsint_PARM_2 + 1),#0x03
	mov	dpl,_main_delay_1_103
	mov	dph,(_main_delay_1_103 + 1)
	lcall	__divsint
	lcall	_waitms
L018030?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:346: v[1] = Volts_at_Pin(QFP32_MUX_P1_6);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	(_main_v_1_103 + 0x0004),r2
	mov	((_main_v_1_103 + 0x0004) + 1),r3
	mov	((_main_v_1_103 + 0x0004) + 2),r4
	mov	((_main_v_1_103 + 0x0004) + 3),r5
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:348: TH0 = 0, TL0 = 0;
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:349: while (Volts_at_Pin(QFP32_MUX_P1_6)!=0 || Volts_at_Pin(QFP32_MUX_P1_7)!=0);
L018032?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	mov	b,r5
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L018032?
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	mov	b,r5
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L018032?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:350: while (Volts_at_Pin(QFP32_MUX_P1_6)==0 && Volts_at_Pin(QFP32_MUX_P1_7)==0);
L018036?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	mov	b,r5
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L018038?
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	mov	b,r5
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jz	L018036?
L018038?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:351: TR0 = 1;
	setb	_TR0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:352: if(Volts_at_Pin(QFP32_MUX_P1_6)!=0){
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	mov	b,r5
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jz	L018046?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:353: sign = -1;
	mov	_main_sign_1_103,#0x00
	mov	(_main_sign_1_103 + 1),#0x00
	mov	(_main_sign_1_103 + 2),#0x80
	mov	(_main_sign_1_103 + 3),#0xBF
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:354: while (Volts_at_Pin(QFP32_MUX_P1_7)==0);
L018039?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,r6
	orl	a,r7
	orl	a,r2
	mov	b,r3
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L018047?
	sjmp	L018039?
L018046?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:357: sign = 1;
	mov	_main_sign_1_103,#0x00
	mov	(_main_sign_1_103 + 1),#0x00
	mov	(_main_sign_1_103 + 2),#0x80
	mov	(_main_sign_1_103 + 3),#0x3F
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:358: while (Volts_at_Pin(QFP32_MUX_P1_6)==0);
L018042?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	mov	b,r5
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jz	L018042?
L018047?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:360: TR0 = 0;
	clr	_TR0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:361: zero_diff=TH0*256.0+TL0; // meauring the time difference of the zero cross
	mov	dpl,_TH0
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	_main_zero_diff_1_103,dpl
	mov	(_main_zero_diff_1_103 + 1),dph
	mov	(_main_zero_diff_1_103 + 2),b
	mov	(_main_zero_diff_1_103 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:363: if(P0_2==0){
	jnb	_P0_2,L018110?
	ljmp	L018058?
L018110?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:364: if(P0_1==1){
	jb	_P0_1,L018111?
	ljmp	L018049?
L018111?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:365: printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6)); // convert the half period to HZ 
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC0
	mov	a,#0x41
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x40
	push	acc
	mov	a,#0x54
	push	acc
	mov	a,#0x89
	push	acc
	mov	a,#0x4C
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:366: printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f degrees     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0)))); // convert peak to rsm 
	push	_main_zero_diff_1_103
	push	(_main_zero_diff_1_103 + 1)
	push	(_main_zero_diff_1_103 + 2)
	push	(_main_zero_diff_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x40
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	dpl,_main_sloc1_1_0
	mov	dph,(_main_sloc1_1_0 + 1)
	mov	b,(_main_sloc1_1_0 + 2)
	mov	a,(_main_sloc1_1_0 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sign_1_103
	mov	dph,(_main_sign_1_103 + 1)
	mov	b,(_main_sign_1_103 + 2)
	mov	a,(_main_sign_1_103 + 3)
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:367: sprintf(String1, "T=%.2fV R=%.2fV", v[0]*1.4142631, v[1]*1.4142631);
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String1_1_103
	push	acc
	mov	a,#(_main_String1_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:368: sprintf(String2, "F=%.0fHz P=%.1f   ",1.0/(half_period*24.0/72.0e6), (sign*((zero_diff*360.0)/(half_period*2.0)))); //convert time difference to phase different
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String2_1_103
	push	acc
	mov	a,#(_main_String2_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:369: LCDprint(String1, 1, 0);
	mov	_LCDprint_PARM_2,#0x01
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String1_1_103
	mov	b,#0x00
	lcall	_LCDprint
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:370: LCDprint(String2, 2, 0);
	mov	_LCDprint_PARM_2,#0x02
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String2_1_103
	mov	b,#0x00
	lcall	_LCDprint
	ljmp	L018059?
L018049?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:373: printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6));
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC0
	mov	a,#0x41
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x40
	push	acc
	mov	a,#0x54
	push	acc
	mov	a,#0x89
	push	acc
	mov	a,#0x4C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:374: printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f degrees     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0))));
	push	_main_zero_diff_1_103
	push	(_main_zero_diff_1_103 + 1)
	push	(_main_zero_diff_1_103 + 2)
	push	(_main_zero_diff_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x40
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc2_1_0
	mov	dph,(_main_sloc2_1_0 + 1)
	mov	b,(_main_sloc2_1_0 + 2)
	mov	a,(_main_sloc2_1_0 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sign_1_103
	mov	dph,(_main_sign_1_103 + 1)
	mov	b,(_main_sign_1_103 + 2)
	mov	a,(_main_sign_1_103 + 3)
	lcall	___fsmul
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:375: sprintf(String1, "T=%.2fV R=%.2fV", v[0]*1.4142631, v[1]*1.4142631);
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String1_1_103
	push	acc
	mov	a,#(_main_String1_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:376: sprintf(String2, ".=%2.2fms P=%.1f  ",(1000*half_period*24.0/72.0e6), (sign*((zero_diff*360.0)/(half_period*2.0)))); 
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#0x8000
	mov	b,#0xBB
	mov	a,#0x46
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x40
	push	acc
	mov	a,#0x54
	push	acc
	mov	a,#0x89
	push	acc
	mov	a,#0x4C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String2_1_103
	push	acc
	mov	a,#(_main_String2_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:377: LCDprint(String1, 1, 0);
	mov	_LCDprint_PARM_2,#0x01
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String1_1_103
	mov	b,#0x00
	lcall	_LCDprint
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:378: LCDprint(String2, 2, 0);
	mov	_LCDprint_PARM_2,#0x02
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String2_1_103
	mov	b,#0x00
	lcall	_LCDprint
	ljmp	L018059?
L018058?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:381: else if (P0_2==1){
	jb	_P0_2,L018112?
	ljmp	L018055?
L018112?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:382: if(P0_1==1){
	jb	_P0_1,L018113?
	ljmp	L018052?
L018113?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:383: printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6));
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC0
	mov	a,#0x41
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x40
	push	acc
	mov	a,#0x54
	push	acc
	mov	a,#0x89
	push	acc
	mov	a,#0x4C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:384: printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f radian     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0)))/180);
	push	_main_zero_diff_1_103
	push	(_main_zero_diff_1_103 + 1)
	push	(_main_zero_diff_1_103 + 2)
	push	(_main_zero_diff_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x40
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	dpl,_main_sloc1_1_0
	mov	dph,(_main_sloc1_1_0 + 1)
	mov	b,(_main_sloc1_1_0 + 2)
	mov	a,(_main_sloc1_1_0 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sign_1_103
	mov	dph,(_main_sign_1_103 + 1)
	mov	b,(_main_sign_1_103 + 2)
	mov	a,(_main_sign_1_103 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:385: sprintf(String1, "T=%.2fV R=%4.2fV", v[0]*1.4142631, v[1]*1.4142631);
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String1_1_103
	push	acc
	mov	a,#(_main_String1_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:386: sprintf(String2, "F=%.0fHz P=%.2fpi  ",1.0/(half_period*24.0/72.0e6), (sign*((zero_diff*360.0)/(half_period*2.0)))/180); 
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String2_1_103
	push	acc
	mov	a,#(_main_String2_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:387: LCDprint(String1, 1, 0);
	mov	_LCDprint_PARM_2,#0x01
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String1_1_103
	mov	b,#0x00
	lcall	_LCDprint
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:388: LCDprint(String2, 2, 0);
	mov	_LCDprint_PARM_2,#0x02
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String2_1_103
	mov	b,#0x00
	lcall	_LCDprint
	ljmp	L018059?
L018052?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:391: printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6));
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC0
	mov	a,#0x41
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x40
	push	acc
	mov	a,#0x54
	push	acc
	mov	a,#0x89
	push	acc
	mov	a,#0x4C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:392: printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f radian     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0)))/180);
	push	_main_zero_diff_1_103
	push	(_main_zero_diff_1_103 + 1)
	push	(_main_zero_diff_1_103 + 2)
	push	(_main_zero_diff_1_103 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x40
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc2_1_0
	mov	dph,(_main_sloc2_1_0 + 1)
	mov	b,(_main_sloc2_1_0 + 2)
	mov	a,(_main_sloc2_1_0 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sign_1_103
	mov	dph,(_main_sign_1_103 + 1)
	mov	b,(_main_sign_1_103 + 2)
	mov	a,(_main_sign_1_103 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:393: sprintf(String1, "T=%.2fV R=%4.2fV", v[0]*1.4142631, v[1]*1.4142631);
	push	(_main_v_1_103 + 0x0004)
	push	((_main_v_1_103 + 0x0004) + 1)
	push	((_main_v_1_103 + 0x0004) + 2)
	push	((_main_v_1_103 + 0x0004) + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_v_1_103
	push	(_main_v_1_103 + 1)
	push	(_main_v_1_103 + 2)
	push	(_main_v_1_103 + 3)
	mov	dptr,#0x0693
	mov	b,#0xB5
	mov	a,#0x3F
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String1_1_103
	push	acc
	mov	a,#(_main_String1_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:394: sprintf(String2, "T=%2.1fms P=%.2fpi  ",(1000*half_period*24.0/72.0e6),(sign*((zero_diff*360.0)/(half_period*2.0)))/180); 
	push	_main_half_period_1_103
	push	(_main_half_period_1_103 + 1)
	push	(_main_half_period_1_103 + 2)
	push	(_main_half_period_1_103 + 3)
	mov	dptr,#0x8000
	mov	b,#0xBB
	mov	a,#0x46
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x40
	push	acc
	mov	a,#0x54
	push	acc
	mov	a,#0x89
	push	acc
	mov	a,#0x4C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_String2_1_103
	push	acc
	mov	a,#(_main_String2_1_103 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:395: LCDprint(String1, 1, 0);
	mov	_LCDprint_PARM_2,#0x01
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String1_1_103
	mov	b,#0x00
	lcall	_LCDprint
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:396: LCDprint(String2, 2, 0);
	mov	_LCDprint_PARM_2,#0x02
	clr	_LCDprint_PARM_3
	mov	dptr,#_main_String2_1_103
	mov	b,#0x00
	lcall	_LCDprint
	sjmp	L018059?
L018055?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:402: LCDprint("nothing",1,0); 
	mov	_LCDprint_PARM_2,#0x01
	clr	_LCDprint_PARM_3
	mov	dptr,#__str_9
	mov	b,#0x80
	lcall	_LCDprint
L018059?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c:405: waitms(100);
	mov	dptr,#0x0064
	lcall	_waitms
	ljmp	L018061?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x0D
	db 'f=%.2fHz, '
	db 0x00
__str_1:
	db 'Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f degrees   '
	db '  '
	db 0x00
__str_2:
	db 'T=%.2fV R=%.2fV'
	db 0x00
__str_3:
	db 'F=%.0fHz P=%.1f   '
	db 0x00
__str_4:
	db '.=%2.2fms P=%.1f  '
	db 0x00
__str_5:
	db 'Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f radian    '
	db ' '
	db 0x00
__str_6:
	db 'T=%.2fV R=%4.2fV'
	db 0x00
__str_7:
	db 'F=%.0fHz P=%.2fpi  '
	db 0x00
__str_8:
	db 'T=%2.1fms P=%.2fpi  '
	db 0x00
__str_9:
	db 'nothing'
	db 0x00

	CSEG

end
