using System;
using System.Collections.Generic;
using System.Text;

namespace ExamplesFromANA
{
	public class TextExample : List<WordExample>
	{
		public string Text = null;
		public string InnerXml = null;

		public TextExample(string strText, string strInnerXml)
		{
			Text = strText;
			InnerXml = strInnerXml;
		}
	}
}
