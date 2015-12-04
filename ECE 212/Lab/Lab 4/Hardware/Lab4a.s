/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global WelcomePrompt
.extern cr
.extern iprintf
.extern getchr
.extern TurnOnLed
.extern TurnOffLed
.extern Row
.extern Column
.extern Delay
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab4a.s **************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad       **/
/* Sirajee (1255986) 											 **/													 **/
/* Date: April 2, 2013	                                         **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
WelcomePrompt:
/*Write your program here******************************************/

/* Preservation of register contents on top of the stack and */
suba.l #60, %sp
movem.l %a0-%a6/%d0-%d7, (%sp)

/* Print the first message/string of the program */
pea Welcome_message1
jsr iprintf
adda.l #4, %sp /* Clean up the stack */
jsr cr

/* Print the second message/string of the program and prompt
   the user for a number */
pea Prompt_message
jsr iprintf
adda.l #4, %sp /* Clean up the stack */
/*jsr cr

/* Check to the see if the number is in the range 0-9 or A-Z */
Check: jsr getchr
	   move.l %d0, %d6
	   jsr cr

/* Check if the input is a Number*/
Is_It_Number: cmp.l #0x30, %d6
	   	      blt Invalid
	          cmp.l #0x39, %d6
	          bgt Is_It_Alphabet
		      bra Valid

/* Check if the input is an Uppercase Alphabet*/
Is_It_Alphabet: cmp.l #0x41, %d6
	   	        blt Invalid
	   			cmp.l #0x5A, %d6
	  		    bgt Invalid

/* Instructions to deal with invalid entries */
Valid: move.l %d6, 64(%sp)
	   bra Return

Invalid: pea Message_for_invalid
		 jsr iprintf
		 adda.l #4, %sp
		 jsr cr
		 bra Check

/* Restore the registers and go back to the main program*/
Return: movem.l %a0-%a6/%d0-%d7, (%sp)
		adda.l #60, %sp
		rts

/*End of Subroutine **************************************************/
.data
/*All Strings placed here **************************************************/
/*WelcomeLines:*/
Welcome_message1: .string "Welcome to the LED Array Display"

Prompt_message: .string "Please enter an UpperCase letter or number from the keyboard followed by 'enter'"

Message_for_invalid: .string "Invalid entry. Please enter proper keystroke from keyboard"

/*End of Strings **************************************************/
/******************************************************/
