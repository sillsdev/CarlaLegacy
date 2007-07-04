//**************************************************************************
// File: "TreeTran\RuleForm.cs".
//
// This file defines the RuleForm class, which implements an MDI-child form
// that displays a RuleListViewer, a FindPatternViewer and a
// ReplacePatternViewer.
//
// History:
//     2006-Sep-26 David Bullock: Code complete.
//**************************************************************************
using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using TreeTranViewer;
//**************************************************************************
namespace TreeTran
{
	//**********************************************************************
	/// <summary>
	/// Implements an MDI-child form that displays a RuleListViewer, a
	/// FindPatternViewer and a ReplacePatternViewer.
	/// </summary>
	public class RuleForm: System.Windows.Forms.Form
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		private TreeTranViewer.RuleListViewer moRuleListViewer;
		private System.Windows.Forms.Splitter moVerticalSplitter;
		private System.Windows.Forms.Panel moFindPatternPanel;
		private System.Windows.Forms.Splitter moHorizontalSplitter;
		private System.Windows.Forms.Panel moReplacePatternPanel;
		private System.Windows.Forms.Label moFindPatternLabel;
		private TreeTranViewer.FindPatternViewer moFindPatternViewer;
		private System.Windows.Forms.Label moReplacePatternLabel;
		private TreeTranViewer.ReplacePatternViewer moReplacePatternViewer;
		private System.Windows.Forms.OpenFileDialog moOpenFileDialog;
		private System.Windows.Forms.SaveFileDialog moSaveFileDialog;
		private System.Windows.Forms.Timer moTimer;
		private System.ComponentModel.IContainer components;

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
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(RuleForm));
			this.moRuleListViewer = new TreeTranViewer.RuleListViewer();
			this.moVerticalSplitter = new System.Windows.Forms.Splitter();
			this.moFindPatternPanel = new System.Windows.Forms.Panel();
			this.moFindPatternViewer = new TreeTranViewer.FindPatternViewer();
			this.moFindPatternLabel = new System.Windows.Forms.Label();
			this.moHorizontalSplitter = new System.Windows.Forms.Splitter();
			this.moReplacePatternPanel = new System.Windows.Forms.Panel();
			this.moReplacePatternViewer = new TreeTranViewer.ReplacePatternViewer();
			this.moReplacePatternLabel = new System.Windows.Forms.Label();
			this.moOpenFileDialog = new System.Windows.Forms.OpenFileDialog();
			this.moSaveFileDialog = new System.Windows.Forms.SaveFileDialog();
			this.moTimer = new System.Windows.Forms.Timer(this.components);
			this.moFindPatternPanel.SuspendLayout();
			this.moReplacePatternPanel.SuspendLayout();
			this.SuspendLayout();
			//
			// moRuleListViewer
			//
			this.moRuleListViewer.BackColor = System.Drawing.SystemColors.Window;
			this.moRuleListViewer.Dock = System.Windows.Forms.DockStyle.Left;
			this.moRuleListViewer.FindOnlyInCurrentParse = false;
			this.moRuleListViewer.FindOnlyWithCurrentRule = false;
			this.moRuleListViewer.ForeColor = System.Drawing.SystemColors.WindowText;
			this.moRuleListViewer.LinkedFindPatternViewer = null;
			this.moRuleListViewer.LinkedParseListViewer = null;
			this.moRuleListViewer.LinkedParseTreeViewer = null;
			this.moRuleListViewer.LinkedReplacePatternViewer = null;
			this.moRuleListViewer.Modified = false;
			this.moRuleListViewer.Name = "moRuleListViewer";
			this.moRuleListViewer.ReadOnly = false;
			this.moRuleListViewer.Size = new System.Drawing.Size(150, 266);
			this.moRuleListViewer.TabIndex = 0;
			this.moRuleListViewer.Enter += new System.EventHandler(this.moRuleListViewer_Enter);
			this.moRuleListViewer.ListChanged += new System.EventHandler(this.moRuleListViewer_ListChanged);
			this.moRuleListViewer.SelectionChanged += new System.EventHandler(this.moRuleListViewer_SelectionChanged);
			this.moRuleListViewer.Leave += new System.EventHandler(this.moRuleListViewer_Leave);
			//
			// moVerticalSplitter
			//
			this.moVerticalSplitter.Location = new System.Drawing.Point(150, 0);
			this.moVerticalSplitter.Name = "moVerticalSplitter";
			this.moVerticalSplitter.Size = new System.Drawing.Size(3, 266);
			this.moVerticalSplitter.TabIndex = 1;
			this.moVerticalSplitter.TabStop = false;
			//
			// moFindPatternPanel
			//
			this.moFindPatternPanel.Controls.AddRange(new System.Windows.Forms.Control[] {
																							 this.moFindPatternViewer,
																							 this.moFindPatternLabel});
			this.moFindPatternPanel.Dock = System.Windows.Forms.DockStyle.Top;
			this.moFindPatternPanel.Location = new System.Drawing.Point(153, 0);
			this.moFindPatternPanel.Name = "moFindPatternPanel";
			this.moFindPatternPanel.Size = new System.Drawing.Size(139, 150);
			this.moFindPatternPanel.TabIndex = 2;
			//
			// moFindPatternViewer
			//
			this.moFindPatternViewer.BackColor = System.Drawing.SystemColors.Window;
			this.moFindPatternViewer.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moFindPatternViewer.ForeColor = System.Drawing.SystemColors.WindowText;
			this.moFindPatternViewer.Location = new System.Drawing.Point(0, 16);
			this.moFindPatternViewer.Modified = false;
			this.moFindPatternViewer.Name = "moFindPatternViewer";
			this.moFindPatternViewer.ReadOnly = false;
			this.moFindPatternViewer.Size = new System.Drawing.Size(139, 134);
			this.moFindPatternViewer.TabIndex = 1;
			this.moFindPatternViewer.Leave += new System.EventHandler(this.moFindPatternViewer_Leave);
			this.moFindPatternViewer.Enter += new System.EventHandler(this.moFindPatternViewer_Enter);
			this.moFindPatternViewer.SelectionChanged += new System.EventHandler(this.moFindPatternViewer_SelectionChanged);
			this.moFindPatternViewer.TreeChanged += new System.EventHandler(this.moFindPatternViewer_TreeChanged);
			//
			// moFindPatternLabel
			//
			this.moFindPatternLabel.Dock = System.Windows.Forms.DockStyle.Top;
			this.moFindPatternLabel.Name = "moFindPatternLabel";
			this.moFindPatternLabel.Size = new System.Drawing.Size(139, 16);
			this.moFindPatternLabel.TabIndex = 0;
			this.moFindPatternLabel.Text = "Find Pattern";
			this.moFindPatternLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			//
			// moHorizontalSplitter
			//
			this.moHorizontalSplitter.Dock = System.Windows.Forms.DockStyle.Top;
			this.moHorizontalSplitter.Location = new System.Drawing.Point(153, 150);
			this.moHorizontalSplitter.Name = "moHorizontalSplitter";
			this.moHorizontalSplitter.Size = new System.Drawing.Size(139, 3);
			this.moHorizontalSplitter.TabIndex = 3;
			this.moHorizontalSplitter.TabStop = false;
			//
			// moReplacePatternPanel
			//
			this.moReplacePatternPanel.Controls.AddRange(new System.Windows.Forms.Control[] {
																								this.moReplacePatternViewer,
																								this.moReplacePatternLabel});
			this.moReplacePatternPanel.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moReplacePatternPanel.Location = new System.Drawing.Point(153, 153);
			this.moReplacePatternPanel.Name = "moReplacePatternPanel";
			this.moReplacePatternPanel.Size = new System.Drawing.Size(139, 113);
			this.moReplacePatternPanel.TabIndex = 4;
			//
			// moReplacePatternViewer
			//
			this.moReplacePatternViewer.BackColor = System.Drawing.SystemColors.Window;
			this.moReplacePatternViewer.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moReplacePatternViewer.ForeColor = System.Drawing.SystemColors.WindowText;
			this.moReplacePatternViewer.Location = new System.Drawing.Point(0, 16);
			this.moReplacePatternViewer.Modified = false;
			this.moReplacePatternViewer.Name = "moReplacePatternViewer";
			this.moReplacePatternViewer.ReadOnly = false;
			this.moReplacePatternViewer.Size = new System.Drawing.Size(139, 97);
			this.moReplacePatternViewer.TabIndex = 1;
			this.moReplacePatternViewer.Leave += new System.EventHandler(this.moReplacePatternViewer_Leave);
			this.moReplacePatternViewer.Enter += new System.EventHandler(this.moReplacePatternViewer_Enter);
			this.moReplacePatternViewer.SelectionChanged += new System.EventHandler(this.moReplacePatternViewer_SelectionChanged);
			this.moReplacePatternViewer.TreeChanged += new System.EventHandler(this.moReplacePatternViewer_TreeChanged);
			//
			// moReplacePatternLabel
			//
			this.moReplacePatternLabel.Dock = System.Windows.Forms.DockStyle.Top;
			this.moReplacePatternLabel.Name = "moReplacePatternLabel";
			this.moReplacePatternLabel.Size = new System.Drawing.Size(139, 16);
			this.moReplacePatternLabel.TabIndex = 0;
			this.moReplacePatternLabel.Text = "Replace Pattern";
			this.moReplacePatternLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			//
			// moTimer
			//
			this.moTimer.Tick += new System.EventHandler(this.moTimer_Tick);
			//
			// RuleForm
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(292, 266);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moReplacePatternPanel,
																		  this.moHorizontalSplitter,
																		  this.moFindPatternPanel,
																		  this.moVerticalSplitter,
																		  this.moRuleListViewer});
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.KeyPreview = true;
			this.Name = "RuleForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultBounds;
			this.Text = "Rules";
			this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.RuleForm_KeyDown);
			this.Closing += new System.ComponentModel.CancelEventHandler(this.RuleForm_Closing);
			this.Load += new System.EventHandler(this.RuleForm_Load);
			this.Activated += new System.EventHandler(this.RuleForm_Activated);
			this.Leave += new System.EventHandler(this.RuleForm_Leave);
			this.Enter += new System.EventHandler(this.RuleForm_Enter);
			this.Deactivate += new System.EventHandler(this.RuleForm_Deactivate);
			this.moFindPatternPanel.ResumeLayout(false);
			this.moReplacePatternPanel.ResumeLayout(false);
			this.ResumeLayout(false);

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
		private RuleForm()
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
		private static RuleForm moInstance = null;
		//******************************************************************
		/// <summary>
		/// Gets the single loaded instance of this form. (The private
		/// constructor is called to create this instance if one is not
		/// currently loaded.) The form is an MDI child of TreeTranForm.
		/// </summary>
		public static RuleForm Instance
		{
			get
			{
				if (moInstance == null)
				{
					moInstance = new RuleForm();
				}
				moInstance.MdiParent = TreeTranForm.Instance;
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
		#region [InitializeViewers() Method]
		//******************************************************************
		/// <summary>
		/// Makes sure the viewers are linked and have their properties set.
		/// (This method should be called from all public methods in this
		/// class to make sure the viewers are initialized before they are
		/// used.)
		/// </summary>
		private void InitializeViewers()
		{
			//**************************************************************
			// Hook up the LinkedFindPatternViewer and the
			// LinkedReplacePatternViewer if they are not already set to the
			// form's FindPatternViewer and ReplacePatternViewer.

			if (moRuleListViewer.LinkedFindPatternViewer
				!= moFindPatternViewer)
			{
				moRuleListViewer.LinkedFindPatternViewer
					= moFindPatternViewer;
			}
			if (moRuleListViewer.LinkedReplacePatternViewer
				!= moReplacePatternViewer)
			{
				moRuleListViewer.LinkedReplacePatternViewer
					= moReplacePatternViewer;
			}

			//**************************************************************
			// If the ParseForm is visible, hook up the
			// LinkedParseListViewer and the LinkedParseTreeViewer if they
			// are not already set to the ParseForm's ParseListViewer and
			// ParseTreeViewer.

			if (ParseForm.Instance.Visible)
			{
				if (moRuleListViewer.LinkedParseListViewer
					!= ParseForm.Instance.GetParseListViewer())
				{
					moRuleListViewer.LinkedParseListViewer
						= ParseForm.Instance.GetParseListViewer();
				}
				if (moRuleListViewer.LinkedParseTreeViewer
					!= ParseForm.Instance.GetParseTreeViewer())
				{
					moRuleListViewer.LinkedParseTreeViewer
						= ParseForm.Instance.GetParseTreeViewer();
				}
			}
			else
			{
				moRuleListViewer.LinkedParseListViewer = null;
				moRuleListViewer.LinkedParseTreeViewer = null;
			}

			//**************************************************************
			// Make sure each viewer font is the same as the ViewerFont on
			// the MDI-parent form.

			if (TreeTranForm.Instance.ViewerFont != null)
			{
				if (moRuleListViewer.Font
					!= TreeTranForm.Instance.ViewerFont)
				{
					moRuleListViewer.Font
						= TreeTranForm.Instance.ViewerFont;
				}
				if (moFindPatternViewer.Font
					!= TreeTranForm.Instance.ViewerFont)
				{
					moFindPatternViewer.Font
						= TreeTranForm.Instance.ViewerFont;
				}
				if (moReplacePatternViewer.Font
					!= TreeTranForm.Instance.ViewerFont)
				{
					moReplacePatternViewer.Font
						= TreeTranForm.Instance.ViewerFont;
				}
			}

			//**************************************************************
			// Make sure the FindOnlyWithCurrentRule and
			// FindOnlyInCurrentParse values are the same as on the
			// MDI-parent form.

			moRuleListViewer.FindOnlyWithCurrentRule
				= TreeTranForm.Instance.FindOnlyWithCurrentRule;
			moRuleListViewer.FindOnlyInCurrentParse
				= TreeTranForm.Instance.FindOnlyInCurrentParse;
		}
		#endregion
		//******************************************************************
		#region [RuleFileNameToSave Property]
		//******************************************************************
		/// <summary>
		/// The RuleFileNameToSave property value.
		/// </summary>
		private string msRuleFileNameToSave = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the name of the currently open rule file. This
		/// value is null if a rule file is not currently open. The
		/// SaveRuleFile() method will save to this file name, and the
		/// SaveRuleFileAs() method uses this file name as the default.
		/// </summary>
		private string RuleFileNameToSave
		{
			set
			{
				msRuleFileNameToSave = value;
			}
			get
			{
				return msRuleFileNameToSave;
			}
		}
		#endregion
		//******************************************************************
		#region [OpenRuleFile() Method]
		//******************************************************************
		/// <summary>
		/// Loads and displays the indicated rule file. If the optional
		/// sFileName argument is omitted or null, the open-file dialog is
		/// displayed so the user can select a rule file to load.
		/// </summary>
		public void OpenRuleFile()
		{
			OpenRuleFile(null);
		}
		//******************************************************************
		/// <summary>
		/// Loads and displays the indicated rule file. If the optional
		/// sFileName argument is omitted or null, the open-file dialog is
		/// displayed so the user can select a rule file to load.
		/// </summary>
		public void OpenRuleFile(string sFileName)
		{
			//**************************************************************
			// If the rules have been modified, ask if the user wants to
			// save the changes.

			if (moRuleListViewer.Modified)
			{
				string sCaption = "TreeTran";
				string sMessage = "The tree-transfer rules have changed."
					+ Environment.NewLine + Environment.NewLine
					+ "Do you want to save the changes?";
				DialogResult iResult = MessageBox.Show(sMessage,
					sCaption,MessageBoxButtons.YesNoCancel,
					MessageBoxIcon.Question);
				if (iResult == DialogResult.Yes)
				{
					if (! SaveRuleFile())
					{
						//**************************************************
						// Return if the save operation failed.

						return;
					}
				}
				if (iResult == DialogResult.Cancel)
				{
					return;
				}
			}

			//**************************************************************
			// Clear the name of the currently open rule file.

			RuleFileNameToSave = null;

			//**************************************************************
			// If the given file name is null, ask the user to select the
			// name of the rule file to load. Store the file name in the
			// TreeTranMain.RuleFileName property.

			if (sFileName != null)
			{
				TreeTranMain.RuleFileName = sFileName;
			}
			else
			{
				Debug.Assert(moOpenFileDialog.AddExtension == true);
				Debug.Assert(moOpenFileDialog.CheckFileExists == true);
				Debug.Assert(moOpenFileDialog.CheckPathExists == true);
				Debug.Assert(moOpenFileDialog.DereferenceLinks == true);
				Debug.Assert(moOpenFileDialog.FilterIndex == 1);
				Debug.Assert(moOpenFileDialog.Multiselect == false);
				Debug.Assert(moOpenFileDialog.ReadOnlyChecked == false);
				Debug.Assert(moOpenFileDialog.ShowHelp == false);
				Debug.Assert(moOpenFileDialog.ShowReadOnly == false);
				Debug.Assert(moOpenFileDialog.ValidateNames == true);

				moOpenFileDialog.DefaultExt = "xml";
				moOpenFileDialog.FileName = TreeTranMain.RuleFileName;
				moOpenFileDialog.Filter
					= "XML files (*.xml)|*.xml|All files (*.*)|*.*";
				moOpenFileDialog.RestoreDirectory = true;
				moOpenFileDialog.Title = "Open Rule File";

				DialogResult iResult = moOpenFileDialog.ShowDialog();
				if (iResult != DialogResult.OK)
				{
					return;
				}
				TreeTranMain.RuleFileName = moOpenFileDialog.FileName;
			}

			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Clear the form caption.

			Text = "Rules";

			//**************************************************************
			// If the form is already visible, set focus to the
			// RuleListViewer (so it will have focus if an error occurs
			// while loading the file).

			if (Visible)
			{
				moRuleListViewer.Focus();
			}

			//**************************************************************
			// Load the indicated file.
			//
			// (Display the wait cursor while loading.)

			Cursor.Current = Cursors.WaitCursor;
			moRuleListViewer.LoadRuleFile(TreeTranMain.RuleFileName);
			Cursor.Current = Cursors.Default;

			//**************************************************************
			// If the file was loaded successfully, set RuleFileNameToSave
			// to the name of the currently open rule file.
			// (RuleFileNameToSave is used by the SaveRuleFile() and
			// SaveRuleFileAs() methods.)

			RuleFileNameToSave = TreeTranMain.RuleFileName;

			//**************************************************************
			// Set the form caption to indicate the loaded rule file name.

			Text = "Rule File: " + RuleFileNameToSave;

			//**************************************************************
			// Show the form (if it is not already visible) and set focus to
			// the RuleListViewer.

			Show();
			Focus();
			moRuleListViewer.Focus();
		}
		#endregion
		//******************************************************************
		#region [SaveRuleFile() Method]
		//******************************************************************
		/// <summary>
		/// Saves the displayed rules to the current open rule file. If a
		/// rule file is not currently open, the save-file dialog is
		/// displayed so the user can specify the file to write. Returns
		/// true if the file was saved, and false if the user was prompted
		/// for a file name and clicked cancel.
		/// </summary>
		public bool SaveRuleFile()
		{
			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// If a rule file is not currently open, display the save-file
			// dialog so the user can specify the file to write.

			if ((RuleFileNameToSave == null)
				|| (RuleFileNameToSave == ""))
			{
				return SaveRuleFileAs();
			}

			//**************************************************************
			// Otherwise, save the rules to the currently open rule file.
			//
			// (Display the wait cursor while saving.)

			Cursor.Current = Cursors.WaitCursor;
			moRuleListViewer.SaveRuleFile(RuleFileNameToSave);
			Cursor.Current = Cursors.Default;
			return true;
		}
		#endregion
		//******************************************************************
		#region [SaveRuleFileAs() Method]
		//******************************************************************
		/// <summary>
		/// Displays the save-file dialog so the user can specify the file
		/// to which the displayed rules are written. Returns true if the
		/// file was saved, and false if the user clicked cancel.
		/// </summary>
		public bool SaveRuleFileAs()
		{
			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Ask the user to specify the name of the rule file to write.

			Debug.Assert(moSaveFileDialog.AddExtension == true);
			Debug.Assert(moSaveFileDialog.CheckFileExists == false);
			Debug.Assert(moSaveFileDialog.CheckPathExists == true);
			Debug.Assert(moSaveFileDialog.CreatePrompt == false);
			Debug.Assert(moSaveFileDialog.DereferenceLinks == true);
			Debug.Assert(moSaveFileDialog.FilterIndex == 1);
			Debug.Assert(moSaveFileDialog.OverwritePrompt == true);
			Debug.Assert(moSaveFileDialog.ShowHelp == false);
			Debug.Assert(moSaveFileDialog.ValidateNames == true);

			moSaveFileDialog.DefaultExt = "xml";
			if ((RuleFileNameToSave != null)
				&& (RuleFileNameToSave != ""))
			{
				moSaveFileDialog.FileName = RuleFileNameToSave;
			}
			else
			{
				moSaveFileDialog.FileName = "";
			}
			moSaveFileDialog.Filter
				= "XML files (*.xml)|*.xml|All files (*.*)|*.*";
			moSaveFileDialog.RestoreDirectory = true;
			moSaveFileDialog.Title = "Save Rule File As";

			DialogResult iResult = moSaveFileDialog.ShowDialog();
			if (iResult != DialogResult.OK)
			{
				return false;
			}

			//**************************************************************
			// Store the file name in the TreeTranMain.RuleFileName
			// property. Then save the displayed rules to that file.
			//
			// (Display the wait cursor while saving.)

			TreeTranMain.RuleFileName = moSaveFileDialog.FileName;
			Cursor.Current = Cursors.WaitCursor;
			moRuleListViewer.SaveRuleFile(TreeTranMain.RuleFileName);
			Cursor.Current = Cursors.Default;

			//**************************************************************
			// If the file was saved successfully, set RuleFileNameToSave to
			// the name of the saved rule file, and also set the form
			// caption to indicate the name of the rule file.

			RuleFileNameToSave = TreeTranMain.RuleFileName;
			Text = "Rule File: " + RuleFileNameToSave;

			return true;
		}
		#endregion
		//******************************************************************
		#region [ProcessParseFile() and CanProcessParseFile() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if a parse file can be processed by the currently
		/// displayed set of rules. Returns false otherwise.
		/// </summary>
		public bool CanProcessParseFile()
		{
			InitializeViewers();
			return moRuleListViewer.CanProcessParseFile();
		}
		//******************************************************************
		/// <summary>
		/// Prompts the user for an input parse file and an output parse
		/// file. Uses the displayed rules to process the input parse file
		/// and write the output parse file.
		/// </summary>
		public void ProcessParseFile()
		{
			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Ask the user to select the parse input file. Store the file
			// name in the TreeTranMain.RuleFileName property.

			Debug.Assert(moOpenFileDialog.AddExtension == true);
			Debug.Assert(moOpenFileDialog.CheckFileExists == true);
			Debug.Assert(moOpenFileDialog.CheckPathExists == true);
			Debug.Assert(moOpenFileDialog.DereferenceLinks == true);
			Debug.Assert(moOpenFileDialog.FilterIndex == 1);
			Debug.Assert(moOpenFileDialog.Multiselect == false);
			Debug.Assert(moOpenFileDialog.ReadOnlyChecked == false);
			Debug.Assert(moOpenFileDialog.ShowHelp == false);
			Debug.Assert(moOpenFileDialog.ShowReadOnly == false);
			Debug.Assert(moOpenFileDialog.ValidateNames == true);

			moOpenFileDialog.DefaultExt = "xml";
			moOpenFileDialog.FileName = TreeTranMain.ParseFileName;
			moOpenFileDialog.Filter
				= "XML files (*.xml)|*.xml|All files (*.*)|*.*";
			moOpenFileDialog.RestoreDirectory = true;
			moOpenFileDialog.Title
				= "Process Parse File - 1. Select Parse File";

			DialogResult iResult = moOpenFileDialog.ShowDialog();
			if (iResult != DialogResult.OK)
			{
				return;
			}
			TreeTranMain.ParseFileName = moOpenFileDialog.FileName;

			//**************************************************************
			// Create a default name for the output file.

			string sOutputFileName
				= TreeTranMain.ParseFileName + "-output.xml";

			//**************************************************************
			// Ask the user to specify the name of the parse output file to
			// write.

			Debug.Assert(moSaveFileDialog.AddExtension == true);
			Debug.Assert(moSaveFileDialog.CheckFileExists == false);
			Debug.Assert(moSaveFileDialog.CheckPathExists == true);
			Debug.Assert(moSaveFileDialog.CreatePrompt == false);
			Debug.Assert(moSaveFileDialog.DereferenceLinks == true);
			Debug.Assert(moSaveFileDialog.FilterIndex == 1);
			Debug.Assert(moSaveFileDialog.OverwritePrompt == true);
			Debug.Assert(moSaveFileDialog.ShowHelp == false);
			Debug.Assert(moSaveFileDialog.ValidateNames == true);

			moSaveFileDialog.DefaultExt = "xml";
			moSaveFileDialog.FileName = sOutputFileName;
			moSaveFileDialog.Filter
				= "XML files (*.xml)|*.xml|All files (*.*)|*.*";
			moSaveFileDialog.RestoreDirectory = true;
			moSaveFileDialog.Title
				= "Process Parse File - 2. Save Output As";

			iResult = moSaveFileDialog.ShowDialog();
			if (iResult != DialogResult.OK)
			{
				return;
			}
			sOutputFileName = moSaveFileDialog.FileName;

			//**************************************************************
			// Use the displayed rules to process the input parse file and
			// write the output parse file.

			moRuleListViewer.ProcessParseFile(TreeTranMain.ParseFileName,
				sOutputFileName);
		}
		#endregion
		//******************************************************************
		#region [ProcessParseFileAndClose() Method]
		//******************************************************************
		/// <summary>
		/// Uses the displayed transfer rules to process the parse trees in
		/// the indicated input file (sInputFileName). The modified parse
		/// trees are written to the indicate output file (sOutputFileName).
		/// A modal dialog displays status information as the file is
		/// processed. The dialog is automatically closed when the
		/// processing is finished.
		/// </summary>
		public void ProcessParseFileAndClose(string sParseFileName,
			string sOutputFileName)
		{
			Debug.Assert(sParseFileName != null);
			Debug.Assert(sOutputFileName != null);

			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Use the displayed rules to process the input parse file and
			// write the output file.

			moRuleListViewer.ProcessParseFileAndClose(sParseFileName,
				sOutputFileName);
		}
		#endregion
		//******************************************************************
		#region [Undo() and CanUndo() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the active control can undo the last edit
		/// operation. Returns false otherwise.
		/// </summary>
		public bool CanUndo()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				return moRuleListViewer.CanUndo();
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				return moFindPatternViewer.CanUndo();
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				return moReplacePatternViewer.CanUndo();
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Undoes the last edit operation in the active control.
		/// </summary>
		public void Undo()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				moRuleListViewer.Undo();
				return;
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				moFindPatternViewer.Undo();
				return;
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				moReplacePatternViewer.Undo();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [Cut() and CanCut() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the active control can cut the current selection
		/// to the clipboard. Returns false otherwise.
		/// </summary>
		public bool CanCut()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				return moRuleListViewer.CanCut();
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				return moFindPatternViewer.CanCut();
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				return moReplacePatternViewer.CanCut();
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Cuts the current selection from the active control to the
		/// clipboard.
		/// </summary>
		public void Cut()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				moRuleListViewer.Cut();
				return;
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				moFindPatternViewer.Cut();
				return;
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				moReplacePatternViewer.Cut();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [Copy() and CanCopy() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the active control can copy the current
		/// selection to the clipboard. Returns false otherwise.
		/// </summary>
		public bool CanCopy()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				return moRuleListViewer.CanCopy();
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				return moFindPatternViewer.CanCopy();
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				return moReplacePatternViewer.CanCopy();
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Copies the current selection from the active control to the
		/// clipboard.
		/// </summary>
		public void Copy()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				moRuleListViewer.Copy();
				return;
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				moFindPatternViewer.Copy();
				return;
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				moReplacePatternViewer.Copy();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [Paste() and CanPaste() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the active control can paste the current
		/// contents of the clipboard. Returns false otherwise.
		/// </summary>
		public bool CanPaste()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				return moRuleListViewer.CanPaste();
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				return moFindPatternViewer.CanPaste();
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				return moReplacePatternViewer.CanPaste();
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Pastes the current contents of the clipboard into the active
		/// control.
		/// </summary>
		public void Paste()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				moRuleListViewer.Paste();
				return;
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				moFindPatternViewer.Paste();
				return;
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				moReplacePatternViewer.Paste();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [Delete() and CanDelete() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the active control can delete the current
		/// selection. Returns false otherwise.
		/// </summary>
		public bool CanDelete()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				return moRuleListViewer.CanDelete();
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				return moFindPatternViewer.CanDelete();
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				return moReplacePatternViewer.CanDelete();
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Deletes the current selection from the active control.
		/// </summary>
		public void Delete()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				moRuleListViewer.Delete();
				return;
			}
			if (moFindPatternViewer.ContainsFocus)
			{
				moFindPatternViewer.Delete();
				return;
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				moReplacePatternViewer.Delete();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [OpenFeatures() and CanOpenFeatures() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection is a tree-viewer node
		/// whose syntax features can be displayed in the FeaturesForm.
		/// Returns false otherwise.
		/// </summary>
		public bool CanOpenFeatures()
		{
			InitializeViewers();
			if (moFindPatternViewer.ContainsFocus)
			{
				return moFindPatternViewer.CanOpenFeatures();
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				return moReplacePatternViewer.CanOpenFeatures();
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Opens the FeaturesForm to display the syntax features of the
		/// selected node in the active tree-viewer control.
		/// </summary>
		public void OpenFeatures()
		{
			InitializeViewers();
			if (moFindPatternViewer.ContainsFocus)
			{
				moFindPatternViewer.OpenFeatures();
				return;
			}
			if (moReplacePatternViewer.ContainsFocus)
			{
				moReplacePatternViewer.OpenFeatures();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [ViewerFont Property]
		//******************************************************************
		/// <summary>
		/// Gets or sets the font for displaying linguistic data in the
		/// viewer controls on this form.
		/// </summary>
		public Font ViewerFont
		{
			set
			{
				InitializeViewers();
				Font oFont = value;

				Debug.Assert(oFont != null);

				if (moRuleListViewer.Font != oFont)
				{
					moRuleListViewer.Font = oFont;
				}
				if (moFindPatternViewer.Font != oFont)
				{
					moFindPatternViewer.Font = oFont;
				}
				if (moReplacePatternViewer.Font != oFont)
				{
					moReplacePatternViewer.Font = oFont;
				}
			}
			get
			{
				InitializeViewers();
				return moFindPatternViewer.Font;
			}
		}
		#endregion
		//******************************************************************
		#region [FindMatchingBranch() and CanFindMatchingBranch() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the displayed rules can be used to find a
		/// parse-tree branch. Returns false otherwise.
		/// </summary>
		public bool CanFindMatchingBranch()
		{
			InitializeViewers();
			return moRuleListViewer.CanFindMatchingBranch();
		}
		//******************************************************************
		/// <summary>
		/// Finds the next parse-tree branch that matches the pattern.
		/// </summary>
		public void FindMatchingBranch()
		{
			//**************************************************************
			// Make sure the ParseForm is visible.

			if (! ParseForm.Instance.Visible)
			{
				ParseForm.Instance.Show();
				ParseTreeViewer oParseTreeViewer
					= ParseForm.Instance.GetParseTreeViewer();
				oParseTreeViewer.Focus();
			}

			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Search for the next matching branch. If found, set the focus
			// to the parse form (which highlights the matching branch).
			// Otherwise, display a pattern-not-found message.
			//
			// (Display the wait cursor while searching.)

			Cursor.Current = Cursors.WaitCursor;
			bool bFound = moRuleListViewer.FindMatchingBranch();
			if (bFound)
			{
				Cursor.Current = Cursors.Default;
				ParseForm.Instance.Show();
				ParseForm.Instance.Focus();
			}
			else
			{
				Cursor.Current = Cursors.Default;
				string sCaption = "Find Matching Branch";
				string sMessage = "The pattern was not found.";
				MessageBox.Show(sMessage,sCaption,MessageBoxButtons.OK,
					MessageBoxIcon.Information);
			}
		}
		#endregion
		//******************************************************************
		#region [ReplaceMatchingBranch() and CanReplaceMatchingBranch()]
		//******************************************************************
		/// <summary>
		/// Returns true if the displayed rules can be used to replace a
		/// parse-tree branch. Returns false otherwise.
		/// </summary>
		public bool CanReplaceMatchingBranch()
		{
			InitializeViewers();
			return moRuleListViewer.CanReplaceMatchingBranch();
		}
		//******************************************************************
		/// <summary>
		/// Replaces the parse-tree branch that matches the pattern.
		/// </summary>
		public void ReplaceMatchingBranch()
		{
			//**************************************************************
			// Make sure the ParseForm is visible.

			if (! ParseForm.Instance.Visible)
			{
				ParseForm.Instance.Show();
				ParseTreeViewer oParseTreeViewer
					= ParseForm.Instance.GetParseTreeViewer();
				oParseTreeViewer.Focus();
			}

			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Replace the current matching branch. If there is not already
			// a current matching branch, search for and replace the next
			// matching branch. If successful, set the focus to the parse
			// form (which highlights the replaced branch). Otherwise,
			// display a pattern-not-found message.
			//
			// (Display the wait cursor while searching.)

			Cursor.Current = Cursors.WaitCursor;
			bool bFound = moRuleListViewer.ReplaceMatchingBranch();
			if (bFound)
			{
				Cursor.Current = Cursors.Default;
				ParseForm.Instance.Show();
				ParseForm.Instance.Focus();
			}
			else
			{
				Cursor.Current = Cursors.Default;
				string sCaption = "Replace Matching Branch";
				string sMessage = "The pattern was not found.";
				MessageBox.Show(sMessage,sCaption,MessageBoxButtons.OK,
					MessageBoxIcon.Information);
			}
		}
		#endregion
		//******************************************************************
		#region [AddNewRule() Method]
		//******************************************************************
		/// <summary>
		/// Adds a new item to the list of rules. The item is placed in edit
		/// mode so the user can rename the new rule.
		/// </summary>
		public void AddNewRule()
		{
			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Show the form (if it is not already visible) and set focus to
			// the RuleListViewer.

			Show();
			Focus();
			moRuleListViewer.Focus();

			//**************************************************************
			// Add a new rule and place the item in edit mode so the user
			// can rename the new rule.

			Debug.Assert(moRuleListViewer.CanAddNewRule());

			moRuleListViewer.AddNewRule();
		}
		#endregion
		//******************************************************************
		#region [RenameRule() and CanRenameRule() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection in the active control is a
		/// rule that the user can rename. Returns false otherwise.
		/// </summary>
		public bool CanRenameRule()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				return moRuleListViewer.CanRenameRule();
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Places the current item of the active control in edit mode so
		/// the user can rename the selected rule.
		/// </summary>
		public void RenameRule()
		{
			InitializeViewers();
			if (moRuleListViewer.ContainsFocus)
			{
				moRuleListViewer.RenameRule();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [UpdateMenu() Method]
		//******************************************************************
		/// <summary>
		/// Starts the timer, which will fire once and update the menu on
		/// the MDI-parent form.
		/// </summary>
		private void UpdateMenu()
		{
			moTimer.Interval = 100;
			moTimer.Start();
		}
		#endregion
		//******************************************************************

		// FORM EVENTS

		//******************************************************************
		#region [Load Event Handler]
		//******************************************************************
		/// <summary>
		/// Initialize the viewer controls on this form.
		/// </summary>
		private void RuleForm_Load(object oSender,EventArgs oArgs)
		{
			try
			{
				InitializeViewers();
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
		private void RuleForm_Activated(object oSender,EventArgs oArgs)
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
		private void RuleForm_Deactivate(object oSender,EventArgs oArgs)
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
		private void RuleForm_Enter(object oSender,EventArgs oArgs)
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
		private void RuleForm_Leave(object oSender,EventArgs oArgs)
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
		#region [KeyDown Event Handler]
		//******************************************************************
		/// <summary>
		/// Opens the FeaturesForm, if appropriate, when the Enter key is
		/// pressed.
		/// </summary>
		private void RuleForm_KeyDown(object oSender,KeyEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (oArgs.KeyData == Keys.Enter)
				{
					if (moFindPatternViewer.ContainsFocus)
					{
						if (moFindPatternViewer.CanOpenFeatures())
						{
							moFindPatternViewer.OpenFeatures();
						}
					}
					if (moReplacePatternViewer.ContainsFocus)
					{
						if (moReplacePatternViewer.CanOpenFeatures())
						{
							moReplacePatternViewer.OpenFeatures();
						}
					}
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Closing Event Handler]
		//******************************************************************
		/// <summary>
		/// Checks before the form closes to see if the rules have been
		/// modified. If so, ask if the user wants to save the changes.
		/// </summary>
		private void RuleForm_Closing(object oSender,CancelEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// If the rules have been modified, ask if the user wants to
				// save the changes.

				if (moRuleListViewer.Modified)
				{
					string sCaption = "TreeTran";
					string sMessage =
						"The tree-transfer rules have changed."
						+ Environment.NewLine + Environment.NewLine
						+ "Do you want to save the changes?";
					DialogResult iResult = MessageBox.Show(sMessage,
						sCaption,MessageBoxButtons.YesNoCancel,
						MessageBoxIcon.Question);
					oArgs.Cancel = true;
					if (iResult == DialogResult.Yes)
					{
						if (SaveRuleFile())
						{
							oArgs.Cancel = false;
						}
					}
					if (iResult == DialogResult.No)
					{
						oArgs.Cancel = false;
					}
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
				oArgs.Cancel = true;
			}
		}
		#endregion
		//******************************************************************

		// CONTROL EVENTS

		//******************************************************************
		#region [RuleListViewer Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moRuleListViewer_Enter(object oSender,EventArgs oArgs)
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
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moRuleListViewer_Leave(object oSender,EventArgs oArgs)
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
		#region [RuleListViewer SelectionChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the selection changes.
		/// </summary>
		private void moRuleListViewer_SelectionChanged(object oSender,
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
		#region [RuleListViewer ListChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the list contents change.
		/// </summary>
		private void moRuleListViewer_ListChanged(object oSender,
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
		#region [FindPatternViewer Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moFindPatternViewer_Enter(object oSender,
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
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moFindPatternViewer_Leave(object oSender,
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
		#region [FindPatternViewer SelectionChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the selection changes.
		/// </summary>
		private void moFindPatternViewer_SelectionChanged(object oSender,
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
		#region [FindPatternViewer TreeChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the tree contents change.
		/// </summary>
		private void moFindPatternViewer_TreeChanged(object oSender,
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
		#region [ReplacePatternViewer Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moReplacePatternViewer_Enter(object oSender,
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
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moReplacePatternViewer_Leave(object oSender,
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
		#region [ReplacePatternViewer SelectionChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the selection changes.
		/// </summary>
		private void moReplacePatternViewer_SelectionChanged(object oSender,
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
		#region [ReplacePatternViewer TreeChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the tree contents change.
		/// </summary>
		private void moReplacePatternViewer_TreeChanged(object oSender,
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
		#region [Timer Tick Event Handler]
		//******************************************************************
		/// <summary>
		/// Tells the MDI-parent form to update the enabled state of its
		/// menu items.
		/// </summary>
		private void moTimer_Tick(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Stop the timer (so it only fires once when the menu needs
				// to be updated).

				moTimer.Stop();

				//**********************************************************
				// Update the MDI-parent menu.

				TreeTranForm.Instance.UpdateMenu();
			}
			catch (Exception oException)
			{
				LogException(oException);
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
