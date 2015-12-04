/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab2a.s *********************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad       **/
/* Sirajee (1255986)                                             **/
/* Date: February 26, 2013                                       **/
/* General Description: Addition of the contents of two arrays   **/
/* from different memory locations and placement of the summed   **/
/* value at another specified location using three different     **/
/* addressing modes **/
/******************************************************************/

/*Write your program here******************************************/
/*clr.l %d2 /*clear %d2*/
/*Part A' **********************************************************/


/* Initializations */
movea.l 0x2300004, %a1 /* Point to the first array with a1 */
movea.l 0x2300008, %a2 /* Point to the second array with a2 */
movea.l 0x230000C, %a3 /* Point to the summation array with a3 */

/* Addition of the first value in the two arrays */
move.l (%a1)+,%d2 /* Move a longword from memory location (a1) to d2 */
move.l (%a2)+,%d3 /* Move a longword from memory location (a2) to d3 */
add.l %d2,%d3     /* Add the numbers contained in d2 and d3 */
move.l %d3,0(%a3) /* Move the resultant number from d3 to memory location (a3) */

/* Addition of the second value in the two arrays */
move.l (%a1)+,%d2
move.l (%a2)+,%d3   
add.l %d2,%d3
move.l %d3,4(%a3)

/* Addition of the second value in the two arrays */
move.l (%a1),%d2
move.l (%a2),%d3
add.l %d2,%d3
move.l %d3,8(%a3)


/*Part B' **********************************************************/


/* Re-initializations */
move.l 0x2300000, %d1 /* Move the size of the array to d1; Use d1 as a counter */
movea.l 0x2300004, %a1 /* Point to the first array with a1 */
movea.l 0x2300008, %a2 /* Point to the second array with a2 */
movea.l 0x2300010, %a4 /* Point to the summation array with a4 */
move.l #0,%d4 /* Initialize the offset-causing data register to 0 */


loop: move.l (%a1)+,%d2 /* Move a longword from memory location (a1) to d2 */
	  move.l (%a2)+,%d3 /* Move a longword from memory location (a2) to d3 */
	  add.l %d2,%d3     /* Add the numbers contained in d2 and d3 */
	  move.l %d3,(%a4,%d4)/* Move the resultant number from d3 to memory location                (a4) */
	  add.l #4, %d4 /* Iterate the offset to point to the next longword */
	  sub.l #1, %d1 /* Decrement the counter */
	  bne loop      /* If counter does not equal to 0, then do 
                     "loop" */


/*Part C' **********************************************************/


/* Re-initializations */
move.l 0x2300000, %d1 /* Move the size of the array to d1; Use d1 as a counter */
movea.l 0x2300004, %a1 /* Point to the first array with a1 */
movea.l 0x2300008, %a2 /* Point to the second array with a2 */
movea.l 0x2300014, %a5 /* Point to the summation array with a5*/


loop2: move.l (%a1)+,%d2 /* Move a longword from memory location (a1) to d2 */
	   move.l (%a2)+,%d3 /* Move a longword from memory location (a2) to d3 */
	   add.l %d2,%d3     /* Add the numbers contained in d2 and d3 */
       move.l %d3,(%a5)+ /* Move the resultant number from d3 to memory location                (a5) */
	   sub.l #1, %d1     /* Decrement the counter */
       bne loop2         /* If counter does not equal to 0, then do
          "loop2" */


exit:


/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7
rts
/*----------------------------------------------------------------*/
