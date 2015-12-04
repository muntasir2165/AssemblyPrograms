#include "predef.h"
#include <stdio.h>
#include <ctype.h>
#include <startnet.h>
#include <autoupdate.h>
#include <NetworkDebug.h>


extern "C" {
void UserMain(void * pd);
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
    while (1) {
    	iprintf("This is the Imported File\n");
        	OSTimeDly(20);
    }
}
