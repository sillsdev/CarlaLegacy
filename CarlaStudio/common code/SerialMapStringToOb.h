// SerialMapStringToOb.h: interface for the CSerialMapStringToOb class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SERIALMAPSTRINGTOOB_H__D7BC9505_89D7_11D2_864F_C8DF0CC10000__INCLUDED_)
#define AFX_SERIALMAPSTRINGTOOB_H__D7BC9505_89D7_11D2_864F_C8DF0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
class CSimpleProgressBar;

class CSerialMapStringToOb : public CMapStringToOb
{
	DECLARE_SERIAL(CSerialMapStringToOb);
public:
	void storeSerialize(CArchive& ar, CSimpleProgressBar* pProgress=NULL, int percentChunk=0);
	CSerialMapStringToOb( int nBlockSize = 10 );
	virtual ~CSerialMapStringToOb();

};

#endif // !defined(AFX_SERIALMAPSTRINGTOOB_H__D7BC9505_89D7_11D2_864F_C8DF0CC10000__INCLUDED_)
