using System;
using System.IO;
using System.Xml;

namespace SIL.PcPatrBrowser
{
	/// <summary>
	/// Summary description for PcPatrDocument.
	/// </summary>
	public class PcPatrDocument
	{
		protected Array m_aSentences;
		protected string m_sAnaFile;
		protected string m_sGrammarFile;
		protected int m_iCurrentSentence;
		public PcPatrDocument()
		{
		}
		/// <summary>
		/// constructor
		/// </summary>
		/// <param name="sAnaFile">AMPLE 'ana' file</param>
		public PcPatrDocument(string sAnaFile, out string sGrammarFile)
		{
			m_sAnaFile = sAnaFile;
			string sText = ReadFileIntoString(sAnaFile);

			sGrammarFile = m_sGrammarFile = GetGrammarFile(sText);

			int iCount = CountSentences(sText);
			m_aSentences = Array.CreateInstance(typeof(PcPatrSentence), iCount);

			ParseTextIntoSentences(sText);
			m_iCurrentSentence = 0;
		}

		private string GetGrammarFile(string sText)
		{
			const string ksGrammarFileTemplate = @" Grammar file used: ";
			int iTemplateLen = ksGrammarFileTemplate.Length;
			int i = sText.IndexOf(ksGrammarFileTemplate);
			if (i < 0)
				return null;
			int j = sText.Substring(i + iTemplateLen).IndexOf("\r\n");
			string sFileName = sText.Substring(i + iTemplateLen, j).ToLower();;
			if (!File.Exists(sFileName))
				return null;
			return sFileName;
		}

		private void ParseTextIntoSentences(string sText)
		{
			int iIndex = 0;
			int iBegin = 0;
			while (iBegin >= 0)
			{
				XmlNode sentenceNode = GetNextSentence(sText, ref iBegin);
				if (sentenceNode != null)
				{
					PcPatrSentence sentence = new PcPatrSentence(sentenceNode);
					m_aSentences.SetValue(sentence, iIndex++);
				}
			}
		}

		private int CountSentences(string sText)
		{
			int iCount = 0;
			int iOffset = sText.IndexOf("<Analysis");
			while (iOffset > 0)
			{
				iCount++;
				iOffset = sText.IndexOf("<Analysis", iOffset + 9);
			}
			return iCount;
		}
		/// <summary>
		/// Get currently selected sentence in the document
		/// </summary>
		public PcPatrSentence CurrentSentence
		{
			get
			{
				if (m_aSentences.Length > 0)
					return (PcPatrSentence)m_aSentences.GetValue(m_iCurrentSentence);
				else
					return null;
			}
		}
		/// <summary>
		/// Get the number of the currently selected sentence in the document
		/// </summary>
		public int CurrentSentenceNumber
		{
			get
			{
				return m_iCurrentSentence+1;
			}
		}
		/// <summary>
		/// Get number of sentences in the document
		/// </summary>
		public int NumberOfSentences
		{
			get
			{
				if (m_aSentences != null)
					return m_aSentences.Length;
				else
					return 0;
			}
		}
		/// <summary>
		/// Get the first sentence in the document
		/// </summary>
		public PcPatrSentence FirstSentence
		{
			get
			{
				m_iCurrentSentence = 0;
				return CurrentSentence;
			}
		}
		/// <summary>
		/// Get the last sentence in the document
		/// </summary>
		public PcPatrSentence LastSentence
		{
			get
			{
				m_iCurrentSentence = m_aSentences.Length - 1;
				return CurrentSentence;
			}
		}
		/// <summary>
		/// Get the next sentence in the document
		/// </summary>
		public PcPatrSentence NextSentence
		{
			get
			{
				m_iCurrentSentence = Math.Min(m_iCurrentSentence + 1, m_aSentences.Length - 1);
				return CurrentSentence;
			}
		}
		/// <summary>
		/// Get the next sentence in the document
		/// </summary>
		public PcPatrSentence PreviousSentence
		{
			get
			{
				m_iCurrentSentence = Math.Max(m_iCurrentSentence - 1, 0);
				return CurrentSentence;
			}
		}
		/// <summary>
		/// Get Sentences
		/// </summary>
		public Array Sentences
		{
			get
			{
				return m_aSentences;
			}
		}
		/// <summary>
		/// Get sentence based on its number
		/// </summary>
		/// <param name="iSentenceNumber">sentence number to get</param>
		/// <returns></returns>
		public PcPatrSentence GoToSentence(int iSentenceNumber)
		{
			if (iSentenceNumber <= 0)
				return FirstSentence;
			if (iSentenceNumber >= NumberOfSentences)
				return LastSentence;
			m_iCurrentSentence = iSentenceNumber - 1;
			return CurrentSentence;
		}
		protected string ReadFileIntoString(string sFileName)
		{
			StreamReader sr = new StreamReader(sFileName);
			string sResult = sr.ReadToEnd();
			sr.Close();
			return sResult;
		}
		/// <summary>
		/// Get XML of next analysis element in document
		/// </summary>
		/// <param name="sDoc">Document text file</param>
		/// <param name="iBegin">index of where to begin looking;  is set at end of the next analysis; if negative, it indicates nothing was found</param>
		/// <returns>xml node containing the analysis element</returns>
		protected XmlNode GetNextSentence(string sDoc, ref int iBegin)
		{
			if (iBegin >= 0)
			{
				string sText = sDoc.Substring(iBegin);
				int iBeg = sText.IndexOf("<Analysis");
				int iEnd = sText.IndexOf("</Analysis>") + 13;  // 13 is for skipping past the </Analysis> + nl
				if (iBeg > 0)
				{
					iBegin += iEnd;
					string sXml = sText.Substring(iBeg, iEnd - iBeg);
					XmlDocument doc = new XmlDocument();
					doc.LoadXml(sXml);
					return doc.SelectSingleNode("/");
				}
				else
				{
					iBegin = -1; // nothing to find; make sure index is negative
				}
			}
			return null;
		}
	}
}
