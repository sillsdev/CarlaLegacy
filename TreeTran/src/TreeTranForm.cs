//**************************************************************************
// File: "TreeTran\TreeTranForm.cs".
//
// This file defines the TreeTranForm class, which implements the main
// TreeTran form, an MDI-parent form that contains the RuleForm and
// ParseForm.
//
// History:
//     2007-Feb-20 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
//**************************************************************************
namespace TreeTran
{
	//**********************************************************************
	/// <summary>
	/// Implements the main TreeTran form, an MDI-parent form that contains
	/// the RuleForm and ParseForm.
	/// </summary>
	public class TreeTranForm: System.Windows.Forms.Form
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		// <summary>
		// Required designer variable.
		// </summary>
		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.MenuItem moFileMenu;
		private System.Windows.Forms.MenuItem moOpenRuleFileMenu;
		private System.Windows.Forms.MenuItem moSaveRuleFileMenu;
		private System.Windows.Forms.MenuItem moSaveRuleFileAsMenu;
		private System.Windows.Forms.MenuItem moLoadParseFileSeparator;
		private System.Windows.Forms.MenuItem moLoadParseFileMenu;
		private System.Windows.Forms.MenuItem moProcessParseFileMenu;
		private System.Windows.Forms.MenuItem moExitSeparator;
		private System.Windows.Forms.MenuItem moUndoMenu;
		private System.Windows.Forms.MenuItem moCutSeparator;
		private System.Windows.Forms.MenuItem moCutMenu;
		private System.Windows.Forms.MenuItem moCopyMenu;
		private System.Windows.Forms.MenuItem moPasteMenu;
		private System.Windows.Forms.MenuItem moDeleteMenu;
		private System.Windows.Forms.MenuItem moFindMenu;
		private System.Windows.Forms.MenuItem moReplaceMenu;
		private System.Windows.Forms.MainMenu moMenu;
		private System.Windows.Forms.MenuItem moFeaturesSeparator;
		private System.Windows.Forms.MenuItem moFeaturesMenu;
		private System.Windows.Forms.MenuItem moExitMenu;
		private System.Windows.Forms.MenuItem moViewMenu;
		private System.Windows.Forms.MenuItem moRuleMenu;
		private System.Windows.Forms.MenuItem moWindowMenu;
		private System.Windows.Forms.MenuItem moHelpMenu;
		private System.Windows.Forms.MenuItem moCascadeMenu;
		private System.Windows.Forms.MenuItem moTileHorizontallyMenu;
		private System.Windows.Forms.MenuItem moTileVerticallyMenu;
		private System.Windows.Forms.MenuItem moShowMorphologyMenu;
		private System.Windows.Forms.MenuItem moAboutTreeTranMenu;
		private System.Windows.Forms.MenuItem moNewRuleSeparator;
		private System.Windows.Forms.MenuItem moFindSeparator;
		private System.Windows.Forms.MenuItem moNewRuleMenu;
		private System.Windows.Forms.MenuItem moShowFeaturesMenu;
		private System.Windows.Forms.MenuItem moFontSeparator;
		private System.Windows.Forms.MenuItem moFontMenu;
		private System.Windows.Forms.MenuItem moRenameMenu;
		private System.Windows.Forms.MenuItem moFindOnlyWithCurrentRuleMenu;
		private System.Windows.Forms.MenuItem moFindOnlyWithCurrentRuleSeparator;
		private System.Windows.Forms.MenuItem moFindOnlyInCurrentParseMenu;
		private System.Windows.Forms.MenuItem moFindMatchingBranchMenu;
		private System.Windows.Forms.MenuItem moReplaceMatchingBranchMenu;
		private System.Windows.Forms.FontDialog moFontDialog;
		private System.Windows.Forms.MenuItem moSaveParseFileAsMenu;
		private System.Windows.Forms.MenuItem moBriefHelpMenu;
		private System.Windows.Forms.MenuItem moEditMenu;

		// <summary>
		// Clean up any resources being used.
		// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		// <summary>
		// Required method for Designer support - do not modify
		// the contents of this method with the code editor.
		// </summary>
		private void InitializeComponent()
		{
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(TreeTranForm));
			this.moMenu = new System.Windows.Forms.MainMenu();
			this.moFileMenu = new System.Windows.Forms.MenuItem();
			this.moOpenRuleFileMenu = new System.Windows.Forms.MenuItem();
			this.moSaveRuleFileMenu = new System.Windows.Forms.MenuItem();
			this.moSaveRuleFileAsMenu = new System.Windows.Forms.MenuItem();
			this.moLoadParseFileSeparator = new System.Windows.Forms.MenuItem();
			this.moLoadParseFileMenu = new System.Windows.Forms.MenuItem();
			this.moSaveParseFileAsMenu = new System.Windows.Forms.MenuItem();
			this.moProcessParseFileMenu = new System.Windows.Forms.MenuItem();
			this.moExitSeparator = new System.Windows.Forms.MenuItem();
			this.moExitMenu = new System.Windows.Forms.MenuItem();
			this.moEditMenu = new System.Windows.Forms.MenuItem();
			this.moUndoMenu = new System.Windows.Forms.MenuItem();
			this.moCutSeparator = new System.Windows.Forms.MenuItem();
			this.moCutMenu = new System.Windows.Forms.MenuItem();
			this.moCopyMenu = new System.Windows.Forms.MenuItem();
			this.moPasteMenu = new System.Windows.Forms.MenuItem();
			this.moDeleteMenu = new System.Windows.Forms.MenuItem();
			this.moFeaturesSeparator = new System.Windows.Forms.MenuItem();
			this.moFeaturesMenu = new System.Windows.Forms.MenuItem();
			this.moViewMenu = new System.Windows.Forms.MenuItem();
			this.moShowFeaturesMenu = new System.Windows.Forms.MenuItem();
			this.moShowMorphologyMenu = new System.Windows.Forms.MenuItem();
			this.moFontSeparator = new System.Windows.Forms.MenuItem();
			this.moFontMenu = new System.Windows.Forms.MenuItem();
			this.moRuleMenu = new System.Windows.Forms.MenuItem();
			this.moFindMatchingBranchMenu = new System.Windows.Forms.MenuItem();
			this.moReplaceMatchingBranchMenu = new System.Windows.Forms.MenuItem();
			this.moFindOnlyWithCurrentRuleSeparator = new System.Windows.Forms.MenuItem();
			this.moFindOnlyWithCurrentRuleMenu = new System.Windows.Forms.MenuItem();
			this.moFindOnlyInCurrentParseMenu = new System.Windows.Forms.MenuItem();
			this.moNewRuleSeparator = new System.Windows.Forms.MenuItem();
			this.moNewRuleMenu = new System.Windows.Forms.MenuItem();
			this.moRenameMenu = new System.Windows.Forms.MenuItem();
			this.moWindowMenu = new System.Windows.Forms.MenuItem();
			this.moCascadeMenu = new System.Windows.Forms.MenuItem();
			this.moTileHorizontallyMenu = new System.Windows.Forms.MenuItem();
			this.moTileVerticallyMenu = new System.Windows.Forms.MenuItem();
			this.moHelpMenu = new System.Windows.Forms.MenuItem();
			this.moBriefHelpMenu = new System.Windows.Forms.MenuItem();
			this.moAboutTreeTranMenu = new System.Windows.Forms.MenuItem();
			this.moFindSeparator = new System.Windows.Forms.MenuItem();
			this.moFindMenu = new System.Windows.Forms.MenuItem();
			this.moReplaceMenu = new System.Windows.Forms.MenuItem();
			this.moFontDialog = new System.Windows.Forms.FontDialog();
			//
			// moMenu
			//
			this.moMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																				   this.moFileMenu,
																				   this.moEditMenu,
																				   this.moViewMenu,
																				   this.moRuleMenu,
																				   this.moWindowMenu,
																				   this.moHelpMenu,
																				   this.moFindSeparator,
																				   this.moFindMenu,
																				   this.moReplaceMenu});
			//
			// moFileMenu
			//
			this.moFileMenu.Index = 0;
			this.moFileMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.moOpenRuleFileMenu,
																					   this.moSaveRuleFileMenu,
																					   this.moSaveRuleFileAsMenu,
																					   this.moLoadParseFileSeparator,
																					   this.moLoadParseFileMenu,
																					   this.moSaveParseFileAsMenu,
																					   this.moProcessParseFileMenu,
																					   this.moExitSeparator,
																					   this.moExitMenu});
			this.moFileMenu.Text = "&File";
			//
			// moOpenRuleFileMenu
			//
			this.moOpenRuleFileMenu.Index = 0;
			this.moOpenRuleFileMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlO;
			this.moOpenRuleFileMenu.Text = "&Open Rule File...";
			this.moOpenRuleFileMenu.Click += new System.EventHandler(this.moOpenRuleFileMenu_Click);
			//
			// moSaveRuleFileMenu
			//
			this.moSaveRuleFileMenu.Index = 1;
			this.moSaveRuleFileMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlS;
			this.moSaveRuleFileMenu.Text = "&Save Rule File";
			this.moSaveRuleFileMenu.Click += new System.EventHandler(this.moSaveRuleFileMenu_Click);
			//
			// moSaveRuleFileAsMenu
			//
			this.moSaveRuleFileAsMenu.Index = 2;
			this.moSaveRuleFileAsMenu.Text = "Save Rule File &As...";
			this.moSaveRuleFileAsMenu.Click += new System.EventHandler(this.moSaveRuleFileAsMenu_Click);
			//
			// moLoadParseFileSeparator
			//
			this.moLoadParseFileSeparator.Index = 3;
			this.moLoadParseFileSeparator.Text = "-";
			//
			// moLoadParseFileMenu
			//
			this.moLoadParseFileMenu.Index = 4;
			this.moLoadParseFileMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlL;
			this.moLoadParseFileMenu.Text = "&Load Parse File...";
			this.moLoadParseFileMenu.Click += new System.EventHandler(this.moLoadParseFileMenu_Click);
			//
			// moSaveParseFileAsMenu
			//
			this.moSaveParseFileAsMenu.Index = 5;
			this.moSaveParseFileAsMenu.Text = "Save Parse &File As...";
			this.moSaveParseFileAsMenu.Click += new System.EventHandler(this.moSaveParseFileAsMenu_Click);
			//
			// moProcessParseFileMenu
			//
			this.moProcessParseFileMenu.Index = 6;
			this.moProcessParseFileMenu.Text = "&Process Parse File...";
			this.moProcessParseFileMenu.Click += new System.EventHandler(this.moProcessParseFileMenu_Click);
			//
			// moExitSeparator
			//
			this.moExitSeparator.Index = 7;
			this.moExitSeparator.Text = "-";
			//
			// moExitMenu
			//
			this.moExitMenu.Index = 8;
			this.moExitMenu.Text = "E&xit";
			this.moExitMenu.Click += new System.EventHandler(this.moExitMenu_Click);
			//
			// moEditMenu
			//
			this.moEditMenu.Index = 1;
			this.moEditMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.moUndoMenu,
																					   this.moCutSeparator,
																					   this.moCutMenu,
																					   this.moCopyMenu,
																					   this.moPasteMenu,
																					   this.moDeleteMenu,
																					   this.moFeaturesSeparator,
																					   this.moFeaturesMenu});
			this.moEditMenu.Text = "&Edit";
			//
			// moUndoMenu
			//
			this.moUndoMenu.Index = 0;
			this.moUndoMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlZ;
			this.moUndoMenu.Text = "&Undo";
			this.moUndoMenu.Click += new System.EventHandler(this.moUndoMenu_Click);
			//
			// moCutSeparator
			//
			this.moCutSeparator.Index = 1;
			this.moCutSeparator.Text = "-";
			//
			// moCutMenu
			//
			this.moCutMenu.Index = 2;
			this.moCutMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlX;
			this.moCutMenu.Text = "Cu&t";
			this.moCutMenu.Click += new System.EventHandler(this.moCutMenu_Click);
			//
			// moCopyMenu
			//
			this.moCopyMenu.Index = 3;
			this.moCopyMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlC;
			this.moCopyMenu.Text = "&Copy";
			this.moCopyMenu.Click += new System.EventHandler(this.moCopyMenu_Click);
			//
			// moPasteMenu
			//
			this.moPasteMenu.Index = 4;
			this.moPasteMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlV;
			this.moPasteMenu.Text = "&Paste";
			this.moPasteMenu.Click += new System.EventHandler(this.moPasteMenu_Click);
			//
			// moDeleteMenu
			//
			this.moDeleteMenu.Index = 5;
			this.moDeleteMenu.Shortcut = System.Windows.Forms.Shortcut.Del;
			this.moDeleteMenu.Text = "&Delete";
			this.moDeleteMenu.Click += new System.EventHandler(this.moDeleteMenu_Click);
			//
			// moFeaturesSeparator
			//
			this.moFeaturesSeparator.Index = 6;
			this.moFeaturesSeparator.Text = "-";
			//
			// moFeaturesMenu
			//
			this.moFeaturesMenu.Index = 7;
			this.moFeaturesMenu.Text = "&Features...";
			this.moFeaturesMenu.Click += new System.EventHandler(this.moFeaturesMenu_Click);
			//
			// moViewMenu
			//
			this.moViewMenu.Index = 2;
			this.moViewMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.moShowFeaturesMenu,
																					   this.moShowMorphologyMenu,
																					   this.moFontSeparator,
																					   this.moFontMenu});
			this.moViewMenu.Text = "&View";
			//
			// moShowFeaturesMenu
			//
			this.moShowFeaturesMenu.Index = 0;
			this.moShowFeaturesMenu.Text = "Show &Features";
			this.moShowFeaturesMenu.Click += new System.EventHandler(this.moShowFeaturesMenu_Click);
			//
			// moShowMorphologyMenu
			//
			this.moShowMorphologyMenu.Index = 1;
			this.moShowMorphologyMenu.Text = "Show &Morphology";
			this.moShowMorphologyMenu.Click += new System.EventHandler(this.moShowMorphologyMenu_Click);
			//
			// moFontSeparator
			//
			this.moFontSeparator.Index = 2;
			this.moFontSeparator.Text = "-";
			//
			// moFontMenu
			//
			this.moFontMenu.Index = 3;
			this.moFontMenu.Text = "Fon&t...";
			this.moFontMenu.Click += new System.EventHandler(this.moFontMenu_Click);
			//
			// moRuleMenu
			//
			this.moRuleMenu.Index = 3;
			this.moRuleMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.moFindMatchingBranchMenu,
																					   this.moReplaceMatchingBranchMenu,
																					   this.moFindOnlyWithCurrentRuleSeparator,
																					   this.moFindOnlyWithCurrentRuleMenu,
																					   this.moFindOnlyInCurrentParseMenu,
																					   this.moNewRuleSeparator,
																					   this.moNewRuleMenu,
																					   this.moRenameMenu});
			this.moRuleMenu.Text = "&Rule";
			//
			// moFindMatchingBranchMenu
			//
			this.moFindMatchingBranchMenu.Index = 0;
			this.moFindMatchingBranchMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlF;
			this.moFindMatchingBranchMenu.Text = "&Find Matching Branch";
			this.moFindMatchingBranchMenu.Click += new System.EventHandler(this.moFindMatchingBranchMenu_Click);
			//
			// moReplaceMatchingBranchMenu
			//
			this.moReplaceMatchingBranchMenu.Index = 1;
			this.moReplaceMatchingBranchMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlR;
			this.moReplaceMatchingBranchMenu.Text = "&Replace Matching Branch";
			this.moReplaceMatchingBranchMenu.Click += new System.EventHandler(this.moReplaceMatchingBranchMenu_Click);
			//
			// moFindOnlyWithCurrentRuleSeparator
			//
			this.moFindOnlyWithCurrentRuleSeparator.Index = 2;
			this.moFindOnlyWithCurrentRuleSeparator.Text = "-";
			//
			// moFindOnlyWithCurrentRuleMenu
			//
			this.moFindOnlyWithCurrentRuleMenu.Index = 3;
			this.moFindOnlyWithCurrentRuleMenu.Text = "Find Only with &Current Rule";
			this.moFindOnlyWithCurrentRuleMenu.Click += new System.EventHandler(this.moFindOnlyWithCurrentRuleMenu_Click);
			//
			// moFindOnlyInCurrentParseMenu
			//
			this.moFindOnlyInCurrentParseMenu.Index = 4;
			this.moFindOnlyInCurrentParseMenu.Text = "Find Only in Current &Parse";
			this.moFindOnlyInCurrentParseMenu.Click += new System.EventHandler(this.moFindOnlyInCurrentParseMenu_Click);
			//
			// moNewRuleSeparator
			//
			this.moNewRuleSeparator.Index = 5;
			this.moNewRuleSeparator.Text = "-";
			//
			// moNewRuleMenu
			//
			this.moNewRuleMenu.Index = 6;
			this.moNewRuleMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlN;
			this.moNewRuleMenu.Text = "&New Rule";
			this.moNewRuleMenu.Click += new System.EventHandler(this.moNewRuleMenu_Click);
			//
			// moRenameMenu
			//
			this.moRenameMenu.Index = 7;
			this.moRenameMenu.Text = "Rena&me";
			this.moRenameMenu.Click += new System.EventHandler(this.moRenameMenu_Click);
			//
			// moWindowMenu
			//
			this.moWindowMenu.Index = 4;
			this.moWindowMenu.MdiList = true;
			this.moWindowMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																						 this.moCascadeMenu,
																						 this.moTileHorizontallyMenu,
																						 this.moTileVerticallyMenu});
			this.moWindowMenu.Text = "&Window";
			//
			// moCascadeMenu
			//
			this.moCascadeMenu.Index = 0;
			this.moCascadeMenu.Text = "&Cascade";
			this.moCascadeMenu.Click += new System.EventHandler(this.moCascadeMenu_Click);
			//
			// moTileHorizontallyMenu
			//
			this.moTileHorizontallyMenu.Index = 1;
			this.moTileHorizontallyMenu.Text = "Tile &Horizontally";
			this.moTileHorizontallyMenu.Click += new System.EventHandler(this.moTileHorizontallyMenu_Click);
			//
			// moTileVerticallyMenu
			//
			this.moTileVerticallyMenu.Index = 2;
			this.moTileVerticallyMenu.Text = "Tile &Vertically";
			this.moTileVerticallyMenu.Click += new System.EventHandler(this.moTileVerticallyMenu_Click);
			//
			// moHelpMenu
			//
			this.moHelpMenu.Index = 5;
			this.moHelpMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																					   this.moBriefHelpMenu,
																					   this.moAboutTreeTranMenu});
			this.moHelpMenu.Text = "&Help";
			//
			// moBriefHelpMenu
			//
			this.moBriefHelpMenu.Index = 0;
			this.moBriefHelpMenu.Shortcut = System.Windows.Forms.Shortcut.F1;
			this.moBriefHelpMenu.Text = "&Brief Help...";
			this.moBriefHelpMenu.Click += new System.EventHandler(this.moBriefHelpMenu_Click);
			//
			// moAboutTreeTranMenu
			//
			this.moAboutTreeTranMenu.Index = 1;
			this.moAboutTreeTranMenu.Text = "&About TreeTran...";
			this.moAboutTreeTranMenu.Click += new System.EventHandler(this.moAboutTreeTranMenu_Click);
			//
			// moFindSeparator
			//
			this.moFindSeparator.Enabled = false;
			this.moFindSeparator.Index = 6;
			this.moFindSeparator.Text = "---";
			//
			// moFindMenu
			//
			this.moFindMenu.Index = 7;
			this.moFindMenu.Shortcut = System.Windows.Forms.Shortcut.F2;
			this.moFindMenu.Text = "Find! (F2)";
			this.moFindMenu.Click += new System.EventHandler(this.moFindMenu_Click);
			//
			// moReplaceMenu
			//
			this.moReplaceMenu.Index = 8;
			this.moReplaceMenu.Shortcut = System.Windows.Forms.Shortcut.F3;
			this.moReplaceMenu.Text = "Replace! (F3)";
			this.moReplaceMenu.Click += new System.EventHandler(this.moReplaceMenu_Click);
			//
			// TreeTranForm
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(292, 225);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.IsMdiContainer = true;
			this.Menu = this.moMenu;
			this.Name = "TreeTranForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultBounds;
			this.Text = "TreeTran";
			this.MdiChildActivate += new System.EventHandler(this.TreeTranForm_MdiChildActivate);
			this.Load += new System.EventHandler(this.TreeTranForm_Load);
			this.Activated += new System.EventHandler(this.TreeTranForm_Activated);
			this.Leave += new System.EventHandler(this.TreeTranForm_Leave);
			this.Enter += new System.EventHandler(this.TreeTranForm_Enter);
			this.Deactivate += new System.EventHandler(this.TreeTranForm_Deactivate);

		}
		#endregion
		#endregion
		//******************************************************************
		#region [Constructor, Static Instance Property, OnClosed() Method]
		//******************************************************************
		/// <summary>
		/// The constructor is private so only one instance of this form
		/// will be loaded at a time. You can get this single instance from
		/// the Instance property.
		/// </summary>
		private TreeTranForm()
		{
			//**************************************************************
			// As required to support code generated by the Form Designer,
			// make InitializeComponent() the first call in the constructor.

			InitializeComponent();

			//**************************************************************
			// Only one instance of this form should be loaded at a time.

			Debug.Assert(moInstance == null);
		}
		//******************************************************************
		/// <summary>
		/// The single loaded instance of this form. This value is returned
		/// by the Instance property. If moInstance is null, the Instance
		/// property sets it to a new instance, created by the private
		/// constructor. When the form is closed, the OnClosed() method sets
		/// moInstance back to null.
		/// </summary>
		private static TreeTranForm moInstance = null;
		//******************************************************************
		/// <summary>
		/// Gets the single loaded instance of this form. (The private
		/// constructor is called to create this instance if one is not
		/// currently loaded.)
		/// </summary>
		public static TreeTranForm Instance
		{
			get
			{
				if (moInstance == null)
				{
					moInstance = new TreeTranForm();
				}
				return moInstance;
			}
		}
		//******************************************************************
		/// <summary>
		/// Sets moInstance back to null when the form is closed.
		/// </summary>
		protected override void OnClosed(EventArgs oArgs)
		{
			try
			{
				moInstance = null;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ShowFeatures Property]
		//******************************************************************
		/// <summary>
		/// Gets the checked state of the ShowFeaturesMenu.
		/// </summary>
		public bool ShowFeatures
		{
			get
			{
				return moShowFeaturesMenu.Checked;
			}
		}
		#endregion
		//******************************************************************
		#region [ShowMorphology Property]
		//******************************************************************
		/// <summary>
		/// Gets the checked state of the ShowMorphologyMenu.
		/// </summary>
		public bool ShowMorphology
		{
			get
			{
				return moShowMorphologyMenu.Checked;
			}
		}
		#endregion
		//******************************************************************
		#region [ViewerFont Property]
		//******************************************************************
		/// <summary>
		/// The ViewerFont property value.
		/// </summary>
		private Font moViewerFont = null;
		//******************************************************************
		/// <summary>
		/// Gets the ViewerFont property, which specifies the font for
		/// displaying linguistic data in the viewer controls. A null value
		/// specifies the default font.
		/// </summary>
		public Font ViewerFont
		{
			get
			{
				return moViewerFont;
			}
		}
		//******************************************************************
		/// <summary>
		/// Sets the ViewerFont property.
		/// </summary>
		private void SetViewerFont(Font oViewerFont)
		{
			moViewerFont = oViewerFont;
		}
		#endregion
		//******************************************************************
		#region [FindOnlyWithCurrentRule Property]
		//******************************************************************
		/// <summary>
		/// Gets the checked state of the FindOnlyWithCurrentRuleMenu.
		/// </summary>
		public bool FindOnlyWithCurrentRule
		{
			get
			{
				return moFindOnlyWithCurrentRuleMenu.Checked;
			}
		}
		#endregion
		//******************************************************************
		#region [FindOnlyInCurrentParse Property]
		//******************************************************************
		/// <summary>
		/// Gets the checked state of the FindOnlyInCurrentParseMenu.
		/// </summary>
		public bool FindOnlyInCurrentParse
		{
			get
			{
				return moFindOnlyInCurrentParseMenu.Checked;
			}
		}
		#endregion
		//******************************************************************
		#region [UpdateMenu() Method]
		//******************************************************************
		/// <summary>
		/// Enables and disables menu items based on the current selection
		/// in the active control on the active form.
		/// </summary>
		public void UpdateMenu()
		{
			//**************************************************************
			// Disable all menu items.

			moOpenRuleFileMenu.Enabled = false;
			moSaveRuleFileMenu.Enabled = false;
			moSaveRuleFileAsMenu.Enabled = false;
			moLoadParseFileMenu.Enabled = false;
			moSaveParseFileAsMenu.Enabled = false;
			moProcessParseFileMenu.Enabled = false;
			moExitMenu.Enabled = false;

			moUndoMenu.Enabled = false;
			moCutMenu.Enabled = false;
			moCopyMenu.Enabled = false;
			moPasteMenu.Enabled = false;
			moDeleteMenu.Enabled = false;
			moFeaturesMenu.Enabled = false;

			moShowFeaturesMenu.Enabled = false;
			moShowMorphologyMenu.Enabled = false;
			moFontMenu.Enabled = false;

			moFindMatchingBranchMenu.Enabled = false;
			moReplaceMatchingBranchMenu.Enabled = false;
			moFindOnlyWithCurrentRuleMenu.Enabled = false;
			moFindOnlyInCurrentParseMenu.Enabled = false;
			moNewRuleMenu.Enabled = false;
			moRenameMenu.Enabled = false;

			moCascadeMenu.Enabled = false;
			moTileHorizontallyMenu.Enabled = false;
			moTileVerticallyMenu.Enabled = false;

			moBriefHelpMenu.Enabled = false;
			moAboutTreeTranMenu.Enabled = false;

			moFindMenu.Enabled = false;
			moReplaceMenu.Enabled = false;

			//**************************************************************
			// Enable menu items that are always available.

			moOpenRuleFileMenu.Enabled = true;
			moLoadParseFileMenu.Enabled = true;
			moExitMenu.Enabled = true;

			moShowFeaturesMenu.Enabled = true;
			moShowMorphologyMenu.Enabled = true;
			moFontMenu.Enabled = true;

			moFindOnlyWithCurrentRuleMenu.Enabled = true;
			moFindOnlyInCurrentParseMenu.Enabled = true;
			moNewRuleMenu.Enabled = true;

			moCascadeMenu.Enabled = true;
			moTileHorizontallyMenu.Enabled = true;
			moTileVerticallyMenu.Enabled = true;

			moBriefHelpMenu.Enabled = true;
			moAboutTreeTranMenu.Enabled = true;

			//**************************************************************
			// Only check the MDI-child forms if the MDI parent is the
			// active form.

			if (ActiveForm != this)
			{
				return;
			}

			//**************************************************************
			// Enable menus that are only available when the RuleForm is
			// visible.

			if (RuleForm.Instance.Visible)
			{
				RuleForm oForm = RuleForm.Instance;

				moSaveRuleFileMenu.Enabled = true;
				moSaveRuleFileAsMenu.Enabled = true;
				moProcessParseFileMenu.Enabled
					= oForm.CanProcessParseFile();
				moFindMatchingBranchMenu.Enabled
					= oForm.CanFindMatchingBranch();
				moReplaceMatchingBranchMenu.Enabled
					= oForm.CanReplaceMatchingBranch();
			}

			//**************************************************************
			// Enable menus that are only available when the ParseForm is
			// visible.

			if (ParseForm.Instance.Visible)
			{
				moSaveParseFileAsMenu.Enabled = true;
			}

			//**************************************************************
			// Enable menus that are only available when the RuleForm is
			// the active MDI child.

			if (ActiveMdiChild == RuleForm.Instance)
			{
				RuleForm oForm = RuleForm.Instance;

				moUndoMenu.Enabled = oForm.CanUndo();
				moCutMenu.Enabled = oForm.CanCut();
				moCopyMenu.Enabled = oForm.CanCopy();
				moPasteMenu.Enabled = oForm.CanPaste();
				moDeleteMenu.Enabled = oForm.CanDelete();
				moFeaturesMenu.Enabled = oForm.CanOpenFeatures();
				moRenameMenu.Enabled = oForm.CanRenameRule();
			}

			//**************************************************************
			// Enable menus that are only available when the ParseForm is
			// the active MDI child.

			if (ActiveMdiChild == ParseForm.Instance)
			{
				ParseForm oForm = ParseForm.Instance;

				moUndoMenu.Enabled = oForm.CanUndo();
				moCutMenu.Enabled = oForm.CanCut();
				moCopyMenu.Enabled = oForm.CanCopy();
				moPasteMenu.Enabled = oForm.CanPaste();
				moDeleteMenu.Enabled = oForm.CanDelete();
				moFeaturesMenu.Enabled = oForm.CanOpenFeatures();
			}

			//**************************************************************
			// Set the enabled state of the Find and Replace menu items
			// (which are like a tool-bar shortcuts) to match the enable
			// state of the corresponding FindMatchingBranch and
			// ReplaceMatchingBranch menu items.

			moFindMenu.Enabled = moFindMatchingBranchMenu.Enabled;
			moReplaceMenu.Enabled = moReplaceMatchingBranchMenu.Enabled;
		}
		#endregion
		//******************************************************************

		// FORM EVENTS

		//******************************************************************
		#region [Load Event Handler]
		//******************************************************************
		/// <summary>
		/// Checks the command-line arguments. If the rule, parse and output
		/// file names are all given, the program is started in batch mode:
		/// the rules are used to process the parse file and write to the
		/// output file. Otherwise, the program is started in interactive
		/// mode: rules and parses are loaded for editing if their file
		/// names are given.
		/// </summary>
		private void TreeTranForm_Load(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Open the rule file, if it was given as a command-line
				// argument. Otherwise, show a blank new rule in the empty
				// rule list.

				if ((TreeTranMain.RuleFileName != null)
					&& (TreeTranMain.RuleFileName != ""))
				{
					RuleForm.Instance.OpenRuleFile(
						TreeTranMain.RuleFileName);
				}
				else
				{
					RuleForm.Instance.AddNewRule();
				}

				//**********************************************************
				// If the parse input and parse output files were both given
				// as command-line arguments, use the rules to process the
				// parse input file and write the parse output file. Show
				// the TreeTran form before processing starts, and close the
				// form when processing is finished.

				if ((TreeTranMain.ParseFileName != null)
					&& (TreeTranMain.ParseFileName != "")
					&& (TreeTranMain.OutputFileName != null)
					&& (TreeTranMain.OutputFileName != ""))
				{
					Show();
					RuleForm.Instance.ProcessParseFileAndClose(
						TreeTranMain.ParseFileName,
						TreeTranMain.OutputFileName);
					Close();
					return;
				}

				//**********************************************************
				// Open the parse file, if it was given as a command-line
				// argument.

				if ((TreeTranMain.ParseFileName != null)
					&& (TreeTranMain.ParseFileName != ""))
				{
					ParseForm.Instance.LoadParseFile(
						TreeTranMain.ParseFileName);
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Activated and Deactivate Event Handlers]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active form changes.
		/// </summary>
		private void TreeTranForm_Activated(object oSender,EventArgs oArgs)
		{
			try
			{
				UpdateMenu();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active form changes.
		/// </summary>
		private void TreeTranForm_Deactivate(object oSender,EventArgs oArgs)
		{
			try
			{
				UpdateMenu();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active form changes.
		/// </summary>
		private void TreeTranForm_Enter(object oSender,EventArgs oArgs)
		{
			try
			{
				UpdateMenu();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active form changes.
		/// </summary>
		private void TreeTranForm_Leave(object oSender,EventArgs oArgs)
		{
			try
			{
				UpdateMenu();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [MdiChildActivate Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active form changes.
		/// </summary>
		private void TreeTranForm_MdiChildActivate(object oSender,
			EventArgs oArgs)
		{
			try
			{
				UpdateMenu();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************

		// CONTROL EVENTS

		//******************************************************************
		#region [OpenRuleFileMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Displays the open-file dialog so the user can select a rule file
		/// to open.
		/// </summary>
		private void moOpenRuleFileMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				RuleForm.Instance.OpenRuleFile();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [SaveRuleFileMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Saves the tree-transfer rules to a file.
		/// </summary>
		private void moSaveRuleFileMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				RuleForm.Instance.SaveRuleFile();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [SaveRuleFileAsMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Displays the save-file dialog so the user can specify a file to
		/// which the tree-transfer rules will be written.
		/// </summary>
		private void moSaveRuleFileAsMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				RuleForm.Instance.SaveRuleFileAs();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [LoadParseFileMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Displays the open-file dialog so the user can select a parse
		/// file to load.
		/// </summary>
		private void moLoadParseFileMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				ParseForm.Instance.LoadParseFile();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [SaveParseFileAsMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Displays the save-file dialog so the user can specify a file to
		/// which the displayed parses will be written.
		/// </summary>
		private void moSaveParseFileAsMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				ParseForm.Instance.SaveParseFileAs();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ProcessParseFileMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Prompts the user for an input parse file and an output parse
		/// file. Uses the displayed rules to process the input parse file
		/// and write the output parse file.
		/// </summary>
		private void moProcessParseFileMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				RuleForm.Instance.ProcessParseFile();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ExitMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Closes the MDI form to shut down the application.
		/// </summary>
		private void moExitMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Close();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [UndoMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Undoes the last edit operation in the active control.
		/// </summary>
		private void moUndoMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				if (ActiveMdiChild == RuleForm.Instance)
				{
					RuleForm.Instance.Undo();
					return;
				}
				if (ActiveMdiChild == ParseForm.Instance)
				{
					ParseForm.Instance.Undo();
					return;
				}
				Debug.Fail("Menu should be disabled.");
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [CutMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Cuts the current selection from the active control to the
		/// clipboard.
		/// </summary>
		private void moCutMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				if (ActiveMdiChild == RuleForm.Instance)
				{
					RuleForm.Instance.Cut();
					return;
				}
				if (ActiveMdiChild == ParseForm.Instance)
				{
					ParseForm.Instance.Cut();
					return;
				}
				Debug.Fail("Menu should be disabled.");
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [CopyMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Copies the current selection from the active control to the
		/// clipboard.
		/// </summary>
		private void moCopyMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				if (ActiveMdiChild == RuleForm.Instance)
				{
					RuleForm.Instance.Copy();
					return;
				}
				if (ActiveMdiChild == ParseForm.Instance)
				{
					ParseForm.Instance.Copy();
					return;
				}
				Debug.Fail("Menu should be disabled.");
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [PasteMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Pastes the current contents of the clipboard into the active
		/// control.
		/// </summary>
		private void moPasteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				if (ActiveMdiChild == RuleForm.Instance)
				{
					RuleForm.Instance.Paste();
					return;
				}
				if (ActiveMdiChild == ParseForm.Instance)
				{
					ParseForm.Instance.Paste();
					return;
				}
				Debug.Fail("Menu should be disabled.");
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [DeleteMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Deletes the current selection from the active control.
		/// </summary>
		private void moDeleteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				if (ActiveMdiChild == RuleForm.Instance)
				{
					RuleForm.Instance.Delete();
					return;
				}
				if (ActiveMdiChild == ParseForm.Instance)
				{
					ParseForm.Instance.Delete();
					return;
				}
				Debug.Fail("Menu should be disabled.");
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FeaturesMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Opens the FeaturesForm to display the syntax features of the
		/// selected node in the active tree-viewer control.
		/// </summary>
		private void moFeaturesMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				if (ActiveMdiChild == RuleForm.Instance)
				{
					RuleForm.Instance.OpenFeatures();
					return;
				}
				if (ActiveMdiChild == ParseForm.Instance)
				{
					ParseForm.Instance.OpenFeatures();
					return;
				}
				Debug.Fail("Menu should be disabled.");
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ShowFeaturesMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Toggles the checked state of the ShowFeaturesMenu and then
		/// updates the ShowFeatures property of the ParseForm.
		/// </summary>
		private void moShowFeaturesMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				if (moShowFeaturesMenu.Checked)
				{
					moShowFeaturesMenu.Checked = false;
				}
				else
				{
					moShowFeaturesMenu.Checked = true;
				}
				ParseForm.Instance.ShowFeatures = ShowFeatures;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ShowMorphologyMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Toggles the checked state of the ShowMorphologyMenu and then
		/// updates the ShowMorphology property of the ParseForm.
		/// </summary>
		private void moShowMorphologyMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				if (moShowMorphologyMenu.Checked)
				{
					moShowMorphologyMenu.Checked = false;
				}
				else
				{
					moShowMorphologyMenu.Checked = true;
				}
				ParseForm.Instance.ShowMorphology = ShowMorphology;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FontMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Displays the font dialog so the user can select the font for
		/// displaying linguistic data in the viewer controls.
		/// </summary>
		private void moFontMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If current ViewerFont is null, get the default font from
				// the RuleForm.

				if (ViewerFont == null)
				{
					moFontDialog.Font = RuleForm.Instance.ViewerFont;
				}
				else
				{
					moFontDialog.Font = ViewerFont;
				}

				//**********************************************************
				// Display the Font dialog so the user can select a font.

				moFontDialog.FontMustExist = true;
				DialogResult iResult = moFontDialog.ShowDialog();
				if (iResult == DialogResult.OK)
				{
					//******************************************************
					// Use the selected font to set the ViewerFont property
					// on this form and on the MDI child forms.

					SetViewerFont(moFontDialog.Font);
					RuleForm.Instance.ViewerFont = ViewerFont;
					ParseForm.Instance.ViewerFont = ViewerFont;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FindMatchingBranchMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Finds the next parse-tree branch that matches the pattern.
		/// </summary>
		private void moFindMatchingBranchMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				RuleForm.Instance.FindMatchingBranch();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ReplaceMatchingBranchMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Replaces the parse-tree branch that matches the pattern.
		/// </summary>
		private void moReplaceMatchingBranchMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				RuleForm.Instance.ReplaceMatchingBranch();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FindOnlyWithCurrentRuleMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Toggles the checked state of the FindOnlyWithCurrentRuleMenu.
		/// </summary>
		private void moFindOnlyWithCurrentRuleMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				if (moFindOnlyWithCurrentRuleMenu.Checked)
				{
					moFindOnlyWithCurrentRuleMenu.Checked = false;
				}
				else
				{
					moFindOnlyWithCurrentRuleMenu.Checked = true;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FindOnlyInCurrentParseMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Toggles the checked state of the FindOnlyInCurrentParseMenu.
		/// </summary>
		private void moFindOnlyInCurrentParseMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				if (moFindOnlyInCurrentParseMenu.Checked)
				{
					moFindOnlyInCurrentParseMenu.Checked = false;
				}
				else
				{
					moFindOnlyInCurrentParseMenu.Checked = true;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [NewRuleMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Adds a new rule to the list of tree-transfer rules.
		/// </summary>
		private void moNewRuleMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				RuleForm.Instance.AddNewRule();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [RenameMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Lets the user edit the name of the selected rule.
		/// </summary>
		private void moRenameMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				if (ActiveMdiChild == RuleForm.Instance)
				{
					RuleForm.Instance.RenameRule();
					return;
				}
				Debug.Fail("Menu should be disabled.");
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [CascadeMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Cascades child windows.
		/// </summary>
		private void moCascadeMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				LayoutMdi(MdiLayout.Cascade);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [TileHorizontallyMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Tiles child windows horizontally.
		/// </summary>
		private void moTileHorizontallyMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				LayoutMdi(MdiLayout.TileHorizontal);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [TileVerticallyMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Tiles child windows vertically.
		/// </summary>
		private void moTileVerticallyMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				LayoutMdi(MdiLayout.TileVertical);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [BriefHelpMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Displays the help form.
		/// </summary>
		private void moBriefHelpMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				HelpForm.Instance.Owner = this;
				HelpForm.Instance.Show();
				HelpForm.Instance.Activate();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [AboutTreeTranMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Displays the program's version information.
		/// </summary>
		private void moAboutTreeTranMenu_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				string sCaption = "About TreeTran";
				string sMessage = "TreeTran version information:";

				//**********************************************************
				// Get the version information associated with the program's
				// executable file.

				FileVersionInfo oFileVersionInfo = FileVersionInfo
					.GetVersionInfo(Application.ExecutablePath);

				//**********************************************************
				// Get the comments from the AssemblyDescription attribute.

				string sComments = oFileVersionInfo.Comments;
				if (sComments.Trim() != "")
				{
					sMessage = sMessage
						+ Environment.NewLine + Environment.NewLine
						+ "Comments: " + sComments;
				}

				//**********************************************************
				// Get the version from the AssemblyVersion attribute.

				string sVersion = oFileVersionInfo.FileVersion;
				sMessage = sMessage
					+ Environment.NewLine + Environment.NewLine
					+ "Version: " + sVersion;

				//**********************************************************
				// Get the copyright from the AssemblyCopyright attribute.

				string sCopyright = oFileVersionInfo.LegalCopyright;
				if (sCopyright.Trim() != "")
				{
					sMessage = sMessage
						+ Environment.NewLine + Environment.NewLine
						+ "Copyright: " + sCopyright;
				}

				//**********************************************************
				// Display the version information in a message box.

				MessageBox.Show(sMessage,sCaption,MessageBoxButtons.OK,
					MessageBoxIcon.Information);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FindMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Clicks the FindMatchingBranch menu (like a tool-bar shortcut to
		/// the FindMatchingBranchMenu).
		/// </summary>
		private void moFindMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				moFindMatchingBranchMenu.PerformClick();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ReplaceMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Clicks the ReplaceMatchingBranch menu (like a tool-bar shortcut
		/// to the ReplaceMatchingBranchMenu).
		/// </summary>
		private void moReplaceMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				moReplaceMatchingBranchMenu.PerformClick();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************

		// ERROR HANDLING

		//******************************************************************
		#region [Static ShowException() and LogException() Methods]
		//******************************************************************
		/// <summary>
		/// Shows the user the message from the given exception object.
		/// </summary>
		private static void ShowException(Exception oException)
		{
			try
			{
				LogException(oException);
				MessageBox.Show(oException.Message,"Error");
			}
			catch
			{
				Debug.Fail("ShowException() failed.");
			}
		}
		//******************************************************************
		/// <summary>
		/// Logs the message from the given exception object.
		/// </summary>
		private static void LogException(Exception oException)
		{
			try
			{
				Debug.WriteLine("Error: " + oException.Message);
				Debug.WriteLine(oException.StackTrace);
			}
			catch
			{
				Debug.Fail("LogException() failed.");
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
