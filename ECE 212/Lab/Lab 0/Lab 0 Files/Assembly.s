/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global TestAsmCall

TestAsmCall:
lea      -40(%a7),%a7
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Assembly.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Tutorial Starts Here******************************************/


/********************************************************************************/
/********************************************************************************/
/* Welcome to Tutorial **********************************************************/
pea Welcome /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

/* Initializing data registers D2-D7 to zero */
clr.l %d2
clr.l %d3
clr.l %d4
clr.l %d5
clr.l %d6
clr.l %d7
/*START**************************************************************************/
/*PART A*************************************************************************/
pea DataRegisters /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

/*move contents into data registers */
move.l #22222222, %d2
move.l #33333333, %d3
move.l #44444444, %d4
move.l #55555555, %d5
move.l #66666666, %d6
move.l #77777777, %d7

/*PART B*************************************************************************/
/*set address register to values, must be a valid address */
pea AddressRegisters /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

movea.l #0x20b0020, %a2
movea.l #0x20b0030, %a3
movea.l #0x20b0040, %a4
movea.l #0x20b0050, %a5

/*PART C*************************************************************************/
/*move contents in data registers to address memory location */
pea DataToAddress /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */
move.l %d2,%a2@
move.l %d3,%a3@
move.l %d4,%a4@
move.l %d5,%a5@


/*PART D*************************************************************************/
/*move contents in memory location of Address Registers into data registers */
pea AddressMemToData /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */

move.l %a2@, %d5
move.l %a3@, %d4
move.l %a4@, %d3
move.l %a5@, %d2

/*PART E*************************************************************************/
/*move address value into data register */
pea AddressToData /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */
move.l %a2,%d2
move.l %a3,%d3
move.l %a4,%d4
move.l %a5,%d5

/*PART F*************************************************************************/
/* moving byte, word and data sizes to data registers */
pea ByteWordLong /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */
move.l #0x7EEEEEEE,%d2
move.b #0x2, %d2
move.w #0x2, %d2
move.l #0x2, %d2

/*PART G*************************************************************************/
/* adding data register contents, you can only use add.l not add.b
 or add.w*/
pea Numeric /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */
move.l #2, %d2
move.l #3, %d3
add.l %d2,%d3

/*PART H*************************************************************************/
/*using logic operation on two data registers(always a long operation)*/
pea Logic /*push address of string onto the stack */
jsr iprintf /* print the string */
addq.l #4,%sp /* clean up stack */
jsr carriagereturn /* Carriage return and line feed */
move.l #0xFF, %d2
move.l #0x0F, %d3
move.l #0x00, %d4
and.l %d3,%d2
and.l %d4,%d2

/*END of program******************************************************************************/
/*--------------------------------------------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5
lea      40(%a7),%a7

rts /*return from subroutine */
/*--------------------------------------------------------------------------------*/

/*All Data should be placed here ie) Strings****************************************/
.data
ds.b 10
Welcome:
.string "Welcome to the tutorial"

DataRegisters:
.string "Part A - Monitor the Data registers D2-D7"

AddressRegisters:
.string "Part B - Monitor the Address registers A2-A5"

DataToAddress:
.string "Part C - Monitor memory locations 0x20b0020,0x20b0030,0x20b0040,0x20b0050 "

AddressMemToData:
.string "Part D - Monitor Data registers D2-D7"

AddressToData:
.string "Part E - Monitor Data registers D2-D7"

ByteWordLong:
.string "Part F - Monitor Data Rgister D2"

Numeric:
.string "Part G - Monitor Data Rgister D3"

Logic:
.string "Part H - Logic Operation (And and Or)"

/************************************************************************************/

