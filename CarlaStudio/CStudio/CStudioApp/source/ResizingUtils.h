/*
 * ResizingUtils.cpp
 * Utility functions to help Dialogs resize themselves in a neat way
 * (with member panes and windows sizing at the same time)
 */

#include "stdafx.h"

/*
 * Functions to store the dialog window's size - or else the user will have to
 * resize over and over again.
 */

/*
 * extern long
 * lPutWindowPlacement(LPCTSTR lpScreenName, WINDOWPLACEMENT *pwp);
 * in : lpScreenName
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
lPutWindowPlacement(LPCTSTR lpScreenName, WINDOWPLACEMENT *pwp);

/*
 * extern long
 * lPutWindowPlacement(LPCTSTR lpScreenName, WINDOWPLACEMENT *pwp);
 * in : lpScreenName
 * out: pwp
 *
 * The reverse of the previous function, retrieves the info from the registry.
 * Return value the same as above.
 */
extern long
lGetWindowPlacement(LPCTSTR lpScreenName, WINDOWPLACEMENT *pwp);

/*
 * To do the resizing of any dialog window, you can call the vResize() function.
 * This is typically called from an OnSize() function.
 * The job that vResize() does, is reposition and resizing the member elements
 * in a dialog.
 * The following structure can contain, for each item, it's position relative
 * to the borders of the mother window (dialog).
 */
typedef struct {
		int iItem;          // Item ID in the dialog; should be unique
		int iFromBorder,    // horizontal distance from border; if iAlignLeft = 1, then
							// this is taken from the left border; else, from the right border
			iWidth,         // width of the box; if this is negative,
							// it is computed relative to the right hand border.
			iTopFromBorder, // is the distance of the top of this element to the border;
							// if positive, distance to the top, if negative, distance from the bottom
			iHeight;        // if this is negative, this element doesn't move but stretch with the bottom
		int iAlignLeft;
	} tsSizingElement;

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
