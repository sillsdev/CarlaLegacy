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
