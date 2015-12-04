/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global Sort
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3b.s **************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad Sirajee*/
/* (1255986) 													 **/
/* Date: March 12, 2013                                          **/
/* General Description: Implementation of a subroutine called    **/
/* 'Sort' that performs the bubble sort algorithm**/
/******************************************************************/
Sort:
/*Write your program here******************************************/

move.l 4(%sp), %d7 /* Number of entries is implied by %d7; */
move.l (%sp), 4(%sp) /* Move the longword in (%sp) to the next memory location*/

/* Preservation of register contents on top of the stack and */
/* pointer assignment for the memory location 0x2300000 */
suba.l #60, %sp
movem.l %a0-%a6/%d0-%d7, (%sp)
movea.l %a2, %a3 /* Copy the contents of %2 to %a3 */

Next_Round: move.l %a3, %a2
		    sub.l #1, %d7 /* "Round" counter */
            beq Lab_3c
            move.l %d7, %d6 /* "Pass" counter */

            move.l (%a2)+, %d3
            move.l (%a2), %d4

/* Compare two successive numbers in the array */
Compare: cmp.l %d3, %d4
         bge Do_Not_Switch
       /*bra Switch_With_Next_Position*/

/* Sort the numbers in the array in ascending order */
Switch_With_Next_Position: move.l %d4, -4(%a2)
                           move.l %d3, (%a2)+
                           move.l (%a2), %d4
                           sub.l #1, %d6
                           cmp.l #0, %d6
                           beq Next_Round
                           bra Compare
Do_Not_Switch: move.l (%a2)+, %d3
               move.l (%a2), %d4
               sub.l #1, %d6
               cmp.l #0, %d6
               beq Next_Round
               bra Compare

/* Restore the registers and go back to the main program*/
Lab_3c: movem.l (%sp), %a0-%a6/%d0-%d7
		adda.l #64, %sp
		rts

/*End of Subroutine **************************************************/
.data
/*All Strings placed here **************************************************/

/*End of Strings **************************************************/
