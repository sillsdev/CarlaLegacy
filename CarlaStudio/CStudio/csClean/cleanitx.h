#pragma once

#include <fstream.h>

// exceptions LPCTSTR
void cleanITX(ostream& fout,
		  LPCTSTR lpszPath,
		  LPCTSTR lpszTextMarker,
		  CStringArray& stripFields);
void cleanITXBlanks(ostream& fout,
					LPCTSTR lpszPath,
					LPCTSTR lpszTextMarker);
