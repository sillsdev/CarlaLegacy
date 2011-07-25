using System;
using System.IO;

namespace SIL.Cabhab
{
	internal class MSXML2Transform : Transform
	{
		private MSXML2.XSLTemplate60Class m_xslt;
		private MSXML2.FreeThreadedDOMDocument60Class m_xslDoc;
		private MSXML2.DOMDocument60Class m_xmlDoc;
		MSXML2.IXSLProcessor m_xslProc;

		public MSXML2Transform(string sTransformName, string sTargetLanguageCode)
			: base(sTargetLanguageCode)
		{
			m_xslt = new MSXML2.XSLTemplate60Class();
			m_xslDoc = new MSXML2.FreeThreadedDOMDocument60Class();
			m_xmlDoc = new MSXML2.DOMDocument60Class();

			m_xslDoc.async = false;
			m_xslDoc.setProperty("ResolveExternals", true);
			m_xslDoc.setProperty("ProhibitDTD", false);
			m_xslDoc.setProperty("AllowDocumentFunction", true);
			m_xslDoc.load(sTransformName);
			m_xslt.stylesheet = m_xslDoc;
			m_xmlDoc.setProperty("ResolveExternals", true);
			m_xmlDoc.setProperty("ProhibitDTD", false);
			m_xmlDoc.async = false;

		}
		public override void TransformFileToFile(string sInputPath, string sOutputName)
		{
			TransformFileToFile(null, sInputPath, sOutputName);
		}

		public override void TransformFileToFile(XMLUtilities.XSLParameter[] parameterList, string sInputPath, string sOutputName)
		{
			m_xmlDoc.load(sInputPath);
			m_xslProc = m_xslt.createProcessor();
			m_xslProc.input = m_xmlDoc;
			AddParameters(parameterList);
			m_xslProc.transform();
			StreamWriter sr = File.CreateText(sOutputName);
			sr.Write(m_xslProc.output);
			sr.Close();

		}
		/// <summary>
		/// Add parameters to a transform
		/// </summary>
		/// <param name="parameterList"></param>
		/// <param name="xslProc"></param>
		private void AddParameters(XMLUtilities.XSLParameter[] parameterList)
		{
			if (parameterList != null)
			{
				foreach (XMLUtilities.XSLParameter rParam in parameterList)
				{
					// Following is a specially recognized parameter name
					if (rParam.Name == "prmSDateTime")
					{
						m_xslProc.addParameter(rParam.Name, XMLUtilities.GetCurrentDateTime(CultureToUse), "");
					}
					else
						m_xslProc.addParameter(rParam.Name, rParam.Value, "");
				}
			}
		}

	}
}