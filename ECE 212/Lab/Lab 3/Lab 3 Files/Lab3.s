/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global AssemblyProgram

AssemblyProgram:

lea      -40(%a7),%a7 
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/
/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3.s *********************************************/
/* Wing Hoy ******************************************************/
/* Date: April 1, 2009 *******                                     **/
/* General Description:                                          **/
/* This file is not to be modified by the students. **************/
/* The three subroutines written by the students are called by this*/
/* File **********************************************************/
/******************************************************************/

/* Do Not Modify and of this *************************************/

/*Applies to the first Subroutine */
subq.l #4,%sp 
jsr WelcomePrompt
move.l (%a7), %d2
addq.l #4,%sp
/*End first subroutine*/


/*Applies to the second Subroutine */
move.l %d2, -(%a7) 
move.l #0x2300000,%a2 
jsr Sort
/*End second subroutine*/


/*Applies to the third Subroutine */
move.l %d2, -(%a7) 
move.l #0x2300000,%a7@- 
jsr Display
/*End third subroutine*/
	 


/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/

