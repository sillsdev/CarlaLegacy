//**************************************************************************
// File: "TreeTran\ParseForm.cs".
//
// This file defines the ParseForm class, which implements an MDI-child form
// that displays a ParseListViewer and a ParseTreeViewer.
//
// History:
//     2006-Sep-23 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using TreeTranViewer;
//**************************************************************************
namespace TreeTran
{
	//**********************************************************************
	/// <summary>
	/// Implements an MDI-child form that displays a ParseListViewer and a
	/// ParseTreeViewer.
	/// </summary>
	public class ParseForm: System.Windows.Forms.Form
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		private TreeTranViewer.ParseListViewer moParseListViewer;
		private System.Windows.Forms.Splitter moVerticalSplitter;
		private TreeTranViewer.ParseTreeViewer moParseTreeViewer;
		private System.Windows.Forms.OpenFileDialog moOpenFileDialog;
		private System.Windows.Forms.Timer moTimer;
		private System.Windows.Forms.SaveFileDialog moSaveFileDialog;
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(ParseForm));
			this.moParseListViewer = new TreeTranViewer.ParseListViewer();
			this.moVerticalSplitter = new System.Windows.Forms.Splitter();
			this.moParseTreeViewer = new TreeTranViewer.ParseTreeViewer();
			this.moOpenFileDialog = new System.Windows.Forms.OpenFileDialog();
			this.moTimer = new System.Windows.Forms.Timer(this.components);
			this.moSaveFileDialog = new System.Windows.Forms.SaveFileDialog();
			this.SuspendLayout();
			//
			// moParseListViewer
			//
			this.moParseListViewer.BackColor = System.Drawing.SystemColors.Window;
			this.moParseListViewer.Dock = System.Windows.Forms.DockStyle.Left;
			this.moParseListViewer.ForeColor = System.Drawing.SystemColors.WindowText;
			this.moParseListViewer.LinkedParseTreeViewer = null;
			this.moParseListViewer.Modified = false;
			this.moParseListViewer.Name = "moParseListViewer";
			this.moParseListViewer.ReadOnly = false;
			this.moParseListViewer.Size = new System.Drawing.Size(150, 266);
			this.moParseListViewer.TabIndex = 0;
			this.moParseListViewer.Enter += new System.EventHandler(this.moParseListViewer_Enter);
			this.moParseListViewer.ListChanged += new System.EventHandler(this.moParseListViewer_ListChanged);
			this.moParseListViewer.SelectionChanged += new System.EventHandler(this.moParseListViewer_SelectionChanged);
			this.moParseListViewer.Leave += new System.EventHandler(this.moParseListViewer_Leave);
			//
			// moVerticalSplitter
			//
			this.moVerticalSplitter.Location = new System.Drawing.Point(150, 0);
			this.moVerticalSplitter.Name = "moVerticalSplitter";
			this.moVerticalSplitter.Size = new System.Drawing.Size(3, 266);
			this.moVerticalSplitter.TabIndex = 1;
			this.moVerticalSplitter.TabStop = false;
			//
			// moParseTreeViewer
			//
			this.moParseTreeViewer.BackColor = System.Drawing.SystemColors.Window;
			this.moParseTreeViewer.DisplayFindPattern = false;
			this.moParseTreeViewer.DisplayReplacePattern = false;
			this.moParseTreeViewer.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moParseTreeViewer.ForeColor = System.Drawing.SystemColors.WindowText;
			this.moParseTreeViewer.Location = new System.Drawing.Point(153, 0);
			this.moParseTreeViewer.Modified = false;
			this.moParseTreeViewer.Name = "moParseTreeViewer";
			this.moParseTreeViewer.ReadOnly = false;
			this.moParseTreeViewer.ShowFeatures = false;
			this.moParseTreeViewer.ShowMorphology = false;
			this.moParseTreeViewer.Size = new System.Drawing.Size(139, 266);
			this.moParseTreeViewer.TabIndex = 2;
			this.moParseTreeViewer.Leave += new System.EventHandler(this.moParseTreeViewer_Leave);
			this.moParseTreeViewer.Enter += new System.EventHandler(this.moParseTreeViewer_Enter);
			this.moParseTreeViewer.SelectionChanged += new System.EventHandler(this.moParseTreeViewer_SelectionChanged);
			this.moParseTreeViewer.TreeChanged += new System.EventHandler(this.moParseTreeViewer_TreeChanged);
			//
			// moTimer
			//
			this.moTimer.Tick += new System.EventHandler(this.moTimer_Tick);
			//
			// ParseForm
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(292, 266);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moParseTreeViewer,
																		  this.moVerticalSplitter,
																		  this.moParseListViewer});
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.KeyPreview = true;
			this.Name = "ParseForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultBounds;
			this.Text = "Parses";
			this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.ParseForm_KeyDown);
			this.Load += new System.EventHandler(this.ParseForm_Load);
			this.Activated += new System.EventHandler(this.ParseForm_Activated);
			this.Leave += new System.EventHandler(this.ParseForm_Leave);
			this.Enter += new System.EventHandler(this.ParseForm_Enter);
			this.Deactivate += new System.EventHandler(this.ParseForm_Deactivate);
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
		private ParseForm()
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
		private static ParseForm moInstance = null;
		//******************************************************************
		/// <summary>
		/// Gets the single loaded instance of this form. (The private
		/// constructor is called to create this instance if one is not
		/// currently loaded.) The form is an MDI child of TreeTranForm.
		/// </summary>
		public static ParseForm Instance
		{
			get
			{
				if (moInstance == null)
				{
					moInstance = new ParseForm();
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
			// Hook up the LinkedParseTreeViewer if it is not already set to
			// the form's ParseTreeViewer.

			if (moParseListViewer.LinkedParseTreeViewer
				!= moParseTreeViewer)
			{
				moParseListViewer.LinkedParseTreeViewer
					= moParseTreeViewer;
			}

			//**************************************************************
			// Make sure the ShowFeatures and ShowMorphology values are the
			// same as on the MDI-parent form.

			if (moParseTreeViewer.ShowFeatures
				!= TreeTranForm.Instance.ShowFeatures)
			{
				moParseTreeViewer.ShowFeatures
					= TreeTranForm.Instance.ShowFeatures;
			}
			if (moParseTreeViewer.ShowMorphology
				!= TreeTranForm.Instance.ShowMorphology)
			{
				moParseTreeViewer.ShowMorphology
					= TreeTranForm.Instance.ShowMorphology;
			}

			//**************************************************************
			// Make sure each viewer font is the same as the ViewerFont on
			// the MDI-parent form.

			if (TreeTranForm.Instance.ViewerFont != null)
			{
				if (moParseListViewer.Font
					!= TreeTranForm.Instance.ViewerFont)
				{
					moParseListViewer.Font
						= TreeTranForm.Instance.ViewerFont;
				}
				if (moParseTreeViewer.Font
					!= TreeTranForm.Instance.ViewerFont)
				{
					moParseTreeViewer.Font
						= TreeTranForm.Instance.ViewerFont;
				}
			}
		}
		#endregion
		//******************************************************************
		#region [GetParseListViewer() Method]
		//******************************************************************
		/// <summary>
		/// Returns the ParseListViewer control displayed on this form.
		/// </summary>
		public ParseListViewer GetParseListViewer()
		{
			InitializeViewers();
			return moParseListViewer;
		}
		#endregion
		//******************************************************************
		#region [GetParseTreeViewer() Method]
		//******************************************************************
		/// <summary>
		/// Returns the ParseTreeViewer control displayed on this form.
		/// </summary>
		public ParseTreeViewer GetParseTreeViewer()
		{
			InitializeViewers();
			return moParseTreeViewer;
		}
		#endregion
		//******************************************************************
		#region [LoadParseFile() Method]
		//******************************************************************
		/// <summary>
		/// Loads and displays the indicated parse file. If the optional
		/// sFileName argument is omitted or null, the open-file dialog is
		/// displayed so the user can select a parse file to load.
		/// </summary>
		public void LoadParseFile()
		{
			LoadParseFile(null);
		}
		//******************************************************************
		/// <summary>
		/// Loads and displays the indicated parse file. If the optional
		/// sFileName argument is omitted or null, the open-file dialog is
		/// displayed so the user can select a parse file to load.
		/// </summary>
		public void LoadParseFile(string sFileName)
		{
			//**************************************************************
			// If the given file name is null, ask the user to select the
			// name of the parse file to load. Store the file name in the
			// TreeTranMain.ParseFileName property.

			if (sFileName != null)
			{
				TreeTranMain.ParseFileName = sFileName;
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
				moOpenFileDialog.FileName = TreeTranMain.ParseFileName;
				moOpenFileDialog.Filter
					= "XML files (*.xml)|*.xml|All files (*.*)|*.*";
				moOpenFileDialog.RestoreDirectory = true;
				moOpenFileDialog.Title = "Load Parse File";

				DialogResult iResult = moOpenFileDialog.ShowDialog();
				if (iResult != DialogResult.OK)
				{
					return;
				}
				TreeTranMain.ParseFileName = moOpenFileDialog.FileName;
			}

			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Clear the form caption.

			Text = "Parses";

			//**************************************************************
			// If the form is already visible, set focus to the
			// ParseListViewer (so it will have focus if an error occurs
			// while loading the file).

			if (Visible)
			{
				moParseListViewer.Focus();
			}

			//**************************************************************
			// Load the indicated file.
			//
			// (Display the wait cursor while loading.)

			Cursor.Current = Cursors.WaitCursor;
			moParseListViewer.LoadParseFile(TreeTranMain.ParseFileName);
			Cursor.Current = Cursors.Default;

			//**************************************************************
			// Set the form caption to indicate the loaded parse file name.

			Text = "Parse File: " + TreeTranMain.ParseFileName;

			//**************************************************************
			// Show the form (if it is not already visible) and set focus to
			// the ParseListViewer.

			Show();
			Focus();
			moParseListViewer.Focus();
		}
		#endregion
		//******************************************************************
		#region [SaveParseFileAs() Method]
		//******************************************************************
		/// <summary>
		/// Displays the save-file dialog so the user can specify the file
		/// to which the displayed parses are written. Returns true if the
		/// file was saved, and false if the user clicked cancel.
		/// </summary>
		public bool SaveParseFileAs()
		{
			//**************************************************************
			// Make sure the viewers are initialized.

			InitializeViewers();

			//**************************************************************
			// Ask the user to specify the name of the parse file to write.

			Debug.Assert(moSaveFileDialog.AddExtension == true);
			Debug.Assert(moSaveFileDialog.CheckFileExists == false);
			Debug.Assert(moSaveFileDialog.CheckPathExists == true);
			Debug.Assert(moSaveFileDialog.CreatePrompt == false);
			Debug.Assert(moSaveFileDialog.DereferenceLinks == true);
			Debug.Assert(moSaveFileDialog.FilterIndex == 1);
			Debug.Assert(moSaveFileDialog.OverwritePrompt == true);
			Debug.Assert(moSaveFileDialog.ShowHelp == false);
			Debug.Assert(moSaveFileDialog.ValidateNames == true);

			moSaveFileDialog.FileName = "";
			moSaveFileDialog.Filter
				= "XML files (*.xml)|*.xml|All files (*.*)|*.*";
			moSaveFileDialog.RestoreDirectory = true;
			moSaveFileDialog.Title = "Save Parse File As";

			DialogResult iResult = moSaveFileDialog.ShowDialog();
			if (iResult != DialogResult.OK)
			{
				return false;
			}

			//**************************************************************
			// Save the displayed parses to the specified file.
			//
			// (Display the wait cursor while saving.)

			string sParseFileName = moSaveFileDialog.FileName;
			Cursor.Current = Cursors.WaitCursor;
			moParseListViewer.SaveParseFile(sParseFileName);
			Cursor.Current = Cursors.Default;
			return true;
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
			if (moParseListViewer.ContainsFocus)
			{
				return moParseListViewer.CanUndo();
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				return moParseTreeViewer.CanUndo();
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
			if (moParseListViewer.ContainsFocus)
			{
				moParseListViewer.Undo();
				return;
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				moParseTreeViewer.Undo();
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
			if (moParseListViewer.ContainsFocus)
			{
				return moParseListViewer.CanCut();
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				return moParseTreeViewer.CanCut();
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
			if (moParseListViewer.ContainsFocus)
			{
				moParseListViewer.Cut();
				return;
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				moParseTreeViewer.Cut();
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
			if (moParseListViewer.ContainsFocus)
			{
				return moParseListViewer.CanCopy();
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				return moParseTreeViewer.CanCopy();
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
			if (moParseListViewer.ContainsFocus)
			{
				moParseListViewer.Copy();
				return;
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				moParseTreeViewer.Copy();
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
			if (moParseListViewer.ContainsFocus)
			{
				return moParseListViewer.CanPaste();
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				return moParseTreeViewer.CanPaste();
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
			if (moParseListViewer.ContainsFocus)
			{
				moParseListViewer.Paste();
				return;
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				moParseTreeViewer.Paste();
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
			if (moParseListViewer.ContainsFocus)
			{
				return moParseListViewer.CanDelete();
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				return moParseTreeViewer.CanDelete();
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
			if (moParseListViewer.ContainsFocus)
			{
				moParseListViewer.Delete();
				return;
			}
			if (moParseTreeViewer.ContainsFocus)
			{
				moParseTreeViewer.Delete();
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
			if (moParseTreeViewer.ContainsFocus)
			{
				return moParseTreeViewer.CanOpenFeatures();
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
			if (moParseTreeViewer.ContainsFocus)
			{
				moParseTreeViewer.OpenFeatures();
				return;
			}
			Debug.Fail("Invalid control for this operation.");
		}
		#endregion
		//******************************************************************
		#region [ShowFeatures Property]
		//******************************************************************
		/// <summary>
		/// Gets or sets the ShowFeatures property of the ParseTreeViewer.
		/// </summary>
		public bool ShowFeatures
		{
			set
			{
				InitializeViewers();
				bool bShowFeatures = value;
				if (moParseTreeViewer.ShowFeatures != bShowFeatures)
				{
					moParseTreeViewer.ShowFeatures = bShowFeatures;
				}
			}
			get
			{
				return moParseTreeViewer.ShowFeatures;
			}
		}
		#endregion
		//******************************************************************
		#region [ShowMorphology Property]
		//******************************************************************
		/// <summary>
		/// Gets or sets the ShowMorphology property of the ParseTreeViewer.
		/// </summary>
		public bool ShowMorphology
		{
			set
			{
				InitializeViewers();
				bool bShowMorphology = value;
				if (moParseTreeViewer.ShowMorphology != bShowMorphology)
				{
					moParseTreeViewer.ShowMorphology = bShowMorphology;
				}
			}
			get
			{
				return moParseTreeViewer.ShowMorphology;
			}
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

				if (moParseListViewer.Font != oFont)
				{
					moParseListViewer.Font = oFont;
				}
				if (moParseTreeViewer.Font != oFont)
				{
					moParseTreeViewer.Font = oFont;
				}
			}
			get
			{
				InitializeViewers();
				return moParseTreeViewer.Font;
			}
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
		private void ParseForm_Load(object oSender,EventArgs oArgs)
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
		private void ParseForm_Activated(object oSender,EventArgs oArgs)
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
		private void ParseForm_Deactivate(object oSender,EventArgs oArgs)
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
		private void ParseForm_Enter(object oSender,EventArgs oArgs)
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
		private void ParseForm_Leave(object oSender,EventArgs oArgs)
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
		private void ParseForm_KeyDown(object oSender,KeyEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (oArgs.KeyData == Keys.Enter)
				{
					if (moParseTreeViewer.ContainsFocus)
					{
						if (moParseTreeViewer.CanOpenFeatures())
						{
							moParseTreeViewer.OpenFeatures();
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

		// CONTROL EVENTS

		//******************************************************************
		#region [ParseListViewer Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moParseListViewer_Enter(object oSender,EventArgs oArgs)
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
		private void moParseListViewer_Leave(object oSender,EventArgs oArgs)
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
		#region [ParseListViewer SelectionChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the selection changes.
		/// </summary>
		private void moParseListViewer_SelectionChanged(object oSender,
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
		#region [ParseListViewer ListChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the list contents change.
		/// </summary>
		private void moParseListViewer_ListChanged(object oSender,
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
		#region [ParseTreeViewer Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the active control changes.
		/// </summary>
		private void moParseTreeViewer_Enter(object oSender,EventArgs oArgs)
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
		private void moParseTreeViewer_Leave(object oSender,EventArgs oArgs)
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
		#region [ParseTreeViewer SelectionChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the selection changes.
		/// </summary>
		private void moParseTreeViewer_SelectionChanged(object oSender,
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
		#region [ParseTreeViewer TreeChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the menu when the tree contents change.
		/// </summary>
		private void moParseTreeViewer_TreeChanged(object oSender,
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
