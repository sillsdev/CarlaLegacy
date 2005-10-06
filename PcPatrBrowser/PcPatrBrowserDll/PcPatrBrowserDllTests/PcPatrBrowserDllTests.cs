using System;
using System.Drawing;
using System.IO;
using System.Xml;
using NUnit.Framework;

namespace SIL.PcPatrBrowser
{
	/// <summary>
	/// Summary description for PcPatrBrowserDllTests.
	/// </summary>
	[TestFixture]
	public class PcPatrBrowserDllTests
	{
		const string m_ksTestData = @"..\..\PcPatrBrowserDll\PcPatrBrowserDllTests\TestData";

		string m_sSimpleSentenceXml;
		string m_sComplexSentenceXml;
		string m_sMultiSentencesSentenceOneXml;
		string m_sMultiSentencesSentenceTwoXml;
		string m_sMultiSentencesSentenceLastXml;

		string m_sSimpleSentenceParseXml;
		string m_sComplexSentenceParseOneXml;
		string m_sMultiSentencesSentenceOneParseOneXml;
		string m_sMultiSentencesSentenceNineParseOneXml;
		string m_sComplexSentenceParseTwoXml;
		string m_sMultiSentencesSentenceOneParseTwoXml;
		string m_sMultiSentencesSentenceNineParseTwoXml;

		PcPatrBrowserApp m_app;
		public PcPatrBrowserDllTests()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		[TestFixtureSetUp]
		public void FixtureInit()
		{
			m_app = new PcPatrBrowserApp(@"C:\carla\Dev\PcPatrBrowser\bin\Debug");
			m_sSimpleSentenceXml = Path.Combine(m_ksTestData, "SimpleSentence.xml");
			m_sComplexSentenceXml = Path.Combine(m_ksTestData, "ComplexSentence.xml");
			m_sMultiSentencesSentenceOneXml = Path.Combine(m_ksTestData, "MultiSentences1.xml");
			m_sMultiSentencesSentenceTwoXml = Path.Combine(m_ksTestData, "MultiSentences2.xml");
			m_sMultiSentencesSentenceLastXml = Path.Combine(m_ksTestData, "MultiSentencesLast.xml");

			m_sSimpleSentenceParseXml = Path.Combine(m_ksTestData, "SimpleSentenceParse.xml");
			m_sComplexSentenceParseOneXml = Path.Combine(m_ksTestData, "ComplexSentenceParse1.xml");
			m_sMultiSentencesSentenceOneParseOneXml = Path.Combine(m_ksTestData, "MultiSentences1Parse1.xml");
			m_sMultiSentencesSentenceNineParseOneXml = Path.Combine(m_ksTestData, "MultiSentences9Parse1.xml");
			m_sComplexSentenceParseTwoXml = Path.Combine(m_ksTestData, "ComplexSentenceParse2.xml");
			m_sMultiSentencesSentenceOneParseTwoXml = Path.Combine(m_ksTestData, "MultiSentences1Parse2.xml");
			m_sMultiSentencesSentenceNineParseTwoXml = Path.Combine(m_ksTestData, "MultiSentences9Parse2.xml");
		}
		private void CheckLoadAnaFile(string sFile, int iExpectedCount, int iExpectedCountOfParsesInFirstSentence, out PcPatrDocument doc, out PcPatrSentence sentence, out string sGrammarFile)
		{
			doc = new PcPatrDocument(sFile, out sGrammarFile);
			Assert.IsNotNull(doc.Sentences, "no sentences found in " + sFile);
			Assert.AreEqual(iExpectedCount, doc.Sentences.Length, sFile + " has " + iExpectedCount.ToString() + " Sentences");
			sentence = doc.FirstSentence;
			Assert.IsNotNull(sentence, "could not get first sentence in " + sFile);
			Assert.IsNotNull(sentence.Parses, "no parses found in 1st sentence of " + sFile);
			Assert.AreEqual(iExpectedCountOfParsesInFirstSentence, sentence.Parses.Length, sFile + " has " + iExpectedCountOfParsesInFirstSentence.ToString() + " parses in first sentence");
		}
		/// <summary>
		/// Check loading of simple ANA file and its content
		/// </summary>
		[Test]
		public void LoadSimpleAnaFile()
		{
			PcPatrDocument doc;
			PcPatrSentence sentence;
			string sFile = Path.Combine(m_ksTestData, "Simple.ana");
			string sGrammarFile;
			CheckLoadAnaFile(sFile, 1, 1, out doc, out sentence, out sGrammarFile);
			Assert.IsNull(sGrammarFile, "Expect grammar file of Simple.ana to be null");
			CheckSentenceInAna(m_sSimpleSentenceXml, sentence.Node, "Simple");
			PcPatrParse parse = sentence.FirstParse;
			CheckParseInSentence(m_sSimpleSentenceParseXml, parse.Node, 1, 1, "Simple");
		}
		/// <summary>
		/// Check loading of complex ANA file and its content
		/// </summary>
		[Test]
		public void LoadComplexAnaFile()
		{
			PcPatrDocument doc;
			PcPatrSentence sentence;
			string sFile = Path.Combine(m_ksTestData, "Complex.ana");
			string sGrammarFile;
			CheckLoadAnaFile(sFile, 1, 4, out doc, out sentence, out sGrammarFile);
			Assert.IsNull(sGrammarFile, "Expect grammar file of Complex.ana to be null");
			CheckSentenceInAna(m_sComplexSentenceXml, sentence.Node, "Complex");
			PcPatrParse parse = sentence.FirstParse;
			CheckParseInSentence(m_sComplexSentenceParseOneXml, parse.Node, 1, 1, "Complex");
			parse = sentence.NextParse;
			CheckParseInSentence(m_sComplexSentenceParseTwoXml, parse.Node, 1, 2, "Complex");
			parse = sentence.GoToParse(2);
			CheckParseInSentence(m_sComplexSentenceParseTwoXml, parse.Node, 1, 2, "Complex");
		}
		/// <summary>
		/// Check loading of multi ANA file and its content
		/// </summary>
		[Test]
		public void LoadMultiAnaFile()
		{
			PcPatrDocument doc;
			PcPatrSentence sentence;
			string sFile = Path.Combine(m_ksTestData, "MultiSentences.ana");
			string sGrammarFile;
			CheckLoadAnaFile(sFile, 34, 4, out doc, out sentence, out sGrammarFile);
			Assert.AreEqual(@"..\..\testdata\calpatr2.grm", sGrammarFile, "Grammar file from Multi");
			CheckSentenceInAna(m_sMultiSentencesSentenceOneXml, sentence.Node, "Multi");
			PcPatrParse parse = sentence.FirstParse;
			CheckParseInSentence(m_sMultiSentencesSentenceOneParseOneXml, parse.Node, 1, 1, "Multi");
			parse = sentence.NextParse;
			CheckParseInSentence(m_sMultiSentencesSentenceOneParseTwoXml, parse.Node, 1, 2, "Multi");

			// Test next sentence
			// get 9th sentence
			for (int i = 1; i < 9; i++)
			{
				Assert.AreEqual(i, doc.CurrentSentenceNumber, "Current Sentence Number");
				sentence = doc.NextSentence;
			}
			parse = sentence.FirstParse;
			CheckParseInSentence(m_sMultiSentencesSentenceNineParseOneXml, parse.Node, 9, 1, "Multi");
			Assert.AreEqual(1, sentence.CurrentParseNumber, "Current Parse Number");
			parse = sentence.NextParse;
			CheckParseInSentence(m_sMultiSentencesSentenceNineParseTwoXml, parse.Node, 9, 2, "Multi");
			Assert.AreEqual(2, sentence.CurrentParseNumber, "Current Parse Number");

			// Test previous sentence
			// get first sentence
			for (int i = 1; i < 9; i++)
				sentence = doc.PreviousSentence;
			CheckSentenceInAna(m_sMultiSentencesSentenceOneXml, sentence.Node, "Multi sent 1");
			parse = sentence.FirstParse;
			CheckParseInSentence(m_sMultiSentencesSentenceOneParseOneXml, parse.Node, 1, 1, "Multi sent 1 parse 1");
			parse = sentence.NextParse;
			CheckParseInSentence(m_sMultiSentencesSentenceOneParseTwoXml, parse.Node, 1, 2, "Multi setn 1 parse 2");

			// Test last sentence
			sentence = doc.LastSentence;
			CheckSentenceInAna(m_sMultiSentencesSentenceLastXml, sentence.Node, "Multi");

			// Test go to sentence
			// go to 9th sentence
			sentence = doc.GoToSentence(9);
			parse = sentence.FirstParse;
			CheckParseInSentence(m_sMultiSentencesSentenceNineParseOneXml, parse.Node, 9, 1, "Multi");

			sentence = doc.GoToSentence(1); // get first
			CheckSentenceInAna(m_sMultiSentencesSentenceOneXml, sentence.Node, "Multi");
			sentence = doc.GoToSentence(-1); // too small; get first
			CheckSentenceInAna(m_sMultiSentencesSentenceOneXml, sentence.Node, "Multi");

			sentence = doc.GoToSentence(38); // get last
			CheckSentenceInAna(m_sMultiSentencesSentenceLastXml, sentence.Node, "Multi");
			sentence = doc.GoToSentence(100); // too large; return last
			CheckSentenceInAna(m_sMultiSentencesSentenceLastXml, sentence.Node, "Multi");

		}
		private void CheckSentenceInAna(string sExpectedResultFile, XmlNode node, string sType)
		{
			string sExpected = ReadExpectedFile(sExpectedResultFile);
			string sMsg = "First Sentence differs for " + sType;
#if CreateCopyOfWhatWeAreGetting
			string s = CreateCopyOfWhatWeAreGetting(node);
			sMsg += " " + s;
#endif
			Assert.AreEqual(sExpected, node.InnerXml, sMsg);
		}
		private void CheckParseInSentence(string sExpectedFile, XmlNode node, int iSentenceIndex, int iParseIndex, string sType)
		{
			string sExpected = ReadExpectedFile(sExpectedFile);
			string sMsg = "Parse " + iParseIndex.ToString() + " differs for sentence " + iSentenceIndex.ToString() + " in " + sType;
#if CreateCopyOfWhatWeAreGetting
			string s = CreateCopyOfWhatWeAreGetting(node);
			sMsg += " " + s;
#endif
			Assert.AreEqual(sExpected, node.InnerXml, sMsg);
		}

#if CreateCopyOfWhatWeAreGetting
		private string CreateCopyOfWhatWeAreGetting(XmlNode node)
		{
			string sTempFile = Path.GetTempFileName();
			StreamWriter sw = new StreamWriter(sTempFile);
			sw.Write(node.InnerXml);
			sw.Close();
			return sTempFile;
		}
#endif

		private string ReadExpectedFile(string sExpectedFile)
		{
			StreamReader sr = new StreamReader(sExpectedFile);
			string sExpected = sr.ReadToEnd();
			sr.Close();
			return sExpected;
		}
		/// <summary>
		/// Check loading of multi ANA file and its content
		/// </summary>
		[Test]
		public void GetFeatureStructuresBasedOnId()
		{
			PcPatrDocument doc;
			PcPatrSentence sentence;
			string sFile = Path.Combine(m_ksTestData, "Simple.ana");
			string sGrammarFile;
			CheckLoadAnaFile(sFile, 1, 1, out doc, out sentence, out sGrammarFile);
			Assert.IsNull(sGrammarFile, "Expect grammar file of Simple.ana to be null");
			CheckSentenceInAna(m_sSimpleSentenceXml, sentence.Node, "Simple");
			PcPatrParse parse = sentence.FirstParse;
			m_app.Parse = parse;

			CheckFeatureStructureAtId("_1._1", "SimpleSentenceParseId_1._1.xml");
			CheckFeatureStructureAtId("_1._14", "SimpleSentenceParseId_1._14.xml");
			CheckFeatureStructureAtId("_1._25", "SimpleSentenceParseId_1._25.xml");
			CheckFeatureStructureAtId("_1._25lex", "SimpleSentenceParseId_1._25Lexfs.xml");
			CheckFeatureStructureAtId("_1._25gloss", "SimpleSentenceParseId_1._25Lexfs.xml");
		}

		private void CheckFeatureStructureAtId(string sId, string sExpectedFile)
		{
			XmlNode fs = m_app.GetFeatureStructureAtNode(sId);
			string sExpected = ReadExpectedFile(Path.Combine(m_ksTestData, sExpectedFile));
			Assert.AreEqual(sExpected, fs.OuterXml, "Index " + sId);
		}
		/// <summary>
		/// check changing, saving, and loading of Language info
		/// </summary>
		[Test]
		public void ChangeSaveAndLoadLanguageInfo()
		{
			const string ksNewLangName = "Unit Test Language Name";
			const string ksNewGlossColorName = "Unit Test Gloss Color";
			const string ksNewGlossFontFace = "Unit Test Gloss Font Face";
			const float kfNewGlossFontSize = 200.0f;
			// todo : style
			const string ksNewLexColorName = "Unit Test Lex Color";
			const string ksNewLexFontFace = "Unit Test Lex Font Face";
			const float kfNewLexFontSize = 200.0f;
			// todo : style
			const string ksNewNTColorName = "Unit Test NT Color";
			const string ksNewNTFontFace = "Unit Test NT Font Face";
			const float kfNewNTFontSize = 200.0f;
			// todo : style
			LanguageInfo lang = m_app.LanguageInfo;
			// make changes
			lang.LanguageName = ksNewLangName;
			lang.GlossColorName = ksNewGlossColorName;
			lang.GlossFontFace = ksNewGlossFontFace;
			lang.GlossFontSize = kfNewGlossFontSize;
			// todo: style
			lang.LexColorName = ksNewLexColorName;
			lang.LexFontFace = ksNewLexFontFace;
			lang.LexFontSize = kfNewLexFontSize;
			// todo: style
			lang.NTColorName = ksNewNTColorName;
			lang.NTFontFace = ksNewNTFontFace;
			lang.NTFontSize = kfNewNTFontSize;
			// todo: style
			// save and reload
			m_app.LanguageFileName = Path.Combine(m_ksTestData, "UnitTestLanguageInfo.pbl");
			m_app.SaveLanguageInfo();
			m_app.LoadLanguageInfo();
			lang = m_app.LanguageInfo;
			// test changes
			Assert.AreEqual(ksNewLangName, lang.LanguageName, "Language Name");
			Assert.AreEqual(ksNewGlossColorName, lang.GlossColorName, "Gloss Color Name");
			Assert.AreEqual(ksNewGlossFontFace, lang.GlossFontFace, "Gloss Font Face");
			Assert.AreEqual(kfNewGlossFontSize, lang.GlossFontSize, "Gloss font size");
			//todo: style
			Assert.AreEqual(ksNewLexColorName, lang.LexColorName, "Lex Color Name");
			Assert.AreEqual(ksNewLexFontFace, lang.LexFontFace, "Lex Font Face");
			Assert.AreEqual(kfNewLexFontSize, lang.LexFontSize, "Lex font size");
			//todo: style
			Assert.AreEqual(ksNewNTColorName, lang.NTColorName, "NT Color Name");
			Assert.AreEqual(ksNewNTFontFace, lang.NTFontFace, "NT Font Face");
			Assert.AreEqual(kfNewNTFontSize, lang.NTFontSize, "NT font size");
			//todo: style
		}
	}
}
