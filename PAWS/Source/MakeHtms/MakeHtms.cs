using System;
using System.IO;
using System.Xml.Xsl;

namespace MakeHtms
{
	/// <summary>
	/// Summary description for MakeHtms.
	/// </summary>
	class MakeHtms
	{
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main(string[] args)
		{
					XslTransform xslt = new XslTransform();
					xslt.Load(@"..\Transforms\PAWSSKHtmlMapper.xsl");
			string[] astrFiles;
			astrFiles = Directory.GetFiles(".", "*.xml");
			if (astrFiles.Length > 0)
			{
				foreach (string strFile in astrFiles)
				{
					try
					{
						string strDestFile = Path.Combine(@"..\HTMs",
					 Path.GetFileNameWithoutExtension(strFile));
			strDestFile += ".htm";
						Console.WriteLine("Making {0} from {1}", strDestFile, strFile);
						xslt.Transform(strFile, strDestFile);
					}
					catch (Exception exc)
					{
						Console.WriteLine("Error: " + exc);
						return;
					}
				}
			}
		}
	}
}
