// PrefsInputDoc.cpp: implementation of the CPrefsInputDoc class.
//
//////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "carlastudioapp.h"
#include "CWProcess.h"
#include "PrefsInputDoc.h"
#include "PageInputDocPanels.h"
#include "SFMFile.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CPrefsInputDocDisplay::CPrefsInputDocDisplay()
{

}
CPrefsInputDocDisplay::~CPrefsInputDocDisplay()
{
/*	for(int i=0; i<m_outputDescriptors.GetSize(); i++)
	{
		delete m_outputDescriptors[i];
	}
	m_outputDescriptors.RemoveAll();
*/
}

CPrefsInputDocDisplay::CPrefsInputDocDisplay(SFMFile* f)
{
	CString sMarker, sField;
	while(f->getField(sMarker, sField))
	{
		if(sMarker=="-PrefsInputDocDisplay")
			break;
		else if (sMarker == CResultStreamDescriptor::getBeginMarker())
		{
			CResultStreamDescriptor* pRSD = new CResultStreamDescriptor(f);
			m_outputDescriptors.Add(*pRSD);
			delete pRSD;
		}
		else f->throwParseFailure("PrefsInputDocDisplay", sMarker, sField);
	}
}

// parameters: pResultStreams.  This is used to give some indication of what
//  output panels are actually *availible* at the moment.  Since we have to
//  keep track of every kind of process output we ever run accross, this
// would get confusing to the user.  This param may be null or have no elements.
BOOL CPrefsInputDocDisplay::doEditDialog(CTypedPtrArray<CPtrArray, CResultStream*>  *pResultStreams) // =null
{
	CPropertySheet dlg("Display");

	CResultDescriptorArray copyOutputDescriptors;
	copyOutputDescriptors.Copy(m_outputDescriptors);

	for(int xx=0; xx<copyOutputDescriptors.GetSize();xx++)
	{
		TRACE("od[%s].m_bShow=%d\n", copyOutputDescriptors.ElementAt(xx).getShortDescription(), copyOutputDescriptors.ElementAt(xx).m_bShow);
	}
	// create an array exactly the size of copyOutputDescriptors, which
	// correspond to whether a stream corresponding to the descriptor is
	// currently availible, i.e. can be shown in the current inputDoc at this moment
	CArray<bool, bool> panelAvailability;
	for(int i=0; i<copyOutputDescriptors.GetSize();i++)
	{
		bool bAvail=FALSE;
		if(pResultStreams && pResultStreams->GetSize())
		{
			for(int x=0; x <  pResultStreams->GetSize(); x++)
			{
				if(  *pResultStreams->GetAt(x)->getDescriptor() // this a comparison of value, not location
							== copyOutputDescriptors.ElementAt(i))
				{
					bAvail=TRUE;
					break;
				}
			}
		}
		panelAvailability.Add(bAvail);
	}
	CPageInputDocPanels* pPanelsPage = new CPageInputDocPanels(&copyOutputDescriptors, &panelAvailability);
	dlg.AddPage(pPanelsPage);

	if(IDOK != dlg.DoModal())
		return FALSE;

	m_outputDescriptors.RemoveAll();
	m_outputDescriptors.Copy(copyOutputDescriptors);
	return TRUE;
}

// given a descriptor, are we supposed to show a panel for its corresponding stream?
BOOL CPrefsInputDocDisplay::getShowPanel(CResultStreamDescriptor * pRSD)
{
	CResultStreamDescriptor* pMatch =  findDescriptor(pRSD);
	ASSERTX(pMatch);
	return pMatch->m_bShow;
}

// given a descriptor, look up our list and return the first matching descriptor
CResultStreamDescriptor* CPrefsInputDocDisplay::findDescriptor(CResultStreamDescriptor* pRSD)
{
	for (int i=0; i< m_outputDescriptors.GetSize(); i++)
		if(m_outputDescriptors.ElementAt(i) == *pRSD)
			return &m_outputDescriptors.ElementAt(i);
	return NULL; // not found
}


void CPrefsInputDocDisplay::writeToFile(ostream& fout)
{
	fout << "\\" << getBeginMarker() << "\n";
	for (int i=0; i< m_outputDescriptors.GetSize(); i++)
	{
		fout << m_outputDescriptors.ElementAt(i);
	}
	fout << "\\-PrefsInputDocDisplay\n";
}

// index is zero-based, so 0 will return the first visible descriptor
CResultStreamDescriptor* CPrefsInputDocDisplay::getNthVisibleDescriptor(int index)
{
	ASSERTX(index <= m_outputDescriptors.GetSize());
	int count=0;
	for (int i=0; i< m_outputDescriptors.GetSize(); i++)
	{
		if(m_outputDescriptors.ElementAt(i).m_bShow)
			++count;
		if(count-1 == index) // -1 because index is zero-based
			return &m_outputDescriptors.ElementAt(i);
	}
	ASSERTX(FALSE);
	return NULL;
}
int CPrefsInputDocDisplay::getExpectedVisibleDescriptorCount() const
{
	int count=0;
	for (int i=0; i< m_outputDescriptors.GetSize(); i++)
	{
		if(m_outputDescriptors.GetAt(i).m_bShow)
			++count;
	}
	return count;
}

void CPrefsInputDocDisplay::includeDescriptor(CResultStreamDescriptor* pRSD)
{
	if(!findDescriptor(pRSD))	// if we've never seen this kind of stream before
	{
		pRSD->m_bShow = TRUE; // show new ones by default
		m_outputDescriptors.Add(*pRSD);
	}
}
