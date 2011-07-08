using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Xsl;

namespace SIL.Cabhab
{
	internal class DotNetCompiledTransform: Transform
	{
		XslCompiledTransform m_transformer = new XslCompiledTransform();

		public DotNetCompiledTransform(string sTransformName)
		{
			var resolver = new XmlUrlResolver();
			resolver.Credentials = System.Net.CredentialCache.DefaultCredentials;
			m_transformer.Load(sTransformName, XsltSettings.TrustedXslt, resolver);

		}

		public override void TransformFileToFile(string sInputPath, string sOutputName)
		{
			TransformFileToFile(null, sInputPath, sOutputName);
		}

		public override void TransformFileToFile(XMLUtilities.XSLParameter[] parameterList, string sInputPath, string sOutputName)
		{
#if DEBUG
			DateTime start = DateTime.Now;
			Debug.WriteLine("\tStarting at: " + start.TimeOfDay.ToString());
#endif
			TextWriter writer = null;
			XmlTextReader reader = null;
			try
			{
				// add any parameters
				XsltArgumentList args;
				AddParameters(out args, parameterList);

				// setup output file
				writer = File.CreateText(sOutputName);

				// load input file
				reader = new XmlTextReader(sInputPath) { ProhibitDtd = false, EntityHandling = EntityHandling.ExpandEntities };

				// Apply transform
				m_transformer.Transform(reader, args, writer);
			}
			finally
			{
				if (writer != null)
					writer.Close();
				if (reader != null)
					reader.Close();
			}
#if DEBUG
			DateTime end = DateTime.Now;
			Debug.WriteLine("\tEnding at: " + end.TimeOfDay.ToString());
			System.TimeSpan diff = end.Subtract(start);
			Debug.WriteLine("\tProcess took: " + diff.ToString() + " " + sOutputName);
#endif

		}
		private void AddParameters(out XsltArgumentList args, XMLUtilities.XSLParameter[] parameterList)
		{
			args = new XsltArgumentList();
			if (parameterList != null)
			{
				foreach (XMLUtilities.XSLParameter rParam in parameterList)
				{
					// Following is a specially recognized parameter name
					if (rParam.Name == "prmSDateTime")
					{
						args.AddParam(rParam.Name, "", XMLUtilities.GetCurrentDateTime());
					}
					else
						args.AddParam(rParam.Name, "", rParam.Value);
				}
			}
		}
	}
}
