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
// File: Language.cs
// Responsibility:
// Last reviewed:
//
// <remarks>
// This class is for all language data and methods
// </remarks>
// --------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using SIL.Utils;
using XCore;
namespace SIL.Cabhab
{
	public class Language
	{
		protected XmlDocument m_xdAnswers = new XmlDocument();
		protected string m_sUserAnswerFile;
		Mediator m_mediator;
		XmlNode m_configurationParameters;
		const string m_ksAnswerFileKey = "AnswerFile";
		const string m_ksStringTablePath = "/group[@id='DialogStrings']/";
		List<AnswerFileTransformSet> m_answerFileTransformSets = new List<AnswerFileTransformSet>();
		List<DataMigrationTransform> m_dataMigrationTransforms = new List<DataMigrationTransform>();

		string m_sLanguageName;
		string m_sLanguageAbbreviation;
		bool m_fRightToLeftScript;

		string m_sConfigurationPath;
		string m_sHtmsPath;

		private string m_sStylesheet;
		private string m_sAnswerFileFilter;
		private string m_sWebPageMapper;
		private Transform m_transform;
		private string m_sMasterAnswerFile;

		public event EventHandler ChangeLanguageName;
		protected virtual void OnChangeLanguageName(EventArgs e)
		{
			if (ChangeLanguageName != null)
				ChangeLanguageName(this, e);
		}

		public Language()
		{
		}
		#region Properties
		public string AnswerFile
		{
			get
			{
				return m_sUserAnswerFile;
			}
			set
			{
				m_sUserAnswerFile = value;
			}
		}

		public string ConfigurationPath
		{
			get
			{
				return m_sConfigurationPath;
			}
			set
			{
				m_sConfigurationPath = value;
			}
		}
		public string Name
		{
			get
			{
				XmlNode node = m_xdAnswers.SelectSingleNode("//langName");
				if (node == null)
					return "";
				else
					return node.InnerText;
			}
		}
		public bool LanguageDataChanged
		{
			get
			{
				return m_mediator.PropertyTable.GetBoolProperty("LanguageDataChanged", false);
			}
			set
			{
				m_mediator.PropertyTable.SetProperty("LanguageDataChanged", value);
			}
		}
		#endregion
		public void Init(Mediator mediator, XmlNode configurationParameters)
		{
			m_mediator = mediator;
			m_configurationParameters = configurationParameters;
			ConfigurationPath = GetConfigurationPath(configurationParameters.BaseURI);
			m_sUserAnswerFile = mediator.PropertyTable.GetStringProperty(m_ksAnswerFileKey, null);
			m_sMasterAnswerFile = GetPropertyValueAsPath("MasterAnswerFileLocation");
			m_sStylesheet = GetPropertyValueAsPath("MasterCSSLocation");
			m_sWebPageMapper = GetPropertyValueAsPath("WebPageMapperLocation");
			string sLanguageCode = XmlUtils.GetOptionalAttributeValue(configurationParameters, "lang", "en");
#if UsingDotNetTransforms
			m_transform = new DotNetCompiledTransform(m_sWebPageMapper, sLanguageCode);
#endif
#if UsingSaxonDotNetTransforms
			m_transform = new SaxonDotNetTransform(m_sWebPageMapper, sLanguageCode);
#endif
#if UsingMSXML2Transforms
			m_transform = new MSXML2Transform(m_sWebPageMapper, sLanguageCode);
#endif

			m_sAnswerFileFilter = mediator.PropertyTable.GetStringProperty("AnswerFileFilter", null);
		}

		public void InitAnswerTransforms()
		{
			Cursor current = Cursor.Current;
			Cursor.Current = Cursors.WaitCursor;
			InitAnswerTransforms(m_configurationParameters);
			Cursor.Current = current;
		}
		// get all transforms and init them
		public void InitAnswerTransforms(XmlNode configurationParameters)
		{
			XmlNode versionNode = configurationParameters.SelectSingleNode("//version");
			string sVersionNumber = versionNode.InnerText;
			m_answerFileTransformSets.Clear();
			XmlNodeList nodeList = configurationParameters.SelectNodes("//answerFileTransformSets/answerFileTransformSet");
			foreach (XmlNode setNode in nodeList)
			{
				AnswerFileTransformSet answerFileTransforms = new AnswerFileTransformSet();
				XmlNodeList transformNodes = setNode.SelectNodes("transform");
				foreach (XmlNode transformNode in transformNodes)
				{
					AnswerFileTransform aft = new AnswerFileTransform(AnswerFile, transformNode, ConfigurationPath, sVersionNumber);
					answerFileTransforms.Add(aft);
				}
				m_answerFileTransformSets.Add(answerFileTransforms);
			}
		}
		// get all data migrations and init them
		public void InitDataMigrationTransforms(XmlNode configurationParameters)
		{
			m_dataMigrationTransforms.Clear();
			XmlNodeList nodeList = configurationParameters.SelectNodes("//dataMigrations/dataMigration");
			foreach (XmlNode dataMigration in nodeList)
			{
				DataMigrationTransform dataMigrationTransform = new DataMigrationTransform(dataMigration, ConfigurationPath);
				m_dataMigrationTransforms.Add(dataMigrationTransform);
			}
		}
		private string GetPropertyValueAsPath(string sKey)
		{
			return ConfigurationPath + "/" +
							m_mediator.PropertyTable.GetStringProperty(sKey, null);
		}
		private string GetConfigurationPath(string sFullPath)
		{
			string sTemp = sFullPath;
			sTemp = sTemp.Replace(@"file:///", "");
			sTemp = sTemp.Substring(0, sTemp.LastIndexOf("/"));
			return sTemp;
		}

		/// <summary>
		/// Get answer file from user and load it
		/// </summary>
		public bool OpenAnswerFile()
		{
			OpenFileDialog dlg = new OpenFileDialog();
			dlg.Filter = m_sAnswerFileFilter;
			dlg.FileName = m_sUserAnswerFile;
			dlg.Title = GetStringFromStringTable("OpenAnswerFile");
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				InitDataMigrationTransforms(m_configurationParameters);
				LoadAnswerFile(dlg.FileName);
				InitAnswerTransforms(m_configurationParameters);
				LanguageNameChanged();
				return true;
			}
			return false;

		}
		/// <summary>
		/// Load an answers file
		/// </summary>
		/// <param name="sAnswerFile">path to the answer file</param>
		/// <remarks>Is public for testing</remarks>
		public void LoadAnswerFile(string sAnswerFile)
		{
			try
			{
				m_sUserAnswerFile = sAnswerFile;
				m_xdAnswers.Load(sAnswerFile);

				MigrateData(sAnswerFile);

				GetLanguageInfoFromAnswerFile();
				SetWorkingPaths();
			}
			catch (Exception exc)
			{
				MessageBox.Show("Error in loading file " + sAnswerFile + "\n" + exc.Message,
					"Error Loading file!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}
		}
		private void MigrateData(string sAnswerFile)
		{
			foreach (DataMigrationTransform migrationTransform in m_dataMigrationTransforms)
			{
				XmlNode node = m_xdAnswers.SelectSingleNode(migrationTransform.DBVersionXPath);

				if (node != null)
				{
					migrationTransform.ApplyTransform(sAnswerFile);
					m_xdAnswers.Load(sAnswerFile);
				}
			}
		}

		public void TransformXmlPageDescription(string sXmlFile, out string sHtmlFile)
		{
			string sTemp = m_sConfigurationPath + "/XmlPageDescriptions/" + sXmlFile;
			XMLUtilities.XSLParameter[] parameterList = GetTransformParameters();
			sHtmlFile = Path.Combine(m_sHtmsPath, Path.GetFileNameWithoutExtension(sXmlFile));
			sHtmlFile += ".htm";
			//MessageBox.Show("TransformXmlPageDescription: m_sWebPageMapper = " + m_sWebPageMapper);
			//MessageBox.Show("XmlPageDescription = " + sTemp);
			//MessageBox.Show("HtmlFile = " + sHtmlFile);
			m_transform.TransformFileToFile(parameterList, sTemp, sHtmlFile);
			//MessageBox.Show("After TransformFileToFile()");
		}

		private XMLUtilities.XSLParameter[] GetTransformParameters()
		{
			XMLUtilities.XSLParameter[] parameterList = new XMLUtilities.XSLParameter[5];
			parameterList[0] = new XMLUtilities.XSLParameter("prmLangAbbr", m_sLanguageAbbreviation);
			parameterList[1] = new XMLUtilities.XSLParameter("prmRtlScript", m_fRightToLeftScript.ToString());
			parameterList[2] = new XMLUtilities.XSLParameter("prmInstallPath", ConfigurationPath + "/");
			string sStylesheet = GetStyleSheet();
			parameterList[3] = new XMLUtilities.XSLParameter("prmStylesheet", sStylesheet);
			parameterList[4] = new XMLUtilities.XSLParameter("prmWorkingPath", m_sHtmsPath.Replace("\\","/") + "/");
			return parameterList;
		}
		private string GetStyleSheet()
		{
			string sBasicStyleheet = ReadBasicStylesheet();
			string sVernacularStyle = GetVernacularStyle();
			return sBasicStyleheet + sVernacularStyle;
		}

		private string ReadBasicStylesheet()
		{
#if Orig
			string sStylesheetPath = Path.Combine(ConfigurationPath, "Styles");
			sStylesheetPath = sStylesheetPath.Replace("/", "\\");
			string sStyleSheetFile = Path.Combine(sStylesheetPath, m_sStylesheet);
			StreamReader sr = new StreamReader(sStyleSheetFile);
			string sStylesheet = sr.ReadToEnd();
			sr.Close();
			return sStylesheet;
#else
			StreamReader sr = new StreamReader(m_sStylesheet);
			string sStylesheet = sr.ReadToEnd();
			sr.Close();
			return sStylesheet;
#endif
		}
		private string GetVernacularStyle()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append(".vernacular {");
			sb.Append("font-family: ");
			sb.Append(GetAnswerValue("//language/font/fontName"));
			sb.Append(";");
			sb.Append("font-size: ");
			sb.Append(GetAnswerValue("//language/font/fontSize"));
			sb.Append("pt;");
			sb.Append("color: ");
			sb.Append(GetAnswerValue("//language/font/fontColor"));
			sb.Append(";");
			if ("True" == GetAnswerValue("//language/font/@bold"))
				sb.Append("font-weight: bold;");
			if ("True" == GetAnswerValue("//language/font/@italic"))
				sb.Append("font-style: italic;");
			bool bFontUnderline = ("True" == GetAnswerValue("//language/font/@under"));
			bool bFontStrikeout = ("True" == GetAnswerValue("//language/font/@strike"));
			if (bFontUnderline || bFontStrikeout)
			{
				sb.Append("text-decoration: ");
				if (bFontUnderline)
					sb.Append("underline ");
				if (bFontStrikeout)
					sb.Append("line-through");
				sb.Append(";");
			}
			sb.Append("}");
			return sb.ToString();
		}

		string SetWorkingPath(string sPathName)
		{
			string sPath = Path.Combine(
				Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
				@"SIL International\Cabhab");
			XmlNode node = m_xdAnswers.SelectSingleNode("/");
			string sRootNode = "Cabhab";
			if (node != null)
			{
				node = node.FirstChild;
				while ((node != null) &&
						(node.NodeType != XmlNodeType.Element))
				{
					node = node.NextSibling;
				}
				if (node != null)
				{
					sRootNode = node.LocalName;
				}
			}
			sPath = Path.Combine(sPath, sRootNode);
			if (m_sLanguageAbbreviation == null)
				m_sLanguageAbbreviation = "new";
			sPath = Path.Combine(sPath, m_sLanguageAbbreviation);
			sPath = Path.Combine(sPath, sPathName);
			if (!Directory.Exists(sPath))
			{
				Directory.CreateDirectory(sPath);
			}
			return sPath;
		}
		void SetWorkingPaths()
		{
			m_sHtmsPath = SetWorkingPath("HTMs");
		}

		private void GetLanguageInfoFromAnswerFile()
		{
			m_sLanguageName = GetAnswerValue("//language/langName");
			m_sLanguageAbbreviation = GetAnswerValue("//language/langAbbr");
			string sBool = GetAnswerValue("//language/font/@rtl");
			m_fRightToLeftScript = Convert.ToBoolean(sBool);
		}
		/// <summary>
		/// Save all files
		/// </summary>
		public void SaveFiles()
		{			// save the files
			Cursor.Current = Cursors.WaitCursor;
			SaveAnswerFile();
			// Apply all transforms
			foreach (AnswerFileTransformSet set in m_answerFileTransformSets)
			{
				string sLastSourceFile = null;
				AnswerFileTransform lastAft = null;
				bool fTransformResult = false;
				for (int i = 0; i < set.Count; i++)
				{
					AnswerFileTransform aft = set.GetTransform(i);
					string sSourceFile = aft.AnswerFile;
					if (i > 0 && fTransformResult)
						sSourceFile = sLastSourceFile;
					fTransformResult = aft.ApplyTransform(ConfigurationPath, sSourceFile);
					if (fTransformResult)
					{
						if (lastAft != null)
							lastAft.ApplyReplaceDOCTYPE(); // do insert DOCTYPE after transform next one (otherwise, one could just insert that DOCTYPE directly via the transform)
						sLastSourceFile = aft.ResultFile;
						lastAft = aft;
					}
				}
			}
			LanguageDataChanged = false;
			SaveSettings();
			Cursor.Current = Cursors.Arrow;
		}

		public void SaveSettings()
		{
			m_mediator.PropertyTable.SetPropertyPersistence(m_ksAnswerFileKey, true);
			m_mediator.PropertyTable.SetProperty(m_ksAnswerFileKey, AnswerFile);
		}
		public void SaveAnswerFile()
		{
			try
			{
				if ((m_sUserAnswerFile == null) ||
					(!File.Exists(m_sUserAnswerFile)))
				{      // require a valid name
					while (!DoSaveAnswerFileDialog())
						;
				}
				// m_sUserAnswerFile has valid file name
				m_xdAnswers.Save(m_sUserAnswerFile);

			}
			catch (Exception exc)
			{
				MessageBox.Show("Problem saving files: " + exc.Message,
					"Save File Error!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}
		}
		protected bool DoSaveAnswerFileDialog()
		{
			SaveFileDialog saveDlg = new SaveFileDialog();
			saveDlg.AddExtension = true;
			saveDlg.Title = GetStringFromStringTable("SaveAnswerFile");
			saveDlg.Filter = m_sAnswerFileFilter;
			// following needed, otherwise it always returns "Cancel"
			saveDlg.OverwritePrompt = false;
			if (m_sUserAnswerFile != null)
			{
				saveDlg.InitialDirectory = Path.GetDirectoryName(m_sUserAnswerFile);
				saveDlg.FileName = Path.GetFileNameWithoutExtension(m_sUserAnswerFile);
			}
			if (saveDlg.ShowDialog() == DialogResult.OK)
			{
				if (Path.GetExtension(saveDlg.FileName) == "")
					saveDlg.FileName += ".paw";
				m_sUserAnswerFile = saveDlg.FileName;
				return true;
			}
			return false;
		}

		/// <summary>
		/// Get value of an answer attribute/element
		/// </summary>
		/// <param name="sXPath">XPath of the attribute/element</param>
		/// <returns>the attribute/element's value or null, if the attribute/element is not found</returns>
		public string GetAnswerValue(string sXPath)
		{
			XmlNode node = m_xdAnswers.SelectSingleNode(sXPath);
			if (node != null)
				return node.InnerText;
			else
				return null;
		}
		/// <summary>
		/// Set the value of an attribute/element
		/// </summary>
		/// <param name="sXPath">XPath of the attribute/element</param>
		/// <param name="sValue">value to set attribute/element to</param>
		/// <remarks>if the attribute/element is not found, it does nothing silently</remarks>
		public void SetAnswerValue(string sXPath, string sValue)
		{
			XmlNode node = m_xdAnswers.SelectSingleNode(sXPath);
			if (node != null)
				node.InnerText = sValue;
		}
		private string GetStringFromStringTable(string sId)
		{
			return m_mediator.StringTbl.GetStringWithXPath(sId, m_ksStringTablePath);
		}
		public bool CreateNewLanguage()
		{
			SaveFileDialog dlg = new SaveFileDialog();
			dlg.Title = GetStringFromStringTable("CreateNewLanguage");
			dlg.Filter = m_sAnswerFileFilter;
			if (DialogResult.OK == dlg.ShowDialog())
			{
				m_xdAnswers.Load(m_sMasterAnswerFile);
				SetAnswerValue("//answerFile", dlg.FileName);
				AnswerFile = dlg.FileName;
				m_xdAnswers.Save(AnswerFile);
				SetWorkingPaths();
				return true;
			}
			return false;
		}
		public bool SaveLanguageAs()
		{
			SaveFileDialog dlg = new SaveFileDialog();
			dlg.Title = GetStringFromStringTable("SaveLanguageAs");
			dlg.Filter = m_sAnswerFileFilter;
			dlg.FileName = AnswerFile;
			if (DialogResult.OK == dlg.ShowDialog())
			{
				SetAnswerValue("//answerFile", dlg.FileName);
				AnswerFile = dlg.FileName;
				ResetLangFilesToMasterValues();
				m_xdAnswers.Save(AnswerFile);
				return true;
			}
			return false;
		}

		private void ResetLangFilesToMasterValues()
		{
			XmlDocument masterDoc = new XmlDocument();
			masterDoc.Load(m_sMasterAnswerFile);
			XmlNodeList languageElements = masterDoc.SelectNodes("//language/*");
			List<string> asElementsToSkip = new List<string>(4);
			asElementsToSkip.Add("langName");
			asElementsToSkip.Add("langAbbr");
			asElementsToSkip.Add("font");
			asElementsToSkip.Add("answerFile");
			foreach (XmlNode node in languageElements)
			{
				if (!asElementsToSkip.Contains(node.Name))
				{
					string sXPath = "//" + node.Name;
					SetAnswerValue(sXPath, node.InnerText);
				}
			}
		}
		public void LanguageNameChanged()
		{
			m_mediator.PropertyTable.SetProperty("DocumentName", Name + " - ");
			// raise event to be handled in CabhabApp
			OnChangeLanguageName(EventArgs.Empty);
		}

		/// <summary>
		/// Get the value of the leftOffAt element
		/// </summary>
		/// <returns>value of the leftOffAt element or "about:blank" if no such element</returns>
		public string GetLeftOffAtPage()
		{
			XmlNode node = m_xdAnswers.SelectSingleNode("//leftOffAt");
			if (node != null)
			{
				string sLoc = node.InnerText;
				if (!sLoc.Contains("/"))
					sLoc = m_sConfigurationPath + "/HTMs/" + sLoc;
				return sLoc;
			}
			else
				return ("about:blank");
		}
		/// <summary>
		/// Set the value of the leftOffAt element
		/// </summary>
		/// <param name="sValue">value to set the leftOffAt element to</param>
		/// <remarks>if the element is not found, it does nothing silently</remarks>
		public void SetLeftOffAtPage(string sValue)
		{
			XmlNode node = m_xdAnswers.SelectSingleNode("//leftOffAt");
			if (node != null)
			{
				node.InnerText = sValue;
				SaveAnswerFile();
			}
		}
	}
}
