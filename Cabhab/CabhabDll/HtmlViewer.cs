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
// File: HtmlViewer.cs
// Responsibility:
// Last reviewed:
//
// <remarks>
// This is based on the XCore HtmlViewer class
// </remarks>
// --------------------------------------------------------------------------------------------
using System;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Security.Permissions;
using System.Windows.Forms;
using System.Xml;
using MsHtmHstInterop;
using System.Runtime.InteropServices;
using SIL.Utils;
using XCore;

namespace SIL.Cabhab
{
	/// <summary>
	/// Summary description for HtmlViewer.
	/// </summary>
	/// <remarks>
	/// IxCoreContentControl includes IxCoreColleague and IxCoreControl now,
	/// so only IxCoreContentControl needs to be declared here.
	/// </remarks>
	[PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
	public class HtmlViewer : XCore.HtmlViewer, IxCoreColleague
	{
		public Language m_lang; // public for testing
		private string m_sAboutFile;
		private string m_sResourcesFile;
		private string m_sInterfaceLanguageFile;
		private string m_sLanguagePropertiesFile;
		private string m_sLanguageFilesFile;
		private string m_sWelcomePageFile;
		private string m_sInterfaceLanguage;

		public event EventHandler ChangeShowStatusBar;
		protected virtual void OnChangeShowStatusBar(EventArgs e)
		{
			if (ChangeShowStatusBar != null)
				ChangeShowStatusBar(this, e);
		}
		public event EventHandler ChangeShowToolbar;
		protected virtual void OnChangeShowToolbar(EventArgs e)
		{
			if (ChangeShowToolbar != null)
				ChangeShowToolbar(this, e);
		}

		#region Construction and disposal
		/// -----------------------------------------------------------------------------------
		/// <summary>
		/// Initializes a new instance of the <see cref="HtmlViewer2"/> class.
		/// </summary>
		/// -----------------------------------------------------------------------------------
		public HtmlViewer()
		{
			m_lang = new Language();
		}

		#endregion // Construction and disposal
		/// <summary>
		/// Initialize.
		/// </summary>
		/// <param name="mediator"></param>
		/// <param name="configurationParameters"></param>
		public override void Init(Mediator mediator, XmlNode configurationParameters)
		{
			base.Init(mediator, configurationParameters);
			m_lang.Init(mediator, configurationParameters);

			m_sAboutFile = m_lang.ConfigurationPath + "/" +
				mediator.PropertyTable.GetStringProperty("AboutPageLocation", null);

			m_sResourcesFile = m_lang.ConfigurationPath + "/" +
				mediator.PropertyTable.GetStringProperty("ResourcesPageLocation", null);

			m_sInterfaceLanguageFile = m_lang.ConfigurationPath + "/" +
				mediator.PropertyTable.GetStringProperty("InterfaceLanguagePageLocation", null);

			m_sInterfaceLanguage = mediator.PropertyTable.GetStringProperty("CurrentInterfaceLanguage", "en");
			//mediator.PropertyTable.RestoreFromFile("CabhabCurrentInterfaceLanguage");
			//m_sInterfaceLanguage = mediator.PropertyTable.GetStringProperty("CurrentInterfaceLanguage", "en");

			m_sLanguagePropertiesFile = m_lang.ConfigurationPath + "/" +
				mediator.PropertyTable.GetStringProperty("LanguagePropertiesLocation", null);

			m_sLanguageFilesFile = m_lang.ConfigurationPath + "/" +
				mediator.PropertyTable.GetStringProperty("LanguageFilesLocation", null);

			m_sWelcomePageFile = m_lang.ConfigurationPath + "/" +
				mediator.PropertyTable.GetStringProperty("WelcomePageLocation", null);

			m_htmlControl.Browser.ObjectForScripting = new WebPageInteractor(m_lang, this, m_htmlControl.Browser);
			m_htmlControl.Browser.Navigated += new WebBrowserNavigatedEventHandler(Browser_Navigated);
			m_htmlControl.Browser.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(Browser_DocumentCompleted);
			m_htmlControl.Browser.Navigating += new WebBrowserNavigatingEventHandler(Browser_Navigating);
			// for debugging:
			//m_htmlControl.Browser.IsWebBrowserContextMenuEnabled = true;

			if (m_lang.AnswerFile == null ||
				!File.Exists(m_lang.AnswerFile))
			{
				m_htmlControl.Browser.Navigate(m_sWelcomePageFile);
			}
			else
			{
				m_lang.InitDataMigrationTransforms(configurationParameters);
				m_lang.LoadAnswerFile(m_lang.AnswerFile);
				m_lang.InitAnswerTransforms(configurationParameters);
				m_lang.LanguageNameChanged();
				m_htmlControl.URL = GetWebPageUrl(m_lang.GetLeftOffAtPage());
			}
		}

		void Browser_Navigating(object sender, WebBrowserNavigatingEventArgs e)
		{
			SaveWebPageData();
		}

		public void SaveWebPageData()
		{
			try
			{
				m_htmlControl.Browser.Document.InvokeScript("saveData");
			}
			catch (Exception)
			{
				// do nothing except assume it's OK.
			}
		}

		void Browser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
		{
			StatusBarPanel message = (StatusBarPanel) m_mediator.PropertyTable.GetValue("Message");
			if (message != null)
				message.Text = m_htmlControl.Browser.DocumentTitle;
			StatusBarPanel page = (StatusBarPanel)m_mediator.PropertyTable.GetValue("PageNumber");
			if (page != null)
			{
				int iStart = m_htmlControl.Browser.DocumentText.IndexOf("PageCount=\"") + 11;
				string sPageCount;
				if (iStart == 10)
					sPageCount = "";
				else
				{
					int iEnd = m_htmlControl.Browser.DocumentText.Substring(iStart).IndexOf("\"");
					sPageCount = m_htmlControl.Browser.DocumentText.Substring(iStart, iEnd);
				}
				page.Text = sPageCount;
			}
		}

		void Browser_Navigated(object sender, WebBrowserNavigatedEventArgs e)
		{
			string sEUrl = e.Url.AbsolutePath;
			string sAppData = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData).Replace("\\", "/").Replace(" ", "%20");
			//MessageBox.Show("In Browser_Navigated: sEUrl = |" + sEUrl + "|");
			//MessageBox.Show("In Browser_Navigated: sAppData = |" + sAppData + "|");
			if (sEUrl.EndsWith(".xml"))
			{
				string sHtmlFile;
				string sXmlFile = sEUrl.Substring(sEUrl.LastIndexOf("/") + 1);
					//sEUrl.Replace("/", "\\");
				//sXmlFile = sXmlFile.Replace("\\HTMs\\", "\\XmlPageDescriptions\\");
				m_lang.TransformXmlPageDescription(sXmlFile, out sHtmlFile);
				//MessageBox.Show("result of transform is " + sHtmlFile);
				m_htmlControl.Browser.Navigate(sHtmlFile);
			}
			else if ((sEUrl.Contains("Contents")
					  && sEUrl.Contains(sAppData))
					 || (sEUrl == "Contents.htm")
					 || (sEUrl == "blankContents.htm"))
			{ // not a generated file; need to make sure working directory is set to configurations (and not temp)
				//MessageBox.Show("In Browser_Navigated: Not a generated file found");
				string sHtmlFile = sEUrl.Substring(sEUrl.LastIndexOf("/") + 1);
				//MessageBox.Show("In Browser_Navigated: sHtmlFile originally = |" + sHtmlFile + "|");
				if (sEUrl == "blankContents.htm") // IE 6 does this; IE 7 does not
				{
					sHtmlFile = "Contents.htm";
				}
				//MessageBox.Show("In Browser_Navigated: sHtmlFile ends = |" + sHtmlFile + "|");
				//MessageBox.Show("In Browser_Navigated: about to navigate to = |" + m_lang.ConfigurationPath + "/HTMs/" + sHtmlFile + "|");
				m_htmlControl.Browser.Navigate(m_lang.ConfigurationPath + "/HTMs/" + sHtmlFile);
			}
			else if (sEUrl.EndsWith("LeftOffAt"))
			{
				OnBrowserBack(sender);
				OnBrowserBack(sender);
			}
			else if (sEUrl.EndsWith("LanguagePropertiesNewMode"))
			{
				LoadLanguagePropertiesPageInNewMode();
			}
			else if (sEUrl.EndsWith("LanguageFilesNewMode"))
			{
				LoadLanguageFilesPageInNewMode();
			}
		}

		protected string GetWebPageUrl(string sPage)
		{
			string sOldUrl = m_htmlControl.URL;
			string sUrl = sOldUrl.Substring(0, sOldUrl.LastIndexOf("/") + 1) + sPage;
			return sUrl;
		}
		#region Message OnDisplayXXX handlers
		public bool OnDisplayCmdNewLanguage(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdOpenLanguage(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdCloseLanguage(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdGenerateFiles(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdInterfaceLanguage(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdSaveLanguageAs(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdShowStatusBar(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			display.Checked = m_mediator.PropertyTable.GetBoolProperty("ShowStatusBar", true);
			return true; //we've handled this
		}
		public bool OnDisplayCmdShowToolbar(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			display.Checked = m_mediator.PropertyTable.GetBoolProperty("ShowToolbar", true);
			return true; //we've handled this
		}
		public bool OnDisplayCmdCopy(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdCut(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdPaste(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdLanguageProperties(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdLanguageExampleFieldCode(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdLanguageFileLocations(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdBack(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			if (m_htmlControl.Browser.CanGoBack)
				display.Enabled = true;
			else
				display.Enabled = false;
			return true; //we've handled this
		}
		public bool OnDisplayCmdForward(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			if (m_htmlControl.Browser.CanGoForward)
				display.Enabled = true;
			else
				display.Enabled = false;
			return true; //we've handled this
		}
		public bool OnDisplayCmdRefresh(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdAbout(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		public bool OnDisplayCmdResources(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}

		public bool OnDisplayCmdExit(object commandObject, ref UIItemDisplayProperties display)
		{
			CheckDisposed();

			display.Enabled = true;
			return true; //we've handled this
		}
		#endregion
		#region Message OnXXX handlers
		public bool OnAboutPage(object param)
		{
			CheckDisposed();

			m_htmlControl.Browser.Navigate(m_sAboutFile);
			return true;
		}
		public bool OnResourcesPage(object param)
		{
			CheckDisposed();

			m_htmlControl.Browser.Navigate(m_sResourcesFile);
			return true;
		}
		public bool OnInterfaceLanguage(object param)
		{
			CheckDisposed();

			m_htmlControl.Browser.Navigate(m_sInterfaceLanguageFile);
			return true;
		}
		public bool OnShowStatusBar(object param)
		{
			CheckDisposed();

			ToggleBooleanProperty("ShowStatusBar");
			// raise event to be handled in CabhabApp
			OnChangeShowStatusBar(EventArgs.Empty);
			return true;
		}
		public bool OnShowToolbar(object param)
		{
			CheckDisposed();

			ToggleBooleanProperty("ShowToolbar");
			// raise event to be handled in CabhabApp
			OnChangeShowToolbar(EventArgs.Empty);
			return true;
		}

		private void ToggleBooleanProperty(string ksShowToolbar)
		{
			bool fToggle = !m_mediator.PropertyTable.GetBoolProperty(ksShowToolbar, true);
			if (fToggle)
				m_mediator.PropertyTable.SetProperty(ksShowToolbar, true);
			else
				m_mediator.PropertyTable.SetProperty(ksShowToolbar, false);
		}
		public bool OnEditCopy(object param)
		{
			CheckDisposed();
			// Copy the selected item in the control to the clipboard
			object o = System.Reflection.Missing.Value;
			((SHDocVw.WebBrowser)m_htmlControl.Browser.ActiveXInstance).ExecWB(
			   SHDocVw.OLECMDID.OLECMDID_COPY,
			   SHDocVw.OLECMDEXECOPT.OLECMDEXECOPT_DODEFAULT, ref o, ref o);
			return true;
		}
		public bool OnEditCut(object param)
		{
			CheckDisposed();
			// Cut the selected item in the control to the clipboard
			object o = System.Reflection.Missing.Value;
			((SHDocVw.WebBrowser)m_htmlControl.Browser.ActiveXInstance).ExecWB(
			   SHDocVw.OLECMDID.OLECMDID_CUT,
			   SHDocVw.OLECMDEXECOPT.OLECMDEXECOPT_DODEFAULT, ref o, ref o);
			return true;
		}
		public bool OnEditPaste(object param)
		{
			CheckDisposed();
			// Paste the clipboard contents into the control
			object o = System.Reflection.Missing.Value;
			((SHDocVw.WebBrowser)m_htmlControl.Browser.ActiveXInstance).ExecWB(
			   SHDocVw.OLECMDID.OLECMDID_PASTE,
			   SHDocVw.OLECMDEXECOPT.OLECMDEXECOPT_DODEFAULT, ref o, ref o);
			return true;
		}
		public bool OnExitApplication(object param)
		{
			try
			{
				CheckDisposed();
				SaveWebPageData();
				if (m_lang != null)
				{
					if (m_lang.LanguageDataChanged)
					{
						m_lang.SaveFiles();
					}
					m_lang.SaveSettings();
				}
				if (param != null)
					this.ParentForm.Close();
				return true;
			}
			catch (Exception exc)
			{
				ReportBadOutputFile(exc);
				return false;
			}
		}

		public bool OnBrowserBack(object param)
		{
			CheckDisposed();

			m_htmlControl.Back();
			string sContent = m_htmlControl.Browser.DocumentText;
			if (sContent.Contains("Cabhab generated html page"))
			{
				m_htmlControl.Back();
			}
			else
			{
				string sEUrl = m_htmlControl.Browser.Url.AbsolutePath;
				if (sEUrl.Contains("Contents") &&
					 (!sEUrl.Contains("Local%20Settings")))
				{ // not a generated file; need to make sure working directory is set to configurations (and not temp)
					m_htmlControl.Back();
				}
			}

			return true;
		}
		public bool OnBrowserForward(object param)
		{
			CheckDisposed();

			this.m_htmlControl.Forward();
			return true;
		}
		public bool OnBrowserRefresh(object param)
		{
			CheckDisposed();

			//this.m_htmlControl.Refresh();
			return true;
		}
		public bool OnLanguageFileLocations(object param)
		{
			CheckDisposed();

			m_htmlControl.Browser.Navigate(m_sLanguageFilesFile);

			return true;
		}
		public bool OnLanguageProperties(object param)
		{
			CheckDisposed();

			m_htmlControl.Browser.Navigate(m_sLanguagePropertiesFile);
			return true;
		}
		public bool OnCloseLanguage(object param)
		{
			CheckDisposed();

			m_htmlControl.Browser.Navigate(m_sWelcomePageFile);
			return true;
		}
		public bool OnOpenLanguage(object param)
		{
			CheckDisposed();

			bool fFound = m_lang.OpenAnswerFile();
			return true;
		}
		public bool OnNewLanguage(object param)
		{
			CheckDisposed();

			bool fGotNewFile = m_lang.CreateNewLanguage();
			if (fGotNewFile)
			{
				LoadLanguagePropertiesPageInNewMode();
			}
			return true;
		}
		public bool OnSaveLanguageAs(object param)
		{
			CheckDisposed();

			bool fGotNewFile = m_lang.SaveLanguageAs();
			if (fGotNewFile)
			{
				LoadLanguagePropertiesPageInNewMode();
			}
			return true;
		}

		private void LoadLanguageFilesPageInNewMode()
		{
			StreamReader sr = new StreamReader(m_sLanguageFilesFile);
			string sPage = sr.ReadToEnd();
			sPage = sPage.Replace("<link rel=\"stylesheet\" href=\"..", "<link rel=\"stylesheet\" href=\"" + m_lang.ConfigurationPath);
			sPage = sPage.Replace("ShowBackNextButtons.style.display = \"none\";", "ShowBackNextButtons.style.display = \"temp\";");
			sPage = sPage.Replace("ShowBackNextButtons.style.display = \"\";", "ShowBackNextButtons.style.display = \"none\";");
			sPage = sPage.Replace(".style.display = \"temp\";", ".style.display = \"\";");
			m_htmlControl.Browser.DocumentText = sPage;
		}
		public void LoadLanguagePropertiesPageInNewMode()
		{
			StreamReader sr = new StreamReader(m_sLanguagePropertiesFile);
			string sPage = sr.ReadToEnd();
			sPage = sPage.Replace("<link rel=\"stylesheet\" href=\"..", "<link rel=\"stylesheet\" href=\"file:///" + m_lang.ConfigurationPath);
			sPage = sPage.Replace(".style.display = \"none\";", ".style.display = \"temp\";");
			sPage = sPage.Replace(".style.display = \"\";", ".style.display = \"none\";");
			sPage = sPage.Replace(".style.display = \"temp\";", ".style.display = \"\";");
			m_htmlControl.Browser.DocumentText = sPage;
		}
		public bool OnGenerateFiles(object param)
		{
			CheckDisposed();
			try
			{
				m_lang.SaveFiles();
				m_lang.LanguageDataChanged = false;
				return true;
			}
			catch (Exception exc)
			{
				ReportBadOutputFile(exc);
				return false;
			}
		}

		private void ReportBadOutputFile(Exception exc)
		{
			string sMsgTitle = m_lang.GetStringFromStringTable("OutputFileBadMessageTitle");
			string sMsg = m_lang.GetStringFromStringTable("OutputFileBadMessage");
			MessageBox.Show(sMsg + exc.Message, sMsgTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
		}

		#endregion
		/// <summary>
		/// Receives the broadcast message "PropertyChanged"
		/// </summary>
		public void OnPropertyChanged(string name)
		{
			CheckDisposed();

			if (name == "ShowToolbar")
			{
				int i = 0;
				i++;
			}
		}
		public string InterfaceLanguage
		{
			get { return m_sInterfaceLanguage; }
			set { m_sInterfaceLanguage = String.IsNullOrEmpty(value) ? "en" : value; }
		}
		public void SaveInterfaceLanguage()
		{
			string sOldInterfaceLanguage = m_mediator.PropertyTable.GetStringProperty("CurrentInterfaceLanguage", "en");

			if (sOldInterfaceLanguage != m_sInterfaceLanguage)
			{
				m_mediator.PropertyTable.SetProperty("CurrentInterfaceLanguage", m_sInterfaceLanguage);
				string[] asTemp = new string[2];
				asTemp[0] = "CurrentInterfaceLanguage";
				asTemp[1] = m_sInterfaceLanguage;
				m_mediator.PropertyTable.Save("CabhabCurrentInterfaceLanguage", asTemp);
#if AfterHandleConfigMenuItemsGenerically
				CultureInfo ci = MiscUtils.GetCultureForWs(m_sInterfaceLanguage);
				if (ci != null)
				{
#if !__MonoCS__
					FormLanguageSwitchSingleton.Instance.ChangeCurrentThreadUICulture(ci);
					object mainWindowForm = m_mediator.PropertyTable.GetValue("window");
					if (mainWindowForm != null)
						FormLanguageSwitchSingleton.Instance.ChangeLanguage((Form)mainWindowForm);

#else
					// TODO-Linux: Investigate FormLanguageSwitchSingleton
#endif
				}
				// Reload the mediator's string table with the appropriate language data.
				m_mediator.StringTbl.Reload(m_sInterfaceLanguage);
#endif
				object mainWindowForm = m_mediator.PropertyTable.GetValue("window");
				if (mainWindowForm != null)
				{
					CabhabApp ca = mainWindowForm as CabhabApp;
					ca.ReLoadMenuBarContents();

					}

				m_mediator.StringTbl.Reload("en");
			}
		}

		public void RefreshMenuUI()
		{
			m_mediator.PostMessage("Refresh", null);

		}
	}
		/// <summary>
	/// Every method here is exposed to the script in the browser
	/// </summary>
	[PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
	[System.Runtime.InteropServices.ComVisible(true)]
	public class WebPageInteractor
	{
		Language m_lang;
		WebBrowser m_browser;
		HtmlViewer m_viewer;
		string m_sOutValue;

		/// <summary>
		/// Requires a language object
		/// </summary>
		/// <param name="lang"></param>
		public WebPageInteractor(Language lang, HtmlViewer viewer, WebBrowser browser)
		{
			m_lang = lang;
			m_viewer = viewer;
			m_browser = browser;
		}

		/// <summary>
		/// Puts the value of the answer attribute/element specified in sXPath into the OutValue property
		/// </summary>
		/// <param name="sXPath">XPath of the attribute/element</param>
		/// <remarks>I (Andy) could not figure out how to get javascript to recognize an "out" parameter,
		/// so am doing this.
		/// Note that the javascript must first invoke GetAnswerValue() and then get the result
		/// by referring to the OutValue property</remarks>
		public void GetAnswerValue(string sXPath)
		{
			m_sOutValue = m_lang.GetAnswerValue(sXPath);
		}
		public string OutValue
		{
			get
			{
				if (m_sOutValue == null)
					return "";
				return m_sOutValue;
			}
		}

		public void GetInterfaceLanguage()
		{
			m_sOutValue = m_viewer.InterfaceLanguage;

		}
		public void SetInterfaceLanguage(string sLangCode)
		{
			m_viewer.InterfaceLanguage = sLangCode;

		}
		public void SaveInterfaceLanguage()
		{
			m_viewer.SaveInterfaceLanguage();
		}
		public void CopyFiles(string sFromDirectory, string sToDirectory)
		{
			try
			{
				string sConfigPath = m_lang.ConfigurationPath;
				string[] asFromFiles = Directory.GetFiles(Path.Combine(sConfigPath, sFromDirectory));
				string sTargetDirectory = Path.Combine(sConfigPath, sToDirectory);
				foreach (string sFile in asFromFiles)
				{
					// following two lines are for testing/debugging
					string sTargetFileName = Path.GetFileName(sFile);
					string sTargetFile = Path.Combine(sTargetDirectory, sTargetFileName);
					File.Copy(sFile, Path.Combine(sTargetDirectory, Path.GetFileName(sFile)), true);
				}
			}
			catch (Exception e)
			{

				MessageBox.Show("Error trying to copy files from directory '" + sFromDirectory + "' to '" + sToDirectory + "': " +
								e.Message + "... " + e.InnerException.Message);
			}

		}
		public void CopyFile(string sFromFile, string sToFile)
		{
			try
			{
				string sConfigPath = m_lang.ConfigurationPath;
					// following two lines are for testing/debugging
				string sSourceFileName = Path.Combine(sConfigPath, sFromFile);
				string sTargetFileName = Path.Combine(sConfigPath, sToFile);
				File.Copy(sSourceFileName, sTargetFileName, true);
			}
			catch (Exception e)
			{

				MessageBox.Show("Error trying to copy file '" + sFromFile + "' to '" + sToFile + "': " +
								e.Message + "... " + e.InnerException.Message);
			}

		}
		public void RefreshMenuUI()
		{
			m_viewer.RefreshMenuUI();
		}
		public void SaveData()
		{
			m_lang.SaveAnswerFile();
		}
		public void LanguageNameChanged()
		{
			m_lang.LanguageNameChanged();
		}
		public void InitAnswerTransforms()
		{
			m_lang.InitAnswerTransforms();
		}

		public void SetAnswerValue(string sXPath, string sValue)
		{
			m_lang.SetAnswerValue(sXPath, sValue);
			m_lang.LanguageDataChanged = true;
		}
		public void SetLeftOffAt(string sValue)
		{
			m_lang.SetLeftOffAtPage(sValue);
		}
		public void CreateNewLanguage()
		{
			bool fGotNewFile = m_lang.CreateNewLanguage();
			if (fGotNewFile)
			{
				m_viewer.LoadLanguagePropertiesPageInNewMode();
			}

		}
		public void FindAnswerFile()
		{
			bool fFound = m_lang.OpenAnswerFile();
			if (fFound)
				m_sOutValue = "true";
			else
				m_sOutValue = "false";
		}
		public void QuitFromNewLanguagePage()
		{
			m_viewer.OnExitApplication(this);
		}
		public void FileBrowse(string sFile, string sFilter)
		{
			SaveFileDialog dlg = new SaveFileDialog();
			dlg.Filter = sFilter;
			dlg.FileName = sFile;
			dlg.OverwritePrompt = false;
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				m_sOutValue = dlg.FileName;
			}
			else
				m_sOutValue = "Cancel";
		}
		public void DirectoryBrowse(string sDirectory, string sDescription)
		{
			FolderBrowserDialog dlg = new FolderBrowserDialog();
			dlg.SelectedPath = sDirectory;
			dlg.Description = sDescription;
			dlg.ShowNewFolderButton = true;
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				m_sOutValue = dlg.SelectedPath;
			}
			else
				m_sOutValue = "Cancel";
		}
		public void ShowTermDefinition(string sMsg)
		{
			using (var dlg = new TermDefinitionDialog())
			{
				dlg.LabelMessage = sMsg;
				dlg.ShowDialog();
			}
		}
		public void ChangeFontInfo()
		{
			const string ksFontName = "//language/font/fontName";
			const string ksFontSize = "//language/font/fontSize";
			const string ksFontColor = "//language/font/fontColor";
			const string ksBold = "//language/font/@bold";
			const string ksItalic = "//language/font/@italic";
			const string ksUnder = "//language/font/@under";
			const string ksStrike = "//language/font/@strike";
			const string ksTrue = "True";
			FontDialog fontdlg = new FontDialog();
			fontdlg.ShowEffects = true;
			fontdlg.ShowColor = true;
			string sFontName = m_lang.GetAnswerValue(ksFontName);
			string sFontSize = m_lang.GetAnswerValue(ksFontSize);
			string sFontColor = m_lang.GetAnswerValue(ksFontColor);
			fontdlg.Color = System.Drawing.Color.FromName(sFontColor);
			// set style
			FontStyle fst = new FontStyle();
			fst = FontStyle.Regular;
			string sBold = m_lang.GetAnswerValue(ksBold);
			if (sBold == ksTrue)
				fst |= FontStyle.Bold;
			string sItalic = m_lang.GetAnswerValue(ksItalic);
			if (sItalic == ksTrue)
				fst |= FontStyle.Italic;
			string sUnderline = m_lang.GetAnswerValue(ksUnder);
			if (sUnderline == ksTrue)
				fst |= FontStyle.Underline;
			string sStrikeout = m_lang.GetAnswerValue(ksStrike);
			if (sStrikeout == ksTrue)
				fst |= FontStyle.Strikeout;
			System.Drawing.Font font = new System.Drawing.Font(sFontName,
				(float)Convert.ToDouble(sFontSize), fst);
			fontdlg.Font = font;
			if (fontdlg.ShowDialog() == DialogResult.OK)
			{
				// set the values
				m_lang.SetAnswerValue(ksFontName, fontdlg.Font.Name);
				m_lang.SetAnswerValue(ksFontSize, fontdlg.Font.Size.ToString());
				sFontColor = fontdlg.Color.ToString();
				sFontColor = sFontColor.Substring(7, sFontColor.Length - 8);
				m_lang.SetAnswerValue(ksFontColor, sFontColor);
				m_lang.SetAnswerValue(ksBold, fontdlg.Font.Bold.ToString());
				m_lang.SetAnswerValue(ksItalic, fontdlg.Font.Italic.ToString());
				m_lang.SetAnswerValue(ksUnder, fontdlg.Font.Underline.ToString());
				m_lang.SetAnswerValue(ksStrike, fontdlg.Font.Strikeout.ToString());
				m_sOutValue = sFontName;
				m_lang.SaveAnswerFile();
			}

		}
	}
}
