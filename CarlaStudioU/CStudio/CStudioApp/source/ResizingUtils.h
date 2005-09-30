/*
 * ResizingUtils.h
 * Utility functions to help Dialogs resize themselves in a neat way
 * (with member panes and windows sizing at the same time)
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
 * To do the resizing of any dialog window, you can call the vResize() function.
 * This is typically called from an OnSize() function.
 * The job that vResize() does, is reposition and resizing the member elements
 * in a dialog.
 * The following structure can contain, for each item, it's position relative
 * to the borders of the mother window (dialog).
 */
typedef struct {
		int iItem;           // Item ID in the dialog; should be unique
		int iHorFromBorder,  // horizontal distance from border; if iAlignLeft = 1, then
							 // this is taken from the left border; else, from the right border
			iWidth,          // width of the box; if this is negative,
							 // it is computed relative to the right hand border.
			iVertFromBorder, // is the distance of the top of this element to the border;
							 // if positive, distance to the top, if negative, distance from the bottom
			iHeight;         // if this is negative, this element doesn't move but stretch with the bottom
		int iAlignLeft;
	} tsSizingElement;

/*
 * If you want to fill out the values that appear in the .rc (resource file) -
 * which makes it a lot easier - then use this macro to do a correction calculation
 * for the iHorFromBorder parameter.
 */
#define LeftCorrect(l)  ((l * 2)) //- 16
#define RightCorrect(l) ((BASE_WIDTH - (l)) * 2)

#define WidthCorrect(l)  (l*2) // (l*2)


/* extern void
 * vResize(CDialog *cd, int cx, int cy, tsSizingElement *psSE, size_t gNoSE)
 * in/out : cd
 * in : cx, cy    // size of the mother window
 * in : psSE      // specifies the relative positions of elements you wish to float
 * in : gNoSE     // number of elements in psSE
 *
 * This functions repositions all of the elements in the array psSE.
 * If you want elements to stay where they are, leave them out of the array.
 */
extern void
vResize(CDialog *cd, int cx, int cy, tsSizingElement *psSE, size_t gNoSE);


#endif /* __RESIZINGUTILS_H__ */
/****************************************************

   Set dialog DPI helper class

   Use this class to make your dialog-editor based
   dialogs look the same under any Windows DPI
   settings (Large font mode).

   This is important if your dialogs have bitmaps on
   them. You can specify current DPI if you want
   bitmaps to get resized to current DPI (normally
   they don't get resized).

   Copyright (C)2003 by George Yohng
   http://www.yohng.com

   LICENSE AGREEMENT:

	  You agree to go to http://www.yohng.com/music.html
	  and listen completely (without skips) to the very
	  first track on the list.

 ****************************************************/

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

   // -------------------------------------------------------------------
   // MFC Example:
   // -------------------------------------------------------------------

   ...

   BOOL CMyDlg::OnInitDialog()
   {
	   CDialog::OnInitDialog();

	   dpi.Attach(AfxFindResourceHandle(IMAKEINTRESOURCE(IDD), RT_DIALOG),
				  m_hWnd,IDD,96.0); // 96 is the DPI

	   // The rest of your initialization code goes here

	   return TRUE;
   }

   // -------------------------------------------------------------------
   // ATL/WTL Example:
   // -------------------------------------------------------------------

   ...

   BOOL CMyDlg::OnInitDialog()
   {
	   CDialog::OnInitDialog();

	   dpi.Attach(_AtlBaseModule.GetResourceInstance(),m_hWnd,IDD,96.0);
	   //                                                         ^^^^ DPI

	   // The rest of your initialization code goes here

	   return TRUE;
   }

*/

#ifndef SETDPI_INCLUDED
#define SETDPI_INCLUDED

class CSetDPI
{
public:
	int IDD;
	HINSTANCE inst;
	HWND hwnd;
	HFONT font,oldfont;

	CSetDPI();

	void Attach(HINSTANCE inst,HWND dlg,int IDD,double dpi);

	void Detach();

	~CSetDPI();
};

#endif
