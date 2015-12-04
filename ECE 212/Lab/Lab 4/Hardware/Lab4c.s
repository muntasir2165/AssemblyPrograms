/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global LedSub
.extern cr
.extern iprintf
.extern getchr
.extern TurnOnLed
.extern TurnOffLed
.extern Row
.extern Column
.extern Delay
/*----------------------------------------------------------------*/

/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab4c.s **************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad       **/
/* Sirajee (1255986) 											 **/													 **/
/* Date: April 2, 2013	                                         **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
LedSub:
/*Write your program here******************************************/

suba.l #60, %sp
movem.l %a0-%a6/%d0-%d7, (%sp)
move.l #0, %d6 /* Initialize the PATTERN counter */


Repeat_The_Pattern:
add.l #1, %d6 /* Initialize the PATTERN counter to 1*/

movea.l 64(%sp), %a2 /* Move the patttern address into the address register a2*/

move.l #0, %d3 /* Initialize the ROW counter */
move.l #7, %d4 /* Initialize the COLUMN counter */
move.l #0, %d5 /* Initialize the BIT counter */

Check_Bit: btst.b %d5, (%a2)
	       bne Light_Up_The_LED

Go_To_Next_Bit: add.l #1, %d5
		        sub.l #1, %d4
	         	cmp.l #-1, %d4
	        	beq Go_To_Next_Row
	        	bra Check_Bit

Go_To_Next_Row: adda.l #1, %a2
				move.l #7, %d4
				move.l #0, %d5
		        add.l #1, %d3
		        cmp.l #8, %d3
		        bne Check_Bit
		        bra Light_Up_The_LED_Again

Light_Up_The_LED: move.l %d4, -(%sp)
		          jsr Column
	              move.l (%sp)+, %d7 /* Use d7 to make sp point to it original location */

		  	      move.l %d3, -(%sp)
		  		  jsr Row
		  		  move.l (%sp)+, %d7

		 		  jsr TurnOnLed

		  		  move.l #300, -(%sp)
		  		  jsr Delay

		 		  move.l (%sp)+, %d7
		  		  jsr TurnOffLed

				 bra Go_To_Next_Bit


Light_Up_The_LED_Again: cmp.l #100, %d6
		             	bne Repeat_The_Pattern

/* Restore the registers and go back to the main program*/
Return: movem.l %a0-%a6/%d0-%d7, (%sp)
		adda.l #60, %sp

		move.l (%sp), 4(%sp)
		adda.l #4, %sp
		rts

/*End of Subroutine **************************************************/
.data
/*All Strings placed here **************************************************/



/*End of Strings **************************************************/
/******************************************************/
