using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Diagnostics;
using Microsoft.Win32;
using System.Xml.Serialization;
using System.IO;
using System.Threading;

// Note: window positioning registry code taken from
// Petzold, Charles. 2002. Programming Windows in C#. Pages 850-851.

namespace LingTree
{
	/// <summary>
	/// A Linguistic Tree Application.
	/// </summary>
	public class LingTreeApp : Form
	{
		public static string m_strRegKey = "Software\\SIL\\LingTree";
		const string m_strLastTreeFile = "LastTreeFile";
		const string m_strLocationX = "LocationX";
		const string m_strLocationY = "LocationY";
		const string m_strSizeHeight = "SizeHeight";
		const string m_strSizeWidth = "SizeWidth";
		const string m_strWindowState = "WindowState";
		const string m_strStatusBarChecked = "StatusBarChecked";
		const string m_strToolBarChecked = "ToolBarChecked";
		const string m_strDescriptionBoxHeight = "DescriptionBoxHeight";
		const string m_strLexGlossGapAdjustment = "LexGlossGapAdjustment";
		const string m_strVerticalGap = "VerticalGap";
		const string m_strHorizontalGap = "HorizontalGap";
		const string m_strInitialXCoord = "InitialXCoord";
		const string m_strInitialYCoord = "InitialYCoord";
		const string m_strNTFontFace = "NTFontFace";
		const string m_strNTFontSize = "NTFontSize";
		const string m_strNTFontStyle = "NTFontStyle";
		const string m_strLexFontFace = "LexFontFace";
		const string m_strLexFontSize = "LexFontSize";
		const string m_strLexFontStyle = "LexFontStyle";
		const string m_strGlossFontFace = "GlossFontFace";
		const string m_strGlossFontSize = "GlossFontSize";
		const string m_strGlossFontStyle = "GlossFontStyle";
		const string m_strNTColor = "NTColor";
		const string m_strLexColor = "LexColor";
		const string m_strGlossColor = "GlossColor";
		const string m_strTreeBackgroundColor = "TreeBackgroundColor";
		const string m_strTreeLinesColor = "TreeLinesColor";
		const string m_strTreeLineWidth = "TreeLineWidth";
		const string m_strCustomColor = "CustomColor";
		const string m_strTrySmoothing = "TrySmoothing";
		const string m_strTryPixelOffset = "TryPixelOffset";
		const string m_strShowFlatView = "ShowFlatView";
		const string m_strUseAsDefaults = "UseAsDefaults";
		const string m_strUseBmp = "UseBmp";
		const string m_strUseEmf = "UseEmf";
		const string m_strUseGif = "UseGif";
		const string m_strUseJpg = "UseJpg";
		const string m_strUsePng = "UsePng";
		const string m_strUseTif = "UseTif";

		const string m_strNewDescriptionMessage = "Enter the tree description here.";
		private const string m_strTreeFileFilter = "Linguistic Tree (*.tre)|*.tre|" +
			"All Files (*.*)|*.*";
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private Metafile mf;
		private bool m_bIsDirty;
		private const string m_strProgName = "Ling Tree";

		private Rectangle m_RectNormal;

		private LingTreeTree tree;
		private RichTextBox rtbTreeDescription;
		private RichTextBox rtbTemp;
		private Panel pnlTree;
		private Panel pnlForTree;
		private MenuItem miFileNew;
		private MenuItem miFileOpen;
		private MenuItem miFileClose;
		private MenuItem miFileSave;
		private MenuItem miFileSaveAs;
		private MenuItem miFileSaveFormats;
		private MenuItem miFileExit;
		private MenuItem miEditUndo;
		private MenuItem miEditRedo;
		private MenuItem miEditCut;
		private MenuItem miEditCopy;
		private MenuItem miEditPaste;
		private MenuItem miTreeProcessDescription;
		private MenuItem miTreeParameters;
		private MenuItem miViewToolBar;
		private MenuItem miViewStatusBar;
		private MenuItem miHelpQuickRefGuide;
		private MenuItem miHelpTopics;
		private MenuItem miHelpAbout;

		private ToolBar tbar;
		private bool m_bViewToolBarChecked = true;
		private StatusBar sb;
		private bool m_bViewStatusBarChecked = true;

		private DlgQuickReferenceGuideHelp dlgQuickReferenceGuide;
		private DlgHelpTopics dlgHelpTopics;

		private string m_strTreeFile;
		private int m_iDescriptionBoxHeight = 100;
		private int m_iLexGlossGapAdjustment = 0;
		private int m_iVerticalGap = 300;
		private int m_iHorizontalGap = 300;
		private int m_iInitialXCoord = 100;
		private int m_iInitialYCoord = 100;
		private Font m_fntNTFont = new Font(new FontFamily(GenericFontFamilies.Monospace), 12);
		private Font m_fntLexFont = new Font(new FontFamily(GenericFontFamilies.Monospace), 12);
		private Font m_fntGlossFont = new Font(new FontFamily(GenericFontFamilies.Monospace), 12);
		private Color m_clrNTColor = Color.Black;
		private Color m_clrLexColor = Color.Blue;
		private Color m_clrGlossColor = Color.Green;
		private Color m_clrTreeBackgroundColor = SystemColors.Window;
		private Color m_clrTreeLinesColor = SystemColors.ControlText;
		private double m_dTreeLineWidth = 25.0;
		private bool m_bTrySmoothing = false;
		private bool m_bTryPixelOffset = false;
		private bool m_bShowFlatView = false;
		private bool m_bUseAsDefaults = false;
		private int[] m_aiCustomColors = new int[16];
		private bool m_bUseBmp = false;
		private bool m_bUseEmf = true;
		private bool m_bUseGif = false;
		private bool m_bUseJpg = false;
		private bool m_bUsePng = true;
		private bool m_bUseTif = false;

		private Font m_fntSynTagmeme = SystemInformation.MenuFont;
		private Color m_clrSynTagmeme = SystemColors.ControlText;

		public LingTreeApp(string strInitFileName)
		{
			BackColor = SystemColors.Window;
			ForeColor = SystemColors.WindowText;
			ResizeRedraw = true;

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

			// Allow handling of user closing the form
			this.Closing += new CancelEventHandler(LingTreeAppOnClosing);

			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			pnlForTree = new Panel();
			pnlForTree.Parent = this;
			pnlForTree.Dock = DockStyle.Fill;
			pnlForTree.AutoScroll = true;

			pnlTree = new Panel();
			pnlTree.Parent = pnlForTree;
			pnlTree.Dock = DockStyle.None;
			pnlTree.AutoScroll = true;
			pnlTree.Paint += new PaintEventHandler(TreePanelOnPaint);
			pnlTree.Size = new Size(10, 10);  // give it an initial size
			pnlTree.Location = new Point(0, 0);

			Splitter split = new Splitter();
			split.Parent = this;
			split.Dock = DockStyle.Top;
			split.BackColor = SystemColors.ScrollBar;

			rtbTreeDescription = new RichTextBox();
			rtbTreeDescription.Parent = this;
			rtbTreeDescription.Dock = DockStyle.Top;
			rtbTreeDescription.Height = m_iDescriptionBoxHeight;
			rtbTreeDescription.BorderStyle = BorderStyle.Fixed3D;
			rtbTreeDescription.KeyUp += new KeyEventHandler(DescriptionOnKeyUp);
			rtbTreeDescription.TextChanged += new EventHandler(DescriptionOnTextChanged);

			InitMenu();
			InitToolBar();
			InitStatusBar();
			AutoScroll = true;

			// create the tree with all the right parameters
			tree = new LingTreeTree();
			tree.GlossColor = Color.Green;
			tree.NTColor = Color.Red;
			tree.LexColor = Color.Blue;

			if (strInitFileName != null)
			{
				m_strTreeFile = strInitFileName;
			}
			if (File.Exists(m_strTreeFile))
			{
				loadTree();
				rtbTreeDescription.Text = tree.Description;
				tree.ParseTreeDescription();
				setFontsInTreeDescription();
			}
			else
			{
				if ((strInitFileName != null) &&
					(DialogResult.OK == MessageBox.Show(m_strTreeFile + " could not be found!  Please navigate to where it is located or click on Cancel to start a new tree description.", "Initial File Not Found!", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation)))
				{
					MenuFileOpenOnClick(null, null);
				}
				else
				{
					rtbTreeDescription.Text = m_strNewDescriptionMessage;
					rtbTreeDescription.SelectAll();
				}
			}
			setIsDirty(false);
			// also allocate the temporary/work RichTextBox
			rtbTemp = new RichTextBox();
			// set position on screen
			m_RectNormal = DesktopBounds;
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

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(LingTreeApp));
			SuspendLayout();
			//
			// LingTreeApp
			//
			//AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			Controls.AddRange(new System.Windows.Forms.Control[] {
																		 });
			Icon =  new Icon(GetType(), "LingTree.ico");
			Name = "LingTreeApp";
			ResumeLayout(false);
		}
		#endregion
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
			miFileNew = new MenuItem("&New");
			miFileNew.Click += new EventHandler(MenuFileNewOnClick);
			miFileNew.Shortcut = Shortcut.CtrlN;
			mMenu.MenuItems[index].MenuItems.Add(miFileNew);

			// File Open
			miFileOpen = new MenuItem("&Open...");
			miFileOpen.Click += new EventHandler(MenuFileOpenOnClick);
			miFileOpen.Shortcut = Shortcut.CtrlO;
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
			miFileSave.Shortcut = Shortcut.CtrlS;
			mMenu.MenuItems[index].MenuItems.Add(miFileSave);

			// File Save As
			miFileSaveAs = new MenuItem("Save&As...");
			miFileSaveAs.Click += new EventHandler(MenuFileSaveAsOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miFileSaveAs);

			// File Save Formats
			miFileSaveFormats = new MenuItem("Set Save &Formats...");
			miFileSaveFormats.Click += new EventHandler(MenuFileSaveFormatsOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miFileSaveFormats);

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

			// Edit Undo
			miEditUndo = new MenuItem("&Undo");
			miEditUndo.Click += new EventHandler(MenuEditUndoOnClick);
			miEditUndo.Shortcut = Shortcut.CtrlZ;
			mMenu.MenuItems[index].MenuItems.Add(miEditUndo);

			// Edit Redo
			miEditRedo = new MenuItem("&Redo");
			miEditRedo.Click += new EventHandler(MenuEditRedoOnClick);
			miEditRedo.Shortcut = Shortcut.CtrlY;
			mMenu.MenuItems[index].MenuItems.Add(miEditRedo);

			// Horizontal line
			mi = new MenuItem("-");
			mMenu.MenuItems[index].MenuItems.Add(mi);

			// Edit Cut
			miEditCut = new MenuItem("Cu&t");
			miEditCut.Click += new EventHandler(MenuEditCutOnClick);
			miEditCut.Shortcut = Shortcut.CtrlX;
			mMenu.MenuItems[index].MenuItems.Add(miEditCut);

			// Edit Copy
			miEditCopy = new MenuItem("&Copy");
			miEditCopy.Click += new EventHandler(MenuEditCopyOnClick);
			miEditCopy.Shortcut = Shortcut.CtrlC;
			mMenu.MenuItems[index].MenuItems.Add(miEditCopy);

			// Edit Paste
			miEditPaste = new MenuItem("&Paste");
			miEditPaste.Click += new EventHandler(MenuEditPasteOnClick);
			miEditPaste.Shortcut = Shortcut.CtrlV;
			mMenu.MenuItems[index].MenuItems.Add(miEditPaste);

			// Tree
			mi = new MenuItem("&Tree");
			mi.Popup += new EventHandler(MenuTreeOnPopup);
			mMenu.MenuItems.Add(mi);
			index = mMenu.MenuItems.Count -1;

			// Tree Process Description
			miTreeProcessDescription = new MenuItem("Process &Description");
			miTreeProcessDescription.Click += new EventHandler(MenuTreeProcessDescriptionOnClick);
			miTreeProcessDescription.Shortcut = Shortcut.CtrlD;
			mMenu.MenuItems[index].MenuItems.Add(miTreeProcessDescription);

			// Tree Parameters
			miTreeParameters = new MenuItem("&Parameters...");
			miTreeParameters.Click += new EventHandler(MenuTreeParametersOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miTreeParameters);

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

			// Help
			mi = new MenuItem("&Help");
			mi.Popup += new EventHandler(MenuHelpOnPopup);
			mMenu.MenuItems.Add(mi);
			index = mMenu.MenuItems.Count -1;

			// Quick Reference Guide
			miHelpQuickRefGuide = new MenuItem("&Quick Reference Guide...");
			miHelpQuickRefGuide.Click += new EventHandler(MenuHelpQuickRefGuideOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miHelpQuickRefGuide);

			// Help Topics
			miHelpTopics = new MenuItem("&Help Topics...");
			miHelpTopics.Click += new EventHandler(MenuHelpTopicsOnClick);
			mMenu.MenuItems[index].MenuItems.Add(miHelpTopics);

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
		void InitToolBar()
		{
			ToolBarButton tbbNew;
			ToolBarButton tbbOpen;
			ToolBarButton tbbSave;
			ToolBarButton tbbCut;
			ToolBarButton tbbCopy;
			ToolBarButton tbbPaste;
			ToolBarButton tbbSeparator;
			ToolBarButton tbbProcessDescription;

			ImageList imglst = new ImageList();
			imglst.Images.Add(new Bitmap(GetType(), "New.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Open.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Save.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Cut.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Copy.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "Paste.bmp"));
			imglst.Images.Add(new Bitmap(GetType(), "ProcessDescription.bmp"));

			tbar = new ToolBar();
			tbar.Parent = this;
			tbar.ImageList = imglst;
			tbar.ShowToolTips = true;
			tbar.ButtonClick += new ToolBarButtonClickEventHandler(ToolBarOnClick);

			tbbNew = new ToolBarButton();
			tbbNew.ImageIndex = 0;
			tbbNew.ToolTipText = "Create a new tree (" + createShortcut(miFileNew) + ")";
			tbbNew.Tag = miFileNew;
			tbar.Buttons.Add(tbbNew);

			tbbOpen = new ToolBarButton();
			tbbOpen.ImageIndex = 1;
			tbbOpen.ToolTipText = "Open an existing tree (" + createShortcut(miFileOpen) + ")";
			tbbOpen.Tag = miFileOpen;
			tbar.Buttons.Add(tbbOpen);

			tbbSave = new ToolBarButton();
			tbbSave.ImageIndex = 2;
			tbbSave.ToolTipText = "Save the tree (" + createShortcut(miFileSave) + ")";
			tbbSave.Tag = miFileSave;
			tbar.Buttons.Add(tbbSave);

			tbbSeparator = new ToolBarButton();
			tbbSeparator.Style = ToolBarButtonStyle.Separator;
			tbar.Buttons.Add(tbbSeparator);

			tbbCut = new ToolBarButton();
			tbbCut.ImageIndex = 3;
			tbbCut.ToolTipText = "Cut (" + createShortcut(miEditCut) + ")";
			tbbCut.Tag = miEditCut;
			tbar.Buttons.Add(tbbCut);

			tbbCopy = new ToolBarButton();
			tbbCopy.ImageIndex = 4;
			tbbCopy.ToolTipText = "Copy (" + createShortcut(miEditCopy) + ")";
			tbbCopy.Tag = miEditCopy;
			tbar.Buttons.Add(tbbCopy);

			tbbPaste = new ToolBarButton();
			tbbPaste.ImageIndex = 5;
			tbbPaste.ToolTipText = "Paste (" + createShortcut(miEditPaste) + ")";
			tbbPaste.Tag = miEditPaste;
			tbar.Buttons.Add(tbbPaste);

			tbar.Buttons.Add(tbbSeparator);

			tbbProcessDescription = new ToolBarButton();
			tbbProcessDescription.ImageIndex = 6;
			tbbProcessDescription.ToolTipText = "Process the tree description (" + createShortcut(miTreeProcessDescription) + ")";
			tbbProcessDescription.Tag = miTreeProcessDescription;
			tbar.Buttons.Add(tbbProcessDescription);

			tbar.Visible = m_bViewToolBarChecked;
		}
		void InitStatusBar()
		{
			sb = new StatusBar();
			sb.Parent = this;
			sb.Text = @"Begin a tree = (; End a tree = ); Gloss = \G; Lex = \L; Triangle = \T; Omit = \O; ( = \(; ) = \); subscript = /s; super = /S";
			//sb.Height = (int)(SystemInformation.MenuHeight * .8);
			sb.Visible = m_bViewStatusBarChecked;
		}
		void MenuFileNewOnClick(object obj, EventArgs ea)
		{
			MenuFileCloseOnClick(null, null);
		}
		void MenuFileOpenOnClick(object obj, EventArgs ea)
		{
			LingTreeAppOnClosing(null, null);
			OpenFileDialog dlg = new OpenFileDialog();
			dlg.Filter = m_strTreeFileFilter;
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				m_strTreeFile = dlg.FileName;
				loadTree();
				initTree();
				tree.ParseTreeDescription();
				setIsDirty(false);
			}
		}
		void MenuFileCloseOnClick(object obj, EventArgs ea)
		{
			if (m_bIsDirty)
			{
				LingTreeAppOnClosing(null, null);
			}
			tree = new LingTreeTree();
			initTreeToDefaultValues();
			initTree();
			m_strTreeFile = null;
			tree.Description = m_strNewDescriptionMessage;
			rtbTreeDescription.Text = tree.Description;
			rtbTreeDescription.SelectAll();
			setIsDirty(false);
		}
		void MenuFileSaveOnClick(object obj, EventArgs ea)
		{
			if (!checkValidityForFileSave())
				return;
			if ((m_strTreeFile == null) ||
				(!File.Exists(m_strTreeFile)))
			{
				SaveFileDialog saveDlg = new SaveFileDialog();
				saveDlg.AddExtension = true;
				saveDlg.Title = "Tree Description File";
				saveDlg.Filter = m_strTreeFileFilter;
				// following needed, otherwise it always returns "Cancel"
				saveDlg.OverwritePrompt = false;
				if (m_strTreeFile != null)
				{
					saveDlg.InitialDirectory = Path.GetDirectoryName(m_strTreeFile);
					saveDlg.FileName = Path.GetFileNameWithoutExtension(m_strTreeFile);
				}
				if (saveDlg.ShowDialog() == DialogResult.OK)
				{
					if (Path.GetExtension(saveDlg.FileName) == "")
						saveDlg.FileName += ".tre";
					m_strTreeFile = saveDlg.FileName;
				}
				else
					return;
			}
			doFileSave();
		}
		void MenuFileSaveAsOnClick(object obj, EventArgs ea)
		{
			if (!checkValidityForFileSave())
				return;
			SaveFileDialog saveDlg = new SaveFileDialog();
			saveDlg.AddExtension = true;
			saveDlg.Title = "Tree Description File";
			saveDlg.Filter = m_strTreeFileFilter;
			// following needed, otherwise it always returns "Cancel"
			saveDlg.OverwritePrompt = false;
			if (m_strTreeFile != null)
			{
				saveDlg.InitialDirectory = Path.GetDirectoryName(m_strTreeFile);
				saveDlg.FileName = Path.GetFileNameWithoutExtension(m_strTreeFile);
			}
			if (saveDlg.ShowDialog() == DialogResult.OK)
			{
				if (Path.GetExtension(saveDlg.FileName) == "")
					saveDlg.FileName += ".tre";
				m_strTreeFile = saveDlg.FileName;
				doFileSave();
			}
		}
		void MenuFileSaveFormatsOnClick(object obj, EventArgs ea)
		{
			DlgSaveFormat fmtdlg = new DlgSaveFormat();
			fmtdlg.UseBmp = m_bUseBmp;
			fmtdlg.UseEmf = m_bUseEmf;
			fmtdlg.UseGif = m_bUseGif;
			fmtdlg.UseJpg = m_bUseJpg;
			fmtdlg.UsePng = m_bUsePng;
			fmtdlg.UseTif = m_bUseTif;
			if (fmtdlg.ShowDialog() == DialogResult.OK)
			{
				m_bUseBmp = fmtdlg.UseBmp;
				m_bUseEmf = fmtdlg.UseEmf;
				m_bUseGif = fmtdlg.UseGif;
				m_bUseJpg = fmtdlg.UseJpg;
				m_bUsePng = fmtdlg.UsePng;
				m_bUseTif = fmtdlg.UseTif;
			}
		}
		void MenuFileExitOnClick(object obj, EventArgs ea)
		{
			Close();
		}
		void MenuEditUndoOnClick(object obj, EventArgs ea)
		{
			rtbTreeDescription.Undo();
		}
		void MenuEditRedoOnClick(object obj, EventArgs ea)
		{
			rtbTreeDescription.Redo();
		}
		void MenuEditCutOnClick(object obj, EventArgs ea)
		{
			rtbTreeDescription.Cut();
		}
		void MenuEditCopyOnClick(object obj, EventArgs ea)
		{
			rtbTreeDescription.Copy();
		}
		void MenuEditPasteOnClick(object obj, EventArgs ea)
		{
			rtbTreeDescription.Paste();
			setFontsInTreeDescription();
		}
		void MenuTreeProcessDescriptionOnClick(object obj, EventArgs ea)
		{
			tree.Description = rtbTreeDescription.Text;
			if (tree.ParseTreeDescription())
			{
				pnlTree.Invalidate();
				setFontsInTreeDescription();
			}
		}
		void MenuTreeParametersOnClick(object obj, EventArgs ea)
		{
			DlgTreeParameters dlg = new DlgTreeParameters();
			dlg.UseAsDefaults = m_bUseAsDefaults;
			dlg.LexGlossGap = tree.LexGlossGapAdjustment;
			dlg.VerticalGap = tree.VerticalGap;
			dlg.HorizontalGap = tree.HorizontalGap;
			dlg.InitialXCoord = tree.InitialXCoord;
			dlg.InitialYCoord = tree.InitialYCoord;
			dlg.NTColor = tree.NTColor;
			dlg.NTFont = tree.NTFont;
			dlg.LexColor = tree.LexColor;
			dlg.LexFont = tree.LexFont;
			dlg.GlossColor = tree.GlossColor;
			dlg.GlossFont = tree.GlossFont;
			dlg.TreeBackgroundColor = tree.BackgroundColor;
			dlg.TreeLinesColor = tree.LinesColor;
			dlg.TreeLineWidth = tree.LineWidth;
			dlg.CustomColors = tree.CustomColors;
			dlg.ShowFlatView = tree.ShowFlatView;
			dlg.TrySmoothing = tree.TrySmoothing;
			dlg.TryPixelOffset = tree.TryPixelOffset;
			while (dlg.ShowDialog() == DialogResult.Retry)
				;
			if (dlg.DialogResult == DialogResult.OK)
			{
				setTreeParameters(dlg);
				m_bUseAsDefaults = dlg.UseAsDefaults;
				if (dlg.UseAsDefaults)
				{
					m_iLexGlossGapAdjustment = dlg.LexGlossGap;
					m_iVerticalGap = dlg.VerticalGap;
					m_iHorizontalGap = dlg.HorizontalGap;
					m_iInitialXCoord = dlg.InitialXCoord;
					m_iInitialYCoord = dlg.InitialYCoord;
					m_clrNTColor = dlg.NTColor;
					m_fntNTFont = dlg.NTFont;
					m_clrLexColor = dlg.LexColor;
					m_fntLexFont = dlg.LexFont;
					m_clrGlossColor = dlg.GlossColor;
					m_fntGlossFont = dlg.GlossFont;
					m_clrTreeBackgroundColor = dlg.TreeBackgroundColor;
					m_clrTreeLinesColor = dlg.TreeLinesColor;
					m_dTreeLineWidth = dlg.TreeLineWidth;
					m_aiCustomColors = dlg.CustomColors;
					m_bShowFlatView = dlg.ShowFlatView;
					m_bTrySmoothing = dlg.TrySmoothing;
					m_bTryPixelOffset = dlg.TryPixelOffset;
				}
				setIsDirty(true);
			}
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
		void MenuHelpAboutOnClick(object obj, EventArgs ea)
		{
			DlgAbout dlg = new DlgAbout();
			dlg.ShowDialog();
		}
		void MenuHelpQuickRefGuideOnClick(object obj, EventArgs ea)
		{
			dlgQuickReferenceGuide = new DlgQuickReferenceGuideHelp();
			foreach (Form form in OwnedForms)
			{
				if (form.Text == dlgQuickReferenceGuide.Text)
					return;   // already exists
			}
			dlgQuickReferenceGuide.Owner = this;
			dlgQuickReferenceGuide.Show();
		}
		void MenuHelpTopicsOnClick(object obj, EventArgs ea)
		{
			dlgHelpTopics = new DlgHelpTopics();
			foreach (Form form in OwnedForms)
			{
				if (form.Text == dlgHelpTopics.Text)
					return;   // already exists
			}
			dlgHelpTopics.Owner = this;
			dlgHelpTopics.Show();
		}
		void MenuFileOnPopup(object obj, EventArgs ea)
		{
		}
		void MenuEditOnPopup(object obj, EventArgs ea)
		{
			miEditUndo.Enabled = rtbTreeDescription.CanUndo;
			miEditRedo.Enabled = rtbTreeDescription.CanRedo;
			miEditCut.Enabled =
				miEditCopy.Enabled = (rtbTreeDescription.SelectionLength > 0);

			miEditPaste.Enabled = Clipboard.GetDataObject().GetDataPresent(typeof(string));
		}
		void MenuTreeOnPopup(object obj, EventArgs ea)
		{
		}
		void MenuViewOnPopup(object obj, EventArgs ea)
		{
		}
		void MenuHelpOnPopup(object obj, EventArgs ea)
		{
		}

		void TreePanelOnPaint(object obj, PaintEventArgs pea)
		{
			Graphics grfx = pea.Graphics;
			grfx.PageUnit = GraphicsUnit.Millimeter;
			grfx.PageScale = .01f;

			tree.CalculateCoordinates(grfx);
			// Adjust size
			Point[] atpt = {new Point(tree.XSize, tree.YSize)};
			grfx.TransformPoints(CoordinateSpace.Device, CoordinateSpace.Page, atpt);
			// guarantee there is something, so it will show next time (when starting
			// without any tree, the values will be zero and it never shows).
			atpt[0].X = Math.Max(10, atpt[0].X);
			atpt[0].Y = Math.Max(10, atpt[0].Y);
			pnlTree.Size = new Size(atpt[0]);
			pnlTree.BackColor = tree.BackgroundColor;

			tree.Draw(grfx, tree.LinesColor);
		}
		void ToolBarOnClick(object obj, ToolBarButtonClickEventArgs tbbcea)
		{
			ToolBarButton tbb = tbbcea.Button;
			MenuItem mi = (MenuItem) tbb.Tag;

			mi.PerformClick();
		}
		void setTitle()
		{
			Text = m_strProgName + " - " + Path.GetFileName(m_strTreeFile);
			if (m_bIsDirty)
			{
				Text += "*";
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
			// close any open help dialog boxes
			if (dlgQuickReferenceGuide != null)
			{
				dlgQuickReferenceGuide.Close();
			}
			if (dlgHelpTopics != null)
			{
				dlgHelpTopics.Close();
			}
		}
		void LingTreeAppOnClosing(object obj, CancelEventArgs cea)
		{
			if (m_bIsDirty)
			{
				if (DialogResult.Yes == MessageBox.Show("The tree description has changed.  Do you want to save it?",
					"Program Ending...", MessageBoxButtons.YesNo,
					MessageBoxIcon.Question))
					MenuFileSaveOnClick(null, null);
			}
		}
		public void initTree()
		{
			rtbTreeDescription.Text = tree.Description;
			setFontsInTreeDescription();
			pnlTree.Invalidate();
		}
		void saveAsImageFile()
		{
			if (File.Exists(m_strTreeFile))
			{
				Graphics grfx = CreateGraphics();
				IntPtr ipHdc = grfx.GetHdc();
				string strMetafile = createFileName("emf");
				mf = new Metafile(strMetafile, ipHdc);
				grfx.ReleaseHdc(ipHdc);
				grfx.Dispose();
				Graphics grfxMF = Graphics.FromImage(mf);
				grfxMF.PageUnit = GraphicsUnit.Millimeter;
				grfxMF.PageScale = .01f;
				SolidBrush brush = new SolidBrush(tree.BackgroundColor);
				PointF pf = new PointF(0f, 0f);
				if (Environment.OSVersion.Platform == PlatformID.Win32Windows)
				{   // adjust because Win98 is extra high (for some reason...)
					pf.Y = grfxMF.DpiY / .254f;
				}
				if (tree.TrySmoothing && tree.TryPixelOffset)
					tree.XSize += 6; // adjust for the pixel offset
				grfxMF.FillRectangle(brush, 0, 0, tree.XSize, tree.YSize + (int)pf.Y);
				tree.Draw(grfxMF, tree.LinesColor);
				brush.Dispose();
				grfxMF.Dispose();
				string strFile;
				if (m_bUseBmp)
				{
					strFile = createFileName("bmp");
					mf.Save(strFile, ImageFormat.Bmp);
				}
				if (m_bUseGif)
				{
					strFile = createFileName("gif");
					mf.Save(strFile, ImageFormat.Gif);
				}
				if (m_bUseJpg)
				{
					strFile = createFileName("jpg");
					mf.Save(strFile, ImageFormat.Jpeg);
				}
				if (m_bUsePng)
				{
					strFile = createFileName("png");
					mf.Save(strFile, ImageFormat.Png);
				}
				if (m_bUseTif)
				{
					strFile = createFileName("tif");
					mf.Save(strFile, ImageFormat.Tiff);
				}
				mf.Dispose();
				if (!m_bUseEmf)
					File.Delete(strMetafile);
			}
		}
		string createFileName(string strFileExtension)
		{
			string strNewFileName;
			strNewFileName = this.m_strTreeFile;
			if (Path.HasExtension(strNewFileName))
			{
				strNewFileName = strNewFileName.Substring(0, strNewFileName.Length - 3);
			}
			strNewFileName += strFileExtension;
			return strNewFileName;
		}
		void doFileSave()
		{
			try
			{
				XmlSerializer mySerializer = new XmlSerializer(tree.GetType());
				StreamWriter myWriter = new StreamWriter(m_strTreeFile);
				mySerializer.Serialize(myWriter, tree);
				myWriter.Close();
			}
			catch (Exception exc)
			{
				MessageBox.Show("An error occurred while trying to save the tree description file: " + exc.Message + " " + exc.InnerException,
					"Save error!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}
			saveAsImageFile();
			setIsDirty(false);
		}
		bool checkValidityForFileSave()
		{
			if (tree.Root == null)
			{
				MessageBox.Show("There is nothing to save!\nBe sure to process the tree first.",
					"Warning!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
				return false;
			}
			return true;
		}
		void setTreeParameters(DlgTreeParameters dlg)
		{
			if (tree != null)
			{
				tree.LexGlossGapAdjustment = dlg.LexGlossGap;
				tree.VerticalGap = dlg.VerticalGap;
				tree.HorizontalGap = dlg.HorizontalGap;
				tree.InitialXCoord = dlg.InitialXCoord;
				tree.InitialYCoord = dlg.InitialYCoord;
				tree.NTColor = dlg.NTColor;
				tree.NTFont = dlg.NTFont;
				tree.LexColor = dlg.LexColor;
				tree.LexFont = dlg.LexFont;
				tree.GlossColor = dlg.GlossColor;
				tree.GlossFont = dlg.GlossFont;
				tree.TrySmoothing = dlg.TrySmoothing;
				tree.TryPixelOffset = dlg.TryPixelOffset;
				tree.ShowFlatView = dlg.ShowFlatView;
				tree.BackgroundColor = dlg.TreeBackgroundColor;
				tree.LinesColor = dlg.TreeLinesColor;
				tree.LineWidth = dlg.TreeLineWidth;
				tree.CustomColors = dlg.CustomColors;
				pnlTree.Invalidate();  // show the changes in the tree
				setFontsInTreeDescription();
			}
		}
		void loadTree()
		{
			try
			{
				XmlSerializer mySerializer = new XmlSerializer(tree.GetType());
				StreamReader myReader = new StreamReader(m_strTreeFile);
				tree = (LingTreeTree)mySerializer.Deserialize(myReader);
				tree.setFontsFromXml();
				myReader.Close();
			}
			catch (Exception exc)
			{
				MessageBox.Show("An error occurred while trying to load the tree description file: " + exc.Message,
					"Load error!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			}
			setIsDirty(false);
		}
		void DescriptionOnKeyUp(object obj, KeyEventArgs kea)
		{
			int iCurrent = this.rtbTreeDescription.SelectionStart;
			int iIndex;
			if (kea.Shift && kea.KeyCode == Keys.D0)
			{   // pressed  ')'
				char[] acText = this.rtbTreeDescription.Text.Substring(0, iCurrent - 1).ToCharArray();
				int iCloseParen = 0;
				iIndex = iCurrent - 2;
				while (iIndex >= 0)
				{
					if (acText[iIndex] == ')')
						iCloseParen++;
					else if (acText[iIndex] == '(')
					{
						if (iCloseParen == 0)
							break;
						else
							iCloseParen--;
					}
					iIndex--;
				}
				if (iIndex >= 0)
				{
					this.rtbTreeDescription.Select(iIndex, 1);
					Thread.Sleep(750);
				}
				else
					MessageBox.Show("No matching opening parenthesis!", "Missing Open Parenthesis!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
				rtbTreeDescription.Select(Math.Max(0, iCurrent - 1), 1);
				rtbTreeDescription.SelectionFont = m_fntSynTagmeme;
				rtbTreeDescription.SelectionColor = m_clrSynTagmeme;
				rtbTreeDescription.Select(iCurrent, 0);
			}
			switch(kea.KeyCode)
			{
				case Keys.Home:
				case Keys.Left:
				case Keys.End:
				case Keys.Enter:
				case Keys.Up:
				case Keys.Down:
				case Keys.PageDown:
				case Keys.PageUp:
				case Keys.Tab:
				case Keys.Space:
				case Keys.Right:
					break;
				default:
					setFontsInTreeDescription();
					break;
			}
		}
		void DescriptionOnTextChanged(object obj, EventArgs ea)
		{
			setIsDirty(true);  // Notify user may want to save changes
		}
		void setIsDirty(bool bIsDirty)
		{
			m_bIsDirty = bIsDirty;
			setTitle();
		}
		string createShortcut(MenuItem mi)
		{
			try
			{
				string str = mi.Shortcut.ToString();
				str = str.Substring(0, str.Length -1) + "+" + str.Substring(str.Length -1);
				return str;
			}
			catch
			{
				return "";
			}
		}
		void setFontsInTreeDescription()
		{
			const int iStateSynTagmeme = 0;
			const int iStateBackSlash = 1;
			const int iStateNonTerminal = 2;
			const int iStateSynTagmemeGloss = 3;
			const int iStateBackSlashGloss = 4;
			const int iStateGloss = 5;
			const int iStateSynTagmemeLex = 6;
			const int iStateBackSlashLex = 7;
			const int iStateLex = 8;
			// We're using a finite state machine here as follows:
			//    States = the above 9 state constants
			//    Alphabet = '(', ')', '\', 'G', 'L', 'T', and all other characters
			//    Move function is defined in the StateMapping array
			//    Start state is iStateSynTagmeme
			//    Final state is iStateSynTagmeme (although we don't check it)
			// In the aiStateMapping array, each row is for a member of the alphabet
			//    and each column is the current state (in the order given in the iStateX values).
			//    The value in each cell is the state to transition to, given the character.
			int[,] aiStateMapping = {
									  // '('
				{iStateSynTagmeme, iStateNonTerminal, iStateSynTagmeme, iStateSynTagmeme, iStateGloss, iStateSynTagmeme, iStateSynTagmeme, iStateLex, iStateSynTagmeme},
									  // ')'
				{iStateSynTagmeme, iStateNonTerminal, iStateSynTagmeme, iStateSynTagmeme, iStateGloss, iStateSynTagmeme, iStateSynTagmeme, iStateLex, iStateSynTagmeme},
									  // '\'
				{iStateBackSlash, iStateNonTerminal, iStateBackSlash, iStateBackSlashGloss, iStateGloss, iStateBackSlashGloss, iStateBackSlashLex, iStateLex, iStateBackSlashLex},
									  // 'G'
				{iStateNonTerminal, iStateSynTagmemeGloss, iStateNonTerminal, iStateGloss, iStateSynTagmemeGloss, iStateGloss, iStateLex, iStateSynTagmemeGloss, iStateLex},
									  // 'T' or 'O'
				{iStateNonTerminal, iStateSynTagmeme, iStateNonTerminal, iStateGloss, iStateSynTagmemeGloss, iStateGloss, iStateLex, iStateSynTagmemeLex, iStateLex},
									  // 'L'
				{iStateNonTerminal, iStateSynTagmemeLex, iStateNonTerminal, iStateGloss, iStateSynTagmemeLex, iStateGloss, iStateLex, iStateSynTagmemeLex, iStateLex},
									  // all other characters
				{iStateNonTerminal, iStateNonTerminal, iStateNonTerminal, iStateGloss, iStateGloss, iStateGloss, iStateLex, iStateLex, iStateLex}
								  };
			const int iActionNone = 0;
			const int iActionSynTagmeme = 1;
			const int iActionSynTagmemeBack2 = 2;
			const int iActionNonTerminal = 3;
			const int iActionGloss = 4;
			const int iActionLex = 5;
			// In the aiActionMapping array, each row is for a member of the alphabet
			//    and each column is the current state (in the order given in the iStateX values).
			//    The value in each cell is the action to take when transitioning from the given state with the given character.
			//    The actions are given by the iActionX values above.
			//    The action is to set the font for a previous section of the description
			int[,] aiActionMapping = {
											 // '('
				{iActionNone, iActionSynTagmemeBack2, iActionNonTerminal, iActionNone, iActionNone, iActionGloss, iActionNone, iActionNone, iActionLex},
											 // ')'
				{iActionNone, iActionSynTagmemeBack2, iActionNonTerminal, iActionNone, iActionNone, iActionGloss, iActionNone, iActionNone, iActionLex},
											 // '\'
				{iActionNone, iActionSynTagmemeBack2, iActionNonTerminal, iActionNone, iActionNone, iActionGloss, iActionNone, iActionNone, iActionLex},
											 // 'G'
				{iActionSynTagmeme, iActionNone, iActionNone, iActionSynTagmeme, iActionSynTagmemeBack2, iActionNone, iActionSynTagmeme, iActionSynTagmemeBack2, iActionNone},
											 // 'T' or 'O'
				{iActionSynTagmeme, iActionNone, iActionNone, iActionSynTagmeme, iActionSynTagmemeBack2, iActionNone, iActionSynTagmeme, iActionSynTagmemeBack2, iActionNone},
											 // 'L'
				{iActionSynTagmeme, iActionNone, iActionNone, iActionSynTagmeme, iActionSynTagmemeBack2, iActionNone, iActionSynTagmeme, iActionSynTagmemeBack2, iActionNone},
											 // all other characters
				{iActionSynTagmeme, iActionSynTagmemeBack2, iActionNone, iActionSynTagmeme, iActionNone, iActionNone, iActionSynTagmeme, iActionNone, iActionNone}
										 };
			int iEnd = rtbTreeDescription.Text.Length;
			int iCurrentPosition = Math.Max(0, rtbTreeDescription.SelectionStart);
			int iCurrentSelectionLength = Math.Max(0, rtbTreeDescription.SelectionLength);
			RichTextBox rtbTemp = new RichTextBox();
			rtbTemp.Text = "";
			rtbTemp.Text = rtbTreeDescription.Text;;
			iEnd = rtbTemp.Text.Length;
			rtbTemp.Visible = false;
			this.rtbTreeDescription.Visible = true;
			char[] acText = rtbTemp.Text.ToCharArray();
			// remember location and length of original selection
			int iState = iStateSynTagmeme;
			int iAction = 0;
			int iFirst = 0;
			int iIndex = 0;
			while (iIndex < iEnd)
			{
					// determine action based on current state and character
					switch (acText[iIndex])
					{
						case '(':
							iAction = aiActionMapping[0, iState];
							break;
						case ')':
							iAction = aiActionMapping[1, iState];
							break;
						case '\\':
							iAction = aiActionMapping[2, iState];
							break;
						case 'G':
							iAction = aiActionMapping[3, iState];
							break;
						case 'O':
						case 'T':
							iAction = aiActionMapping[4, iState];
							break;
						case 'L':
							iAction = aiActionMapping[5, iState];
							break;
						default:
							iAction = aiActionMapping[6, iState];
							break;
					}
					// perform any needed action
				switch(iAction)
				{
					case iActionNone:
						// nothing to do
						break;
					case iActionSynTagmeme:
						rtbTemp.Select(iFirst, Math.Max(0,(iIndex - iFirst) + 1));
						rtbTemp.SelectionFont = m_fntSynTagmeme;
						rtbTemp.SelectionColor = m_clrSynTagmeme;
						iFirst = iIndex;
						break;
					case iActionSynTagmemeBack2:
						rtbTemp.Select(iFirst, Math.Max(0,(iIndex - iFirst)));
						rtbTemp.SelectionFont = m_fntSynTagmeme;
						rtbTemp.SelectionColor = m_clrSynTagmeme;
						iFirst = iIndex - 1;
						break;
					case iActionNonTerminal:
						rtbTemp.Select(iFirst, Math.Max(0,(iIndex - iFirst) + 1));
						rtbTemp.SelectionFont = tree.NTFont;
						rtbTemp.SelectionColor = tree.NTColor;
						iFirst = iIndex;
						break;
					case iActionGloss:
						rtbTemp.Select(iFirst, Math.Max(0,(iIndex - iFirst) + 1));
						rtbTemp.SelectionFont = tree.GlossFont;
						rtbTemp.SelectionColor = tree.GlossColor;
						iFirst = iIndex;
						break;
					case iActionLex:
						rtbTemp.Select(iFirst, Math.Max(0,(iIndex - iFirst) + 1));
						rtbTemp.SelectionFont = tree.LexFont;
						rtbTemp.SelectionColor = tree.LexColor;
						iFirst = iIndex;
						break;
				}
				// change state
				int iToken;
				switch (acText[iIndex])
				{
					case '(':
						iToken = 0;
						break;
					case ')':
						iToken = 1;
						break;
					case '\\':
						iToken = 2;
						break;
					case 'G':
						iToken = 3;
						break;
					case 'O':
					case 'T':
						iToken = 4;
						break;
					case 'L':
						iToken = 5;
						break;
					default:
						iToken = 6;
						break;
				}
				iState = aiStateMapping[iToken, iState];
				iIndex++;
			}
			// handle font of whatever is left
			rtbTemp.Select(iFirst, Math.Max(0,iIndex - 1));
			switch (iState)
			{
				case iStateSynTagmeme:
				case iStateBackSlash:
				case iStateSynTagmemeGloss:
				case iStateBackSlashGloss:
				case iStateSynTagmemeLex:
				case iStateBackSlashLex:
					rtbTemp.SelectionFont = m_fntSynTagmeme;
					rtbTemp.SelectionColor = m_clrSynTagmeme;
					break;
				case iStateNonTerminal:
					rtbTemp.SelectionFont = tree.NTFont;
					rtbTemp.SelectionColor = tree.NTColor;
					break;
				case iStateGloss:
					rtbTemp.SelectionFont = tree.GlossFont;
					rtbTemp.SelectionColor = tree.GlossColor;
					break;
				case iStateLex:
					rtbTemp.SelectionFont = tree.LexFont;
					rtbTemp.SelectionColor = tree.LexColor;
					break;
			}
			// reset location and length of original selection
			string strTemp = rtbTemp.Rtf;
			this.rtbTreeDescription.Rtf = strTemp;
			this.rtbTreeDescription.SelectionStart = iCurrentPosition;
			this.rtbTreeDescription.SelectionLength = iCurrentSelectionLength;
			rtbTreeDescription.Visible = true;
		}
		void retrieveRegistryInfo(RegistryKey regkey)
		{
			m_strTreeFile = (string)regkey.GetValue(m_strLastTreeFile);
			m_bViewToolBarChecked = Convert.ToBoolean((string) regkey.GetValue(m_strToolBarChecked));
			m_bViewStatusBarChecked = Convert.ToBoolean((string) regkey.GetValue(m_strStatusBarChecked));
			m_iDescriptionBoxHeight =Convert.ToInt32(regkey.GetValue(m_strDescriptionBoxHeight));
			m_iLexGlossGapAdjustment = Convert.ToInt32(regkey.GetValue(m_strLexGlossGapAdjustment));
			m_iVerticalGap = Convert.ToInt32(regkey.GetValue(m_strVerticalGap));
			m_iHorizontalGap = Convert.ToInt32(regkey.GetValue(m_strHorizontalGap));
			m_iInitialXCoord = Convert.ToInt32(regkey.GetValue(m_strInitialXCoord));
			m_iInitialYCoord = Convert.ToInt32(regkey.GetValue(m_strInitialYCoord));
			m_fntNTFont = new Font((string) regkey.GetValue(m_strNTFontFace),
				float.Parse((string) regkey.GetValue(m_strNTFontSize)),
				(FontStyle) regkey.GetValue(m_strNTFontStyle));
			m_fntLexFont = new Font((string) regkey.GetValue(m_strLexFontFace),
				float.Parse((string) regkey.GetValue(m_strLexFontSize)),
				(FontStyle) regkey.GetValue(m_strLexFontStyle));
			m_fntGlossFont = new Font((string) regkey.GetValue(m_strGlossFontFace),
				float.Parse((string) regkey.GetValue(m_strGlossFontSize)),
				(FontStyle) regkey.GetValue(m_strGlossFontStyle));
			m_clrNTColor = Color.FromArgb((int)regkey.GetValue(m_strNTColor));
			m_clrLexColor = Color.FromArgb((int)regkey.GetValue(m_strLexColor));
			m_clrGlossColor = Color.FromArgb((int)regkey.GetValue(m_strGlossColor));
			m_clrTreeBackgroundColor = Color.FromArgb((int)regkey.GetValue(m_strTreeBackgroundColor));
			m_clrTreeLinesColor = Color.FromArgb((int)regkey.GetValue(m_strTreeLinesColor));
			m_dTreeLineWidth = Convert.ToDouble(regkey.GetValue(m_strTreeLineWidth));
			for (int i = 0; i < 16; i++)
				m_aiCustomColors[i] = (int) regkey.GetValue(m_strCustomColor + i);
			m_bTrySmoothing = Convert.ToBoolean(regkey.GetValue(m_strTrySmoothing));
			m_bTryPixelOffset = Convert.ToBoolean(regkey.GetValue(m_strTryPixelOffset));
			m_bShowFlatView = Convert.ToBoolean(regkey.GetValue(m_strShowFlatView));
			m_bUseAsDefaults = Convert.ToBoolean(regkey.GetValue(m_strUseAsDefaults));
			m_bUseBmp = Convert.ToBoolean((string) regkey.GetValue(m_strUseBmp));
			m_bUseEmf = Convert.ToBoolean((string) regkey.GetValue(m_strUseEmf));
			m_bUseGif = Convert.ToBoolean((string) regkey.GetValue(m_strUseGif));
			m_bUseJpg = Convert.ToBoolean((string) regkey.GetValue(m_strUseJpg));
			m_bUsePng = Convert.ToBoolean((string) regkey.GetValue(m_strUsePng));
			m_bUseTif = Convert.ToBoolean((string) regkey.GetValue(m_strUseTif));
			// Window location
			int iX = (int)regkey.GetValue(m_strLocationX, 100);
			int iY = (int)regkey.GetValue(m_strLocationY, 100);
			int iWidth = (int)regkey.GetValue(m_strSizeWidth, 300);
			int iHeight = (int)regkey.GetValue(m_strSizeHeight, 300);
			m_RectNormal = new Rectangle(iX, iY, iWidth, iHeight);
			// Set form properties
			DesktopBounds = m_RectNormal;
			WindowState = (FormWindowState) regkey.GetValue(m_strWindowState, 0);
			StartPosition = FormStartPosition.Manual;
			setIsDirty(false);
		}
		void initTreeToDefaultValues()
		{
			tree.LexGlossGapAdjustment = m_iLexGlossGapAdjustment;
			tree.VerticalGap = m_iVerticalGap;
			tree.HorizontalGap = m_iHorizontalGap;
			tree.InitialXCoord = m_iInitialXCoord;
			tree.InitialYCoord = m_iInitialYCoord;
			tree.NTColor = m_clrNTColor;
			tree.NTFont = m_fntNTFont;
			tree.LexColor = m_clrLexColor;
			tree.LexFont = m_fntLexFont;
			tree.GlossColor = m_clrGlossColor;
			tree.GlossFont = m_fntGlossFont;
			tree.BackgroundColor = m_clrTreeBackgroundColor;
			tree.LinesColor = m_clrTreeLinesColor;
			tree.LineWidth = m_dTreeLineWidth;
			tree.CustomColors = m_aiCustomColors;
			tree.ShowFlatView = m_bShowFlatView;
			tree.TrySmoothing = m_bTrySmoothing;
			tree.TryPixelOffset = m_bTryPixelOffset;
		}
		protected override void OnMove(EventArgs ea)
		{
			base.OnMove(ea);

			if (WindowState == FormWindowState.Normal)
				m_RectNormal = DesktopBounds;
		}
		protected override void OnResize(EventArgs ea)
		{
			base.OnResize(ea);

			if (WindowState == FormWindowState.Normal)
				m_RectNormal = DesktopBounds;
		}
		void saveRegistryInfo(RegistryKey regkey)
		{
			if (m_strTreeFile != null)
				regkey.SetValue(m_strLastTreeFile, m_strTreeFile);
			regkey.SetValue(m_strToolBarChecked, miViewToolBar.Checked.ToString());
			regkey.SetValue(m_strStatusBarChecked, miViewStatusBar.Checked.ToString());
			regkey.SetValue(m_strDescriptionBoxHeight, rtbTreeDescription.Height.ToString());
			regkey.SetValue(m_strLexGlossGapAdjustment, m_iLexGlossGapAdjustment.ToString());
			regkey.SetValue(m_strVerticalGap, m_iVerticalGap.ToString());
			regkey.SetValue(m_strHorizontalGap, m_iHorizontalGap.ToString());
			regkey.SetValue(m_strInitialXCoord, m_iInitialXCoord.ToString());
			regkey.SetValue(m_strInitialYCoord, m_iInitialYCoord.ToString());
			regkey.SetValue(m_strNTFontFace, m_fntNTFont.Name);
			regkey.SetValue(m_strNTFontSize, m_fntNTFont.SizeInPoints.ToString());
			regkey.SetValue(m_strNTFontStyle, (int)m_fntNTFont.Style);
			regkey.SetValue(m_strLexFontFace, m_fntLexFont.Name);
			regkey.SetValue(m_strLexFontSize, m_fntLexFont.SizeInPoints.ToString());
			regkey.SetValue(m_strLexFontStyle, (int)m_fntLexFont.Style);
			regkey.SetValue(m_strGlossFontFace, m_fntGlossFont.Name);
			regkey.SetValue(m_strGlossFontSize, m_fntGlossFont.SizeInPoints.ToString());
			regkey.SetValue(m_strGlossFontStyle, (int)m_fntGlossFont.Style);
			regkey.SetValue(m_strNTColor, m_clrNTColor.ToArgb());
			regkey.SetValue(m_strLexColor, m_clrLexColor.ToArgb());
			regkey.SetValue(m_strGlossColor, m_clrGlossColor.ToArgb());
			regkey.SetValue(m_strTreeBackgroundColor, m_clrTreeBackgroundColor.ToArgb());
			regkey.SetValue(m_strTreeLinesColor, m_clrTreeLinesColor.ToArgb());
			regkey.SetValue(m_strTreeLineWidth, m_dTreeLineWidth.ToString());
			for (int i = 0; i < 16; i++)
				regkey.SetValue(m_strCustomColor + i, m_aiCustomColors[i]);
			regkey.SetValue(m_strTrySmoothing, m_bTrySmoothing.ToString());
			regkey.SetValue(m_strTryPixelOffset, m_bTryPixelOffset.ToString());
			regkey.SetValue(m_strShowFlatView, m_bShowFlatView.ToString());
			regkey.SetValue(m_strUseAsDefaults, m_bUseAsDefaults.ToString());
			regkey.SetValue(m_strUseBmp, m_bUseBmp.ToString());
			regkey.SetValue(m_strUseEmf, m_bUseEmf.ToString());
			regkey.SetValue(m_strUseGif, m_bUseGif.ToString());
			regkey.SetValue(m_strUseJpg, m_bUseJpg.ToString());
			regkey.SetValue(m_strUsePng, m_bUsePng.ToString());
			regkey.SetValue(m_strUseTif, m_bUseTif.ToString());
			// Window position and location
			regkey.SetValue(m_strWindowState, (int)WindowState);
			regkey.SetValue(m_strLocationX, this.m_RectNormal.X);
			regkey.SetValue(m_strLocationY, this.m_RectNormal.Y);
			regkey.SetValue(m_strSizeWidth, this.m_RectNormal.Width);
			regkey.SetValue(m_strSizeHeight, this.m_RectNormal.Height);
		}
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main(string[] args)
		{
#if DoTrace
			Trace.Listeners.Add(new TextWriterTraceListener(Console.Out));
			Trace.AutoFlush = true;
#endif
			LingTreeApp theApp;
			if (args.Length == 0)
				theApp = new LingTreeApp(null);
			else
				theApp = new LingTreeApp(args[0]);
			Application.Run(theApp);
		}
	}
}
