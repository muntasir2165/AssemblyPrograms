/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab1a.s *********************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad       **/
/* Sirajee (1255986)                                             **/
/* Date: February 5, 2013                                        **/
/* General Description: Lab 1A Introduction to Assembly Language **/
/* A program that converts the ASCII characters 0 to 9,          **/
/* A-F, a-f to their hexadecimal equivalents.                    **/
/******************************************************************/

/*Write your program here******************************************/


clr.l %d2 /* Clear data register %d2 */


movea.l #0x2300000, %a2 /* Pointer for memory location 0x2300000 */
movea.l #0x2310000, %a3 /* Pointer for memory location 0x2310000 */


Repeat: move.l (%a2), %d2 /* [%d2] <-- (%a2) */

/* Exit program when the memory location contains the ASCII 'Enter' Code 0x0D */
cmp.l #0x0D, %d2 
beq exit

/* Check if the ASCII character is less/greater than the allowed characters and if so, send it to 'error'*/
cmp.l #0x30, %d2 
ble error
cmp.l #0x66, %d2 
bgt error

/* Check whether the ASCII character is a number (arabic numeral) or not. If so,  send it to 'num' */
cmp.l #0x30, %d2 
bge is_it_number
is_it_number: cmp.l #0x39, %d2
			  ble num

/* Check if the memory content is an invalid character in the ASCII table and reject it with an error code */
cmp.l #0x3A, %d2
bge reject
reject: cmp.l #0x40, %d2
      ble error

/* Check if character is an allowed upper case letter. If so, send it to 'bigalpha' */
cmp.l #0x41, %d2
bge IS_IT_LETTER
IS_IT_LETTER: cmp.l #0x46, %d2
		ble bigalpha

/* Check if the character is between G and ' in the ASCII table and reject it by sending it to 'error' */
cmp.l #0x47, %d2
bge REJECT_AGAIN
REJECT_AGAIN: cmp.l #0x60, %d2
         ble error

/* Check if character is an allowed lower case letter. If so, send it to 'alpha' */
cmp.l #0x61, %d2
bge is_it_letter
is_it_letter: cmp.l #0x66, %d2
		ble alpha

/* Record the error code 'FFFFFFFF' for an invalid character in memory */
error: move.l #0xFFFFFFFF, %d2
	   move.l %d2, (%a3)
	   bra loop

/* Store the hexadecimal equivalent of the numbers in memory */
num: sub.l #0x30, %d2
     move.l %d2, (%a3)
	 bra loop

/* Store the hexadecimal equivalent of the valid upper case letters in memory */
bigalpha: sub.l #0x37, %d2
	      move.l %d2, (%a3)
          bra loop

/* Store the hexadecimal equivalent of the valid lower case letters in memory */
alpha: sub.l #0x57, %d2
	   move.l %d2, (%a3)


/* Repeat the loop */
loop: adda.l #4, %a2 /* Point to the next memory location */
      adda.l #4, %a3 /* Point to the next memory location */  
      bra Repeat


exit:
/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7
rts
/*----------------------------------------------------------------*/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7
rts
/*----------------------------------------------------------------*/
