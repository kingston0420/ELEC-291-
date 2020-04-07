// PeriodEFM8.c: Measure the period of a signal on pin P0.1.
//
// By:  Jesus Calvino-Fraga (c) 2008-2018
//
// The next line clears the "C51 command line options:" field when compiling with CrossIDE
//  ~C51~  

#include <EFM8LB1.h>
//#include <EFM8UB2.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>

#define SYSCLK      72000000L  // SYSCLK frequency in Hz
#define BAUDRATE      115200L  // Baud rate of UART in bps

#define LCD_RS P2_6
// #define LCD_RW Px_x // Not used in this code.  Connect to GND
#define LCD_E  P2_5
#define LCD_D4 P2_4
#define LCD_D5 P2_3
#define LCD_D6 P2_2
#define LCD_D7 P2_1



char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key
  
	VDM0CN |= 0x80;
	RSTSRC = 0x02;

	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif
	
	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)	
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif
	
	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
//	P1MDOUT |= 0x11; we don't need this
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0X00;
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	// Configure Uart 0
	SCON0 = 0x10;
	CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
	
	return 0;
}

void InitADC (void)
{
	SFRPAGE = 0x00;
	ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	ADC0CF1 = 0b_0_0_011110; // Same as default for now
	ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	ADEN=1; // Enable ADC
}

// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	for(j=ms; j!=0; j--)
	{
		Timer3us(249);
		Timer3us(249);
		Timer3us(249);
		Timer3us(250);
	}
}

#define VDD 3.309 // The measured value of VDD in volts

void InitPinADC (unsigned char portno, unsigned char pinno)
{
unsigned char mask;
mask=1<<pinno;
SFRPAGE = 0x20;
switch (portno)
{case 0: // P0.0 and P0.3 can not be used for analog input
P0MDIN &= (~mask); // Set pin as analog input
P0|=mask; // Set the bit associated with the pin in the Pn register to 1
P0SKIP |= mask; // Skip Crossbar decoding for this pin
break;
case 1:
P1MDIN &= (~mask); // Set pin as analog input
P1|=mask; // Set the bit associated with the pin in the Pn register to 1
P1SKIP |= mask; // Skip Crossbar decoding for this pin
break;
case 2: // P2.0 and P2.7 can not be used for analog input
P2MDIN &= (~mask); // Set pin as analog input
P2|=mask; // Set the bit associated with the pin in the Pn register to 1
P2SKIP |= mask; // Skip Crossbar decoding for this pin
break;
default: // P3 can not be used for analog input
break;
}
SFRPAGE = 0x00;
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	ADC0MX = pin;   // Select input from pin
	ADBUSY=1;       // Dummy conversion first to select new pin
	while (ADBUSY); // Wait for dummy conversion to finish
	ADBUSY = 1;     // Convert voltage at the pin
	while (ADBUSY); // Wait for conversion to complete
	return (ADC0);
}

float Volts_at_Pin( unsigned char pin)
{
return ((ADC_at_Pin(pin)*VDD)/16383.0);
}

void TIMER0_Init(void)
{
	TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	TR0=0; // Stop Timer/Counter 0
}

void LCD_pulse (void)
{
	LCD_E=1;
	Timer3us(40);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the C8051Fxxx is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	Timer3us(40);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	waitms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	waitms(5);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	// LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<16; j++) WriteData(' '); // Clear the rest of the line
}

int getsn (char * buff, int len)
{
	int j;
	char c;
	
	for(j=0; j<(len-1); j++)
	{
		c=getchar();
		if ( (c=='\n') || (c=='\r') )
		{
			buff[j]=0;
			return j;
		}
		else
		{
			buff[j]=c;
		}
	}
	buff[j]=0;
	return len;
}

unsigned int Get_ADC (void)
{
	ADBUSY = 1;
	while (ADBUSY); // Wait for conversion to complete
	return (ADC0);
}

void main (void) 
{
	float v[2];// = malloc(4*sizeof(float));
	float sign = 1;
	float half_period;
	float zero_diff;
	int delay;
	char xdata String1[16];
    char xdata String2[16]; 
	float VD = 3.309;    
    char buff[3];
    
    
	LCD_4BIT();
	TIMER0_Init();

	waitms(500); // Give PuTTY a chance to start.
//	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	
	InitPinADC(1,6); // Configure P1.6 as analog input this is TEST
	InitPinADC(1,7); // Configure P1.7 as analog input this is REF
    InitADC();
	
    while (1)
    {
	  	ADC0MX=QFP32_MUX_P1_7;
		ADBUSY=1;
		while (ADBUSY); // Wait for conversion to complete
		// Reset the timer
		TL0=0;
		TH0=0;
		while (Get_ADC()!=0); // Wait for the signal to be zero
		while (Get_ADC()==0); // Wait for the signal to be positive
		TR0=1; // Start the timer 0
		while (Get_ADC()!=0); // Wait for the signal to be zero again
		TR0=0; // Stop timer 0
		half_period=TH0*256.0+TL0; // The 16-bit number [TH0-TL0]
		
		delay = (int)(half_period/12.0); //this is how much time you want to delay
		
		while(Get_ADC()!=0); // Wait for the signal to be zero
		while(Get_ADC()==0); // Wait for the signal to be positive
		if(delay<1000){
			Timer3us(delay);
		}
		else{
			waitms(delay/1000);
		}
		v[0] = Volts_at_Pin(QFP32_MUX_P1_7); // meausre the peak value of ref
		
		while(Volts_at_Pin(QFP32_MUX_P1_6)!=0); // Wait for the signal to be zero
		while(Volts_at_Pin(QFP32_MUX_P1_6)==0); // Wait for the signal to be positive
		if(delay<1000){
			Timer3us(delay);
		}
		else{
			waitms(delay/1000);
		}
		v[1] = Volts_at_Pin(QFP32_MUX_P1_6);
	  	
	  	TH0 = 0, TL0 = 0;
	  	while (Volts_at_Pin(QFP32_MUX_P1_6)!=0 || Volts_at_Pin(QFP32_MUX_P1_7)!=0);
		while (Volts_at_Pin(QFP32_MUX_P1_6)==0 && Volts_at_Pin(QFP32_MUX_P1_7)==0);
	  	TR0 = 1;
	  	if(Volts_at_Pin(QFP32_MUX_P1_6)!=0){
	  		sign = -1;
	  		while (Volts_at_Pin(QFP32_MUX_P1_7)==0);
	  	}
	  	else{
	  		sign = 1;
	  		while (Volts_at_Pin(QFP32_MUX_P1_6)==0);
	  	}
	  	TR0 = 0;
	  	zero_diff=TH0*256.0+TL0; // meauring the time difference of the zero cross
	    
	    if(P0_2==0){
	    if(P0_1==1){
	    printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6)); // convert the half period to HZ 
		printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f degrees     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0)))); // convert peak to rsm 
		sprintf(String1, "T=%.2fV R=%.2fV", v[0]*1.4142631, v[1]*1.4142631);
		sprintf(String2, "F=%.0fHz P=%.1f   ",1.0/(half_period*24.0/72.0e6), (sign*((zero_diff*360.0)/(half_period*2.0)))); //convert time difference to phase different
		LCDprint(String1, 1, 0);
	    LCDprint(String2, 2, 0);
	    	}
	    	else{
	    	 printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6));
		printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f degrees     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0))));
		sprintf(String1, "T=%.2fV R=%.2fV", v[0]*1.4142631, v[1]*1.4142631);
		sprintf(String2, ".=%2.2fms P=%.1f  ",(1000*half_period*24.0/72.0e6), (sign*((zero_diff*360.0)/(half_period*2.0)))); 
		LCDprint(String1, 1, 0);
	    LCDprint(String2, 2, 0);
	    	}
	    }
	    else if (P0_2==1){
	    if(P0_1==1){
	    printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6));
		printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f radian     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0)))/180);
		sprintf(String1, "T=%.2fV R=%4.2fV", v[0]*1.4142631, v[1]*1.4142631);
		sprintf(String2, "F=%.0fHz P=%.2fpi  ",1.0/(half_period*24.0/72.0e6), (sign*((zero_diff*360.0)/(half_period*2.0)))/180); 
		LCDprint(String1, 1, 0);
	    LCDprint(String2, 2, 0);
	    }
	    else{
	    printf ("\rf=%.2fHz, ",1.0/(half_period*24.0/72.0e6));
		printf ("Test Voltage=%.2fV, Ref Voltage=%.2fV, Phase=%.2f radian     ", v[0]*1.4142631, v[1]*1.4142631, (sign*((zero_diff*360.0)/(half_period*2.0)))/180);
		sprintf(String1, "T=%.2fV R=%4.2fV", v[0]*1.4142631, v[1]*1.4142631);
		sprintf(String2, "T=%2.1fms P=%.2fpi  ",(1000*half_period*24.0/72.0e6),(sign*((zero_diff*360.0)/(half_period*2.0)))/180); 
		LCDprint(String1, 1, 0);
	    LCDprint(String2, 2, 0);
	   // LCDprint(custom,2,0); 
	    }
	    }
	    
	    else{
	    LCDprint("nothing",1,0); 
	    
	    }
		waitms(100);
		
 	}
	
}

//CH1: 1.7 (test)
//CH2: 1.6 (reference)


 