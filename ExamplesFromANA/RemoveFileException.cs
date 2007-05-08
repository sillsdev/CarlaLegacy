using System;
using System.Collections.Generic;
using System.Text;

namespace ExamplesFromANA
{
	public class RemoveFileException : ApplicationException
	{
		public string Filename = null;

		public RemoveFileException(string strFilename)
			: base(String.Format("File '{0}' doesn't exist", strFilename))
		{
			Filename = strFilename;
		}
	}
}
