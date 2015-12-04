/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab1b.s *********************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad       **/
/* Sirajee (1255986)                                             **/
/* Date: February 5, 2013                                        **/
/* General Description: Lab 1B Introduction to Assembly Language **/
/* A program that converts an ASCII letter to its upper or lower **/
/* case equivalent.                                              **/
/******************************************************************/

/*Write your program here******************************************/


clr.l %d2 /*Clear %d2*/


movea.l #0x2300000, %a2 /* Pointer for memory location 0x2300000 */
movea.l #0x2320000, %a3 /* Pointer for memory location 0x2320000 */


Repeat: move.l (%a2), %d2 /* [%d2] <-- (%a2) */

/* Exit program when the memory location contains the ASCII 'Enter' Code 0x0D */
cmp.l #0x0D, %d2
beq exit

/* Check if the ASCII character is less/greater than the allowed characters and if so, send it to 'error'*/
cmp.l #0x41, %d2
blt error
cmp.l #0x7A, %d2
bgt error

/* Check if memory content is an invalid character between Y and a in the ASCII table and reject it with an error code */
cmp.l #0x5B, %d2
bge reject
reject: cmp.l #0x60, %d2
ble error

/* Check if character is an ASCII upper case letter. If so, send it to 'bigalpha' */
cmp.l #0x41, %d2
bge LETTER
LETTER: cmp.l #0x5A, %d2
		ble bigalpha

/* Check if character is an ASCII lower case letter. If so, send it to 'alpha' */
cmp.l #0x61, %d2
bge letter
letter: cmp.l #0x7A, %d2
		ble alpha

/* Record the error code 'FFFFFFFF' for an invalid character in memory */
error: move.l #0xFFFFFFFF, %d2
	   move.l %d2, (%a3)
	   bra loop

/* Store the valid upper case letter's  lower case equivalent in memory */
bigalpha: add.l #0x20, %d2
	      move.l %d2, (%a3)
          bra loop

/* Store the valid lower case letter's  upper case equivalent in memory */
alpha: sub.l #0x20, %d2
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
