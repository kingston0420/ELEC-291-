#include <XC.h>
#include <stdio.h>
#include <stdlib.h>
 
// Configuration Bits (somehow XC32 takes care of this)
#pragma config FNOSC = FRCPLL       // Internal Fast RC oscillator (8 MHz) w/ PLL
#pragma config FPLLIDIV = DIV_2     // Divide FRC before PLL (now 4 MHz)
#pragma config FPLLMUL = MUL_20     // PLL Multiply (now 80 MHz)
#pragma config FPLLODIV = DIV_2     // Divide After PLL (now 40 MHz)
#pragma config FWDTEN = OFF         // Watchdog Timer Disabled
#pragma config FPBDIV = DIV_1       // PBCLK = SYCLK
#pragma config FSOSCEN = OFF        // Secondary Oscillator Enable (Disabled)

// Defines
#define SYSCLK 40000000L
#define Baud2BRG(desired_baud)( (SYSCLK / (16*desired_baud))-1)
#define metal 59900
 
void UART2Configure(int baud_rate)
{
    // Peripheral Pin Select
    U2RXRbits.U2RXR = 4;    //SET RX to RB8
    RPB9Rbits.RPB9R = 2;    //SET RB9 to TX

    U2MODE = 0;         // disable autobaud, TX and RX enabled only, 8N1, idle=HIGH
    U2STA = 0x1400;     // enable TX and RX
    U2BRG = Baud2BRG(baud_rate); // U2BRG = (FPb / (16*baud)) - 1
    
    U2MODESET = 0x8000;     // enable UART2
}

// Needed to by scanf() and gets()
int _mon_getc(int canblock)
{
	char c;
	
    if (canblock)
    {
	    while( !U2STAbits.URXDA); // wait (block) until data available in RX buffer
	    c=U2RXREG;
	    if(c=='\r') c='\n'; // When using PUTTY, pressing <Enter> sends '\r'.  Ctrl-J sends '\n'
		return (int)c;
    }
    else
    {
        if (U2STAbits.URXDA) // if data available in RX buffer
        {
		    c=U2RXREG;
		    if(c=='\r') c='\n';
			return (int)c;
        }
        else
        {
            return -1; // no characters to return
        }
    }
}

//this loop causes dealy
void SomeDelay (void)
{
	int j;
	for(j=0; j<50000; j++);
}

// Use the core timer to wait for 1 ms.
void wait_1ms(void)
{
    unsigned int ui;
    _CP0_SET_COUNT(0); // resets the core timer count

    // get the core timer count
    while ( _CP0_GET_COUNT() < (SYSCLK/(2*1000)) );
}

//delay ms
void waitms(int len)
{
	while(len--) wait_1ms();
}

//define port14 RB5 as the outpit of the colpitts Oscillator 
#define PIN_PERIOD (PORTB&(1<<5))

// GetPeriod() seems to work fine for frequencies between 200Hz and 700kHz.
long int GetPeriod (int n)
{
	int i;
	unsigned int saved_TCNT1a, saved_TCNT1b;
	
    _CP0_SET_COUNT(0); // resets the core timer count
	while (PIN_PERIOD!=0) // Wait for square wave to be 0
	{
		if(_CP0_GET_COUNT() > (SYSCLK/4)) return 0;
	}

    _CP0_SET_COUNT(0); // resets the core timer count
	while (PIN_PERIOD==0) // Wait for square wave to be 1
	{
		if(_CP0_GET_COUNT() > (SYSCLK/4)) return 0;
	}
	
    _CP0_SET_COUNT(0); // resets the core timer count
	for(i=0; i<n; i++) // Measure the time of 'n' periods
	{
		while (PIN_PERIOD!=0) // Wait for square wave to be 0
		{
			if(_CP0_GET_COUNT() > (SYSCLK/4)) return 0;
		}
		while (PIN_PERIOD==0) // Wait for square wave to be 1
		{
			if(_CP0_GET_COUNT() > (SYSCLK/4)) return 0;
		}
	}
	return  _CP0_GET_COUNT();
}

// Information here:
// http://umassamherstm5.org/tech-tutorials/pic32-tutorials/pic32mx220-tutorials/1-basic-digital-io-220
void main(void)
{
	//variable declaration
	long int count;
	float T, f;
	int led=0, sound=0, both=0, coin=0;
	
	DDPCON = 0;
	CFGCON = 0;
  
    UART2Configure(115200);  // Configure UART2 for a baud rate of 115200
    
    //initialize pin23 RB12 for LED output
	TRISBbits.TRISB12 = 0;
	LATBbits.LATB12 = 0;
	//	
	
	//initialize pin15 RB6 for speaker output
	TRISBbits.TRISB6 = 0;
	LATBbits.LATB6 = 0;	
	INTCONbits.MVEC = 1;
	//
    
    //for pin4 RB0 for LED mode 
    ANSELB &= ~(1<<0); // Set RB1 as a digital I/O
    TRISB |= (1<<0);   // configure pin RB5 as input
    CNPUB |= (1<<0);   // Enable pull-up resistor for RB1
    
    //for pin5 RB1 for speaker mode
    ANSELB &= ~(1<<1); // Set RB1 as a digital I/O
    TRISB |= (1<<1);   // configure pin RB5 as input
    CNPUB |= (1<<1);   // Enable pull-up resistor for RB1
    //
    
    //for pin6 RB2 for combined mode
    ANSELB &= ~(1<<2); // Set RB1 as a digital I/O
    TRISB |= (1<<2);   // configure pin RB5 as input
    CNPUB |= (1<<2);   // Enable pull-up resistor for RB1
    //
    
    //for pin6 RB2 for coin detect mode
    ANSELB &= ~(1<<3); // Set RB1 as a digital I/O
    TRISB |= (1<<3);   // configure pin RB5 as input
    CNPUB |= (1<<3);   // Enable pull-up resistor for RB1
    //
    
    //initialization for the metal detector input
    ANSELB &= ~(1<<5); // Set RB5 as a digital I/O
    TRISB |= (1<<5);   // configure pin RB5 as input
    CNPUB |= (1<<5);   // Enable pull-up resistor for RB5
 
	//waitms(500);
	//printf("Period measurement using the core timer free running counter.\r\n"
	      //"Connect signal to RB5 (pin 14).\r\n");
	     
	     
	     
    //actuall program start here
    while(1)
    {	
		//change mode based on the user input
    	if(!(PORTB&(1<<0))) 
    	{
	    	led=1;
	    	sound=0;
	    	both=0;
	    	coin=0;
    	}
    	else if(!(PORTB&(1<<1)))
    	{
	    	led=0;
	    	sound=1;
	    	both=0;
	    	coin=0;
    	}
    	else if(!(PORTB&(1<<2)))
    	{
	    	led=0;
	    	sound=0;
	    	both=1;
	    	coin=0;
    	}
    	else if(!(PORTB&(1<<3)))
    	{
    		led=0;
    		sound=0;
    		both=0;
    		coin=1;
    	}
    	else
    	{
    	}
    
    	SomeDelay();
  
		count=GetPeriod(100); //get the period
		
		if(count>0)
		{
			T=(count*2.0)/(SYSCLK*100.0);
			f=1/T;
			printf("  f=%fHz, Count=%ld        \r", f, count);
		}
		else
		{
			printf("  NO SIGNAL                     \r");
		}	
		
		
		//decide which mode we are in
		if(led)
		{
				if(f>59700)
			{
				//LATBbits.LATB6 =1;//turn speker on
				LATBbits.LATB12 = 1;//turn LED on	
			}
			else
			{
				//LATBbits.LATB6 =0;//turn speaker off
				LATBbits.LATB12 = 0;//turn LED off
			}
				waitms(200);
		}
		else if(sound)
		{
			if(f>metal)
			{
				LATBbits.LATB6 =1;//turn speker on
				//LATBbits.LATB12 = 1;//turn LED on	
			}
			else
			{
				LATBbits.LATB6 =0;//turn speaker off
				//LATBbits.LATB12 = 0;//turn LED off
			}
			
				waitms(200);
		}
		else if(both)
		{
			if(f>metal)
			{
				LATBbits.LATB6 =1;//turn speker on
				LATBbits.LATB12 = 1;//turn LED on	
			}
			else
			{
				LATBbits.LATB6 =0;//turn speaker off
				LATBbits.LATB12 = 0;//turn LED off
			}
				waitms(200);	
		}
		else if(coin)
		{
			if((f>metal)&&(f<60000))
			{
				LATBbits.LATB6 =1;//turn speker on
				LATBbits.LATB12 = 1;//turn LED on
				printf("It is not a coin");	
			}
			else if((f>60000)&&(f<63000))
			{
				LATBbits.LATB6 =1;//turn speaker off
				LATBbits.LATB12 = 1;//turn LED off
				printf("The coin is a Dime");
			}
			else if((f>63000)&&(f<64000))
			{
				LATBbits.LATB6 =0;//turn speaker off
				LATBbits.LATB12 = 0;//turn LED off
				printf("The coin is a Nickel");
			}
			else if((f>64000)&&(f<65000))
			{
				//LATBbits.LATB6 =1;//turn speaker off
				LATBbits.LATB12 = 1;//turn LED off
				printf("The coin is a Quater");
			}
			else
			{
				LATBbits.LATB6 =0;//turn speaker off
				LATBbits.LATB12 = 0;//turn LED off
				printf("There is no coin");
			}
				waitms(200);	
		}
		else
		{
		}		
    }
}
