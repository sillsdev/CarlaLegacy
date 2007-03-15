using System;
using System.Drawing;
using System.IO;
using System.Reflection;
using System.Windows.Forms;
using System.Xml;
using NUnit.Framework;

using XCore;

namespace SIL.Cabhab
{
	/// <summary>
	/// Summary description for CabhabDllTests.
	/// </summary>
	[TestFixture]
	public class CabhabDllTests
	{
		const string m_ksTestData = @"..\..\CabhabDll\CabhabDllTests\TestData";
		const string m_ksConfigurationPath = "file:///C:/carla/Dev/Cabhab/Configurations/PAWS";
		//HtmlViewer m_htmlviewer;
		//CabhabApp m_app;
		Language m_lang;
		public CabhabDllTests()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		[TestFixtureSetUp]
		public void FixtureInit()
		{
#if FailsWithMessageAboutNeedingWebBrowseerToBeInSingleThreadedApartment
			m_app = new CabhabApp();
			Form m_form = m_app.NewMainWindow(true);

			m_htmlviewer = (HtmlViewer)m_app.m_form.CurrentContentControl;
#endif
			m_lang = new Language();
			m_lang.AnswerFile = Path.Combine(m_ksTestData, "IsthmusZapotec2.paw");
			m_lang.LoadAnswerFile(m_lang.AnswerFile);
		}
		/// <summary>
		/// Check get values
		/// </summary>
		[Test]
		public void GetAnswerValues()
		{
			// attribute
			string sResult = m_lang.GetAnswerValue("//neg/@checkedOff");
			Assert.AreEqual("no", sResult, "get //neg/@checkedOff");
			// value
			sResult = m_lang.GetAnswerValue("//typology/example");
			Assert.AreEqual("Biiya'\tJuan\tca\tmani'.\r\nRutoo\tJuana\tgueta.\r\nBixhele'\tJuana\tpuerta'.", sResult, "get //typology/example");
		}
		/// <summary>
		/// Check setting values
		/// </summary>
		[Test]
		public void SetAnswerValues()
		{
			// attribute
			m_lang.SetAnswerValue("//neg/@checkedOff", "yes");
			string sResult = m_lang.GetAnswerValue("//neg/@checkedOff");
			Assert.AreEqual("yes", sResult, "set/get //neg/@checkedOff");
			// value
			m_lang.SetAnswerValue("//typology/example", "hi there");
			sResult = m_lang.GetAnswerValue("//typology/example");
			Assert.AreEqual("hi there", sResult, "get //typology/example");
			// attribute that is not there
			m_lang.SetAnswerValue("//neg/@gobbleligook", "yes");
			sResult = m_lang.GetAnswerValue("//neg/@gobbleligook");
			Assert.AreEqual(null, sResult, "set/get //neg/@gobbleligook");
			// value that is not there
			m_lang.SetAnswerValue("//typology/junk", "hi there");
			sResult = m_lang.GetAnswerValue("//typology/junk");
			Assert.AreEqual(null, sResult, "get //typology/junk");
		}
		/// <summary>
		///
		/// </summary>
		[Test]
		public void AnswerFileTransform()
		{
			AnswerFileTransform aft;
			string sAnswerFile = Path.Combine(m_ksTestData, "IsthmusZapotec2.paw");
			string sConfigurationFile = @"..\..\Configurations\PAWS\paws.xml";
			string sConfigurationPath = @"..\..\Configurations\PAWS";
			XmlDocument doc = new XmlDocument();
			doc.Load(sConfigurationFile);
			// Grammar file
			XmlNode node = doc.SelectSingleNode("//answerFileTransformSets/answerFileTransformSet[1]/transform");
			aft = new AnswerFileTransform(sAnswerFile, node, m_ksConfigurationPath);
			Assert.AreEqual(sAnswerFile, aft.AnswerFile, "Answer file");
			Assert.AreEqual(m_ksConfigurationPath + "/Transforms/PAWSSKMasterGrammarMapper.xsl", aft.TransformFile, "Transform file");
			Assert.AreEqual(@"C:\carla\Dev\Cabhab\UserData\IZ2\IsthmusZapotec2.grm", aft.ResultFile, "result file");
			Assert.IsNull(aft.ResultPath, "result path");
			Assert.IsNull(aft.ResultFile1, "result file 1");
			Assert.IsNull(aft.ResultFile2, "result file 2");
			Assert.IsNull(aft.FileExtension, "file extension");
			Assert.IsNull(aft.ReplaceDOCTYPE, "insert DOCTYPE");
			Assert.IsTrue(aft.RemoveBOM, "remove BOM");
			Assert.IsFalse(aft.SaveResult, "save result");
			Assert.IsNull(aft.Parameters, "grammar parameters");
			Assert.IsNull(aft.ParameterSet, "parameter set");
			aft.ApplyTransform(m_ksConfigurationPath);
			string sExpected = ReadFileIntoString(Path.Combine(m_ksTestData, "IsthmusZapotec2.grm"));
			string sActual = ReadFileIntoString(aft.ResultFile);
			Assert.AreEqual(sExpected, sActual, "Grammar result file");

			// Writer first file
			node = doc.SelectSingleNode("//answerFileTransformSets/answerFileTransformSet[2]/transform[1]");
			aft = new AnswerFileTransform(sAnswerFile, node, sConfigurationPath);
			Assert.AreEqual(sAnswerFile, aft.AnswerFile, "writer 1 Answer file");
			Assert.AreEqual(sConfigurationPath + "/Transforms/PAWSSKMasterWriterMapperUse.xsl", aft.TransformFile, "writer 1 Transform file");
			Assert.AreEqual(@"C:\carla\Dev\Cabhab\UserData\IZ2\IsthmusZapotec2.xml", aft.ResultFile, "writer 1 result file");
			Assert.IsNull(aft.ResultPath, "writer 1 result path");
			Assert.IsNull(aft.ResultFile1, "writer 1 result file 1");
			Assert.IsNull(aft.ResultFile2, "writer 1 result file 2");
			Assert.AreEqual("xml", aft.FileExtension, "writer 1 file extension");
			Assert.AreEqual("<!DOCTYPE lingPaper PUBLIC \"-//XMLmind//DTD XLingPap//EN\"\r\n\"file://%SystemDrive%/Documents and Settings/%USERNAME%/Application Data/XMLmind/XMLEditor/addon/XLingPap/XLingPap.dtd\">", aft.ReplaceDOCTYPE, "writer 1 replace DOCTYPE");
			Assert.IsFalse(aft.RemoveBOM, "writer 1 remove BOM");
			Assert.IsTrue(aft.SaveResult, "writer 1 save result");
			Assert.IsNotNull(aft.Parameters, "writer 1 parameters not null");
			Assert.AreEqual(1, aft.Parameters.Length, "writer 1 parameters count");
			CheckParameterNameValue((XMLUtilities.XSLParameter) aft.Parameters.GetValue(0), "prmSDateTime", "fake", "writer 1 first parameter");
			Assert.IsNull(aft.ParameterSet, "writer 1 parameter set");
			aft.ApplyTransform(m_ksConfigurationPath);
			sExpected = ReadFileIntoString(Path.Combine(m_ksTestData, "IsthmusZapotec2.xml"));
			sActual = ReadFileIntoString(aft.ResultFile);
			int iExpectedDateStart = sExpected.IndexOf("<date>");
			int iExpectedDateEnd = sExpected.IndexOf("</date>");
			int iActualDateStart = sActual.IndexOf("<date>");
			int iActualDateEnd = sActual.IndexOf("</date>");
			Assert.AreEqual(sExpected.Substring(0, iExpectedDateStart) + sExpected.Substring(iExpectedDateEnd),
							sActual.Substring(0, iActualDateStart) + sActual.Substring(iActualDateEnd),
							"writer 1 result file");

			// Writer second file
			string sPass1ResultFile = aft.ResultFile;
			node = doc.SelectSingleNode("//answerFileTransformSets/answerFileTransformSet[2]/transform[2]");
			aft = new AnswerFileTransform(sAnswerFile, node, m_ksConfigurationPath);
			Assert.AreEqual(sAnswerFile, aft.AnswerFile, "writer 2 Answer file");
			Assert.AreEqual(m_ksConfigurationPath + "/Transforms/XLingPap1.xsl", aft.TransformFile, "writer 2 Transform file");
			Assert.AreEqual(@"C:\carla\Dev\Cabhab\UserData\IZ2\IsthmusZapotec2.htm", aft.ResultFile, "writer 2 result file");
			Assert.IsNull(aft.ResultPath, "writer 2 result path");
			Assert.IsNull(aft.ResultFile1, "writer 2 result file 1");
			Assert.IsNull(aft.ResultFile2, "writer 2 result file 2");
			Assert.AreEqual("htm", aft.FileExtension, "writer 2 file extension");
			Assert.IsNull(aft.ReplaceDOCTYPE, "writer 2 insert DOCTYPE");
			Assert.IsFalse(aft.RemoveBOM, "writer 2 remove BOM");
			Assert.IsFalse(aft.SaveResult, "writer 2 save result");
			Assert.IsNull(aft.Parameters, "writer 2 parameters are null");
			Assert.IsNull(aft.ParameterSet, "writer 2 parameter set");
			aft.ApplyTransform(m_ksConfigurationPath, sPass1ResultFile);
			sExpected = ReadFileIntoString(Path.Combine(m_ksTestData, "IsthmusZapotec2.htm"));
			sActual = ReadFileIntoString(aft.ResultFile);
			iExpectedDateStart = sExpected.IndexOf("<center><small>");
			iExpectedDateEnd = sExpected.IndexOf("</small></center>");
			iActualDateStart = sActual.IndexOf("<center><small>");
			iActualDateEnd = sActual.IndexOf("</small></center>");
			Assert.AreEqual(sExpected.Substring(0, iExpectedDateStart) + sExpected.Substring(iExpectedDateEnd),
							sActual.Substring(0, iActualDateStart) + sActual.Substring(iActualDateEnd),
							"writer 2 result file");

			// Example files
			node = doc.SelectSingleNode("//answerFileTransformSets/answerFileTransformSet[3]/transform");
			aft = new AnswerFileTransform(sAnswerFile, node, m_ksConfigurationPath);
			Assert.AreEqual(sAnswerFile, aft.AnswerFile, "Answer file");
			Assert.AreEqual(m_ksConfigurationPath + "/Transforms/PAWSSKParameterizedExample.xsl", aft.TransformFile, "Transform file");
			Assert.IsNull(aft.ResultFile, "result file is null");
			Assert.AreEqual(@"C:\carla\Dev\Cabhab\UserData\IZ2", aft.ResultPath, "result path");
			Assert.AreEqual("prmIdTitle", aft.ResultFile1, "result file 1");
			Assert.AreEqual("Test", aft.ResultFile2, "result file 2");
			Assert.AreEqual("txt", aft.FileExtension, "file extension");
			Assert.IsNull(aft.ReplaceDOCTYPE, "insert DOCTYPE");
			Assert.IsTrue(aft.RemoveBOM, "remove BOM");
			Assert.IsFalse(aft.SaveResult, "save result");
			Assert.IsNull(aft.Parameters, "example parameters are null");
			Assert.IsNotNull(aft.ParameterSet, "example parameter set not null");
			Assert.AreEqual(16, aft.ParameterSet.Count, "parameter set count");
			CheckParameterNameValue(aft.ParameterSet[0][0], "prmIdTitle", "QP", "example first set, first parameter");
			CheckParameterNameValue(aft.ParameterSet[0][1], "prmTextSFM", "\\t", "example first set, second parameter");
			aft.ApplyTransform(m_ksConfigurationPath);
			sExpected = ReadFileIntoString(Path.Combine(m_ksTestData, "IZ2QPTest.txt"));
			sActual = ReadFileIntoString(Path.Combine(aft.ResultPath, "IZ2QPTest.txt"));
			Assert.AreEqual(sExpected, sActual, "IZ2QPTest result file");
			sExpected = ReadFileIntoString(Path.Combine(m_ksTestData, "IZ2ExclTest.txt"));
			sActual = ReadFileIntoString(Path.Combine(aft.ResultPath, "IZ2ExclTest.txt"));
			Assert.AreEqual(sExpected, sActual, "IZ2ExclTest result file");
		}

		private static void CheckParameterNameValue(XMLUtilities.XSLParameter parameter, string sExpectedName, string sExpectedValue, string sMessage)
		{
			string sName = parameter.Name;
			Assert.AreEqual(sExpectedName, sName, sMessage + " name");
			string sValue = parameter.Value;
			Assert.AreEqual(sExpectedValue, sValue, sMessage + " value");
		}
		private string ReadFileIntoString(string sFile)
		{
			StreamReader sr = new StreamReader(sFile);
			string sResult = sr.ReadToEnd();
			sr.Close();
			return sResult;
		}

#if no
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
#endif
	}
}
