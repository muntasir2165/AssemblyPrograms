/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global Display
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3c.s **************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad Sirajee*/
/* (1255986) 													 **/
/* Date: March 12, 2013                                          **/
/* General Description: Implementation of a subroutine 'Display' **/
/* that displays the numbers from lowest to highest              **/
/******************************************************************/
Display:
/*Write your program here******************************************/

/* Preservation of register contents on top of the stack and */
/* pointer assignment for the memory location 0x2300000 */
suba.l #60, %sp
movem.l %a0-%a6/%d0-%d7, (%sp)
movea.l 64(%sp), %a2 /* Copy the starting address of the sorted array to %a2 */
move.l 68(%sp), %d2 /* Copy the number of entries from the stackt to %d2 */


/* Display Message1 */
pea Message_1
jsr iprintf
adda.l #4, %sp /* Clean up the stack */
jsr cr

/* Display the message of the number of entries*/
pea Message_for_entry_number
jsr iprintf
adda.l #4, %sp /* Clean up the stack */
/* Display the number of entries */
move.l %d2, -(%sp)
jsr value
adda.l #4, %sp 
jsr cr

/* Display Message3 */
pea Message_3
jsr iprintf
adda.l #4, %sp
jsr cr

/* Display the sorted numbers in ascending order */
Print_Sorted_Numbers: move.l (%a2)+, -(%sp)
	  				  jsr value
	  				  adda.l #4, %sp
	  				  jsr cr
	  				  sub.l #1, %d2
	  				  bne Print_Sorted_Numbers

/* Display the last message */
pea Final_message
jsr iprintf
adda.l #4, %sp
jsr cr

jsr cr

/* Restore the registers and go back to the main program*/
Back_To_Main_Program: movem.l %a0-%a6/%d0-%d7, (%sp)
					  adda.l #60, %sp
					  move.l (%sp), 8(%sp)
					  add.l #8, %sp
					  rts

/*End of Subroutine **************************************************/
.data
/*All Strings placed here **************************************************/
Message_1: .string "The numbers are sorted with bubblesort algorithm"
Message_for_entry_number: .string "The number of entries was "

Message_3: .string "Sorted from smallest to biggest, the number are: "
Final_message: .string "Program ended. Try again?"

/*End of Strings **************************************************/
