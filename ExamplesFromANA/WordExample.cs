using System;
using System.Collections.Generic;
using System.Text;

namespace ExamplesFromANA
{
	public class WordExample
	{
		public string Word = null;
		public string Analysis = null;
		public string Category = null;
		public string InnerXml = null;

		public WordExample(string strWord, string strAnalysis, string strCategory, string strInnerXml)
		{
			Word = strWord;
			Analysis = strAnalysis;
			Category = strCategory;
			InnerXml = strInnerXml;
		}
	}
}
