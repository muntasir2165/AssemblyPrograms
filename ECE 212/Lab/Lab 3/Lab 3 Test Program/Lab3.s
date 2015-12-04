/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global AssemblyProgram
.extern putchr
.extern value
.extern getchar

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

pea StackValue 
jsr iprintf 
addq.l #4,%sp 
move.l %sp, %d3
move.l %d3, -(%sp)
jsr value1
move.l (%sp)+,%d3

clr.l %d2
clr.l %d3
clr.l %d4
clr.l %d5
clr.l %d6
clr.l %d7

repeat:
pea Prompt 
jsr iprintf 
addq.l #4,%sp 
jsr cr

pea Sub1 
jsr iprintf
addq.l #4,%sp 
jsr cr

pea Sub2 
jsr iprintf 
addq.l #4,%sp 
jsr cr 

pea Sub3 
jsr iprintf 
addq.l #4,%sp 
jsr cr

pea Sub4 
jsr iprintf 
addq.l #4,%sp 
jsr cr 

jsr getstring 
move.l %d0, %d2 
jsr cr 

cmpi.l #1,%d2
beq ChkSub1
cmpi.l #2,%d2
beq ChkSub2
cmpi.l #3,%d2
beq ChkSub3
cmpi.l #4,%d2
beq ChkSub4

pea Invalid 
jsr iprintf 
addq.l #4,%sp 
jsr cr 
bra repeat

ChkSub1:
move.l #22222222, %d2
move.l #33333333, %d3
move.l #44444444, %d4
move.l #55555555, %d5
move.l #66666666, %d6

move.l #0x23022222, %a2
move.l #0x23033333, %a3
move.l #0x23044444, %a4
move.l #0x23055555, %a5
move.l %a7, %a6

pea Subroutine1 
jsr iprintf 
addq.l #4,%sp
jsr cr
move.l #0,-(%sp) 
jsr WelcomePrompt
nop
Stuff:
cmpi.l  #22222222, %d2
bne RegisterModify1
cmpi.l  #33333333, %d3
bne RegisterModify1
cmpi.l  #44444444, %d4
bne RegisterModify1
cmpi.l  #55555555, %d5
bne RegisterModify1
cmpi.l  #66666666, %d6
bne RegisterModify1

bra next1

RegisterModify1:
pea RegisterError 
jsr iprintf 
addq.l #4,%sp 
jsr cr 

next1:

move.l (%a7)+, %d3
/*move.l (%a7), %d3
addq.l #4,%sp */
move.l %d3, (%sp)
cmp.l  %a7, %a6
beq nexta

pea StackError 
jsr iprintf 
addq.l #4,%sp 
jsr cr

nexta:
pea KeyboardEntry 
jsr iprintf 
addq.l #4,%sp 

move.l %d3, %a7@-
jsr value
addq.l #4,%sp
jsr cr
jsr cr
bra repeat

 
ChkSub2:
move.l %a7, %a6
move.l (%sp), %d3
move.l %d3, %a7@-
move.l %d3, %a7@-


pea Subroutine2
jsr iprintf 
addq.l #4,%sp 
jsr cr

pea BeforeSort
jsr iprintf 
addq.l #4,%sp 
jsr cr

move.l #0x2300000, %a2
clr.l %d3
clr.l %d4
move.l (%sp),%d3
nextab:
move.l (%a2), %d4
move.l %d4, -(%sp)
jsr value
move.l (%sp)+, %d4
add.l #4, %a2
sub.l #1, %d3
cmp.l #0,%d3
bne nextab
jsr cr

move.l #22222222, %d2
move.l #33333333, %d3
move.l #44444444, %d4
move.l #55555555, %d5
move.l #66666666, %d6


move.l #0x23033333, %a3
move.l #0x23044444, %a4
move.l #0x23055555, %a5
move.l #0x2300000, %a2
jsr Sort
Nop
Memory2:
cmpi.l  #22222222, %d2
bne RegisterModify2
cmpi.l  #33333333, %d3
bne RegisterModify2
cmpi.l  #44444444, %d4
bne RegisterModify2
cmpi.l  #55555555, %d5
bne RegisterModify2
cmpi.l  #66666666, %d6
bne RegisterModify2

bra next2

RegisterModify2:
pea RegisterError 
jsr iprintf 
addq.l #4,%sp 
jsr cr 

next2:
move.l #0x2300000, %a2
clr.l %d3
clr.l %d4
move.l (%sp)+,%d3
move.l %d3,%d5
cmp.l  %a7, %a6
beq nextb

pea StackError 
jsr iprintf 
addq.l #4,%sp 
jsr cr 




nextb:
pea AfterSort
jsr iprintf 
addq.l #4,%sp 
jsr cr
nextc:
move.l (%a2), %d4
move.l %d4, -(%sp)
jsr value
move.l (%sp)+, %d4
add.l #4, %a2
sub.l #1, %d3
cmp.l #0,%d3
bne nextc

jsr cr 

move.l %d5,%d3
bra repeat




Nop
ChkSub3:
move.l %a7, %a6
move.l (%sp), %d5
move.l %d5, -(%sp)
move.l #0x2300000, -(%sp)

move.l #22222222, %d2
move.l #33333333, %d3
move.l #44444444, %d4
move.l #55555555, %d5
move.l #66666666, %d6

move.l #0x23022222, %a2
move.l #0x23033333, %a3
move.l #0x23044444, %a4
move.l #0x23055555, %a5


pea Subroutine3
jsr iprintf 
addq.l #4,%sp 
jsr cr

jsr Display


cmpi.l  #22222222, %d2
bne RegisterModify3
cmpi.l  #33333333, %d3
bne RegisterModify3
cmpi.l  #44444444, %d4
bne RegisterModify3
cmpi.l  #55555555, %d5
bne RegisterModify3
cmpi.l  #66666666, %d6
bne RegisterModify3

 

bra next3

RegisterModify3:
pea RegisterError 
jsr iprintf 
addq.l #4,%sp 
jsr cr 

next3:
cmp.l  %a7, %a6
beq next3a

pea StackError 
jsr iprintf
addq.l #4,%sp 
jsr cr 

bra repeat

next3a:

jsr cr
bra repeat 





Nop
ChkSub4:

Nop



subq.l #4,%sp 
jsr WelcomePrompt 
move.l (%a7), %d2
addq.l #4,%sp

move.l %d2, -(%a7) 
move.l #0x2300000,%a2 

jsr Sort 


move.l %d2, -(%a7) 
move.l #0x2300000,%a7@- 
jsr Display 
	

pea StackValue1 
jsr iprintf 
addq.l #4,%sp 

move.l %sp, %d3
move.l %d3, -(%sp)
jsr value1
move.l (%sp)+,%d3

jsr cr 
jsr cr	 


/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/

.data
StackValue:
.string "The stack at beginning is set at SP = "
StackValue1:
.string "The stack at end is set at SP = "
Prompt:
.string "Testing Subroutines. Choose from the menu below"
Sub1:
.string "1 - Test First subroutine"
Sub2:
.string "2 - Test Second subroutine"
Sub3:
.string "3 - Test Third subroutine"
Sub4:
.string "4 - Test All subroutine"
KeyboardEntry:
.string "The Number of entries is "
RegisterError:
.string "Register not properly restored"
Subroutine1:
.string "Testing 1st subroutine."
Subroutine2:
.string "Testing 2nd subroutine."
Subroutine3:
.string "Testing 3nd subroutine."
Subroutine4:
.string "Testing All subroutine."
TestAll:
.string "Test All subroutines and run program"
Invalid:
.string "Invalid Entry, Please enter correct entry"
StackError:
.string "Stack not properly restored"
BeforeSort:
.string "The entries before sort:"
AfterSort:
.string "The entries after sort:"


