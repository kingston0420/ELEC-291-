;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Mar 08 17:11:39 2020
;--------------------------------------------------------
$name lab6nobonus
$optc51 --model-small
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
	public _main
	public _getsn
	public _Timer2_ISR
	public __c51_external_startup
	public _getsn_PARM_2
	public _direction
	public _speed
	public _direction_c
	public _speed_c
	public _pwm_count
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
_pwm_count:
	ds 1
_speed_c:
	ds 3
_direction_c:
	ds 2
_speed:
	ds 2
_direction:
	ds 2
_getsn_PARM_2:
	ds 2
_getsn_buff_1_48:
	ds 3
_getsn_sloc0_1_0:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg R_OSEG
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
_Timer2_ISR_sloc0_1_0:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
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
	CSEG at 0x002b
	ljmp	_Timer2_ISR
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
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:19: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:21: volatile int  speed = 0, direction = 0;
	clr	a
	mov	_speed,a
	mov	(_speed + 1),a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:21: 
	clr	a
	mov	_direction,a
	mov	(_direction + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:24: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:27: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:28: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:29: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:31: VDM0CN=0x80;       // enable VDD Amonitor
	mov	_VDM0CN,#0x80
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:32: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:39: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:40: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:41: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:62: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:63: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:64: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:65: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:66: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:67: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:72: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:73: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:74: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:75: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:81: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:82: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:83: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:84: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:85: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:86: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:87: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:90: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:91: CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:92: TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:93: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:94: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:95: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:97: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:100: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:103: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	b
	push	ar2
	push	ar3
	push	psw
	mov	psw,#0x00
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:105: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:107: pwm_count++;
	inc	_pwm_count
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:108: if(pwm_count>100) pwm_count=0;
	mov	a,_pwm_count
	add	a,#0xff - 0x64
	jnc	L003002?
	mov	_pwm_count,#0x00
L003002?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:110: if (direction){ //if it is 1 then we want to go CW
	mov	a,_direction
	orl	a,(_direction + 1)
	jz	L003004?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:111: OUT0=pwm_count>speed?0:1; 
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_speed
	subb	a,r2
	mov	a,(_speed + 1)
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:112: OUT1=0;
	clr	_P2_1
	sjmp	L003006?
L003004?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:114: OUT0=0;
	clr	_P2_0
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:115: OUT1=pwm_count>speed?0:1;  
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_speed
	subb	a,r2
	mov	a,(_speed + 1)
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_1,c
L003006?:
	pop	psw
	pop	ar3
	pop	ar2
	pop	b
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;len                       Allocated with name '_getsn_PARM_2'
;buff                      Allocated with name '_getsn_buff_1_48'
;j                         Allocated with name '_getsn_sloc0_1_0'
;c                         Allocated to registers r3 
;sloc0                     Allocated with name '_getsn_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:120: int getsn (char * buff, int len)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
	mov	_getsn_buff_1_48,dpl
	mov	(_getsn_buff_1_48 + 1),dph
	mov	(_getsn_buff_1_48 + 2),b
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:125: for(j=0; j<(len-1); j++)
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
L004005?:
	clr	c
	mov	a,r1
	subb	a,r7
	mov	a,r2
	xrl	a,#0x80
	mov	b,r0
	xrl	b,#0x80
	subb	a,b
	jnc	L004008?
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:127: c=getchar();
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
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:128: if ( (c=='\n') || (c=='\r') )
	cjne	r3,#0x0A,L004015?
	sjmp	L004001?
L004015?:
	cjne	r3,#0x0D,L004002?
L004001?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:130: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_48
	mov	r4,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_48 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_48 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:131: return j;
	mov	dpl,_getsn_sloc0_1_0
	mov	dph,(_getsn_sloc0_1_0 + 1)
	ret
L004002?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:135: buff[j]=c;
	mov	a,r1
	add	a,_getsn_buff_1_48
	mov	r4,a
	mov	a,r2
	addc	a,(_getsn_buff_1_48 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_48 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:125: for(j=0; j<(len-1); j++)
	inc	r1
	cjne	r1,#0x00,L004018?
	inc	r2
L004018?:
	mov	_getsn_sloc0_1_0,r1
	mov	(_getsn_sloc0_1_0 + 1),r2
	sjmp	L004005?
L004008?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:138: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_48
	mov	r2,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_48 + 1)
	mov	r3,a
	mov	r4,(_getsn_buff_1_48 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:139: return len;
	mov	dpl,_getsn_PARM_2
	mov	dph,(_getsn_PARM_2 + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:142: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:144: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:146: "Check pins P2.0 and P2.1 with the oscilloscope.\r\n\n");
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:148: while(1)
L005005?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:150: printf("Please enter the speed (2 digits):");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:151: getsn(speed_c, sizeof(speed_c));
	mov	_getsn_PARM_2,#0x03
	clr	a
	mov	(_getsn_PARM_2 + 1),a
	mov	dptr,#_speed_c
	mov	b,#0x40
	lcall	_getsn
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:153: speed = atoi(speed_c);
	mov	dptr,#_speed_c
	mov	b,#0x40
	lcall	_atoi
	mov	_speed,dpl
	mov	(_speed + 1),dph
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:154: printf("\nThe speed is set to %d\n",speed);
	push	_speed
	push	(_speed + 1)
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:156: printf("Please enter the direction (0 for CCW,1 for CW):");
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:157: getsn(direction_c, sizeof(direction_c));
	mov	_getsn_PARM_2,#0x02
	clr	a
	mov	(_getsn_PARM_2 + 1),a
	mov	dptr,#_direction_c
	mov	b,#0x40
	lcall	_getsn
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:159: direction = atoi(direction_c); 
	mov	dptr,#_direction_c
	mov	b,#0x40
	lcall	_atoi
	mov	_direction,dpl
	mov	(_direction + 1),dph
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:161: if(direction) printf("\nClockwise rotation\n"); //print what direction we are in
	mov	a,_direction
	orl	a,(_direction + 1)
	jz	L005002?
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L005005?
L005002?:
;	C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\lab6nobonus.c:162: else printf("\nCounterClockwise rotation\n");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L005005?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'Author: Kingston Chen.'
	db 0x0D
	db 0x0A
	db 'Check pins P2.0 and P2.1 with the os'
	db 'cilloscope.'
	db 0x0D
	db 0x0A
	db 0x0A
	db 0x00
__str_2:
	db 'Please enter the speed (2 digits):'
	db 0x00
__str_3:
	db 0x0A
	db 'The speed is set to %d'
	db 0x0A
	db 0x00
__str_4:
	db 'Please enter the direction (0 for CCW,1 for CW):'
	db 0x00
__str_5:
	db 0x0A
	db 'Clockwise rotation'
	db 0x0A
	db 0x00
__str_6:
	db 0x0A
	db 'CounterClockwise rotation'
	db 0x0A
	db 0x00

	CSEG

end
