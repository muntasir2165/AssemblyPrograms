/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab2b.s *********************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad Sirajee (1255986) **/
/* Date: February 26, 2013                                       **/
/* General Description: A program to calculate the area under a  **/
/* curve (y = f(x)) using the trapezoidal rule for the specified **/
/* (x,y) co-ordinates in two different arrays                    **/
/******************************************************************/

/*Write your program here******************************************/
/*clr.l %d2 /*clear %d2*/
/*Part B **********************************************************/


/* Initializations */
move.l 0x2300000,%d1 /*Move size of the array to d1*/
sub.l #1, %d1
movea.l 0x2300004,%a1 /* Point to the memory address of the array x with a1*/
movea.l 0x2300008,%a2 /* Point to the memory address of the array y with a2*/
movea.l 0x2300010,%a4 /* Point to the final storage location with a4*/
move.l #0, %d6 /*Initialize d6 to zero*/
move.l #0, %d7 /*Initialize d7 to zero*/


/* Calculate delta_x = x(b)-x(a), where b>a */
iteration:move.l (%a1)+,%d2
		  move.l (%a1),%d3
		  sub.l %d2,%d3
		  cmp.l #2,%d3
		  beq case_of_2

/* Calculate f(x(b))-f(x(a)) when delta_x = 1 */
/*case_of_1:*/move.l (%a2)+,%d4
	      	  move.l (%a2),%d5
	   		  add.l %d4,%d5
              add.l %d5,%d7
		      sub.l #1,%d1
	          bgt iteration
	          bra account_for_fraction

/* Calculate f(x(b))-f(x(a)) when delta_x = 2 */
case_of_2:move.l (%a2)+,%d4
		  move.l (%a2),%d5
		  add.l %d4,%d5
          add.l %d5,%d6
          sub.l #1,%d1
		  bgt iteration


/* Summation of the overall areas from the two cases */ 
account_for_fraction:asr.l #1,%d7
					 add.l %d7,%d6


/* Move the final area value to the memory location (%a4) */
move.l %d6,(%a4)


exit:


/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7
rts
/*----------------------------------------------------------------*/
