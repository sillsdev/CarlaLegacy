using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using Microsoft.Win32;
using Microsoft.IE;

namespace PAWSStarterKit
{
	/// <summary>
	/// Summary description for PAWSSKForm.
	/// </summary>
	public class PAWSSKForm : Form
	{
		const string m_strRegKey = "Software\\SIL International\\PAWSStarterKit";
		const string m_strLastAnswerFile = "LastAnswerFile";
		const string m_strLastGrammarFile = "GrammarFile";
		const string m_strLastWriterFile = "WriterFile";
		const string m_strLastExampleFilesPath = "ExampleFilesPath";
		const string m_strLocationX = "LocationX";
		const string m_strLocationY = "LocationY";
		const string m_strSizeHeight = "SizeHeight";
		const string m_strSizeWidth = "SizeWidth";
		const string m_strStatusBarChecked = "StatusBarChecked";
		const string m_strToolBarChecked = "ToolBarChecked";
		const string m_strBackgroundGif = "p12c08.gif";
		const string m_strPurposeHtm = "Purpose.htm";
		const string m_strUnderConstructionHtm = "UnderConstruction.htm";
		const string m_strEditCaption = "Edit Items";
		string m_strAppPath;
		string m_strXLingPapDtd;
		string m_strXLingPapCss;
		string m_strXLingPapXsl;
		string m_strConstructionGif;
		string m_strPAWSErrorMsg = Application.ProductName + ": ";
		string m_strHelpPath;
		string m_strHtmsPath;
		string m_strStylesPath;
		string m_strTreeDescriptionsPath;
		string m_strTempGrammarFile;
		string m_strBlack1997;
		string m_strBlack1999;
		string m_strMcConnel2002;
		string m_strXLingPapDoc;
		string[] m_astrIgnorePages = new string[4];

		MenuItem miFileNew;
		MenuItem miFileOpen;
		MenuItem miFileClose;
		MenuItem miFileSave;
		MenuItem miFileSaveAs;
		MenuItem miFileExit;
		MenuItem miEditCut;
		MenuItem miEditCopy;
		MenuItem miEditPaste;
		MenuItem miLanguageProperties;
		MenuItem miViewToolBar;
		MenuItem miViewStatusBar;
		MenuItem miViewBack;
		MenuItem miViewForward;
		MenuItem miViewRefresh;
		MenuItem miHelpAbout;
		MenuItem miHelpBlack1997Doc;
		MenuItem miHelpBlack1999Doc;
		MenuItem miHelpMcConnel2002Doc;
		MenuItem miHelpXLingPapDoc;

		private string m_strUserDataStore;
		private string m_strUserAnswerFile;
		private string m_strUserGrammarFile;
		private string m_strUserWriterFile;
		private string m_strUserExampleFilesPath;
		private string m_strLanguageName;
		private string m_strLanguageAbbreviation;
		private string m_strTextSFM;
		private bool m_bInitializing = true;
		private bool m_bIsDirty;
		private const string m_strProgName = "PAWS Starter Kit";
		private const string m_strInitHtm = "PawsSKInit.htm";
		private const string m_strPAWSStarterKitCSS = "PAWSStarterKit.css";
		private const string m_strWriteUpCSS = "WriteUp.css";
		private const string m_strNewAnswerFileRelative = @"Data\PAWSStarterKitMaster.paw";
		private string m_strNewAnswerFile;
		private const string m_strAnswerFileFilter = "PAWS Starter Kit (*.paw)|*.paw|" +
			"All Files (*.*)|*.*";
		private const string m_strGrammarFileFilter = "PAWS Grammar File (*.grm)|*.grm|" +
			"All Files (*.*)|*.*";
		private const string m_strExampleFilesPathFilter = "Example Test File (*.txt)|*.txt|" +
			"All Files (*.*)|*.*";
		private XmlDocument m_XmlDoc = new XmlDocument();
		private XslTransform m_XslGrammarTransform = new XslTransform();
		private XslTransform m_XslWriterTransform = new XslTransform();
		private XslTransform m_XslExampleTransform = new XslTransform();
		System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(PAWSSKForm));
		private AxSHDocVw.AxWebBrowser axWebBrowser;
		private ToolBar tbar;
		private bool m_bViewToolBarChecked = true;
		private StatusBar sb;
		private bool m_bViewStatusBarChecked = true;
		private Panel panel;
		private System.ComponentModel.IContainer components = null;

		public PAWSSKForm()
		{
			// set value of application path
			m_strAppPath = Path.GetDirectoryName(Application.ExecutablePath);
			m_strAppPath = m_strAppPath.Remove(m_strAppPath.Length-4, 4);

			// load grammar, writer and examples transforms
			try
			{
				string strTransformsPath = Path.Combine(m_strAppPath, @"Transforms");
				m_XslGrammarTransform.Load(Path.Combine(strTransformsPath, "PAWSSKMasterGrammarMapper.xsl"));
				m_XslWriterTransform.Load(Path.Combine(strTransformsPath, "PAWSSKMasterWriterMapper.xsl"));
				m_XslExampleTransform.Load(Path.Combine(strTransformsPath, "PAWSSKParameterizedExample.xsl"));
			}
			catch (Exception exc)
			{
				MessageBox.Show("Could not find a transform: " + exc.Message,
					"Error while loading transform!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}
			// Allow handling of user closing the form
			this.Closing += new CancelEventHandler(PAWSSKOnClosing);

			// Get registry info (if any)
			try
			{
				RegistryKey regkey = Registry.CurrentUser.OpenSubKey(m_strRegKey);
				if (regkey != null)
				{
					retrieveRegistryInfo(regkey);
					regkey.Close();
				}
			}
			catch
			{
			}

			// Initialize the form
			this.AutoScroll = true;
			Icon = ((Icon)(resources.GetObject("$this.Icon")));
			InitMenu();
			InitPanel();
			InitWebBrowser();
			InitToolBar();
			InitStatusBar();

			// Initialize some values
			m_strNewAnswerFile = Path.Combine(m_strAppPath, m_strNewAnswerFileRelative);
			m_strXLingPapDtd = Path.Combine(m_strAppPath, @"Data\XLingPap.dtd");
			m_strXLingPapCss = Path.Combine(m_strAppPath, @"Styles\WriteUpMaster.css");
			m_strXLingPapXsl = Path.Combine(m_strAppPath, @"Transforms\XLingPap1.xsl");
			m_strConstructionGif = Path.Combine(m_strAppPath, @"HTMs\Construction.gif");
			m_strBlack1997 = Path.Combine(m_strAppPath, @"Help\Black1997.htm");
			m_strBlack1999 = Path.Combine(m_strAppPath, @"Help\CBGBTEXT.DOC");
			m_strMcConnel2002 = Path.Combine(m_strAppPath, @"Help\pcpatr.htm");
			m_strXLingPapDoc = Path.Combine(m_strAppPath, @"Help\XLingPapUserDoc.htm");
			m_astrIgnorePages[0] = m_strBlack1997;
			m_astrIgnorePages[1] = m_strBlack1999;
			m_astrIgnorePages[2] = m_strMcConnel2002;
			m_astrIgnorePages[3] = m_strXLingPapDoc;
			Array.Sort(m_astrIgnorePages, Comparer.Default);

			if (m_strUserAnswerFile != null)
			{
				try
				{
					// load our copy of the answer file
					loadAnswerFile(m_strUserAnswerFile);
				}
				catch (Exception exc)
				{
					MessageBox.Show(m_strPAWSErrorMsg + "Initialization problem: " + exc.Message);
				}

			}
			else
			{
				DlgFirstTime dlg = new DlgFirstTime();
				if (dlg.ShowDialog() == DialogResult.Cancel)
					sayGoodBye();
				if (dlg.rbCreate.Checked)
				{
					// need to do new language processing...
					m_XmlDoc.Load(m_strNewAnswerFile);
					if (!doLanguagePropertiesDialog(true))
					{
						sayGoodBye();
					}
				}
				else
				{
					// allow user to navigate to an answer file and open it
					OpenFileDialog dlgOpen = new OpenFileDialog();
					dlgOpen.Filter = m_strAnswerFileFilter;
					if (dlgOpen.ShowDialog() == DialogResult.OK)
					{
						loadAnswerFile(dlgOpen.FileName);
					}
					else
					{
						sayGoodBye();
					}
				}
				Location = new Point(2,2);
				Size = new Size(SystemInformation.PrimaryMonitorMaximizedWindowSize.Width - SystemInformation.VerticalScrollBarWidth,
					SystemInformation.PrimaryMonitorMaximizedWindowSize.Height- SystemInformation.HorizontalScrollBarHeight);
			}
			showPage(Path.Combine(m_strHtmsPath, m_strInitHtm));
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		void InitMenu()
		{
			MenuItem mi;

			// Menu items
			MainMenu mMenu = new MainMenu();

			// File
			mi = new MenuItem("&File");
			mi.Popup += new EventHandler(MenuFileOnPopup);
			mMenu.MenuItems.Add(mi);
			int index = mMenu.MenuItems.Count -1;

			// File New
			miFileNew = new MenuItem("&New...");
			miFileNew.Click += new EventHandler(MenuFileNewOnClick);
			//miFileNew.Shortcut = Shortcut.CtrlN;  // short cuts don't always work
			mMenu.MenuItems[index].MenuItems.Add(miFileNew);

			// File Open
			miFileOpen = new MenuItem("&Open...");
			miFileOpen.Click += new EventHandler(MenuFileOpenOnClick);
			//miFileOpen.Shortcut = Shortcut.CtrlO;
			mMenu.MenuItems[index].MenuItems.Add(miFileOpen);

			// File Close
			miFileClose = new MenuItem("&Close");
			miFileClose.Click += new EventHandler(MenuFileCloseOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miFileClose);

			// Horizontal line
			mi = new MenuItem("-");
			mMenu.MenuItems[index].MenuItems.Add(mi);

			// File Save
			miFileSave = new MenuItem("&Save...");
			miFileSave.Click += new EventHandler(MenuFileSaveOnClick);
			//miFileSave.Shortcut = Shortcut.CtrlS;
			mMenu.MenuItems[index].MenuItems.Add(miFileSave);

			// File Save As
			miFileSaveAs = new MenuItem("Save&As...");
			miFileSaveAs.Click += new EventHandler(MenuFileSaveAsOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miFileSaveAs);

			// Horizontal line
			mi = new MenuItem("-");
			mMenu.MenuItems[index].MenuItems.Add(mi);

			// File Exit
			miFileExit = new MenuItem("E&xit");
			miFileExit.Click += new EventHandler(MenuFileExitOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miFileExit);


			// Edit
			mi = new MenuItem("&Edit");
			mi.Popup += new EventHandler(MenuEditOnPopup);
			mMenu.MenuItems.Add(mi);
			index = mMenu.MenuItems.Count -1;

			// Edit Cut
			miEditCut = new MenuItem("Cu&t");
			miEditCut.Click += new EventHandler(MenuEditCutOnClick);
			//miEditCut.Shortcut = Shortcut.CtrlX;
			mMenu.MenuItems[index].MenuItems.Add(miEditCut);

			// Edit Copy
			miEditCopy = new MenuItem("&Copy");
			miEditCopy.Click += new EventHandler(MenuEditCopyOnClick);
			//miEditCopy.Shortcut = Shortcut.CtrlC;
			mMenu.MenuItems[index].MenuItems.Add(miEditCopy);

			// Edit Paste
			miEditPaste = new MenuItem("&Paste");
			miEditPaste.Click += new EventHandler(MenuEditPasteOnClick);
			//miEditPaste.Shortcut = Shortcut.CtrlV;
			mMenu.MenuItems[index].MenuItems.Add(miEditPaste);

			// Language
			mi = new MenuItem("&Language");
			mi.Popup += new EventHandler(MenuLanguageOnPopup);
			mMenu.MenuItems.Add(mi);
			index = mMenu.MenuItems.Count -1;

			// Language Properties
			miLanguageProperties = new MenuItem("&Properties...");
			miLanguageProperties.Click += new EventHandler(MenuLanguagePropertiesOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miLanguageProperties);

			// View
			mi = new MenuItem("&View");
			mi.Popup += new EventHandler(MenuViewOnPopup);
			mMenu.MenuItems.Add(mi);
			index = mMenu.MenuItems.Count -1;

			// View Tool Bar
			miViewToolBar = new MenuItem("&Tool Bar");
			miViewToolBar.Click += new EventHandler(MenuViewToolBarOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miViewToolBar);
			miViewToolBar.Checked = m_bViewToolBarChecked;

			// View Status Bar
			miViewStatusBar = new MenuItem("&Status Bar");
			miViewStatusBar.Click += new EventHandler(MenuViewStatusBarOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miViewStatusBar);
			miViewStatusBar.Checked = m_bViewStatusBarChecked;

			// Horizontal line
			mi = new MenuItem("-");
			mMenu.MenuItems[index].MenuItems.Add(mi);

			// View Back
			miViewBack = new MenuItem("&Back");
			miViewBack.Click += new EventHandler(MenuViewBackOnClick);
			//miViewBack.Shortcut = Shortcut.F5;
			mMenu.MenuItems[index].MenuItems.Add(miViewBack);

			// View Forward
			miViewForward = new MenuItem("&Forward");
			miViewForward.Click += new EventHandler(MenuViewForwardOnClick);
			//miViewForward.Shortcut = Shortcut.F5;
			mMenu.MenuItems[index].MenuItems.Add(miViewForward);

			// View Refresh
			miViewRefresh = new MenuItem("&Refresh");
			miViewRefresh.Click += new EventHandler(MenuViewRefreshOnClick);
			//miViewRefresh.Shortcut = Shortcut.F5;
			mMenu.MenuItems[index].MenuItems.Add(miViewRefresh);


			// Help
			mi = new MenuItem("&Help");
			mi.Popup += new EventHandler(MenuHelpOnPopup);
			mMenu.MenuItems.Add(mi);
			index = mMenu.MenuItems.Count -1;

			// Help Black1997 Documentation
			miHelpBlack1997Doc = new MenuItem("PC-PATR and GB (&Black 1997)");
			miHelpBlack1997Doc.Click += new EventHandler(MenuHelpBlack1997OnClick);
			mMenu.MenuItems[index].MenuItems.Add(miHelpBlack1997Doc);

			// Help Black1999 Documentation
			miHelpBlack1999Doc = new MenuItem("&GB Intro (Black 1999)");
			miHelpBlack1999Doc.Click += new EventHandler(MenuHelpBlack1999OnClick);
			mMenu.MenuItems[index].MenuItems.Add(miHelpBlack1999Doc);

			// Help McConnel2002 Documentation
			miHelpMcConnel2002Doc = new MenuItem("&PC-PATR documentation (McConnel 2002)");
			miHelpMcConnel2002Doc.Click += new EventHandler(MenuHelpMcConnel2002OnClick);
			mMenu.MenuItems[index].MenuItems.Add(miHelpMcConnel2002Doc);

			// Help XLingPap Documentation
			miHelpXLingPapDoc = new MenuItem("&XLingPap documentation");
			miHelpXLingPapDoc.Click += new EventHandler(MenuHelpXLingPapDocOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miHelpXLingPapDoc);

			// Horizontal line
			mi = new MenuItem("-");
			mMenu.MenuItems[index].MenuItems.Add(mi);

			// Help About
			miHelpAbout = new MenuItem("&About " + m_strProgName + "...");
			miHelpAbout.Click += new EventHandler(MenuHelpAboutOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miHelpAbout);

			// set the Form's menu to this menu
			Menu = mMenu;
		}
		void InitPanel()
		{
			panel = new Panel();
			panel.Parent = this;
			panel.BackColor = SystemColors.Window;
			panel.ForeColor = SystemColors.WindowText;
			panel.AutoScroll = true;
			panel.Dock = DockStyle.Fill;
			panel.BorderStyle = BorderStyle.Fixed3D;
		}
		void InitToolBar()
		{
			ToolBarButton tbbNew;
			ToolBarButton tbbOpen;
			ToolBarButton tbbSave;
			ToolBarButton tbbCut;
			ToolBarButton tbbCopy;
			ToolBarButton tbbPaste;
			ToolBarButton tbbSeparator;
			ToolBarButton tbbBack;
			ToolBarButton tbbForward;
			ToolBarButton tbbRefresh;

			ImageList imglst = new ImageList();
			imglst.Images.Add(new Bitmap(GetType(), "New.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Open.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Save.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Cut.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Copy.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Paste.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Back.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Forward.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Refresh.bmp"));

			tbar = new ToolBar();
			tbar.Parent = this;
			tbar.ImageList = imglst;
			tbar.ShowToolTips = true;
			tbar.ButtonClick += new ToolBarButtonClickEventHandler(ToolBarOnClick);

			tbbNew = new ToolBarButton();
			tbbNew.ImageIndex = 0;
			tbbNew.ToolTipText = "Create a new language";
			tbbNew.Tag = miFileNew;
			tbar.Buttons.Add(tbbNew);

			tbbOpen = new ToolBarButton();
			tbbOpen.ImageIndex = 1;
			tbbOpen.ToolTipText = "Open an existing language";
			tbbOpen.Tag = miFileOpen;
			tbar.Buttons.Add(tbbOpen);

			tbbSave = new ToolBarButton();
			tbbSave.ImageIndex = 2;
			tbbSave.ToolTipText = "Save current language";
			tbbSave.Tag = miFileSave;
			tbar.Buttons.Add(tbbSave);

			tbbSeparator = new ToolBarButton();
			tbbSeparator.Style = ToolBarButtonStyle.Separator;
			tbar.Buttons.Add(tbbSeparator);

			tbbCut = new ToolBarButton();
			tbbCut.ImageIndex = 3;
			tbbCut.ToolTipText = "Cut";
			tbbCut.Tag = miEditCut;
			tbar.Buttons.Add(tbbCut);

			tbbCopy = new ToolBarButton();
			tbbCopy.ImageIndex = 4;
			tbbCopy.ToolTipText = "Copy";
			tbbCopy.Tag = miEditCopy;
			tbar.Buttons.Add(tbbCopy);

			tbbPaste = new ToolBarButton();
			tbbPaste.ImageIndex = 5;
			tbbPaste.ToolTipText = "Paste";
			tbbPaste.Tag = miEditPaste;
			tbar.Buttons.Add(tbbPaste);

			tbbSeparator = new ToolBarButton();
			tbbSeparator.Style = ToolBarButtonStyle.Separator;
			tbar.Buttons.Add(tbbSeparator);

			tbbBack = new ToolBarButton();
			tbbBack.ImageIndex = 6;
			tbbBack.ToolTipText = "Back";
			tbbBack.Tag = miViewBack;
			tbar.Buttons.Add(tbbBack);

			tbbForward = new ToolBarButton();
			tbbForward.ImageIndex = 7;
			tbbForward.ToolTipText = "Forward";
			tbbForward.Tag = miViewForward;
			tbar.Buttons.Add(tbbForward);

			tbbRefresh = new ToolBarButton();
			tbbRefresh.ImageIndex = 8;
			tbbRefresh.ToolTipText = "Refresh";
			tbbRefresh.Tag = miViewRefresh;
			tbar.Buttons.Add(tbbRefresh);

			tbar.Visible = m_bViewToolBarChecked;
		}
		void InitWebBrowser()
		{
			SuspendLayout();
			axWebBrowser = new AxSHDocVw.AxWebBrowser();
			((System.ComponentModel.ISupportInitialize)(this.axWebBrowser)).BeginInit();
			axWebBrowser.Anchor = (((AnchorStyles.Top
				| AnchorStyles.Bottom)
				| AnchorStyles.Left)
				| AnchorStyles.Right);
			axWebBrowser.Enabled = true;
			axWebBrowser.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axWebBrowser.OcxState")));
			axWebBrowser.TabIndex = 0;
			Controls.AddRange(new Control[] {axWebBrowser});
			((System.ComponentModel.ISupportInitialize)(this.axWebBrowser)).EndInit();
			axWebBrowser.Size = new Size(ClientSize.Width, ClientSize.Height);
			ResumeLayout();
			axWebBrowser.Parent = panel;
		}

		void InitStatusBar()
		{
			sb = new StatusBar();
			sb.Parent = this;
			//            sb.Location = new Point(0, 258);
			//SystemInformation.
			//            sb.Location = new Point(0, ClientSize.Height - 14);

			sb.Height = (int)(SystemInformation.MenuHeight * .8);
			sb.Visible = m_bViewStatusBarChecked;
		}

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main()
		{
			PAWSSKForm pForm = new PAWSSKForm();
			Application.Run(pForm);
		}
		private void showPage(String sPagePath)
		{
			System.Object nullObject = 0;
			System.Object nullObjStr = "";
			axWebBrowser.Visible = true;
			axWebBrowser.Focus();
			axWebBrowser.BringToFront();

			axWebBrowser.DocumentComplete += new AxSHDocVw.DWebBrowserEvents2_DocumentCompleteEventHandler(WebBrowserOnDocumentComplete);
			axWebBrowser.TitleChange += new AxSHDocVw.DWebBrowserEvents2_TitleChangeEventHandler(WebBrowserOnTitleChange);
			axWebBrowser.Offline = true;
			axWebBrowser.Navigate(sPagePath, ref nullObject, ref nullObjStr, ref
				nullObjStr, ref nullObjStr);
		}
		private void saveUserDataStoreToUserAnswerFile()
		{
			string strSourceFile;
			if ((m_strUserAnswerFile == null) ||
				(!File.Exists(m_strUserAnswerFile)))
			{      // require a valid name
				while (!doSaveAnswerFileDialog())
					;
			}
			locateUserDataStore();
			if (m_strUserDataStore != "")
			{
				strSourceFile = m_strUserDataStore;
			}
			else
			{
				strSourceFile = m_strNewAnswerFile;
			}
			File.Copy(strSourceFile, m_strUserAnswerFile, true);
		}


		// locateUserDataStore
		// Sets m_strUserDataStore to location of the UserData store being used
		//  by the HTML pages.
		// If there is no UserData directory or no appropriate data file,
		//  m_strUserDataStore is set to "".
		private void locateUserDataStore()
		{
			try
			{
				string[] astrDirectories;
				string strUserDataStoreDir = Path.Combine(
					Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
					@"Microsoft\Internet Explorer\UserData");
				if (!Directory.Exists(strUserDataStoreDir))
				{
					strUserDataStoreDir = Path.Combine(
						Environment.GetFolderPath(Environment.SpecialFolder.System),
						@"..\UserData");
					if (!Directory.Exists(strUserDataStoreDir))
					{
						MessageBox.Show("Cannot find UserData store directory!\nGiving up.", "Cannot locate UserData store",
							MessageBoxButtons.OK, MessageBoxIcon.Error);
						sayGoodBye();
					}
				}
				string strUserDataStoreFile = m_strLanguageAbbreviation + "PawsSK*.xml";
				// initialize
				m_strUserDataStore = "";

				astrDirectories = Directory.GetDirectories(strUserDataStoreDir);
				foreach (string str in astrDirectories)
				{
					string[] astrFiles;
					astrFiles = Directory.GetFiles(str, strUserDataStoreFile);
					if (astrFiles.Length > 0)
					{
						// for now we assume there is but one and take the first otherwise
						m_strUserDataStore = astrFiles[0];
						return;
					}
				}
				return;
			}
			catch (FileNotFoundException excFNF)
			{
				string strIgnore = excFNF.FileName; // make compiler happy
				return;
			}
			catch (DirectoryNotFoundException excDNF)
			{
				string strIgnore = excDNF.Message; // make compiler happy
				return;
			}
			catch (Exception exc)
			{
				MessageBox.Show(m_strPAWSErrorMsg + "locateUserDataShow exception: " + exc.Message);
				return;
			}
		}

		private void loadUserDataStore()
		{
			try
			{
				m_XmlDoc.Load(m_strUserDataStore);
			}
			catch (FileNotFoundException exc)
			{
				exc = exc;  // make compiler happy
				//saveUserData();  // Wrong!
				//loadUserDataStore();
			}
/*
			catch (ArgumentException ae)
			{
				string strTemp = m_XmlDoc.InnerText;
				ae = ae;
			}
			*/
			catch (Exception exc)
			{
				MessageBox.Show(m_strPAWSErrorMsg + "Failed to load XML file: " + exc);
			}
		}
		void MenuFileNewOnClick(object obj, EventArgs ea)
		{
#if Orig
			// Remember current state
			XmlDocument xmlDocTemp = m_XmlDoc;
			m_XmlDoc.Load(m_strNewAnswerFile);
			if (doLanguagePropertiesDialog(true))
				showPage(Path.Combine(m_strHtmsPath, m_strInitHtm));
			else
				// the user canceled; restore the state
				m_XmlDoc = xmlDocTemp;
#else
			// Remember current state
			XmlDocument xmlDocTemp = m_XmlDoc;
			// ask whether to start from scratch or to copy
			DlgFileNew dlg = new DlgFileNew();
			if (dlg.ShowDialog() == DialogResult.Cancel)
				return; // they quit, so we do, too
			if (dlg.rbCopy.Checked)
			{
				// allow user to navigate to an answer file and open it
				OpenFileDialog dlgOpen = new OpenFileDialog();
				dlgOpen.Filter = m_strAnswerFileFilter;
				if (dlgOpen.ShowDialog() == DialogResult.OK)
				{
					loadAnswerFile(dlgOpen.FileName);
				}
				else
				{
					return;  // they quit, so we do, too
				}
			}
			else
			{   // doing it from scratch
				m_XmlDoc.Load(m_strNewAnswerFile);
			}
			// get language properties
			if (doLanguagePropertiesDialog(true))
			{
				Location = new Point(2,2);
				Size = new Size(SystemInformation.PrimaryMonitorMaximizedWindowSize.Width - SystemInformation.VerticalScrollBarWidth,
					SystemInformation.PrimaryMonitorMaximizedWindowSize.Height- SystemInformation.HorizontalScrollBarHeight);
				showPage(Path.Combine(m_strHtmsPath, m_strInitHtm));
			}
			else
				// the user canceled; restore the state
				m_XmlDoc = xmlDocTemp;
#endif // Orig
		}
		void MenuFileOpenOnClick(object obj, EventArgs ea)
		{
			OpenFileDialog dlg = new OpenFileDialog();
			dlg.Filter = m_strAnswerFileFilter;
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				loadAnswerFile(dlg.FileName);
				showPage(Path.Combine(m_strHtmsPath, m_strInitHtm));
			}
		}
		void MenuFileCloseOnClick(object obj, EventArgs ea)
		{
			MessageBox.Show("File Close item clicked.", Text);
		}
		void MenuFileSaveOnClick(object obj, EventArgs ea)
		{
#if Orig
			// Remember original names in case user cancels at some point
			string strAnswerFileTemp = m_strUserAnswerFile;
			string strGrammarFileTemp = m_strUserGrammarFile;
			string strExampleFilesPathTemp = m_strUserExampleFilesPath;
			if ((m_strUserAnswerFile == null) ||
				(!File.Exists(m_strUserAnswerFile)))
			{
				if (!doSaveAnswerFileDialog())
					return; // nothing to do; user canceled on first one
			}
			if (m_strUserGrammarFile == null)
				{
				if (!doSaveGrammarFileDialog())
				{   // User canceled; undo any name change to answer file
					m_strUserAnswerFile = strAnswerFileTemp;
					return;
				}
			}
			if ((m_strUserExampleFilesPath == null) ||
				(!Directory.Exists(m_strUserExampleFilesPath)))
			{
				if (!doSaveExampleFilesPathDialog())
				{   // user canceled; undo any name change to answer or grammar files
					m_strUserAnswerFile = strAnswerFileTemp;
					m_strUserGrammarFile = strGrammarFileTemp;
					return;
				}
			}
			// save the files
			saveUserDataStoreToUserAnswerFile();
			saveGrammarFile();
			saveExampleFiles();
			m_bIsDirty = false;
			setTitle();
#else
			// save the files
			try
			{
				saveUserDataStoreToUserAnswerFile();
				saveGrammarFile();
				saveWriterFiles();
				saveExampleFiles();
				m_bIsDirty = false;
				setTitle();
			}
			catch (Exception exc)
			{
				MessageBox.Show("Problem saving files: " + exc.Message,
					"Save File Error!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}
#endif
		}
		void MenuFileSaveAsOnClick(object obj, EventArgs ea)
		{
			bool bDidAnswerFile = false;
			bool bDidGrammarFile = false;
			bool bDidExamplesPath = false;
			// Remember original names in case user cancels at some point
			string strAnswerFileTemp = m_strUserAnswerFile;
			string strGrammarFileTemp = m_strUserGrammarFile;
			string strExampleFilesPathTemp = m_strUserExampleFilesPath;
			if (doSaveAnswerFileDialog())
			{
				bDidAnswerFile = true;
				if (doSaveGrammarFileDialog())
				{
					bDidGrammarFile = true;
					if (doSaveExampleFilesPathDialog())
					{
						bDidExamplesPath = true;
					}
				}
			}
			if (!bDidAnswerFile || !bDidGrammarFile || !bDidExamplesPath)
			{   // User canceled; restore file names
				m_strUserAnswerFile = strAnswerFileTemp;
				m_strUserGrammarFile = strGrammarFileTemp;
				m_strUserExampleFilesPath = strExampleFilesPathTemp;
			}
			else
			{   // user provided all file names
				saveUserDataStoreToUserAnswerFile();
				saveGrammarFile();
				saveExampleFiles();
				m_bIsDirty = false;
				setTitle();
			}
		}
		void MenuFileExitOnClick(object obj, EventArgs ea)
		{
			Close();
		}
		void MenuEditCutOnClick(object obj, EventArgs ea)
		{
			MessageBox.Show("To cut a selection from a page, use the keyboard shortcut Ctrl-X",
				m_strEditCaption, MessageBoxButtons.OK,
				MessageBoxIcon.Information);
		}
		void MenuEditCopyOnClick(object obj, EventArgs ea)
		{
			MessageBox.Show("To copy a selection from a page, use the keyboard shortcut Ctrl-C",
				m_strEditCaption, MessageBoxButtons.OK,
				MessageBoxIcon.Information);
		}
		void MenuEditPasteOnClick(object obj, EventArgs ea)
		{
			MessageBox.Show("To paste a selection onto a page, use the keyboard shortcut Ctrl-V",
				m_strEditCaption, MessageBoxButtons.OK,
				MessageBoxIcon.Information);
		}
		void MenuLanguagePropertiesOnClick(object obj, EventArgs ea)
		{
			locateUserDataStore();
			loadUserDataStore();
			if (doLanguagePropertiesDialog(false))
				showPage(Path.Combine(m_strHtmsPath, m_strInitHtm));
		}
		void MenuViewToolBarOnClick(object obj, EventArgs ea)
		{
			MenuItem mi = (MenuItem) obj;
			mi.Checked ^= true;;
			tbar.Visible = mi.Checked;
			Invalidate();
		}
		void MenuViewStatusBarOnClick(object obj, EventArgs ea)
		{
			MenuItem mi = (MenuItem) obj;
			mi.Checked ^= true;;
			sb.Visible = mi.Checked;
			Invalidate();
		}
		void MenuViewBackOnClick(object obj, EventArgs ea)
		{
			try
			{
				axWebBrowser.GoBack();
			}
			catch
			{
				axWebBrowser.CtlRefresh();
			}
		}
		void MenuViewForwardOnClick(object obj, EventArgs ea)
		{
			try
			{
				axWebBrowser.GoForward();
			}
			catch
			{
				axWebBrowser.CtlRefresh();
			}
		}
		void MenuViewRefreshOnClick(object obj, EventArgs ea)
		{
			axWebBrowser.CtlRefresh();
		}
		void MenuHelpBlack1997OnClick(object obj, EventArgs ea)
		{
			showPage(m_strBlack1997);
		}
		void MenuHelpBlack1999OnClick(object obj, EventArgs ea)
		{
			showPage(m_strBlack1999);
		}
		void MenuHelpMcConnel2002OnClick(object obj, EventArgs ea)
		{
			showPage(m_strMcConnel2002);
		}
		void MenuHelpXLingPapDocOnClick(object obj, EventArgs ea)
		{
			showPage(m_strXLingPapDoc);
		}
		void MenuHelpAboutOnClick(object obj, EventArgs ea)
		{
			DlgAbout dlg = new DlgAbout();
			dlg.ShowDialog();
		}
		void MenuFileOnPopup(object obj, EventArgs ea)
		{
		}
		void MenuEditOnPopup(object obj, EventArgs ea)
		{
		}
		void MenuLanguageOnPopup(object obj, EventArgs ea)
		{
		}
		void MenuViewOnPopup(object obj, EventArgs ea)
		{
		}
		void MenuHelpOnPopup(object obj, EventArgs ea)
		{
		}
		void WebBrowserOnDocumentComplete(object obj, AxSHDocVw.DWebBrowserEvents2_DocumentCompleteEvent ev)
		{
			string strPage = ev.uRL.ToString();
			if ((Path.GetFileName(strPage) != m_strInitHtm) &&
				0 > Array.BinarySearch(m_astrIgnorePages, strPage, Comparer.Default))
			{ // it's not one of the "ignore" pages
				saveUserDataStoreToUserAnswerFile();
				if (m_bInitializing)
				{
					m_bInitializing = false;
					m_bIsDirty = false;
				}
				else
					m_bIsDirty = true;
				setTitle();
			}
		}
		void WebBrowserOnTitleChange(object obj, AxSHDocVw.DWebBrowserEvents2_TitleChangeEvent ev)
		{
			sb.Text = ev.text;
		}
		void ToolBarOnClick(object obj, ToolBarButtonClickEventArgs tbbcea)
		{
			ToolBarButton tbb = tbbcea.Button;
			MenuItem mi = (MenuItem) tbb.Tag;

			mi.PerformClick();
		}
		string getXmlElementAttribute(string strXPath)
		{
			XmlNode xmlNode;
			try
			{
				xmlNode = m_XmlDoc.SelectSingleNode(strXPath);
				if (xmlNode != null)
					return xmlNode.Value;
				else
					return "";
			}
			catch (Exception exc)
			{
				exc = exc; // Make compiler happy
				return "";
			}
		}
		string getXmlElementContent(string strXPath)
		{
			XmlNode xmlNode;
			try
			{
				xmlNode = m_XmlDoc.SelectSingleNode(strXPath).FirstChild;
				if (xmlNode != null)
					return xmlNode.Value;
				else
					return "";
			}
			catch (Exception exc)
			{
				exc = exc; // Make compiler happy
				return "";
			}
		}
		void setXmlElementAttribute(string strXPathElement, string strAttribute, string strValue)
		{
			XmlNode xmlNode;
#if !UseString
			StringBuilder sb = new StringBuilder(strXPathElement);
			sb.Append("/@");
			sb.Append(strAttribute);
			string strXPath = sb.ToString();
#else
			string strXPath = strXPathElement + "/@" + strAttribute;
#endif
			try
			{
				xmlNode = m_XmlDoc.SelectSingleNode(strXPath);
				if (xmlNode == null)
				{
					XmlAttribute xmlAttr = m_XmlDoc.CreateAttribute(strAttribute);
					xmlAttr.Value = strValue;
					xmlNode = m_XmlDoc.SelectSingleNode(strXPathElement);
					xmlNode.Attributes.Append(xmlAttr);
				}
				else
					xmlNode.Value = strValue;
			}
			catch (Exception exc)
			{
				MessageBox.Show(m_strPAWSErrorMsg + "setXmlElementAttribute: " + exc);
			}
		}
		void setXmlElementContent(string strXPath, string strContent)
		{
			XmlNode xmlNode;
			try
			{
				xmlNode = m_XmlDoc.SelectSingleNode(strXPath).FirstChild;
				if (xmlNode == null)
				{
					XmlText xmlText = m_XmlDoc.CreateTextNode(strContent);
					xmlNode = m_XmlDoc.SelectSingleNode(strXPath);
					xmlNode.AppendChild(xmlText);
				}
				else
					xmlNode.Value = strContent;
			}
			catch (Exception exc)
			{
				MessageBox.Show(m_strPAWSErrorMsg + "setXmlElementContent: " + exc);
			}
		}
		void PAWSSKOnClosing(object obj, CancelEventArgs cea)
		{
			saveUserDataStoreToUserAnswerFile();
			if (m_bIsDirty)
			{
				if (DialogResult.Yes == MessageBox.Show("The Answer file has changed.  Do you want to generate the grammar, writer and example files?",
					"Program Ending...", MessageBoxButtons.YesNo,
					MessageBoxIcon.Question))
					MenuFileSaveOnClick(null, null);
			}
		}
		protected override void OnClosed(EventArgs ea)
		{
			base.OnClosed(ea);
			// save registry info
			RegistryKey regkey = Registry.CurrentUser.OpenSubKey(m_strRegKey, true);
			if (regkey == null)
			{
				regkey = Registry.CurrentUser.CreateSubKey(m_strRegKey);
			}
			saveRegistryInfo(regkey);
			regkey.Close();
		}
		void createPAWSSKInitHtm(bool bUseContentsHtm)
		{
			string strUserFileWithDoubleBackslash = m_strUserAnswerFile.Replace(@"\", @"\\");

			setHtmsPath();
			StreamWriter sw = new StreamWriter(Path.Combine(m_strHtmsPath, m_strInitHtm));
			sw.WriteLine("<html>");
			sw.WriteLine("<head>");
			sw.WriteLine("<META http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
			sw.WriteLine("<title>Initializing...Please Wait</title>");
			sw.WriteLine("<style>");
			sw.WriteLine(".userData {");
			sw.WriteLine("  behavior: url(#default#userdata);");
			sw.WriteLine("}");
			sw.WriteLine("</style>");
			sw.WriteLine("<script>");
			sw.WriteLine("function Initialize()");
			sw.WriteLine("{");
			sw.WriteLine("  var elem;");
			sw.WriteLine(@"     //Load the answers from user's answer file");
#if !UseString
			StringBuilder sbFilespec =  new StringBuilder("  filespec = \"");
			sbFilespec.Append(strUserFileWithDoubleBackslash);
			sbFilespec.Append("\";");
			sw.WriteLine(sbFilespec.ToString());
#else
			sw.WriteLine("  filespec = \"" + strUserFileWithDoubleBackslash + "\";");
#endif
			sw.WriteLine("  PawsSKAnswers = new ActiveXObject(\"MicroSoft.XMLDOM\");");
			sw.WriteLine("  PawsSKAnswers.async = false;");
			sw.WriteLine("  PawsSKAnswers.load( filespec );");
#if CheckLangAbbrOnLoad
			sw.WriteLine("alert(\"loaded \" + filespec);");
#endif  // CheckLangAbbrOnLoad
			sw.WriteLine("     // and Save them to the UserData store named LangAbbr + \"PawsSKAnswers\"");
			sw.WriteLine("  div = document.all(\"answerDiv\");");
			sw.WriteLine("  div.XMLDocument.documentElement = PawsSKAnswers.documentElement;");
#if !UseString
			StringBuilder sbDivSave = new StringBuilder("  div.save(\"");
			sbDivSave.Append(m_strLanguageAbbreviation);
			sbDivSave.Append("PawsSKAnswers\");");
			sw.WriteLine(sbDivSave.ToString());
#else
			sw.WriteLine("  div.save(\"" + m_strLanguageAbbreviation + "PawsSKAnswers\");");
#endif
			sw.WriteLine("   PawsSKAnswers = div.XMLDocument; ");
			sw.WriteLine("");
			sw.WriteLine("  elem = PawsSKAnswers.selectSingleNode(\"//leftOffAt\");");
			if (bUseContentsHtm)
			{
				sw.WriteLine("     elem.text = \"Contents.htm\";");
			}
			else
			{
				sw.WriteLine("  if (elem.text == \"\")");
				sw.WriteLine("{ ");
				sw.WriteLine("     elem.text = \"Contents.htm\";");
				sw.WriteLine("} ");
			}
			sw.WriteLine("  window.navigate(elem.text);");
			sw.WriteLine("}");
			sw.WriteLine("</script>");
			sw.WriteLine("</head>");
			sw.WriteLine("<body onload=\"Initialize()\">");
			sw.WriteLine("<div class=\"userData\" id=\"answerDiv\"></div>");
			sw.WriteLine("<p>Initializing... Please wait.</p>");
			sw.WriteLine("</body>");
			sw.WriteLine("</html>");
			sw.Close();
		}
		void setTitle()
		{
			Text = m_strProgName + " - " + m_strLanguageName;
			if (m_bIsDirty)
			{
				Text += "*";
			}
		}
		bool doSaveAnswerFileDialog()
		{
			SaveFileDialog saveDlg = new SaveFileDialog();
			saveDlg.AddExtension = true;
			saveDlg.Title = "Answer File";
			saveDlg.Filter = m_strAnswerFileFilter;
			// following needed, otherwise it always returns "Cancel"
			saveDlg.OverwritePrompt = false;
			if (m_strUserAnswerFile != null)
			{
				saveDlg.InitialDirectory = Path.GetDirectoryName(m_strUserAnswerFile);
				saveDlg.FileName = Path.GetFileNameWithoutExtension(m_strUserAnswerFile);
			}
			if (saveDlg.ShowDialog() == DialogResult.OK)
			{
				if (Path.GetExtension(saveDlg.FileName) == "")
					saveDlg.FileName += ".paw";
				m_strUserAnswerFile = saveDlg.FileName;
				return true;
			}
			return false;
		}
		bool doSaveGrammarFileDialog()
		{
			SaveFileDialog saveDlg = new SaveFileDialog();
			saveDlg.AddExtension = true;
			saveDlg.Title = "Grammar File";
			saveDlg.Filter = m_strGrammarFileFilter;
			// following needed, otherwise it always returns "Cancel"
			saveDlg.OverwritePrompt = false;
			if (m_strUserGrammarFile != null)
			{
				saveDlg.InitialDirectory = Path.GetDirectoryName(m_strUserGrammarFile);
				saveDlg.FileName = Path.GetFileNameWithoutExtension(m_strUserGrammarFile);
			}
			if (saveDlg.ShowDialog() == DialogResult.OK)
			{
				if (Path.GetExtension(saveDlg.FileName) == "")
					saveDlg.FileName += ".grm";
				m_strUserGrammarFile = saveDlg.FileName;
				return true;
			}
			return false;
		}
		bool doSaveExampleFilesPathDialog()
		{
			DirectoryBrowser dirBrowser = new DirectoryBrowser();
			if (dirBrowser.ShowDialog("Example File Path") == DialogResult.OK)
			{
				m_strUserExampleFilesPath = dirBrowser.DirectoryPath;
				return true;
			}
			return false;
		}
		void saveGrammarFile()
		{
			try
			{
				m_XslGrammarTransform.Transform(m_strUserAnswerFile, m_strTempGrammarFile);
				// the above outputs the Unicode BOM in UTF8; we need to remove that
				// open and read the file
				StreamReader sr = new StreamReader(m_strTempGrammarFile);
				string strFile = sr.ReadToEnd();
				// use no BOM
				UTF8Encoding utf8NoBOM = new UTF8Encoding(false);
				// write it out without the BOM
				StreamWriter sw = new StreamWriter(m_strUserGrammarFile, false, utf8NoBOM);
				sw.Write(strFile);
				sw.Close();
			}
			catch (Exception exc)
			{
				MessageBox.Show(this.m_strPAWSErrorMsg + "saveGrammarFile: " + exc);
			}
		}
		void saveWriterFiles()
		{
			try
			{
				m_XslWriterTransform.Transform(m_strUserAnswerFile, m_strUserWriterFile);
				string strUserWriterDir = Path.GetDirectoryName(m_strUserWriterFile);
				string strUserWriterDtd = Path.Combine(strUserWriterDir, "XLingPap.dtd");
				if (!File.Exists(strUserWriterDtd))
				{
					File.Copy(m_strXLingPapDtd, strUserWriterDtd, true);
				}
				string strUserWriterXsl = Path.Combine(strUserWriterDir, "XLingPap1.xsl");
				if (!File.Exists(strUserWriterXsl))
				{
					File.Copy(m_strXLingPapXsl, strUserWriterXsl, true);
				}
				string strUserWriterConstructionGif = Path.Combine(strUserWriterDir, "Construction.gif");
				if (!File.Exists(strUserWriterConstructionGif))
				{
					File.Copy(m_strConstructionGif, strUserWriterConstructionGif, true);
				}
			}
			catch (Exception exc)
			{
				MessageBox.Show(this.m_strPAWSErrorMsg + "saveWriterFiles: " + exc);
			}
		}
		void saveExampleFiles()
		{
			locateUserDataStore();
			loadUserDataStore();
			createExampleFile("QP");
			createExampleFile("AdvP");
			createExampleFile("AdjP");
			createExampleFile("NP");
			createExampleFile("PP");
			createExampleFile("Prop");
			createExampleFile("Pron");
			createExampleFile("IP");
			createExampleFile("Comp");
			createExampleFile("Q");
			createExampleFile("RelCl");
			createExampleFile("AdvCl");
			createExampleFile("Neg");
			createExampleFile("Coord");
			createExampleFile("Focus");
			createExampleFile("Excl");
		}
		void createExampleFile(string strType)
		{
			XsltArgumentList xslArg = new XsltArgumentList();
			try
			{
				xslArg.AddParam("prmIdTitle","", strType);
				xslArg.AddParam("textSFM","", m_strTextSFM);
#if !UseString
				StringBuilder sb = new StringBuilder(m_strLanguageAbbreviation);
				sb.Append(strType);
				sb.Append("Test.txt");
				string strExampleFile = Path.Combine(m_strUserExampleFilesPath,
					sb.ToString());
#else
				string strExampleFile = Path.Combine(m_strUserExampleFilesPath,
					m_strLanguageAbbreviation + strType + "Test.txt");
#endif
				StreamWriter sw = new StreamWriter(strExampleFile);
				m_XslExampleTransform.Transform(m_XmlDoc, xslArg, sw);
				sw.Close();
			}
			catch (Exception exc)
			{
				MessageBox.Show(this.m_strPAWSErrorMsg + "createExampleFile: " + exc);
			}
		}
		bool doLanguagePropertiesDialog(bool bDoingFileNew)
		{
			string strOriginalLanguageAbbreviation = m_strLanguageAbbreviation;
			DlgLanguageProperties dlg = new DlgLanguageProperties();
			dlg.Language = getXmlElementContent("//language/langName");
			dlg.Abbreviation = getXmlElementContent("//language/langAbbr");
			dlg.FieldCode = getXmlElementContent("//language/textSFM");
			dlg.FontName = getXmlElementContent("//language/font/fontName");
			dlg.FontColor = getXmlElementContent("//language/font/fontColor");
			dlg.FontSize = getXmlElementContent("//language/font/fontSize");

			string strBool = getXmlElementAttribute("//language/font/@bold");
			dlg.FontBold = Convert.ToBoolean(strBool);
			strBool = getXmlElementAttribute("//language/font/@italic");
			dlg.FontItalic = Convert.ToBoolean(strBool);
			strBool = getXmlElementAttribute("//language/font/@under");
			dlg.FontUnderline = Convert.ToBoolean(strBool);
			strBool = getXmlElementAttribute("//language/font/@strike");
			dlg.FontStrikeout = Convert.ToBoolean(strBool);

			dlg.AnswerFile = m_strUserAnswerFile;
			if (bDoingFileNew)
			{
				dlg.GrammarFile = null;
				dlg.WriterFile = null;
				dlg.ExampleFiles = null;
			}
			else
			{
				dlg.GrammarFile = m_strUserGrammarFile;
				dlg.WriterFile = m_strUserWriterFile;
				dlg.ExampleFiles = m_strUserExampleFilesPath;
			}

			if (dlg.ShowDialog() == DialogResult.OK)
			{
				m_strLanguageName = dlg.Language;
				m_strLanguageAbbreviation = dlg.Abbreviation;
				m_strTextSFM = dlg.FieldCode;
				string strFontName = dlg.FontName;
				string strFontColor = dlg.FontColor;
				string strFontSize = dlg.FontSize;
				bool bFontBold = dlg.FontBold;
				bool bFontItalic = dlg.FontItalic;
				bool bFontUnderline = dlg.FontUnderline;
				bool bFontStrikeout = dlg.FontStrikeout;
				m_strUserAnswerFile = dlg.AnswerFile;
				m_strUserGrammarFile = dlg.GrammarFile;
				m_strUserWriterFile = dlg.WriterFile;
				m_strUserExampleFilesPath = dlg.ExampleFiles;
				// save Answer file info
				setXmlElementContent("//language/langName", m_strLanguageName);
				setXmlElementContent("//language/langAbbr", m_strLanguageAbbreviation);
				setXmlElementContent("//language/textSFM", m_strTextSFM);
				setXmlElementContent("//language/font/fontName", strFontName);
				setXmlElementContent("//language/font/fontColor", strFontColor);
				setXmlElementContent("//language/font/fontSize", strFontSize);
				setXmlElementAttribute("//language/font", "bold", bFontBold.ToString());
				setXmlElementAttribute("//language/font", "italic", bFontItalic.ToString());
				setXmlElementAttribute("//language/font", "under", bFontUnderline.ToString());
				setXmlElementAttribute("//language/font", "strike", bFontStrikeout.ToString());
				setXmlElementContent("//language/answerFile", m_strUserAnswerFile);
				setXmlElementContent("//language/grammarFile", m_strUserGrammarFile);
				setXmlElementContent("//language/writerFile", m_strUserWriterFile);
				setXmlElementContent("//language/exampleFilesPath", m_strUserExampleFilesPath);
				if (m_strLanguageAbbreviation != strOriginalLanguageAbbreviation)
				{   // lang abbreviation changed; need to redo working paths
					setWorkingPaths();
					// now recreate all HTM, etc. files
					createHTMs();
				}
				// create language specific style sheets
				createPageStyleSheet();
				createWriterStyleSheet();
				// save user's answer file
				if (m_strUserAnswerFile == null)
					doSaveAnswerFileDialog();
				m_XmlDoc.Save(m_strUserAnswerFile);
				setTitle();
				// Start over so the changes will take effect
				createPAWSSKInitHtm(true);
				return true;
			}
			return false;
		}
		void setHtmsPath()
		{
			m_strHtmsPath = setWorkingPath("HTMs");
		}
		string setWorkingPath(string strPathName)
		{
			string strPath = Path.Combine(
				Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
				"PAWSSK");
			strPath = Path.Combine(strPath, m_strLanguageAbbreviation);
			strPath = Path.Combine(strPath, strPathName);
			if (!Directory.Exists(strPath))
			{
				Directory.CreateDirectory(strPath);
			}
			return strPath;
		}
		void setWorkingPaths()
		{
			setHtmsPath();
			m_strHelpPath = setWorkingPath("Help");
			m_strTreeDescriptionsPath = setWorkingPath("TreeDescriptions");
			m_strStylesPath = setWorkingPath("Styles");
			string strTempPath = setWorkingPath("Temp");
			m_strTempGrammarFile = Path.Combine(strTempPath, "temp.grm");
		}
		void createHTMs()
		{
			string[] astrXmlFiles;
			string[] astrContentsFiles;
			string[] astrGifFiles;
			string[] astrPngFiles;
			string[] astrDocFiles;
			try
			{
				DlgInitProgress dlg = new DlgInitProgress();
				dlg.Owner = this;

				dlg.Text = "Initializing Language " + this.m_strLanguageName + ".  Please Wait...";

				astrXmlFiles = Directory.GetFiles(Path.Combine(m_strAppPath, @"XMLPageDescriptions"), "*.xml");
				astrContentsFiles = Directory.GetFiles(Path.Combine(m_strAppPath, @"HTMs"), "*Contents.htm");
				astrGifFiles = Directory.GetFiles(Path.Combine(m_strAppPath, @"HTMs"), "*.gif");
				astrPngFiles = Directory.GetFiles(Path.Combine(m_strAppPath, @"TreeDescriptions"), "*.png");
				astrDocFiles = Directory.GetFiles(Path.Combine(m_strAppPath, @"Help"), "*.doc");
				dlg.progressBar.Minimum = 1;
				// Max is all the files plus the UnderConstruction.htm and Purpose.htm
				dlg.progressBar.Maximum = astrXmlFiles.Length +
					astrContentsFiles.Length + astrGifFiles.Length +
					astrPngFiles.Length + astrDocFiles.Length + 2;
				dlg.progressBar.Value = 1;
				dlg.progressBar.Step = 1;
				dlg.progressBar.Visible = true;
				dlg.Show();
				// Process all XML page descriptions, creating corresponding HTM files
				if (astrXmlFiles.Length > 0)
				{
					XslTransform xslt = new XslTransform();
					XsltArgumentList xslArg = new XsltArgumentList();
					xslt.Load(Path.Combine(
						Path.Combine(m_strAppPath,@"Transforms"), "PAWSSKHtmlMapper.xsl"));
					xslArg.AddParam("prmLangAbbr", "", m_strLanguageAbbreviation);
					foreach (string strFile in astrXmlFiles)
					{
						dlg.doProgressUpdate(strFile);
						string strDestFile = Path.Combine(m_strHtmsPath,
							Path.GetFileNameWithoutExtension(strFile));
						strDestFile += ".htm";
						XmlDocument xmlDoc = new XmlDocument();
						xmlDoc.Load(strFile);
						StreamWriter sw = new StreamWriter(strDestFile);
						xslt.Transform(xmlDoc, xslArg, sw);
						sw.Close();
					}
				}
				// Copy the Contents.htm files, adjusting the stylesheet and UDS names
				if (astrContentsFiles.Length > 0)
				{
					foreach (string strFile in astrContentsFiles)
					{
						dlg.doProgressUpdate(strFile);
						updateHTM(strFile);
					}
					updateHTM(Path.Combine(m_strAppPath,
						Path.Combine(@"HTMs", m_strPurposeHtm)));
					updateHTM(Path.Combine(m_strAppPath,
						Path.Combine(@"HTMs", m_strUnderConstructionHtm)));
				}
				// Copy the *.gif files
				copyFileSets(astrGifFiles, m_strHtmsPath, dlg);
				// Copy the *.png files
				copyFileSets(astrPngFiles, m_strTreeDescriptionsPath, dlg);
				// Copy the *.doc files
				copyFileSets(astrDocFiles, m_strHelpPath, dlg);
				dlg.Close();
			}
			catch (Exception exc)
			{
				MessageBox.Show(m_strPAWSErrorMsg + exc);
				return;
			}
		}
		void copyFileSets(string[] astrFiles, string strPath, DlgInitProgress dlg)
		{
			if (astrFiles.Length > 0)
			{
				foreach (string strFile in astrFiles)
				{
					dlg.doProgressUpdate(strFile);
					string strDestFile = Path.Combine(strPath, Path.GetFileName(strFile));
					File.Copy(strFile, strDestFile, true);
				}
			}
		}
		void updateHTM(string strFile)
		{
			string strDestFile = Path.Combine(m_strHtmsPath, Path.GetFileName(strFile));
			StreamReader sr = new StreamReader(strFile);
			StreamWriter sw = new StreamWriter(strDestFile);
			string strLine;
			while ((strLine = sr.ReadLine()) != null)
			{
				if (strLine.IndexOf("../styles/PAWSStarterKitMaster.css") != -1)
				{
					sw.Write("      <link rel=\"stylesheet\" href=\"../styles/");
					sw.Write(m_strLanguageAbbreviation);
					sw.WriteLine(m_strPAWSStarterKitCSS + "\">");
				}
				else if (strLine.IndexOf("strUserDataStore = ") != -1)
				{
					sw.Write("   strUserDataStore = \"");
					sw.Write(m_strLanguageAbbreviation);
					sw.WriteLine("PawsSKAnswers\";");
				}
				else
					sw.WriteLine(strLine);
			}
			sr.Close();
			sw.Close();
		}
		void retrieveRegistryInfo(RegistryKey regkey)
		{
			m_strUserAnswerFile = (string)regkey.GetValue(m_strLastAnswerFile);
			m_strUserGrammarFile = (string)regkey.GetValue(m_strLastGrammarFile);
			m_strUserWriterFile = (string)regkey.GetValue(m_strLastWriterFile);
			m_strUserExampleFilesPath = (string)regkey.GetValue(m_strLastExampleFilesPath);
			m_bViewToolBarChecked = Convert.ToBoolean((string) regkey.GetValue(m_strToolBarChecked));
			m_bViewStatusBarChecked = Convert.ToBoolean((string) regkey.GetValue(m_strStatusBarChecked));
			int iX = Convert.ToInt32((string)regkey.GetValue(m_strLocationX));
			int iY = Convert.ToInt32((string)regkey.GetValue(m_strLocationY));
			int iWidth = Convert.ToInt32((string)regkey.GetValue(m_strSizeWidth));
			int iHeight = Convert.ToInt32((string)regkey.GetValue(m_strSizeHeight));
			StartPosition = FormStartPosition.Manual;
			Location = new Point(iX, iY);
			Size = new Size(iWidth, iHeight);
		}
		void saveRegistryInfo(RegistryKey regkey)
		{
			if (m_strUserAnswerFile != null)
				regkey.SetValue(m_strLastAnswerFile, m_strUserAnswerFile);
			if (m_strUserGrammarFile != null)
				regkey.SetValue(m_strLastGrammarFile, m_strUserGrammarFile);
			if (m_strUserWriterFile != null)
				regkey.SetValue(m_strLastWriterFile, m_strUserWriterFile);
			if (m_strUserExampleFilesPath != null)
				regkey.SetValue(m_strLastExampleFilesPath, m_strUserExampleFilesPath);
			regkey.SetValue(m_strLocationX, Location.X.ToString());
			regkey.SetValue(m_strLocationY, Location.Y.ToString());
			regkey.SetValue(m_strSizeWidth, Size.Width.ToString());
			regkey.SetValue(m_strSizeHeight, Size.Height.ToString());
			regkey.SetValue(m_strToolBarChecked, miViewToolBar.Checked.ToString());
			regkey.SetValue(m_strStatusBarChecked, miViewStatusBar.Checked.ToString());
		}
		void loadAnswerFile(string strAnswerFile)
		{
			try
			{
				m_XmlDoc.Load(strAnswerFile);
				m_strLanguageName = getXmlElementContent("//language/langName");
				m_strLanguageAbbreviation = getXmlElementContent("//language/langAbbr");
#if CheckLangAbbrOnLoad
				MessageBox.Show("In loadAnswerFile: langAbbr = " + m_strLanguageAbbreviation);
#endif // CheckLangAbbrOnLoad
				m_strTextSFM = getXmlElementContent("//language/textSFM");
				m_strUserGrammarFile = getXmlElementContent("//language/grammarFile");
				m_strUserWriterFile = getXmlElementContent("//language/writerFile");
				m_strUserExampleFilesPath = getXmlElementContent("//language/exampleFilesPath");
				setWorkingPaths();
				// if working subdirs are empty, create them
				string[] astrHtmFiles = Directory.GetFiles(m_strHtmsPath, "*.htm");
				if ((astrHtmFiles.Length == 0) ||
					(!File.Exists(getPageStyleFile())) ||
					(!File.Exists(getWriterStyleFile())))
				{
					DialogResult dr = MessageBox.Show("The language in file " + strAnswerFile + " needs to have its working files initialized.\n" +
						"Do you want to initialize them now?", "Missing working files",
						MessageBoxButtons.YesNo, MessageBoxIcon.Question);
					if (dr == DialogResult.Yes)
					{
						if (astrHtmFiles.Length == 0)
							createHTMs();
						if (!File.Exists(getPageStyleFile()))
							createPageStyleSheet();
						if (!File.Exists(getWriterStyleFile()))
							createWriterStyleSheet();
					}
					else
						sayGoodBye();
				}
				setTitle();
				m_strUserAnswerFile = strAnswerFile;
				createPAWSSKInitHtm(false);
			}
			catch (Exception exc)
			{
				MessageBox.Show("Error in loading file " + strAnswerFile + "\n" + exc.Message,
					"Error Loading file!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}

		}
		void createPageStyleSheet()
		{
			createStyleSheet("PAWSStarterKitMaster.css", getPageStyleFile());
		}
		void createWriterStyleSheet()
		{
			createStyleSheet("WriteUpMaster.css", getWriterStyleFile());
		}
		void createStyleSheet(string strMasterCss, string strUserStyleFile)
		{
			const string strStyles = @"Styles\";
			try
			{
				string strMasterCssPath = Path.Combine(m_strAppPath, strStyles);
				string strMasterCssFile = Path.Combine(strMasterCssPath, strMasterCss);
				// copy the master
				File.Copy(strMasterCssFile, strUserStyleFile, true);
				StreamWriter sw = new StreamWriter(strUserStyleFile, true);
				// append the font info
				sw.WriteLine (".vernacular {");
				sw.Write ("font-family: ");
				sw.Write (getXmlElementContent("//language/font/fontName"));
				sw.WriteLine (";");
				sw.Write ("font-size: ");
				sw.Write (getXmlElementContent("//language/font/fontSize"));
				sw.WriteLine ("pt;");
				sw.Write ("color: ");
				sw.Write (getXmlElementContent("//language/font/fontColor"));
				sw.WriteLine (";");
				if ("True" == getXmlElementAttribute("//language/font/@bold"))
					sw.WriteLine ("font-weight: bold;");
				if ("True" == getXmlElementAttribute("//language/font/@italic"))
					sw.WriteLine ("font-style: italic;");
				bool bFontUnderline = ("True" == getXmlElementAttribute("//language/font/@under"));
				bool bFontStrikeout = ("True" == getXmlElementAttribute("//language/font/@strike"));
				if (bFontUnderline || bFontStrikeout)
				{
					sw.Write ("text-decoration: ");
					if (bFontUnderline)
						sw.Write ("underline ");
					if (bFontStrikeout)
						sw.Write ("line-through");
					sw.WriteLine (";");
				}
				sw.WriteLine ("}");
				sw.Close();
				// copy the background gif
				File.Copy(Path.Combine(strMasterCssPath, m_strBackgroundGif),
					Path.Combine(m_strStylesPath, m_strBackgroundGif), true);
			}
			catch (Exception exc)
			{
				MessageBox.Show("Error in creating style sheet: " + exc.Message,
					"Create Style Sheet", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}
		}
		string getPageStyleFile()
		{
			return Path.Combine(m_strStylesPath,
				m_strLanguageAbbreviation + m_strPAWSStarterKitCSS);
		}
		string getWriterStyleFile()
		{
			return Path.Combine(Path.GetDirectoryName(m_strUserWriterFile),
				m_strLanguageAbbreviation + m_strWriteUpCSS);
		}
		void sayGoodBye()
		{
			MessageBox.Show("Exiting program.\nGood Bye!", "Canceled Initialization",
				MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			Environment.Exit(1);
		}
		protected override void OnLoad(EventArgs ea)
		{
			base.OnLoad(ea);

			string[] astrArgs = Environment.GetCommandLineArgs();
#if CheckLangAbbrOnLoad
			MessageBox.Show("In OnLoad");
#endif // CheckLangAbbrOnLoad

			if (astrArgs.Length > 1)
			{
				if (File.Exists(astrArgs[1]))
				{
					string strFullFileName = Path.GetFullPath(astrArgs[1]);
#if CheckLangAbbrOnLoad
					MessageBox.Show("In OnLoad before loadAnswerFile");
#endif // CheckLangAbbrOnLoad
					loadAnswerFile(strFullFileName);
					showPage(Path.Combine(m_strHtmsPath, m_strInitHtm));
				}
				else
				{
					MessageBox.Show("You have invoked this program with a file name on the command line.\n" +
						"The file could not be found, however.\n" +
						"The file was: " + astrArgs[1],  "Command Line Error",
						MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
					sayGoodBye();
				}
			}
		}
	}
}
