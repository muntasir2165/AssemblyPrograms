#include "predef.h"
#include <stdio.h>
#include <ctype.h>
#include <startnet.h>
#include <autoupdate.h>
#include <NetworkDebug.h>


extern "C" {
void UserMain(void * pd);
}

extern "C" {
	void TestAsmCall();
void carriagereturn();
	
}
void carriagereturn()
{
		iprintf( "\r\n");
}


 
const char * AppName="Tutorial";

void UserMain(void * pd) {
    InitializeStack();
    OSChangePrio(MAIN_PRIO);
    EnableAutoUpdate();
	
    #ifdef _DEBUG
    InitializeNetworkGDB_and_Wait();
    #endif

    iprintf("Application started\n");
    OSTimeDly(120);
    while (1) {
    	TestAsmCall();
        	OSTimeDly(20);
    }
}
 
