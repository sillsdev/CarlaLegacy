// AmpleResult.cpp: implementation of the CAmpleResult class.
//
// 2.1.8 26-May-2000 hab Add manual parse to QP
//	9-June-2000 jdh  added a "morphsID" attribute to the xml output to help XSL comparison of analyses
//	10-june-2000 jdh added category to each morpheme known to facilitate interlinearization
// 2.2.1 21-Jun-2000 hab fixed bug where morpheme processing assumed that
//                        every morpheme had a category
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "AmpleResult.h"
#include "iostream.h"
#include "parsestream.h"
#include <strstrea.h>

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

CString sThrow;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAmpleResult::CAmpleResult(CParseStream& parseStream)
{
	CMapStringToString map;
	readBeginTag(parseStream, map); // will throw an exception if this kind of node is not found

	CANode* p;
	do
	{
		if(p = CAParse::readNode(parseStream))
			m_wordResults.Add(p);
		else if(p = CAError::readNode(parseStream))
			m_wordResults.Add(p);
	}while (p);

	readEndTag(parseStream);
}

CAParse::CAParse(CParseStream& parseStream)
{
	CMapStringToString map;
	readBeginTag(parseStream, map); // will throw an exception if this kind of node is not found

	 THROW_STR_IF_NOT(map.Lookup("id", m_sID), "CAParse id not found");

	CAAnalysis* pA;
	do
	{
		try
		{
			if(pA = CAAnalysis::readNode(parseStream))
				m_analyses.Add(pA);
		}
		catch(char* lpsz)
		{
			sThrow.Format("%s.  Word='%s'", lpsz, m_sID);
			throw LPCTSTR(sThrow);
		}
	} while (pA);

	readEndTag(parseStream);
}


//	10-june-2000 jdh added category to each morpheme known to facilitate interlinearization
CAAnalysis::CAAnalysis(CParseStream& parseStream)
{
	CMapStringToString map;
	readBeginTag(parseStream, map); // will throw an exception if this kind of node is not found

	CString sCatProgression;
	THROW_STR_IF_NOT(map.Lookup("cat", sCatProgression), "CAAnalysis cat not found");

	 // there is an infelicity in how ample gives us cats:
		// cat="V0MS blah/mah=foo/goo=kii/gii"

	sCatProgression.Replace('=', ' ');

	CParseStream ps(sCatProgression);
//	THROW_STR_IF_NOT(ps.word(m_sFinalCat, true), "Trouble reading final cat");
//	THROW_STR_IF_NOT(ps.toEnd(m_sCatProgression), "Trouble reading cat progression");
//	m_sCatProgression.Replace('=', ' '); //equals signs look dumb

	THROW_STR_IF_NOT(ps.word(m_sFinalCat, true), "Trouble reading final cat");

	// jdh 6/10/2000 parse the catProgression into distinct strings
	CStringArray cats;
	CString s;
	while (ps.word(s, false))
	{
		cats.Add(s);
		m_sCatProgression=m_sCatProgression+" "+s;
	}

#ifndef hab221
				// process morpheme
	CAMorph* p = CAMorph::readNode(parseStream);
	int i = 0;
	while (p)
	  {
		if (i < cats.GetSize())
		  p->m_sCategory = cats[i];	// add morpheme's cat/cat mapping
		m_morphs.Add(p);	// add morpheme
		p = CAMorph::readNode(parseStream);	// check on next morpheme
		i++;
	  }
#else // hab221
	CAMorph* p;
	for(int i=0; p && i <= cats.GetSize(); i++)
	{
		if(p = CAMorph::readNode(parseStream))
		{
			p->m_sCategory = cats[i];
			m_morphs.Add(p);
		}
	}
	if(i != cats.GetSize()+1)
		throw("The number of categories did not match the number of morphemes.");
#endif // hab221

	readEndTag(parseStream);
}

CAMorph::CAMorph(CParseStream& parseStream)
{
	m_sType = "?";
	CMapStringToString map;
	readBeginTag(parseStream, map); // will throw an exception if this kind of node is not found

	 THROW_STR_IF_NOT(map.Lookup("id", m_sID), "CAMorph id not found");
	 THROW_STR_IF_NOT(map.Lookup("allo", m_sAllo), "CAMorph allo not found");

	 //THROW_STR_IF_NOT(map.Lookup("type", m_cType), "Morph Type not found. Need latest AmpleDLL version.");
	 map.Lookup("type", m_sType); // ok if this fails

	 m_sAllo.Replace("#", ""); // remove those hashes
}
CAError::CAError(CParseStream& parseStream)
{
	CMapStringToString map;
	readBeginTag(parseStream, map); // will throw an exception if this kind of node is not found

	 THROW_STR_IF_NOT(map.Lookup("code", m_sCode), "CAError code not found");

	parseStream.upTo(m_sWord, '<');
	readEndTag(parseStream);
}

void CANode::readBeginTag(CParseStream& parseStream, CMapStringToString& map)
{
	if (parseStream.readSGMLTag(getTag(), map))
	{
	//	TRACE("Read %s\n", getTag());
		return;
	}
	else
		throw CString("tag not found"); // this is not usually an error
}

// static
// returns null if item wasn't found
// to do: throw exception if item mal-formed
CAmpleResult* CAmpleResult::buildResult(CString& sBuf)
{
	CParseStream parseStream(sBuf);
	try
	{
		CAmpleResult* p = new CAmpleResult(parseStream);
		return p;
	}
	catch (CString sFailure)
	{
		TRACE(sFailure);
		return NULL;
	}
}

// static
// returns null if item wasn't found
// to do: throw exception if item mal-formed
CAError* CAError::readNode(CParseStream& parseStream)
{
	try
	{
		CAError* p = new CAError(parseStream);
		return p;
	}
	catch (CString sFailure)
	{
		return NULL;
	}
}

// static
// returns null if item wasn't found
// to do: throw exception if item mal-formed
CAParse* CAParse::readNode(CParseStream& parseStream)
{
	try
	{
		CAParse* p = new CAParse(parseStream);
		return p;
	}
	catch (CString sFailure)
	{
		return NULL;
	}
}

// static
// returns null if item wasn't found
// to do: throw exception if item mal-formed
CAAnalysis* CAAnalysis::readNode(CParseStream& parseStream)
{
	try
	{
		CAAnalysis* p = new CAAnalysis(parseStream);
		return p;
	}
	catch (CString sFailure)
	{
		return NULL;
	}
}

// static
// returns null if item wasn't found
// to do: throw exception if item mal-formed
CAMorph* CAMorph::readNode(CParseStream& parseStream)
{
	try
	{
		CAMorph* p = new CAMorph(parseStream);
		return p;
	}
	catch (CString sFailure)
	{
		return NULL;
	}
}
	/*<AResult>
	<parse id=nan>
	<analysis cat=N>
	<morph id=talk.N allo=talk.N_1>
	</analysis>
	</parse>
	</AResult>
	*/

	/*

	ostream& CAmpleResult::operator<<(ostream& sout) const
	{
		for(int i=0; i< m_parses.GetSize(); i++)
			sout << *(m_parses[i]);

		return sout;
	}
	ostream& CAParse::operator<<(ostream& sout) const
	{
		sout << "<parse id=" << m_sID << "> ";
		for(int i=0; i< m_analyses.GetSize(); i++)
			sout << *(m_analyses[i]);
		sout << "</parse> ";
		return sout;
	}
	ostream& CAAnalysis::operator<<(ostream& sout) const
	{
		sout << "<analysis cat=" << m_sFinalCat << "> ";
		for(int i=0; i< m_morphs.GetSize(); i++)
			sout << *(m_morphs[i]);
		sout << "</analysis> ";
		return sout;
	}
	ostream& CAMorph::operator<<(ostream& sout) const
	{
		sout << "<morph id=" << m_sID << " allo=" << m_sAllo << "> ";
		return sout;
	}
	*/


	ostream& CAmpleResult::operator<<(ostream& sout) const
	{
	for(int i=0; i< m_wordResults.GetSize(); i++)
		sout << *(m_wordResults[i]);

	return sout;
	}
	ostream& CAError::operator<<(ostream& sout) const
	{
	sout << "Failed to parse \"" << m_sWord << "\". " << m_sCode << "\r\n";
	return sout;
	}

	ostream& CAParse::operator<<(ostream& sout) const
	{
	sout <<"Parsed " << m_sID << "\r\n";
	for(int i=0; i< m_analyses.GetSize(); i++)
		sout << *(m_analyses[i]);
	sout << "\r\n";
	return sout;
	}
	ostream& CAAnalysis::operator<<(ostream& sout) const
	{
	sout << '[' << m_sFinalCat <<"] " ;
	for(int i=0; i< m_morphs.GetSize(); i++)
		sout << *(m_morphs[i]);
	sout << "   " << m_sCatProgression;  // jdh 23/may/2000
	sout << "\r\n";
	return sout;
	}

	//jdh 26may2000 added hyphens around allomorphs
	ostream& CAMorph::operator<<(ostream& sout) const
	{
		sout << m_sID << "(";
		if(m_sType == "s" || m_sType == "i")
			sout << "-";
		sout << m_sAllo;
		if(m_sType == "p" || m_sType == "i")
			sout << "-";
		sout << ") ";// jdh 23/may/2000

		return sout;
	}

	void CANode::readEndTag(CParseStream& parseStream)
	{
		if (parseStream.readSGMLEndTag(getTag()))
		{
			return;
		}
		else
			throw CString("tag not found"); // this is not usually an error
	}

	CString CAmpleResult::getStringRepresentation()
	{

		ostrstream sout;
		sout << *this;

		CString sResult (sout.str(), sout.pcount());

		sout.rdbuf()->freeze(0); // else get a memory leak

		return sResult;
	}

	//friend
	ostream& operator <<( ostream& sout, const CANode& n )
	{
		return n.operator<<(sout);
	}

	CAmpleResult::~CAmpleResult()
	{
		for(int i=0; i< m_wordResults.GetSize(); i++)
			delete 	m_wordResults[i];
	}

	CAParse::~CAParse()
	{
		for(int i=0; i< m_analyses.GetSize(); i++)
			delete 	m_analyses[i];
	}

	CAAnalysis::~CAAnalysis()
	{
		for(int i=0; i< m_morphs.GetSize(); i++)
			delete 	m_morphs[i];
	}

	CANode::~CANode()
	{

	}

	ostream& CAmpleResult::writeXML(ostream &sout) const
	{
		sout << "<aresult>";
		for(int i=0; i< m_wordResults.GetSize(); i++)
			(m_wordResults[i])->writeXML(sout);

		sout << "</aresult>";
		return sout;
	}

#include <fstream.h>
CString CAmpleResult::getXMLRepresentation(LPCTSTR lpszPath)
{
	 if(lpszPath)
	 {
		 ofstream fout(lpszPath);
		this->writeXML(fout);
		return lpszPath;
	 }
	else
	{
		ostrstream sout;
		this->writeXML(sout);

		CString sResult (sout.str(), sout.pcount());

		sout.rdbuf()->freeze(0); // else get a memory leak

		return sResult;
	}
}

	ostream& CAError::writeXML(ostream& sout) const
	{
		sout << "<error>";
		sout << "Failed to parse \"" << m_sWord << "\". " << m_sCode;
		sout << "</error>";
		return sout;
	}

	ostream& CAParse::writeXML(ostream& sout) const
	{
		sout << "<parse id=\"" << m_sID << "\">";
		for(int i=0; i< m_analyses.GetSize(); i++)
			(m_analyses[i])->writeXML(sout);
		sout << "</parse>";
		return sout;
	}
	// 10-june-2000 jdh changed to break catprogression from one string to individual elements
	ostream& CAAnalysis::writeXML(ostream& sout) const
	{
		sout << "<analysis finalcat=\"" << m_sFinalCat << "\" catProgression=\""
		<< m_sCatProgression << "\" morphsID=\"" ;

	//make an ID attribute to aid in matching analyses
		for(int i=0; i< m_morphs.GetSize(); i++)
		sout << '%' << (m_morphs[i])->m_sID << '_' << (m_morphs[i])->m_sAllo;

	sout << "\" >";

	for( i=0; i< m_morphs.GetSize(); i++)
			(m_morphs[i])->writeXML(sout);
		sout << "</analysis>";

		return sout;
	}
	ostream& CAMorph::writeXML(ostream& sout) const
	{
		sout << "<morph id=\"" << m_sID << "\" type=\"" << m_sType << "\" allo=\"" << m_sAllo << "\" cat=\"" << m_sCategory << "\" />";
		return sout;
	}

  #ifndef hab218
  CAllo::CAllo(CParseStream& parseStream)
	: m_sID(""),
	  m_sInfixContext("")
  {
	CMapStringToString map;
	readBeginTag(parseStream, map); // will throw an exception if this kind of node is not found

	THROW_STR_IF_NOT(map.Lookup("shape", m_sShape), "CAllo shape not found");
	if (m_sShape.GetLength() == 2)
	  m_sShape = "0";
	else
	  m_sShape = m_sShape.Mid(1,m_sShape.GetLength()-2);
	THROW_STR_IF_NOT(map.Lookup("mname", m_sMorphName), "CAllo mname not found");
	THROW_STR_IF_NOT(map.Lookup("type", m_sType), "CAllo type not found");
  }

  // static
  // returns null if item wasn't found
  // to do: throw exception if item mal-formed
  CAllo* CAllo::readNode(CParseStream& parseStream)
  {
	try
	  {
		CAllo* p = new CAllo(parseStream);
		return p;
	  }
	catch (CString sFailure)
	  {
		return NULL;
	  }
  }

  ostream& CAllo::operator<<(ostream& sout) const
  {
	sout << m_sShape << ' ' << m_sMorphName << ' ' << m_sType << ' '
		 << m_sInfixContext << '\n';
	return sout;
  }

  ostream& CAllo::writeXML(ostream& sout) const
  {
	sout << "<allo id=\"" << m_sID <<
			"\" shape=\"" << m_sShape <<
			"\" mname=\"" << m_sMorphName <<
			"\" type=\"" << m_sType << "\" />";
	return sout;
  }

  //////////////////////////////////////////////////////////////////////
  // Construction/Destruction
  //////////////////////////////////////////////////////////////////////

  CAlloResult::CAlloResult(CParseStream& parseStream)
  {
	CMapStringToString map;
	readBeginTag(parseStream, map); // will throw an exception if this kind of node is not found

	CANode* p;
	do
	  {
		if(p = CAllo::readNode(parseStream))
	m_wordResults.Add(p);
	  }while (p);

	readEndTag(parseStream);
  }

  // static
  // returns null if item wasn't found
  // to do: throw exception if item mal-formed
  CAlloResult* CAlloResult::buildResult(CString& sBuf)
  {
	CParseStream parseStream(sBuf);
	try
	  {
		CAlloResult* p = new CAlloResult(parseStream);
		return p;
	  }
	catch (CString sFailure)
	  {
		TRACE(sFailure);
		return NULL;
	  }
  }

  CANode* CAlloResult::getResult(int index)
  {
	if (index < 0 || index >= m_wordResults.GetSize())
	  return NULL;

	return m_wordResults[index];
  }

  ostream& CAlloResult::operator<<(ostream& sout) const
  {
	for(int i=0; i< m_wordResults.GetSize(); i++)
	  sout << *(m_wordResults[i]);

	return sout;
  }

  CString CAlloResult::getStringRepresentation(CString &sInput)
  {
	CAllo * pAllo = NULL;
	CString sAllo = "";
	CString sMName = "";
	CString sLastInfixAllo  = "";
	CString sLastInfixMName = "";
	int iInfixLocation = 0;
				// determine any infix contexts
	for(int i=0; i< m_wordResults.GetSize(); i++)
	  {
		pAllo = (CAllo *)getResult(i);
		if (pAllo->m_sType == "IFX")
	{
	  sAllo  = pAllo->m_sShape;
	  sMName = pAllo->m_sMorphName;
	  if (sAllo  == sLastInfixAllo &&
		  sMName == sLastInfixMName)
		{			// already seen one instance of infix;
				// find next one
		  iInfixLocation = sInput.Find(sAllo, iInfixLocation + 1);
		}
	  else
		{			// find first instance of infix
		  iInfixLocation = sInput.Find(sAllo);
		}
				// demarcate infix by use of underscores
	  pAllo->m_sInfixContext = sInput.Left(iInfixLocation) + kcDelim +
						   sAllo + kcDelim +
						   sInput.Right(sInput.GetLength()-
						(sAllo.GetLength()+
						 iInfixLocation));
	  sLastInfixAllo  = sAllo; // remember infix content to check for
	  sLastInfixMName = sMName; // other occurrences
	}
		else
	{			// init infix content and index so find first
				// instance of next infix
	  sLastInfixAllo = sLastInfixMName = "";
	  iInfixLocation = 0;
	}
	  }
				// now format the string representation
	ostrstream sout;
	sout << *this;

	CString sResult (sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak

	return sResult;
  }

  ostream& CAlloResult::writeXML(ostream &sout) const
  {
	sout << "<AlloResult>";
	for(int i=0; i< m_wordResults.GetSize(); i++)
		(m_wordResults[i])->writeXML(sout);

	sout << "</AlloResult>";
	return sout;
  }

  CAlloResult::~CAlloResult()
  {
	for(int i=0; i< m_wordResults.GetSize(); i++)
	  delete 	m_wordResults[i];
  }

  #endif //hab218
