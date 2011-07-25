// --------------------------------------------------------------------------------------------
#region // Copyright (c) 2007, SIL International. All Rights Reserved.
// <copyright from='2003' to='2007' company='SIL International'>
//		Copyright (c) 2007, SIL International. All Rights Reserved.
//
//		Distributable under the terms of either the Common Public License or the
//		GNU Lesser General Public License, as specified in the LICENSING.txt file.
// </copyright>
#endregion
//
// File: AnswerFileTransform.cs
// Responsibility:
// Last reviewed:
//
// <remarks>
// This class is for a transform that can be applied to an answer file.
// </remarks>
// --------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using SIL.Utils;

namespace SIL.Cabhab
{
	public class AnswerFileTransform
	{
		string m_sTransformFile;
		private Transform m_transform;
		string m_sAnswerFile;
		XmlDocument m_xdAnswers = new XmlDocument();
		string m_sResultFileAnswerFileXPath;
		string m_sResultPathAnswerFileXPath;
		string m_sFileExtension;
		string m_sResultFile1;
		string m_sResultFile2;
		string m_sReplaceDOCTYPE;
		string m_sVersionNumber;
		bool m_fRemoveBOM;
		bool m_fSaveResult;
		bool m_fInsertConfigPathInTransformDOCTYPE;
		string m_sApplyTransformWhenXPath;
		XMLUtilities.XSLParameter[] m_parameters;
		List<XMLUtilities.XSLParameter[]> m_parameterSet;
		#region Construction and initialization
		public AnswerFileTransform()
		{
		}
		public AnswerFileTransform(string sAnswerFile, XmlNode transformConfigurationNode, string sConfigurationPath, string sVersionNumber)
		{
			AnswerFile = sAnswerFile;
			m_sVersionNumber = sVersionNumber;
			m_sTransformFile = XmlUtils.GetManditoryAttributeValue(transformConfigurationNode, "file");
			m_sTransformFile = sConfigurationPath + "/" + m_sTransformFile;
			m_sResultFileAnswerFileXPath = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "resultFileFromAnswerFile");
			m_sResultPathAnswerFileXPath = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "resultPathFromAnswerFile");
			m_sFileExtension = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "ext", null);
			m_sResultFile1 = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "resultFile1", null);
			m_sResultFile2 = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "resultFile2", null);
			m_sReplaceDOCTYPE = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "replaceDOCTYPE", null);
			m_fRemoveBOM = XmlUtils.GetBooleanAttributeValue(transformConfigurationNode, "removeBOM");
			m_fSaveResult = XmlUtils.GetBooleanAttributeValue(transformConfigurationNode, "saveResult");
			m_sApplyTransformWhenXPath = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "applyTransformWhenXPath", null);
			m_fInsertConfigPathInTransformDOCTYPE = XmlUtils.GetBooleanAttributeValue(transformConfigurationNode, "insertConfigPathInTransformDOCTYPE");
			if (m_fInsertConfigPathInTransformDOCTYPE)
			{
				AdjustDoctypePath(sConfigurationPath);
			}
			SetUpXSLTParameters(transformConfigurationNode);
			string sLanguageCode = XmlUtils.GetOptionalAttributeValue(transformConfigurationNode, "lang", "en");
#if UsingDotNetTransforms
			m_transform = new DotNetCompiledTransform(m_sTransformFile, sLanguageCode);
#endif
#if UsingSaxonDotNetTransforms
			m_transform = new SaxonDotNetTransform(m_sTransformFile, sLanguageCode);
#endif
#if UsingMSXML2Transforms
			m_transform = new MSXML2Transform(m_sTransformFile, sLanguageCode);
#endif

		}

		private void SetUpXSLTParameters(XmlNode transformConfigurationNode)
		{
			XmlNode xsltParametersNode;
			XmlNode parameterSets = XmlUtils.FindNode(transformConfigurationNode, "xsltParameterSets");
			if (parameterSets != null)
			{
				XmlNodeList list = parameterSets.SelectNodes("xsltParameterSet");
				m_parameterSet = new List<XMLUtilities.XSLParameter[]>();
				foreach (XmlNode node in list)
				{
					xsltParametersNode = node.SelectSingleNode("xsltParameters");
					XMLUtilities.XSLParameter[] parameters = CreateParametersFromXsltParametersNode(xsltParametersNode);
					m_parameterSet.Add(parameters);
				}
			}
			else
			{
				xsltParametersNode = XmlUtils.FindNode(transformConfigurationNode, "xsltParameters");
				m_parameters = CreateParametersFromXsltParametersNode(xsltParametersNode);
			}
		}

		private void AdjustDoctypePath(string sConfigurationPath)
		{
			StreamReader sr = new StreamReader(m_sTransformFile);
			string sTransformContents = sr.ReadToEnd();
			sr.Close();
			int iStart = sTransformContents.IndexOf("doctype-system=\"") + 16;
			if (iStart > 15)
			{
				StringBuilder sb = new StringBuilder();
				sb.Append(sTransformContents.Substring(0, iStart));
				sb.Append(sConfigurationPath);
				sb.Append(sTransformContents.Substring(iStart));
				int iExtension = m_sTransformFile.LastIndexOf('.');
				string sTemp = m_sTransformFile.Substring(0, iExtension) + "Use" + m_sTransformFile.Substring(iExtension);
				StreamWriter sw = new StreamWriter(sTemp);
				sw.Write(sb.ToString());
				sw.Close();
				m_sTransformFile = sTemp;
			}
		}

		private XMLUtilities.XSLParameter[] CreateParametersFromXsltParametersNode(XmlNode node)
		{
			if (node == null)
			{
				return null;
			}
			int iParameterCount = node.SelectNodes("param").Count;
			XMLUtilities.XSLParameter[] parameters = new XMLUtilities.XSLParameter[iParameterCount];
			for (int i = 0; i < iParameterCount; i++)
			{
				XmlNode paramNode = node.SelectSingleNode("param[" + (i+1).ToString() + "]");
				string sName = XmlUtils.GetManditoryAttributeValue(paramNode, "name");
				string sValue = XmlUtils.GetOptionalAttributeValue(paramNode, "value");
				string sValueFromAnswerFile = GetResultFromAnswerFile(paramNode, "valueFromAnswerFile");
				if (sValueFromAnswerFile != null)
					sValue = sValueFromAnswerFile;
				parameters[i] = new XMLUtilities.XSLParameter(sName, sValue);
			}
			return parameters;
		}
		/// <summary>
		/// Get a string from the answer file
		/// </summary>
		/// <param name="sXPath">XPath of what to get</param>
		/// <returns></returns>
		private string GetResultFromAnswerFile(string sXPath)
		{
			if (sXPath == null || sXPath == "")
				return null;
			XmlNode node = m_xdAnswers.SelectSingleNode(sXPath);
			if (node != null)
			{
				return node.InnerText;
			}
			return null;
		}
		/// <summary>
		/// Get a string from the answer file, based on an xpath string contained in a configuration node
		/// </summary>
		/// <param name="configurationNode">the configuration node to use</param>
		/// <param name="sXPath">the xpath of where to look in the answer file</param>
		/// <returns></returns>
		private string GetResultFromAnswerFile(XmlNode configurationNode, string sXPath)
		{
			string sResult = XmlUtils.GetOptionalAttributeValue(configurationNode, sXPath);
			if (sResult == null)
				return null;
			XmlNode node = m_xdAnswers.SelectSingleNode(sResult);
			if (node != null)
			{
				return node.InnerText;
			}
			return null;
		}
		#endregion
		public bool ApplyTransform(string sConfigurationPath)
		{
			return ApplyTransform(sConfigurationPath, AnswerFile);
		}
		public bool ApplyTransform(string sConfigurationPath, string sSourceFile)
		{
			if (!String.IsNullOrEmpty(ApplyTransformWhenXPath))
			{
				if (null == GetResultFromAnswerFile(ApplyTransformWhenXPath))
				return false;
			}
			string sResultFile = ResultFile;
			if (sResultFile != null)
			{
				XMLUtilities.XSLParameter[] parameterList = Parameters;
				if (parameterList != null)
				{
					foreach (XMLUtilities.XSLParameter parameter in parameterList)
					{
						if (parameter.Name == "prmSVersionNumber")
						{
							parameter.Value = m_sVersionNumber;
						}
					}
				}
				m_transform.TransformFileToFile(parameterList, sSourceFile, sResultFile);
				DoAnyCleanup(sResultFile);
			}
			else
			{
				try
				{
					XmlNode node = m_xdAnswers.SelectSingleNode("//langAbbr");
					string sLanguageAbbreviation = node.InnerText;
					foreach (XMLUtilities.XSLParameter[] parameters in ParameterSet)
					{
						sResultFile = BuildResultFileName(sLanguageAbbreviation, parameters);
						m_transform.TransformFileToFile(parameters, sSourceFile, sResultFile);
						DoAnyCleanup(sResultFile);
					}
				}
				catch (Exception exc)
				{
					throw new Exception("When using 'resultPathFromAnswerFile', the resultFile1 and resultFile2 attributes must be specified and, also, one must use <xsltParameterSets>",
						exc.InnerException);
				}
			}
			return true;
		}

		private string BuildResultFileName(string sLanguageAbbreviation, XMLUtilities.XSLParameter[] parameters)
		{
			StringBuilder sb = new StringBuilder();
			sb.Append(Path.Combine(ResultPath, sLanguageAbbreviation));
			sb.Append(DetermineResultFile1(parameters));
			sb.Append(ResultFile2);
			string sResultFile = sb.ToString();
			if (FileExtension != null && sResultFile != null)
			{
				int iExtensionStart = sResultFile.LastIndexOf(".") + 1;
				if ((iExtensionStart > 0) &&
					(FileExtension != sResultFile.Substring(iExtensionStart)))
				{
					sResultFile = sResultFile.Substring(0, iExtensionStart) + FileExtension;
				}
				else if (iExtensionStart == 0)
				{
					sResultFile = sResultFile + "." + FileExtension;
				}
			}
			return sResultFile;
		}

		private string DetermineResultFile1(XMLUtilities.XSLParameter[] parameters)
		{
			string sResult = ResultFile1;
			for (int i = 0; i < parameters.Length; i++)
			{
				if (parameters[i].Name == sResult)
				{
					sResult = parameters[i].Value;
					break;
				}
			}
			return sResult;
		}

		private void DoAnyCleanup(string sResultFile)
		{
			StreamReader sr = new StreamReader(sResultFile);
			string sResult = sr.ReadToEnd();
			sr.Close();
			UTF8Encoding utf8NoBOM = new UTF8Encoding(true);
			if (RemoveBOM)
			{
				utf8NoBOM = new UTF8Encoding(false);
			}
			// following is only because one version of the XSLT transform engine fails to output the encoding.
			if (sResult.StartsWith("<?xml version=\"1.0\"?>"))
				sResult = sResult.Replace("<?xml version=\"1.0\"?>", "<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			// write it out without the BOM
			StreamWriter sw = new StreamWriter(sResultFile, false, utf8NoBOM);
			sw.Write(sResult);
			sw.Close();
		}
		public void ApplyReplaceDOCTYPE()
		{
			if (ReplaceDOCTYPE != null)
			{
				StreamReader sr = new StreamReader(ResultFile);
				string sResult = sr.ReadToEnd();
				sr.Close();
				int iStart = sResult.IndexOf("<!DOCTYPE ");
				int iEnd = (sResult.Substring(iStart)).IndexOf(">") + iStart + 1; //skip the closing wedge
				StringBuilder sb = new StringBuilder();
				sb.Append(sResult.Substring(0, iStart));
				sb.Append(ReplaceDOCTYPE);
				sb.Append(sResult.Substring(iEnd));
				sResult = sb.ToString();
				StreamWriter sw = new StreamWriter(ResultFile);
				sw.Write(sResult);
				sw.Close();
			}
		}

		#region Properties
		public string AnswerFile
		{
			get
			{
				m_xdAnswers.Load(m_sAnswerFile); // make sure we have a current copy of the answers
				return m_sAnswerFile;
			}
			set
			{
				m_sAnswerFile = value;
				m_xdAnswers.Load(m_sAnswerFile);
			}
		}
		public string ApplyTransformWhenXPath
		{
			get { return m_sApplyTransformWhenXPath; }
		}
		public string FileExtension
		{
			get { return m_sFileExtension; }
		}
		public XMLUtilities.XSLParameter[] Parameters
		{
			get { return m_parameters; }
		}
		public List<XMLUtilities.XSLParameter[]> ParameterSet
		{
			get { return m_parameterSet; }
		}
		public bool RemoveBOM
		{
			get { return m_fRemoveBOM; }
		}
		public string ReplaceDOCTYPE
		{
			get { return m_sReplaceDOCTYPE; }
		}
		public string ResultFile
		{
			get
			{
				string sResultFile = GetResultFromAnswerFile(m_sResultFileAnswerFileXPath);
				if (FileExtension != null && sResultFile != null)
				{
					int iExtensionStart = sResultFile.LastIndexOf(".") + 1;
					if ((iExtensionStart > 0) &&
						(FileExtension != sResultFile.Substring(iExtensionStart)))
					{
						sResultFile = sResultFile.Substring(0, iExtensionStart) + FileExtension;
					}
				}

				return sResultFile;
			}
		}
		public string ResultFile1
		{
			get { return m_sResultFile1; }
		}
		public string ResultFile2
		{
			get { return m_sResultFile2; }
		}
		public string ResultPath
		{
			get { return GetResultFromAnswerFile(m_sResultPathAnswerFileXPath); }
		}
		public bool SaveResult
		{
			get { return m_fSaveResult; }
		}
		public string TransformFile
		{
			get	{return m_sTransformFile;}
		}
		#endregion

	}
	public class AnswerFileTransformSet
	{
		List<AnswerFileTransform> m_transforms = new List<AnswerFileTransform>();
		public AnswerFileTransformSet()
		{
		}
		public void Add(AnswerFileTransform aft)
		{
			m_transforms.Add(aft);
		}
		public AnswerFileTransform GetTransform(int index)
		{
			return m_transforms[index];
		}
		public int Count
		{
			get
			{
				return m_transforms.Count;
			}
		}

	}
}
