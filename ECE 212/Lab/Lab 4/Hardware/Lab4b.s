/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global convert
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
/* File Name: Lab4b.s **************************************/
/* Names of Students: Ishtiak Ahmed (1269389) and Mohammad       **/
/* Sirajee (1255986) 											 **/													 **/
/* Date: April 2, 2013	                                         **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
convert:
/*Write your program here******************************************/

suba.l #4, %sp
move.l 8(%sp), (%sp)

jsr convert1

move.l (%sp), 8(%sp)
adda.l #4, %sp
rts

/*End of Subroutine **************************************************/
.data
/*All Strings placed here **************************************************/


/*End of Strings **************************************************/
