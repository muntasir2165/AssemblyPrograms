/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global WelcomePrompt
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3a.s **************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad Sirajee*/
/* (1255986) 													 **/
/* Date: March 12, 2013                                          **/
/* General Description: Implementation of a subroutine called    **/
/* 'WelcomePrompt' that prompts the user to enter the number of  **/
/* entries (for to be bubble sorted) followed by the numbers for **/
/* sorting from the keyboard                                     **/
/******************************************************************/
WelcomePrompt:
/* Write your program here *****************************************/

/* Preservation of register contents on top of the stack and */
/* pointer assignment for the memory location 0x2300000 */
suba.l #60, %sp
movem.l %a0-%a6/%d0-%d7, (%sp)
movea.l #0x2300000, %a2

/* Print the first message/string of the program */
pea Welcome_message1
jsr iprintf
adda.l #4, %sp /* Clean up the stack */
jsr cr

/* Print the second message/string of the program and prompt
   the user for a number */
/* Check to the see if the number is in the range [2,10] */
Check: pea Prompt_message
	   jsr iprintf
	   adda.l #4, %sp /* Clean up the stack */
	   jsr cr
	   jsr getstring
	   move.l %d0, %d6
	   jsr cr
	   cmp.l #1, %d6
	   ble Invalid
	   cmp.l #11, %d6
	   bge Too_Many

/* Instructions to deal with negative, excessive and valid number */
/* of entries */
Valid: move.l %d6, 64(%sp)
	   move.l %d6, %d7 /* Use d7 as a counter*/
	   bra Get_Numbers
Invalid: pea Message_for_invalid
		 jsr iprintf
		 adda.l #4, %sp
		 jsr cr
		 bra Check
Too_Many: pea Message_for_too_many
		  jsr iprintf
		  adda.l #4, %sp
		  jsr cr
		  bra Check

/*  Print a message/string prompting the user for a number*/
Get_Numbers: pea Message_for_numbers
		     jsr iprintf
	         adda.l #4, %sp
		     jsr cr

/* Print a message/string indicating the last entry */
Get_Number: jsr getstring
            move.l %d0, %d4
            jsr cr
            cmp.l #0, %d4
            blt Negative

/* Instructions to deal with positive and negative user entries*/
Positive: move.l %d4, (%a2)+
		  sub.l #1, %d7
		  cmp.l #0, %d7
		  beq Lab_3b

		  cmp.l #1, %d7 /* Check if the counter is at the 2nd last entry */
          bne Get_Numbers
		  bra Last_Number
Negative: pea Message_for_negative_number
		  jsr iprintf
	      adda.l #4, %sp
		  jsr cr
		  bra Get_Numbers
Last_Number: pea Message_for_last_number
			 jsr iprintf
			 adda.l #4, %sp
			 jsr cr
			 bra Get_Number

/* Restore the registers and go back to the main program*/
Lab_3b: movem.l %a0-%a6/%d0-%d7, (%sp)
		adda.l #60, %sp
		rts

/*End of Subroutine **************************************************/
.data
/*All Strings placed here **************************************************/

/*WelcomeLines:*/
Welcome_message1: .string "Welcome to the Bubble Sort Program  "
Prompt_message: .string "Please enter the number (2min-10max) of entries followed by 'enter'"

Message_for_invalid: .string "Invalid entry. Please enter more than 1 entry"
Message_for_too_many: .string "Too many entries"

Message_for_numbers: .string "Please enter a number (positive only) followed by 'enter'"
Message_for_negative_number: .string "Negative value entered, only positive ones accepted"
Message_for_last_number: .string "Please enter the lst number (positive only) followed by 'enter'"

/*End of Strings **************************************************/
