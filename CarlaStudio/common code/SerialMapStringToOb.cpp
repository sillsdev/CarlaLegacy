// SerialMapStringToOb.cpp: implementation of the CSerialMapStringToOb class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "SerialMapStringToOb.h"
#include "SimpleProgressBar.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CSerialMapStringToOb, CMapStringToOb, 1);

CSerialMapStringToOb::CSerialMapStringToOb(int nBlockSize )
:CMapStringToOb(nBlockSize)
{

}

CSerialMapStringToOb::~CSerialMapStringToOb()
{

}

// percentChunk is a number between 0 and 100, the amoun of % points that this will eat up
void CSerialMapStringToOb::storeSerialize(CArchive &ar, CSimpleProgressBar* pProgress,  int percentChunk)
{
	if(ar.IsStoring())
	{
		CObject* pObj;
		CString sKey;
		int sz = GetCount();
		int iProgCount=0;
		int lastPer=0;
		int basePer = 0;
		if(pProgress)
			basePer = pProgress->m_nPercentage;

		POSITION p = GetStartPosition( );
		while(p)
		{
			GetNextAssoc(p, sKey, pObj);
			if(pObj)
				pObj->Serialize(ar);
			if(pProgress)
			{
				++iProgCount;
				int per = basePer + int(percentChunk*iProgCount/sz);
				if(per >= lastPer + 2)
					pProgress->Step(per);
			}
		}
	}
	else
	{
		ASSERT(FALSE); // can only output serialize
	}
}
