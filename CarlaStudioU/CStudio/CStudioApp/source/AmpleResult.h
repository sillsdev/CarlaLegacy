	// these are classes for parsing, representing, and drawing AmpleDLL parses
  // 2.1.8 26-May-2000 hab Add manual parse to QP
  //	9-June2000 jdh  made a couple member vars public that were protected
//		16-June2000 jdh add m_sCategory to morph

	#pragma once

	#ifdef _DEBUG
	#define new DEBUG_NEW
	#endif

	#include <afxtempl.h>
	#include <afxcoll.h>

	class ostream;
	class CParseStream;
	class istream;

  const TCHAR kcDelim = '_';

	class CANode	// ABSTRACT CLASS
	{
		public:
			virtual ostream& writeXML(ostream &sout) const = 0;
			virtual  ~CANode();
		//	CMapStringToString m_paramMap;
			virtual ostream& operator<<(ostream& sout) const =0;
			friend ostream& operator <<( ostream& fout, const CANode& n );
		protected:
			void readEndTag(CParseStream & fin);
			virtual CString getTag() const =0;
			void readBeginTag(CParseStream& parseStream, CMapStringToString& map);
			//BOOL readSimpleNode(CString& sTag);
			//BOOL readComplexNode(CString& sTag);
	};

	class CASimpleNode : public CANode
	{
	public:

	};
	class CAComplexNode: public CANode
	{
		public:
		//	CTypedPtrArray<CPtrArray, CANode*>  m_pNodes;
	};

	class CAError : public CASimpleNode
	{
		public:
			 CAError(CParseStream& parseStream);
			virtual ostream& operator<<(ostream& sout) const;
			static CAError* readNode(CParseStream& parseStream);
			virtual ostream& writeXML(ostream &sout) const;
		protected:
			virtual CString getTag() const {return _T("error");}
			CString m_sCode;
			CString m_sWord;
	};

	class CAMorph : public CASimpleNode
	{
		public:
			 CAMorph(CParseStream& parseStream);
			virtual ostream& operator<<(ostream& sout) const;
			static CAMorph* readNode(CParseStream& parseStream);
			virtual ostream& writeXML(ostream &sout) const;
		CString m_sID;
		CString m_sAllo;
		CString m_sCategory;
		protected:
			CString m_sType;
			virtual CString getTag() const {return _T("morph");}
	};

	class CAAnalysis : public CAComplexNode
	{
		public:
			CString m_sCatProgression;
			virtual  ~CAAnalysis();
			 CAAnalysis(CParseStream& parseStream);
			virtual ostream& operator<<(ostream& sout) const;
			static CAAnalysis* readNode(CParseStream& parseStream);
			virtual ostream& writeXML(ostream &sout) const;
		protected:
			virtual CString getTag() const {return _T("analysis");}
			CTypedPtrArray<CPtrArray, CAMorph*>  m_morphs;
			CString m_sFinalCat;
	};

	class CAParse : public CAComplexNode
	{
		public:
			virtual  ~CAParse();
			 CString m_sID;
			 CAParse(CParseStream& parseStream);
			virtual ostream& operator<<(ostream& sout) const;
			static CAParse* readNode(CParseStream& parseStream);
			virtual ostream& writeXML(ostream &sout) const;
		protected:
			virtual CString getTag() const {return _T("parse");}
			CTypedPtrArray<CPtrArray, CAAnalysis*>  m_analyses;
	};

	class CAmpleResult : public CAComplexNode
	{
		public:
			CString getXMLRepresentation();
			virtual ostream& writeXML(ostream& sout) const;
			virtual  ~CAmpleResult();
			CString getStringRepresentation();
			CAmpleResult(CParseStream& parseStream);

			virtual ostream& operator<<(ostream& sout) const;
			static CAmpleResult* readNode(CString& sBuf);
			static CAmpleResult* buildResult(CString& sBuf);
			CString getXMLRepresentation (LPCTSTR lpszPath);

		protected:
			virtual CString getTag() const {return _T("AResult");}
	//		CTypedPtrArray<CPtrArray, CAParse*>  m_parses;
	//		CTypedPtrArray<CPtrArray, CAError*>  m_errors;
			CTypedPtrArray<CPtrArray, CANode*>  m_wordResults;

	};



  #ifndef hab218
  class CAllo : public CASimpleNode
  {
	public:
		 CAllo(CParseStream& parseStream);
		virtual ostream& writeXML(ostream &sout) const;
		virtual ostream& operator<<(ostream& sout) const;
		static CAllo* readNode(CParseStream& parseStream);
		CString m_sID;
		CString m_sShape;
		CString m_sMorphName;
		CString m_sType;
		CString m_sInfixContext;
	protected:
		virtual CString getTag() const {return _T("allo");}
  };

  class CAlloResult : public CAComplexNode
  {
	public:
		virtual  ~CAlloResult();
		CString getStringRepresentation(CString &sInput);
		CAlloResult(CParseStream& parseStream);

		virtual ostream& writeXML(ostream &sout) const;
		virtual ostream& operator<<(ostream& sout) const;
		static CAlloResult* readNode(CString& sBuf);
		static CAlloResult* buildResult(CString& sBuf);
		CANode * getResult(int index);
		int getSizeOfResults(void) { return m_wordResults.GetSize();}


	protected:
		virtual CString getTag() const {return _T("AlloResult");}
		CTypedPtrArray<CPtrArray, CANode*>  m_wordResults;
  };
  #endif // hab218

	//typedef CArray<CResultStreamDescriptor, CResultStreamDescriptor&> CANodeArray;
