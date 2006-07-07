/* PumpMessages.c - process pending messages if needed.
 ***************************************************************************
 *
 * int PumpMessages()
 *
 ***************************************************************************
 * Copyright 2006 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef WIN32
#include <windows.h>
#endif
#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif

/*****************************************************************************
 * NAME
 *    PumpMessages
 * DESCRIPTION
 *    For those situations which need it, read and dispatch messages so that
 *    this code isn't a total CPU hog as a separate thread in interactive
 *    programs.
 * RETURN VALUE
 *    TRUE if the current parse should abort, FALSE otherwise.
 */
int PumpMessages()
{
#ifdef WIN32
MSG msg;
int idThread = GetCurrentThreadId();
//char rgch[1000];
//sprintf(rgch, "PumpMessages(): CurrentThreadId = %d\n", idThread);
//OutputDebugString(rgch);
while (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
	{
	//sprintf(rgch,
	//	"PumpMessages(): hwnd = 0x%x, message = 0x%x, 0x%x, 0x%x\n",
	//	msg.hwnd, msg.message, msg.lParam, msg.wParam);
	//OutputDebugString(rgch);
	// Check for a thread specific message.
	if (msg.hwnd == NULL)
	   {
		//sprintf(rgch,
		//    "PumpMessages(): thread specific: 0x%x, 0x%x, 0x%x\n",
		//    msg.message, msg.lParam, msg.wParam);
		//OutputDebugString(rgch);
		if (msg.message == WM_USER &&
			msg.wParam == WM_QUIT &&
			msg.lParam == idThread)
			{
			//OutputDebugString("Stopping the parse so the thread can die!\n");
			return TRUE;
			}
		}
	else
		{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
		}
	}
#endif
return FALSE;
}
