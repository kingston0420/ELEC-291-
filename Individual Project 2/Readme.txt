ELEC 291 Project2 
Author: KINGSTON CHEN 25028549


Construction: I first constructed the pic32 microcontroller system with the bo230XS and use blinky to test the circuit work properly. 
Then I connected to the colpits Oscillator as an input, and connected to a speaker as the output, and test it the program to make sure it detects metal.
Finally, I added my bonus feature which include a LED as output, and four push bottons as input to the microcontroller.

Software: I first run the blinky program to test my circuit then I use the period.c provided to get the frequency changes when putting a metal close to the coil.
Then I modify the program to make the speaker output sound when the frequency changes.
Finally, I added some conditional statements to make my program swithch into different mode when different push botton is pressed.

References: PIC32MXXX/2XX Family Data Sheet and ELEC 291 class slide.

Operation of the metal detector: If a metal is placed close to the inductor coil, it will change the magnetic field, 
slightly changing the inductance which is relected as a change in oscillator frequency in the colpitts Oscillator circuit.

Extra features: There are four different mode that the user can change based on the push bottons.
		Mode1-> LED lights up when metal is detected.
		Mode2-> Speaker beebs when metal is detected.
		Mode3-> LED lights up and Speaker beebs when metal is detected.
		Mode4-> The program can detect when a coin is there and display on putty that if it's a dime, nickel, or quarter, or display it's not a coin