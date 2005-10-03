/*
 * ResizingUtils.h
 *
 ****************************************************
 *
 * Dialog Resizing Code
 * by Marius Doornenbal, for (c) SIL International
 *
 * Inspired on the --Set dialog DPI helper class--
 * originally written by George Yohng [(C) 2003]
 *  http://www.yohng.com
 *
 * BUT:
 *  -- his code has been debugged and the resizing code has
 * been added.
 *
 ***************************************************
 *
 * Utility functions to help Dialogs resize themselves in a neat way
 * (with member panes and windows sizing at the same time)
 * Also - code to store sizing information in the registry.
 */
#ifndef __RESIZINGUTILS_H__
#define __RESIZINGUTILS_H__

#include "stdafx.h"

/*
 * Functions to store the dialog window's size - or else the user will have to
 * resize over and over again.
 */

/*
 * extern long
 * lPutWindowPlacement(const char *ozcScreenName, WINDOWPLACEMENT *pwp);
 * in : ozcScreenName
 * in : pwp
 *
 * ** lpScreenName: give the name of the dialog
 *                  (typically the .cpp file's name without the .cpp)
 * ** pwp         : pointer to the Window Placement structure
 *
 * This function will file the windowplacement for this screen for you - for future
 * reference. Typically called in a Destroy() function.
 * Return value is a registry-function return value; if it is not ERROR_SUCCESS
 * then for some reason something went wrong. Look in the Windows API definition
 * to check the different return values.
 */
extern long
lPutWindowPlacement(const char *ozcScreenName, WINDOWPLACEMENT *pwp);

/*
 * extern long
 * lGetWindowPlacement(const char *ozcScreenName, WINDOWPLACEMENT *pwp);
 * in : ozcScreenName
 * out: pwp
 *
 * The reverse of the previous function, retrieves the info from the registry.
 * Return value the same as above.
 */
extern long
lGetWindowPlacement(const char *ozcScreenName, WINDOWPLACEMENT *pwp);

/*
 *************************************************
 * Warning: for proper sizing with large fonts,  *
 *          set dialog font explicitly to        *
 *                                               *
 *         Microsoft Sans Serif (as opposed to   *
 *                                MS Sans Serif) *
 *          or Tahoma                            *
 *                                               *
 *          (they have the same sizes)           *
 *************************************************
 *
	// -------------------------------------------------------------------
	// MFC Example:
	// -------------------------------------------------------------------

	// TO your dialog class, add the following two variables:
	CSetDPI dpi;
	BOOL dpiset;

	// TO your dialog creator function, add
	dpiset = false; // to avoid a call to the resizer before the dpi
					// structure was properly initialised
	...

	// ADD handlers for ON_INIT, ON_SIZE, ON_DESTROY and ON_MINMAXINFO

	BOOL CMyDlg::OnInitDialog()
	{
		CDialog::OnInitDialog();

		CSetDPIInit(&dpi, AfxFindResourceHandle(IMAKEINTRESOURCE(IDD), RT_DIALOG),
				  m_hWnd,IDD,96.0); // 96 is the DPI
		dpiset = true;

	   // The rest of your initialization code goes here
	   // here goes the collection of previously stored sizes

	   return TRUE;
   }

	// for further sample code, see e.g. DlgPhonruleRule.cpp

*/

/* data stored for each dialog.
 * this is - original data - read from the resource.
 */
typedef struct dialogdata_t
{
	int			pt,has_menu;
	unsigned	weight;
	BOOL		italic;
	LPCWSTR		faceName;
	int			style;
	int			exStyle;
	int			cx, cy;  /* original sizes */
} tsDialogData, *tpsDialogData;

/* Information filed for each dialog item -
 * ID, coordinates & size, and resizing behaviour
 */
typedef struct dialogitem
{
	int x, y, cx, cy;
	DWORD id;

	/* for each item we can list a number of flags */
	unsigned uiFlags;
} tsDialogItem, *tpsDialogItem;

/*
 * as we do not want to allocate memory on the heap we maximise the number of
 * items on a dialog. 40 seems reasonable.
 */
#define MAX_NO_DIALOG_ITEMS   40

/* As there is to know about dialogs
 */
typedef struct
{
	FILE *fiOut;

	/* This first block of variables is set only once */
	/* ID, etc */
	int IDD;
	HINSTANCE inst;
	/* handle for the window */
	HWND hwnd;
	/* font sizes */
	HFONT font,oldfont;

	/* This struct is initialised only once */
	tsDialogData sDialogData;
	int jNtItems; /* the number of items in this dialog */
	tsDialogItem asDI[MAX_NO_DIALOG_ITEMS];

	/* current point size information */
	double	x_factor,
			y_factor;

} CSetDPI;

/* ----------------------------
 * methods
 * ----------------------------
 */
/* Should you wish to resize items on a dialog, you must
 * 1. add a CSetDPI structure in the class definition
 * 2. call this initialisation function on it
 */
extern void
CSetDPIInit(CSetDPI *, HINSTANCE inst, HWND dlg, int IDD, double dpi);

/* To add resizable items, call this function.
 * Which flags you can set for each item, see the defines below.
 */
/* MOVING behaviour */
#define RESIZER_MOVES_WITH_LEFTTOP		0x0000
#define RESIZER_MOVES_WITH_RIGHTTOP		0x0001
#define RESIZER_MOVES_WITH_LEFTBOTTOM	0x0002
#define RESIZER_MOVES_WITH_RIGHTBOTTOM	0x0003
#define RESIZER_MOVES_HOR_HALFSPEED		0x0010
#define RESIZER_MOVES_VER_HALFSPEED		0x0020

/* SIZING behaviour */
#define RESIZER_SIZES_HORIZONTAL		0x0100
#define RESIZER_SIZES_HOR_HALFSPEED		0x0200
#define RESIZER_SIZES_VERTICAL			0x0400
#define RESIZER_SIZES_VER_HALFSPEED		0x0800

extern void
CSetDPIResizerFlags(CSetDPI *, DWORD id, unsigned uiFlags);

extern void
CSetDPIResize(CSetDPI *,int cx, int cy);

extern void
CSetDPIDetach(CSetDPI *);

/* first thing to call */
extern void
CSetDPIInitialSize(CSetDPI *dpi);

#endif /* __RESIZINGUTILS_H__ */
