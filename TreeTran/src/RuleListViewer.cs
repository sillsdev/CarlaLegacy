//**************************************************************************
// File: "TreeTran\RuleListViewer.cs".
//
// This file defines the RuleListViewer class, which implements a control
// that allows the user to view and edit a list of transfer rules.
//
// History:
//     2007-Feb-20 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Windows.Forms;
using TreeTranEngine;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Implements a control that allows the user to view and edit a list of
	/// transfer rules.
	/// </summary>
	public class RuleListViewer: System.Windows.Forms.UserControl
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		private System.Windows.Forms.ListView moListView;
		private System.Windows.Forms.ImageList moImageList;
		private System.Windows.Forms.ColumnHeader moColumnHeader;
		private System.Windows.Forms.Timer moTimer;
		private System.Windows.Forms.ContextMenu moMenu;
		private System.Windows.Forms.MenuItem moUndoMenu;
		private System.Windows.Forms.MenuItem moCutSeparator;
		private System.Windows.Forms.MenuItem moCutMenu;
		private System.Windows.Forms.MenuItem moCopyMenu;
		private System.Windows.Forms.MenuItem moPasteMenu;
		private System.Windows.Forms.MenuItem moDeleteMenu;
		private System.Windows.Forms.MenuItem moNewRuleSeparator;
		private System.Windows.Forms.MenuItem moNewRuleMenu;
		private System.Windows.Forms.MenuItem moRenameMenu;
		private System.Windows.Forms.MenuItem moSelectAllSeparator;
		private System.Windows.Forms.MenuItem moSelectAllMenu;
		private System.ComponentModel.IContainer components;

		public RuleListViewer()
		{
			// This call is required by the Windows.Forms Form Designer.
			InitializeComponent();

			// TO DO: Add any initialization after the InitForm call

		}

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

		#region Component Designer generated code
		// <summary>
		// Required method for Designer support - do not modify
		// the contents of this method with the code editor.
		// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(RuleListViewer));
			this.moListView = new System.Windows.Forms.ListView();
			this.moColumnHeader = new System.Windows.Forms.ColumnHeader();
			this.moMenu = new System.Windows.Forms.ContextMenu();
			this.moUndoMenu = new System.Windows.Forms.MenuItem();
			this.moCutSeparator = new System.Windows.Forms.MenuItem();
			this.moCutMenu = new System.Windows.Forms.MenuItem();
			this.moCopyMenu = new System.Windows.Forms.MenuItem();
			this.moPasteMenu = new System.Windows.Forms.MenuItem();
			this.moDeleteMenu = new System.Windows.Forms.MenuItem();
			this.moNewRuleSeparator = new System.Windows.Forms.MenuItem();
			this.moNewRuleMenu = new System.Windows.Forms.MenuItem();
			this.moRenameMenu = new System.Windows.Forms.MenuItem();
			this.moSelectAllSeparator = new System.Windows.Forms.MenuItem();
			this.moSelectAllMenu = new System.Windows.Forms.MenuItem();
			this.moImageList = new System.Windows.Forms.ImageList(this.components);
			this.moTimer = new System.Windows.Forms.Timer(this.components);
			this.SuspendLayout();
			//
			// moListView
			//
			this.moListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						 this.moColumnHeader});
			this.moListView.ContextMenu = this.moMenu;
			this.moListView.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moListView.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.None;
			this.moListView.HideSelection = false;
			this.moListView.LabelEdit = true;
			this.moListView.Name = "moListView";
			this.moListView.Size = new System.Drawing.Size(150, 150);
			this.moListView.SmallImageList = this.moImageList;
			this.moListView.TabIndex = 0;
			this.moListView.View = System.Windows.Forms.View.Details;
			this.moListView.Resize += new System.EventHandler(this.moListView_Resize);
			this.moListView.AfterLabelEdit += new System.Windows.Forms.LabelEditEventHandler(this.moListView_AfterLabelEdit);
			this.moListView.BeforeLabelEdit += new System.Windows.Forms.LabelEditEventHandler(this.moListView_BeforeLabelEdit);
			this.moListView.SelectedIndexChanged += new System.EventHandler(this.moListView_SelectedIndexChanged);
			//
			// moMenu
			//
			this.moMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																				   this.moUndoMenu,
																				   this.moCutSeparator,
																				   this.moCutMenu,
																				   this.moCopyMenu,
																				   this.moPasteMenu,
																				   this.moDeleteMenu,
																				   this.moNewRuleSeparator,
																				   this.moNewRuleMenu,
																				   this.moRenameMenu,
																				   this.moSelectAllSeparator,
																				   this.moSelectAllMenu});
			this.moMenu.Popup += new System.EventHandler(this.moMenu_Popup);
			//
			// moUndoMenu
			//
			this.moUndoMenu.Index = 0;
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
			this.moCutMenu.Text = "Cu&t";
			this.moCutMenu.Click += new System.EventHandler(this.moCutMenu_Click);
			//
			// moCopyMenu
			//
			this.moCopyMenu.Index = 3;
			this.moCopyMenu.Text = "&Copy";
			this.moCopyMenu.Click += new System.EventHandler(this.moCopyMenu_Click);
			//
			// moPasteMenu
			//
			this.moPasteMenu.Index = 4;
			this.moPasteMenu.Text = "&Paste";
			this.moPasteMenu.Click += new System.EventHandler(this.moPasteMenu_Click);
			//
			// moDeleteMenu
			//
			this.moDeleteMenu.Index = 5;
			this.moDeleteMenu.Text = "&Delete";
			this.moDeleteMenu.Click += new System.EventHandler(this.moDeleteMenu_Click);
			//
			// moNewRuleSeparator
			//
			this.moNewRuleSeparator.Index = 6;
			this.moNewRuleSeparator.Text = "-";
			//
			// moNewRuleMenu
			//
			this.moNewRuleMenu.Index = 7;
			this.moNewRuleMenu.Text = "&New Rule";
			this.moNewRuleMenu.Click += new System.EventHandler(this.moNewRuleMenu_Click);
			//
			// moRenameMenu
			//
			this.moRenameMenu.Index = 8;
			this.moRenameMenu.Text = "&Rename";
			this.moRenameMenu.Click += new System.EventHandler(this.moRenameMenu_Click);
			//
			// moSelectAllSeparator
			//
			this.moSelectAllSeparator.Index = 9;
			this.moSelectAllSeparator.Text = "-";
			//
			// moSelectAllMenu
			//
			this.moSelectAllMenu.Index = 10;
			this.moSelectAllMenu.Text = "Select &All";
			this.moSelectAllMenu.Click += new System.EventHandler(this.moSelectAllMenu_Click);
			//
			// moImageList
			//
			this.moImageList.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit;
			this.moImageList.ImageSize = new System.Drawing.Size(16, 16);
			this.moImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("moImageList.ImageStream")));
			this.moImageList.TransparentColor = System.Drawing.Color.Transparent;
			//
			// moTimer
			//
			this.moTimer.Tick += new System.EventHandler(this.moTimer_Tick);
			//
			// RuleListViewer
			//
			this.BackColor = System.Drawing.SystemColors.Window;
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moListView});
			this.ForeColor = System.Drawing.SystemColors.WindowText;
			this.Name = "RuleListViewer";
			this.Enter += new System.EventHandler(this.RuleListViewer_Enter);
			this.Leave += new System.EventHandler(this.RuleListViewer_Leave);
			this.ResumeLayout(false);

		}
		#endregion


		#endregion
		//******************************************************************
		#region [LoadRuleFile() Method]
		//******************************************************************
		/// <summary>
		/// Loads and displays the indicated rule file (sFileName). The
		/// Modified property is set to false after the file is loaded.
		/// </summary>
		public void LoadRuleFile(string sFileName)
		{
			//**************************************************************
			// Validate the parameters.

			if ((sFileName == null) || (sFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "RuleListViewer.LoadRuleFile() requires "
					+ "a file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Clear the linked FindPatternViewer and ReplacePatternViewer.

			UpdateFindAndReplacePatternViewers(null);

			//**************************************************************
			// Reset the TreeTransferData object.

			ResetTreeTransferData();

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Clear the list of items in the ListView.

			moListView.Items.Clear();

			//**************************************************************
			// Create a RuleReader to read from the indicated rule file.

			StreamReader oStreamReader = new StreamReader(sFileName);
			RuleReader oRuleReader = new RuleReader(oStreamReader);

			//**************************************************************
			// For each rule loaded from the rule file, create a new rule
			// item and append it to the ListView.

			while (oRuleReader.Read())
			{
				RuleListViewerItem oRuleItem = new RuleListViewerItem();
				oRuleItem.Text
					= oRuleReader.RuleName;
				oRuleItem.FindPatternRoot
					= oRuleReader.FindPatternRoot;
				oRuleItem.ReplacePatternRoot
					= oRuleReader.ReplacePatternRoot;
				moListView.Items.Add(oRuleItem);
			}

			//**************************************************************
			// Close the RuleReader.

			oRuleReader.Close();

			//**************************************************************
			// Select the first item in the ListView. Make sure it is
			// scrolled into view and has focus within the ListView.

			if (moListView.Items.Count > 0)
			{
				ListViewItem oItem = moListView.Items[0];
				oItem.Selected = true;
				oItem.EnsureVisible();
				oItem.Focused = true;
			}

			//**************************************************************
			// Set the Modified property to false.

			Modified = false;

			//**************************************************************
			// Raise the SelectionChanged event.

			OnSelectionChanged(new EventArgs());

			//**************************************************************
			// Raise the ListChanged event.

			OnListChanged(new EventArgs());
		}
		#endregion
		//******************************************************************
		#region [SaveRuleFile() Method]
		//******************************************************************
		/// <summary>
		/// Saves the displayed rules to the indicated rule file
		/// (sFileName). The Modified property is set to false after the
		/// file is saved.
		/// </summary>
		public void SaveRuleFile(string sFileName)
		{
			//**************************************************************
			// Validate the parameters.

			if ((sFileName == null) || (sFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "RuleListViewer.SaveRuleFile() requires "
					+ "a file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create a RuleWriter to write to the indicated rule file.

			StreamWriter oStreamWriter = new StreamWriter(sFileName);
			RuleWriter oRuleWriter = new RuleWriter(oStreamWriter);

			//**************************************************************
			// For each item in the ListView, write the rule to the file.

			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the rule from the ListView item.

				Debug.Assert(oItem is RuleListViewerItem);

				RuleListViewerItem oRuleItem = (RuleListViewerItem) oItem;

				//**********************************************************
				// Make sure the find pattern is not null.

				SyntaxNode oFindPatternRoot
					= oRuleItem.FindPatternRoot;
				if (oFindPatternRoot == null)
				{
					oFindPatternRoot = new SyntaxNode();
				}

				//**********************************************************
				// Make sure the replace pattern is not null.

				SyntaxNode oReplacePatternRoot
					= oRuleItem.ReplacePatternRoot;
				if (oReplacePatternRoot == null)
				{
					oReplacePatternRoot = new SyntaxNode();
				}

				//**********************************************************
				// Write the rule to the file.

				oRuleWriter.RuleName = oRuleItem.Text;
				oRuleWriter.FindPatternRoot = oFindPatternRoot;
				oRuleWriter.ReplacePatternRoot = oReplacePatternRoot;
				oRuleWriter.Write();
			}

			//**************************************************************
			// Close the RuleWriter.

			oRuleWriter.Close();

			//**************************************************************
			// Set the Modified property to false.

			Modified = false;
		}
		#endregion
		//******************************************************************
		#region [ProcessParseFile() and CanProcessParseFile() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if a parse file can be processed by the currently
		/// displayed list of transfer rules. Returns false otherwise.
		/// </summary>
		public bool CanProcessParseFile()
		{
			if (moListView.Items.Count > 0)
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Uses the displayed list of transfer rules to process the parse
		/// trees in the indicated input file (sParseFileName). The modified
		/// parse trees are written to the indicate output file
		/// (sOutputFileName). A modal dialog displays status information as
		/// the file is processed. DialogResult.OK is returned if the
		/// process completed successfully. DialogResult.Cancel is returned
		/// if the process was canceled or if an error occurred.
		/// </summary>
		public DialogResult ProcessParseFile(string sParseFileName,
			string sOutputFileName)
		{
			//**************************************************************
			// Validate the current state.

			if (! CanProcessParseFile())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.ProcessParseFile() "
					+ "is not allowed if "
					+ "RuleListViewer.CanProcessParseFile() "
					+ "returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Validate the parameters.

			if ((sParseFileName == null) || (sParseFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "RuleListViewer.ProcessParseFile() requires "
					+ "a parse-file name that is not null or blank.";
				throw new Exception(sMessage);
			}
			if ((sOutputFileName == null) || (sOutputFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "RuleListViewer.ProcessParseFile() requires "
					+ "an output-file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Copy the transfer rules from the displayed list.

			TransferRuleCollection oTransferRules
				= new TransferRuleCollection();
			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the rule from the ListView item.

				Debug.Assert(oItem is RuleListViewerItem);

				RuleListViewerItem oRuleItem = (RuleListViewerItem) oItem;

				//**********************************************************
				// Copy the rule information and add it to the
				// oTransferRules collection.

				TransferRule oRule = new TransferRule();
				oRule.RuleName = oRuleItem.Text;
				oRule.FindPatternRoot = oRuleItem.FindPatternRoot;
				oRule.ReplacePatternRoot = oRuleItem.ReplacePatternRoot;
				oTransferRules.Add(oRule);
			}

			//**************************************************************
			// Perform the tree-transfer processing.

			DialogResult iResult = TransferForm.ProcessParseFile(
				oTransferRules,sParseFileName,sOutputFileName);

			//**************************************************************
			// Return the dialog result.

			return iResult;
		}
		#endregion
		//******************************************************************
		#region [ProcessParseFileAndClose() Method]
		//******************************************************************
		/// <summary>
		/// Uses the displayed list of transfer rules to process the parse
		/// trees in the indicated input file (sParseFileName). The modified
		/// parse trees are written to the indicate output file
		/// (sOutputFileName). A modal dialog displays status information as
		/// the file is processed. The dialog is automatically closed when
		/// the processing is finished. DialogResult.OK is returned if the
		/// process completed successfully. DialogResult.Cancel is returned
		/// if the process was canceled or if an error occurred.
		/// </summary>
		public DialogResult ProcessParseFileAndClose(string sParseFileName,
			string sOutputFileName)
		{
			//**************************************************************
			// Validate the current state.

			if (moListView.Items.Count == 0)
			{
				string sMessage = "The parse file could not be processed "
					+ "because the list of transfer rules is empty.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Validate the parameters.

			if ((sParseFileName == null) || (sParseFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "RuleListViewer.ProcessParseFileAndClose() requires "
					+ "a parse-file name that is not null or blank.";
				throw new Exception(sMessage);
			}
			if ((sOutputFileName == null) || (sOutputFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "RuleListViewer.ProcessParseFileAndClose() requires "
					+ "an output-file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Copy the transfer rules from the displayed list.

			TransferRuleCollection oTransferRules
				= new TransferRuleCollection();
			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the rule from the ListView item.

				Debug.Assert(oItem is RuleListViewerItem);

				RuleListViewerItem oRuleItem = (RuleListViewerItem) oItem;

				//**********************************************************
				// Copy the rule information and add it to the
				// oTransferRules collection.

				TransferRule oRule = new TransferRule();
				oRule.RuleName = oRuleItem.Text;
				oRule.FindPatternRoot = oRuleItem.FindPatternRoot;
				oRule.ReplacePatternRoot = oRuleItem.ReplacePatternRoot;
				oTransferRules.Add(oRule);
			}

			//**************************************************************
			// Perform the tree-transfer processing.

			DialogResult iResult = TransferForm.ProcessParseFileAndClose(
				oTransferRules,sParseFileName,sOutputFileName);

			//**************************************************************
			// Return the dialog result.

			return iResult;
		}
		#endregion
		//******************************************************************
		#region [FirstIndexForUndo and ItemCountForUndo Properties]
		//******************************************************************
		/// <summary>
		/// The FirstIndexForUndo property value.
		/// </summary>
		private int miFirstIndexForUndo = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the FirstIndexForUndo property. To undo the last
		/// edit operation, a range of items in the ListView (starting at
		/// the index indicated by FirstIndexForUndo and containing the
		/// number of items specified by ItemCountForUndo) must be replaced
		/// by the rules in the TransferRulesForUndo collection.
		/// </summary>
		private int FirstIndexForUndo
		{
			set
			{
				miFirstIndexForUndo = value;

				Debug.Assert(miFirstIndexForUndo >= 0);
			}
			get
			{
				return miFirstIndexForUndo;
			}
		}
		//******************************************************************
		/// <summary>
		/// The ItemCountForUndo property value.
		/// </summary>
		private int miItemCountForUndo = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ItemCountForUndo property. To undo the last
		/// edit operation, a range of items in the ListView (starting at
		/// the index indicated by FirstIndexForUndo and containing the
		/// number of items specified by ItemCountForUndo) must be replaced
		/// by the rules in the TransferRulesForUndo collection.
		/// </summary>
		private int ItemCountForUndo
		{
			set
			{
				miItemCountForUndo = value;

				Debug.Assert(miItemCountForUndo >= 0);
			}
			get
			{
				return miItemCountForUndo;
			}
		}
		#endregion
		//******************************************************************
		#region [TransferRulesForUndo Property]
		//******************************************************************
		/// <summary>
		/// The TransferRulesForUndo property value.
		/// </summary>
		private TransferRuleCollection moTransferRulesForUndo = null;
		//******************************************************************
		/// <summary>
		/// Gets the TransferRulesForUndo collection. To undo the last edit
		/// operation, a range of items in the ListView (starting at the
		/// index indicated by FirstIndexForUndo and containing the number
		/// of items specified by ItemCountForUndo) must be replaced by the
		/// rules in the TransferRulesForUndo collection.
		/// </summary>
		private TransferRuleCollection TransferRulesForUndo
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moTransferRulesForUndo == null)
				{
					moTransferRulesForUndo = new TransferRuleCollection();
				}

				//**********************************************************
				// Return the collection.

				return moTransferRulesForUndo;
			}
		}
		#endregion
		//******************************************************************
		#region [ClearUndoInformation() Method]
		//******************************************************************
		/// <summary>
		/// Clears the undo information. FirstIndexForUndo is set to zero,
		/// ItemCountForUndo is set to zero, and all items are removed from
		/// the TransferRulesForUndo collection.
		/// </summary>
		private void ClearUndoInformation()
		{
			FirstIndexForUndo = 0;
			ItemCountForUndo = 0;
			TransferRulesForUndo.Clear();
		}
		#endregion
		//******************************************************************
		#region [ReadOnly Property]
		//******************************************************************
		/// <summary>
		/// The ReadOnly property value.
		/// </summary>
		private bool mbReadOnly = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ReadOnly property, which is false if the user
		/// can edit the list, and true if the user is not allowed to edit.
		/// </summary>
		public bool ReadOnly
		{
			set
			{
				mbReadOnly = value;
			}
			get
			{
				return mbReadOnly;
			}
		}
		#endregion
		//******************************************************************
		#region [Modified Property]
		//******************************************************************
		/// <summary>
		/// The Modified property value.
		/// </summary>
		private bool mbModified = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the Modified property. This property is set to
		/// false by the LoadRuleFile() and SaveRuleFile() methods. It is
		/// then set to true whenever changes are made to the list contents
		/// (including any changes to the trees represented by the list
		/// items).
		/// </summary>
		public bool Modified
		{
			set
			{
				mbModified = value;
			}
			get
			{
				return mbModified;
			}
		}
		#endregion
		//******************************************************************
		#region [InEditMode Property]
		//******************************************************************
		/// <summary>
		/// The InEditMode property value.
		/// </summary>
		private bool mbInEditMode = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the InEditMode property, which is true if a
		/// ListView item is in edit mode (where the user can edit its text
		/// label) and false otherwise. The BeforeLabelEdit event handler
		/// sets this value to true, and the AfterLabelEdit event handler
		/// sets this value back to false.
		/// </summary>
		private bool InEditMode
		{
			set
			{
				mbInEditMode = value;
			}
			get
			{
				return mbInEditMode;
			}
		}
		#endregion
		//******************************************************************
		#region [Undo() and CanUndo() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the control can undo the last edit operation.
		/// Returns false otherwise. (When a rule name is in edit mode,
		/// CanUndo() returns false and the form must disable its Undo menu
		/// so Control+Z can be used to edit the name.)
		/// </summary>
		public bool CanUndo()
		{
			if (! ReadOnly)
			{
				if (! InEditMode)
				{
					if (ItemCountForUndo > 0)
					{
						return true;
					}
					if (TransferRulesForUndo.Count > 0)
					{
						return true;
					}
				}
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Undoes the last edit operation.
		/// </summary>
		public void Undo()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanUndo())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.Undo() is not allowed "
					+ "if RuleListViewer.CanUndo() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only tree.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Prevent list modification if an item is in edit mode.

			if (InEditMode)
			{
				return;
			}

			//**************************************************************
			// Set the Modified property to true.

			Modified = true;

			//**************************************************************
			// Clear the selection.

			ClearSelection();

			//**************************************************************
			// Clear the linked FindPatternViewer and ReplacePatternViewer.

			UpdateFindAndReplacePatternViewers(null);

			//**************************************************************
			// Reset the TreeTransferData object.

			ResetTreeTransferData();

			//**************************************************************
			// Make a copy of the undo information.
			//
			// Note: Read the comments before the Paste() and Delete()
			// methods to see examples of what the undo information looks
			// like.

			int iFirstIndexForUndo = FirstIndexForUndo;
			int iItemCountForUndo = ItemCountForUndo;
			TransferRuleCollection oTransferRulesForUndo
				= new TransferRuleCollection();
			foreach (TransferRule oRule in TransferRulesForUndo)
			{
				oTransferRulesForUndo.Add(oRule);
			}

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Make a copy of the rules that will be replaced. (Starting at
			// index iFirstIndexForUndo, copy the number of rules specified
			// by iItemCountForUndo.)

			Debug.Assert(iFirstIndexForUndo >= 0);
			Debug.Assert(iItemCountForUndo >= 0);
			Debug.Assert((iFirstIndexForUndo + iItemCountForUndo)
				<= moListView.Items.Count);

			TransferRuleCollection oReplacedRules
				= new TransferRuleCollection();
			for (int iIndex = iFirstIndexForUndo;
				iIndex < (iFirstIndexForUndo + iItemCountForUndo); ++iIndex)
			{
				if (iIndex < moListView.Items.Count)
				{
					ListViewItem oItem = moListView.Items[iIndex];

					//******************************************************
					// Get the rule from the ListView item.

					Debug.Assert(oItem is RuleListViewerItem);

					RuleListViewerItem oRuleItem
						= (RuleListViewerItem) oItem;

					//******************************************************
					// Copy the rule information and add it to the
					// oReplacedRules collection.

					TransferRule oRule = new TransferRule();
					oRule.RuleName = oRuleItem.Text;
					oRule.FindPatternRoot = oRuleItem.FindPatternRoot;
					oRule.ReplacePatternRoot = oRuleItem.ReplacePatternRoot;
					oReplacedRules.Add(oRule);
				}
			}

			//**************************************************************
			// Delete the rules that are being replaced. (Starting at index
			// iFirstIndexForUndo, delete the number of rules specified by
			// iItemCountForUndo.)

			if (iItemCountForUndo > 0)
			{
				DeleteRules(iFirstIndexForUndo,iItemCountForUndo);
			}

			//**************************************************************
			// Insert the replacement rules (from the undo information in
			// oTransferRulesForUndo). The inserted rules will be selected.

			if (oTransferRulesForUndo.Count > 0)
			{
				InsertRules(iFirstIndexForUndo,oTransferRulesForUndo);
			}

			//**************************************************************
			// Unselect any rules that appear with the same information in
			// the oReplacedRules collection. (We do not want rules to be
			// selected if they were already in the list when the undo
			// command was issued.)

			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the rule from the ListView item.

				Debug.Assert(oItem is RuleListViewerItem);

				RuleListViewerItem oRuleItem = (RuleListViewerItem) oItem;

				//**********************************************************
				// Does the rule have the same information as a rule in the
				// oReplacedRules collection? If so, unselect it.

				if (oRuleItem.Selected)
				{
					foreach (TransferRule oRule in oReplacedRules)
					{
						if ((oRuleItem.Text == oRule.RuleName)
							&& (oRuleItem.FindPatternRoot
							== oRule.FindPatternRoot)
							&& (oRuleItem.ReplacePatternRoot
							== oRule.ReplacePatternRoot))
						{
							oRuleItem.Selected = false;
						}
					}
				}
			}

			//**************************************************************
			// Select the item at the iFirstSelectedIndex position. If there
			// is no longer an item at that position, select the last item
			// in the list.

			if (iFirstIndexForUndo < moListView.Items.Count)
			{
				moListView.Items[iFirstIndexForUndo].Selected = true;
			}
			else
			{
				if (moListView.Items.Count > 0)
				{
					int iIndex = moListView.Items.Count - 1;
					moListView.Items[iIndex].Selected = true;
				}
			}

			//**************************************************************
			// Make sure the new selected item (if any) is scrolled into
			// view and has focus within the ListView.

			RuleListViewerItem oFirstSelectedItem = FirstSelectedItem();
			if (oFirstSelectedItem != null)
			{
				oFirstSelectedItem.EnsureVisible();
				oFirstSelectedItem.Focused = true;
			}

			//**************************************************************
			// Raise the SelectionChanged event.

			OnSelectionChanged(new EventArgs());

			//**************************************************************
			// Raise the ListChanged event.

			OnListChanged(new EventArgs());
		}
		#endregion
		//******************************************************************
		#region [Cut() and CanCut() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection can be cut to the
		/// clipboard. Returns false otherwise. (When a rule name is in edit
		/// mode, CanCut() returns false and the form must disable its Cut
		/// menu so Control+X can be used to edit the name.)
		/// </summary>
		public bool CanCut()
		{
			if ((CanCopy()) && (CanDelete()))
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Cuts the current selection to the clipboard.
		/// </summary>
		public void Cut()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanCut())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.Cut() is not allowed "
					+ "if RuleListViewer.CanCut() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Copy the current selection, then delete it.

			Copy();
			Delete();
		}
		#endregion
		//******************************************************************
		#region [Copy() and CanCopy() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection can be copied to the
		/// clipboard. Returns false otherwise. (When a rule name is in edit
		/// mode, CanCopy() returns false and the form must disable its Copy
		/// menu so Control+C can be used to edit the name.)
		/// </summary>
		public bool CanCopy()
		{
			if (! InEditMode)
			{
				if (FirstSelectedItem() != null)
				{
					return true;
				}
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Copies the current selection to the clipboard.
		/// </summary>
		public void Copy()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanCopy())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.Copy() is not allowed "
					+ "if RuleListViewer.CanCopy() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create a RuleWriter that writes to a string.

			StringBuilder oStringBuilder = new StringBuilder();
			TextWriter oTextWriter = new StringWriter(oStringBuilder);
			RuleWriter oRuleWriter = new RuleWriter(oTextWriter);

			//**************************************************************
			// Write each selected rule to the string.

			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the rule from the ListView item.

				Debug.Assert(oItem is RuleListViewerItem);

				RuleListViewerItem oRuleItem = (RuleListViewerItem) oItem;

				//**********************************************************
				// If the item is selected, write the rule to the string.

				if (oRuleItem.Selected)
				{
					//******************************************************
					// Make sure the find pattern is not null.

					SyntaxNode oFindPatternRoot
						= oRuleItem.FindPatternRoot;
					if (oFindPatternRoot == null)
					{
						oFindPatternRoot = new SyntaxNode();
					}

					//******************************************************
					// Make sure the replace pattern is not null.

					SyntaxNode oReplacePatternRoot
						= oRuleItem.ReplacePatternRoot;
					if (oReplacePatternRoot == null)
					{
						oReplacePatternRoot = new SyntaxNode();
					}

					//******************************************************
					// Write the rule to the string.

					oRuleWriter.RuleName = oRuleItem.Text;
					oRuleWriter.FindPatternRoot = oFindPatternRoot;
					oRuleWriter.ReplacePatternRoot = oReplacePatternRoot;
					oRuleWriter.Write();
				}
			}

			//**************************************************************
			// Close the RuleWriter.

			oRuleWriter.Close();

			//**************************************************************
			// Copy the string to the clipboard.

			const bool bCopy = true;
			Clipboard.SetDataObject(oStringBuilder.ToString(),bCopy);
		}
		#endregion
		//******************************************************************
		#region [Paste() and CanPaste() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the control can paste the current contents of
		/// the clipboard. Returns false otherwise. (When a rule name is in
		/// edit mode, CanPaste() returns false and the form must disable
		/// its Paste menu so Control+V can be used to edit the name.)
		/// </summary>
		public bool CanPaste()
		{
			if (! ReadOnly)
			{
				if (! InEditMode)
				{
					return true;
				}
			}
			return false;
		}
		//******************************************************************
		// EXAMPLE UNDO INFORMATION FOR A PASTE OPERATION
		//
		// Before the paste operation, suppose the ListView displays the
		// following items:
		//
		//     (index 0) Item-A
		//     (index 1) Item-B
		//     (index 2) Item-C (selected)
		//     (index 3) Item-D
		//     (index 4) Item-E
		//     (index 5) Item-F (selected)
		//     (index 6) Item-G
		//
		// Suppose the clipboard contains (Item-X,Item-Y,Item-Z). After the
		// paste operation, the ListView will display the following items:
		//
		//     (index 0) Item-A
		//     (index 1) Item-B
		//     (index 2) Item-X (selected)
		//     (index 3) Item-Y (selected)
		//     (index 4) Item-Z (selected)
		//     (index 5) Item-C
		//     (index 6) Item-D
		//     (index 7) Item-E
		//     (index 8) Item-F
		//     (index 9) Item-G
		//
		// And the undo information will contain:
		//
		//     FirstIndexForUndo = 2
		//     ItemCountForUndo = 3
		//     TransferRulesForUndo = ()
		//
		// This undo information indicates what is needed to reverse the
		// paste operation: replace the 3 items starting at index 2 with
		// the items in the TransferRulesForUndo collection (which in this
		// case contains no items).
		//******************************************************************
		/// <summary>
		/// Pastes the current contents of the clipboard.
		/// </summary>
		public void Paste()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanPaste())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.Paste() is not allowed "
					+ "if RuleListViewer.CanPaste() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only list.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Prevent list modification if an item is in edit mode.

			if (InEditMode)
			{
				return;
			}

			//**************************************************************
			// Reset the TreeTransferData object.

			ResetTreeTransferData();

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Get the string data on the clipboard, or return (without
			// reporting an error) if there is no string data on the
			// clipboard.

			IDataObject oDataObject = Clipboard.GetDataObject();
			if (oDataObject == null)
			{
				return;
			}
			if (! oDataObject.GetDataPresent(typeof(string)))
			{
				return;
			}
			string sString = (string) oDataObject.GetData(typeof(string));
			if (sString == null)
			{
				return;
			}

			//**************************************************************
			// Return (without reporting an error) if the string data does
			// not look at all like XML.

			if (sString.IndexOf("<") < 0)
			{
				return;
			}
			if (sString.IndexOf("/") < 0)
			{
				return;
			}
			if (sString.IndexOf(">") < 0)
			{
				return;
			}

			//**************************************************************
			// Use a RuleReader to read the all the rules represented by the
			// string data.

			TransferRuleCollection oTransferRules
				= new TransferRuleCollection();
			try
			{
				TextReader oTextReader = new StringReader(sString);
				RuleReader oRuleReader = new RuleReader(oTextReader);
				while (oRuleReader.Read())
				{
					TransferRule oRule = new TransferRule();
					oRule.RuleName
						= oRuleReader.RuleName;
					oRule.FindPatternRoot
						= oRuleReader.FindPatternRoot;
					oRule.ReplacePatternRoot
						= oRuleReader.ReplacePatternRoot;
					oTransferRules.Add(oRule);
				}
				oRuleReader.Close();
			}
			catch (Exception oException)
			{
				string sCaption = "Paste";
				string sMessage = "Cannot paste because "
					+ "the clipboard data is not compatible."
					+ Environment.NewLine + Environment.NewLine
					+ "(" + oException.Message  + ")";
				MessageBox.Show(sMessage,sCaption,MessageBoxButtons.OK,
					MessageBoxIcon.Warning);
				return;
			}

			//**************************************************************
			// Return (without reporting an error) if the collection of
			// rules (from the string data) is empty.

			if (oTransferRules.Count == 0)
			{
				return;
			}

			//**************************************************************
			// Set the Modified property to true.

			Modified = true;

			//**************************************************************
			// Determine the first index where the rules will be pasted.

			int iFirstIndex = 0;
			RuleListViewerItem oFirstSelectedItem = FirstSelectedItem();
			if (oFirstSelectedItem != null)
			{
				//**********************************************************
				// Insert before the first selected item in the list.

				iFirstIndex = oFirstSelectedItem.Index;
			}
			else
			{
				//**********************************************************
				// If no items are selected, append after the last item in
				// the list.

				iFirstIndex = moListView.Items.Count;
			}

			//**************************************************************
			// Paste the rules. (The pasted rules will be selected.)

			InsertRules(iFirstIndex,oTransferRules);

			Debug.Assert(FirstSelectedItem() != null);

			//**************************************************************
			// Set the undo information.

			FirstIndexForUndo = iFirstIndex;
			ItemCountForUndo = oTransferRules.Count;
			TransferRulesForUndo.Clear();

			//**************************************************************
			// Raise the ListChanged event.

			OnListChanged(new EventArgs());
		}
		#endregion
		//******************************************************************
		#region [Delete() and CanDelete() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection can be deleted. Returns
		/// false otherwise. (When a rule name is in edit mode, CanDelete()
		/// returns false and the form must disable its Delete menu so the
		/// Delete key can be used to edit the name.)
		/// </summary>
		public bool CanDelete()
		{
			if (! ReadOnly)
			{
				if (! InEditMode)
				{
					if (FirstSelectedItem() != null)
					{
						return true;
					}
				}
			}
			return false;
		}
		//******************************************************************
		// EXAMPLE UNDO INFORMATION FOR A DELETE OPERATION
		//
		// Before the delete operation, suppose the ListView displays the
		// following items:
		//
		//     (index 0) Item-A
		//     (index 1) Item-B (selected)
		//     (index 2) Item-C
		//     (index 3) Item-D
		//     (index 4) Item-E (selected)
		//     (index 5) Item-F (selected)
		//     (index 6) Item-G
		//     (index 7) Item-H
		//
		// After the delete operation, the ListView will display the
		// following items:
		//
		//     (index 0) Item-A
		//     (index 1) Item-C (selected)
		//     (index 2) Item-D
		//     (index 3) Item-G
		//     (index 4) Item-H
		//
		// And the undo information will contain:
		//
		//     FirstIndexForUndo = 1
		//     ItemCountForUndo = 2
		//     TransferRulesForUndo = (Item-B,Item-C,Item-D,Item-E,Item-F)
		//
		// This undo information indicates what is needed to reverse the
		// delete operation: replace the 2 items starting at index 1 with
		// the items in the TransferRulesForUndo collection.
		//******************************************************************
		/// <summary>
		/// Deletes the current selection.
		/// </summary>
		public void Delete()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanDelete())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.Delete() is not allowed "
					+ "if RuleListViewer.CanDelete() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only list.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Prevent list modification if an item is in edit mode.

			if (InEditMode)
			{
				return;
			}

			//**************************************************************
			// Set the Modified property to true.

			Modified = true;

			//**************************************************************
			// Reset the TreeTransferData object.

			ResetTreeTransferData();

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Determine the first and last selected items.

			RuleListViewerItem oFirstSelectedItem = FirstSelectedItem();
			RuleListViewerItem oLastSelectedItem = LastSelectedItem();

			//**************************************************************
			// Create the undo information:
			//
			// Set iFirstIndexForUndo to the first selected index.
			//
			// Copy the rules from the first selected item through (and
			// including) the last selected item, storing the copied rules
			// in the oTransferRulesForUndo collection.
			//
			// Count the rules in the oTransferRulesForUndo collection that
			// were not selected. Set iItemCountForUndo to this count.
			// (These non-selected rules will not be deleted from the list.)

			int iFirstIndexForUndo = 0;
			int iItemCountForUndo = 0;
			TransferRuleCollection oTransferRulesForUndo
				= new TransferRuleCollection();
			if ((oFirstSelectedItem != null) && (oLastSelectedItem != null))
			{
				//**********************************************************
				// Set iFirstIndexForUndo to the first selected index.

				iFirstIndexForUndo = oFirstSelectedItem.Index;

				//**********************************************************
				// Copy the rules from the first selected item through (and
				// including) the last selected item.

				for (int iIndex = oFirstSelectedItem.Index;
					iIndex <= oLastSelectedItem.Index; ++iIndex)
				{
					ListViewItem oItem = moListView.Items[iIndex];

					//******************************************************
					// Get the rule from the ListView item.

					Debug.Assert(oItem is RuleListViewerItem);

					RuleListViewerItem oRuleItem
						= (RuleListViewerItem) oItem;

					//******************************************************
					// Copy the rule information and add it to the
					// oTransferRulesForUndo collection.

					TransferRule oRule = new TransferRule();
					oRule.RuleName = oRuleItem.Text;
					oRule.FindPatternRoot = oRuleItem.FindPatternRoot;
					oRule.ReplacePatternRoot = oRuleItem.ReplacePatternRoot;
					oTransferRulesForUndo.Add(oRule);

					//******************************************************
					// Count the non-selected rules (that were copied to
					// oTransferRulesForUndo but will not be deleted).

					if (! oItem.Selected)
					{
						++iItemCountForUndo;
					}
				}
			}

			//**************************************************************
			// Delete the selected items from the ListView in reverse order.
			// (This prevents multiple selection changes that would update
			// the linked tree viewers multiple times.)

			for (int iIndex = (moListView.Items.Count - 1);
				iIndex >= 0; --iIndex)
			{
				ListViewItem oItem = moListView.Items[iIndex];
				if (oItem.Selected)
				{
					oItem.Remove();
				}
			}

			Debug.Assert(FirstSelectedItem() == null);

			//**************************************************************
			// Clear the linked FindPatternViewer and ReplacePatternViewer.

			UpdateFindAndReplacePatternViewers(null);

			//**************************************************************
			// Set the undo information.

			FirstIndexForUndo = iFirstIndexForUndo;
			ItemCountForUndo = iItemCountForUndo;
			TransferRulesForUndo.Clear();
			foreach (TransferRule oRule in oTransferRulesForUndo)
			{
				TransferRulesForUndo.Add(oRule);
			}

			//**************************************************************
			// Select the item at the iFirstSelectedIndex position. If there
			// is no longer an item at that position, select the last item
			// in the list.

			if (iFirstIndexForUndo < moListView.Items.Count)
			{
				moListView.Items[iFirstIndexForUndo].Selected = true;
			}
			else
			{
				if (moListView.Items.Count > 0)
				{
					int iIndex = moListView.Items.Count - 1;
					moListView.Items[iIndex].Selected = true;
				}
			}

			//**************************************************************
			// Make sure the new selected item (if any) is scrolled into
			// view and has focus within the ListView.

			oFirstSelectedItem = FirstSelectedItem();
			if (oFirstSelectedItem != null)
			{
				oFirstSelectedItem.EnsureVisible();
				oFirstSelectedItem.Focused = true;
			}

			//**************************************************************
			// Raise the SelectionChanged event.

			OnSelectionChanged(new EventArgs());

			//**************************************************************
			// Raise the ListChanged event.

			OnListChanged(new EventArgs());
		}
		#endregion
		//******************************************************************
		#region [AddNewRule() and CanAddNewRule() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if a new rule can be added to the list. Returns
		/// false otherwise.
		/// </summary>
		public bool CanAddNewRule()
		{
			if (! ReadOnly)
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Adds a new item to the list of rules. The item is placed in edit
		/// mode so the user can rename the new rule.
		/// </summary>
		public void AddNewRule()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanAddNewRule())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.AddNewRule() is not "
					+ "allowed if RuleListViewer.CanAddNewRule() returns "
					+ "false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only list.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Set the Modified property to true.
			//
			// If the list is empty and Modified is false, adding a blank
			// new rule does not set Modified to true. (Modified will be set
			// to true later if the user makes any changes to the blank new
			// rule, or if the user makes any other changes to the list.)

			if (moListView.Items.Count > 0)
			{
				Modified = true;
			}

			//**************************************************************
			// Clear the selection.

			ClearSelection();

			//**************************************************************
			// Clear the linked FindPatternViewer and ReplacePatternViewer.

			UpdateFindAndReplacePatternViewers(null);

			//**************************************************************
			// Reset the TreeTransferData object.

			ResetTreeTransferData();

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Create a new rule item and append it to the list.

			RuleListViewerItem oRuleItem = new RuleListViewerItem();
			oRuleItem.Text = "(new rule)";
			oRuleItem.FindPatternRoot = new SyntaxNode();
			oRuleItem.ReplacePatternRoot = new SyntaxNode();
			moListView.Items.Add(oRuleItem);

			//**************************************************************
			// Select the item. Make sure it is scrolled into view and has
			// focus within the ListView.

			oRuleItem.Selected = true;
			oRuleItem.EnsureVisible();
			oRuleItem.Focused = true;

			//**************************************************************
			// Raise the SelectionChanged event.

			OnSelectionChanged(new EventArgs());

			//**************************************************************
			// Raise the ListChanged event.

			OnListChanged(new EventArgs());

			//**************************************************************
			// Place the item in edit mode so the user can edit the name of
			// the new rule. (If the user changes the rule name, the
			// AfterLabelEdit event handler will raise the ListChanged
			// event again.)

			oRuleItem.BeginEdit();
		}
		#endregion
		//******************************************************************
		#region [RenameRule() and CanRenameRule() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection is a rule that the user
		/// can rename. Returns false otherwise.
		/// </summary>
		public bool CanRenameRule()
		{
			if (! ReadOnly)
			{
				if (FirstSelectedItem() != null)
				{
					return true;
				}
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Places the current item in edit mode so the user can rename the
		/// selected rule.
		/// </summary>
		public void RenameRule()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanRenameRule())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.RenameRule() is not "
					+ "allowed if RuleListViewer.CanRenameRule() returns "
					+ "false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only list.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Place the first selected item in edit mode so the user can
			// edit the rule name. (If the user changes the rule name, the
			// AfterLabelEdit event handler will clear the undo information,
			// set the Modified property to true, and raise the ListChanged
			// event.)

			RuleListViewerItem oFirstSelectedItem = FirstSelectedItem();
			if (oFirstSelectedItem != null)
			{
				oFirstSelectedItem.BeginEdit();
			}
		}
		#endregion
		//******************************************************************
		#region [SelectAll() and CanSelectAll() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the control can select all of the items in the
		/// list. Returns false otherwise.
		/// </summary>
		public bool CanSelectAll()
		{
			return true;
		}
		//******************************************************************
		/// <summary>
		/// Selects all of the items in the list.
		/// </summary>
		public void SelectAll()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanSelectAll())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.SelectAll() is not allowed "
					+ "if RuleListViewer.CanSelectAll() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Select all of the ListView items.

			foreach (ListViewItem oItem in moListView.Items)
			{
				oItem.Selected = true;
			}
		}
		#endregion
		//******************************************************************
		#region [InsertRules() and DeleteRules() Methods]
		//******************************************************************
		/// <summary>
		/// Inserts the given rules (oTransferRules) into the ListView,
		/// starting at the indicated index (iFirstIndex). The inserted
		/// rules are selected.
		/// </summary>
		private void InsertRules(int iFirstIndex,
			TransferRuleCollection oTransferRules)
		{
			Debug.Assert(iFirstIndex >= 0);
			Debug.Assert(oTransferRules != null);
			Debug.Assert(oTransferRules.Count > 0);

			//**************************************************************
			// Clear the selection.

			ClearSelection();

			//**************************************************************
			// Insert the given rules starting at the indicated index.

			int iIndex = iFirstIndex;
			foreach (TransferRule oRule in oTransferRules)
			{
				//**********************************************************
				// Create the item to display in the ListView.

				RuleListViewerItem oRuleItem = new RuleListViewerItem();
				oRuleItem.Text = oRule.RuleName;
				oRuleItem.FindPatternRoot = oRule.FindPatternRoot;
				oRuleItem.ReplacePatternRoot = oRule.ReplacePatternRoot;

				//**********************************************************
				// Insert or append the item in the ListView.

				if (iIndex < moListView.Items.Count)
				{
					moListView.Items.Insert(iIndex,oRuleItem);
				}
				else
				{
					moListView.Items.Add(oRuleItem);
				}

				//**********************************************************
				// Select the item and make sure it is scrolled into view.

				oRuleItem.Selected = true;
				oRuleItem.EnsureVisible();

				//**********************************************************
				// Increment the index.

				++iIndex;
			}

			//**************************************************************
			// Make sure the first selected item is scrolled into view and
			// has focus within the ListView.

			RuleListViewerItem oFirstSelectedItem = FirstSelectedItem();
			if (oFirstSelectedItem != null)
			{
				oFirstSelectedItem.EnsureVisible();
				oFirstSelectedItem.Focused = true;
			}
		}
		//******************************************************************
		/// <summary>
		/// Deletes the specified number of items (iRuleCount) from the
		/// ListView, starting at the indicated index (iFirstIndex).
		/// </summary>
		private void DeleteRules(int iFirstIndex,int iRuleCount)
		{
			Debug.Assert(iFirstIndex >= 0);
			Debug.Assert(iRuleCount >= 0);
			Debug.Assert((iFirstIndex + iRuleCount)
				<= moListView.Items.Count);

			//**************************************************************
			// Delete the indicated items in reverse order. (This prevents
			// multiple selection changes that would update the linked tree
			// viewers multiple times.)

			int iCount = 0;
			while (iCount < iRuleCount)
			{
				++iCount;
				int iIndex = iFirstIndex + iRuleCount - iCount;
				if (iIndex < moListView.Items.Count)
				{
					moListView.Items.RemoveAt(iIndex);
				}
			}
		}
		#endregion
		//******************************************************************
		#region [FirstSelectedItem() and LastSelectedItem() Methods]
		//******************************************************************
		/// <summary>
		/// Returns the first selected item in the ListView. Returns null if
		/// no item is selected.
		/// </summary>
		private RuleListViewerItem FirstSelectedItem()
		{
			foreach (ListViewItem oItem in moListView.Items)
			{
				if (oItem.Selected)
				{
					Debug.Assert(oItem is RuleListViewerItem);

					return (RuleListViewerItem) oItem;
				}
			}
			return null;
		}
		//******************************************************************
		/// <summary>
		/// Returns the last selected item in the ListView. Returns null if
		/// no item is selected.
		/// </summary>
		private RuleListViewerItem LastSelectedItem()
		{
			RuleListViewerItem oRuleItem = null;
			foreach (ListViewItem oItem in moListView.Items)
			{
				if (oItem.Selected)
				{
					Debug.Assert(oItem is RuleListViewerItem);

					oRuleItem = (RuleListViewerItem) oItem;
				}
			}
			return oRuleItem;
		}
		#endregion
		//******************************************************************
		#region [ClearSelection() Method]
		//******************************************************************
		/// <summary>
		/// Clears the selection in the ListView. (The selection is cleared
		/// in reverse order to prevent multiple selection changes that
		/// would update the linked tree viewers multiple times.)
		/// </summary>
		private void ClearSelection()
		{
			RuleListViewerItem oLastSelectedItem = LastSelectedItem();
			while (oLastSelectedItem != null)
			{
				oLastSelectedItem.Selected = false;
				oLastSelectedItem = LastSelectedItem();
			}
		}
		#endregion
		//******************************************************************
		#region [TreeTransferData Property]
		//******************************************************************
		/// <summary>
		/// The TreeTransferData property value.
		/// </summary>
		private TreeTransfer moTreeTransferData = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the TreeTransfer object that is used by the
		/// FindMatchingBranch() and ReplaceMatchingBranch() methods to
		/// represent the current state (parse tree, find pattern, replace
		/// pattern, current node) for interactively applying transfer
		/// rules.
		/// </summary>
		private TreeTransfer TreeTransferData
		{
			set
			{
				moTreeTransferData = value;
			}
			get
			{
				return moTreeTransferData;
			}
		}
		#endregion
		//******************************************************************
		#region [InitializeTreeTransferData() Method]
		//******************************************************************
		/// <summary>
		/// If the TreeTransferData object is null, it is set to a new
		/// TreeTransfer object. If the TreeTransferData object's
		/// .CurrentParseTreeNode is null, its .ParseTreeRoot is set to a
		/// copy of the parse tree in the linked ParseTreeViewer, and its
		/// .FindPatternRoot and .ReplacePatternRoot are set to the find
		/// and replace patterns indicated by the SelectedRule.
		/// </summary>
		private void InitializeTreeTransferData()
		{
			//**************************************************************
			// Set the TreeTransferData property to a new TreeTransfer
			// object if the TreeTransferData property is currently null.

			if (TreeTransferData == null)
			{
				TreeTransferData = new TreeTransfer();
			}

			//**************************************************************
			// If TreeTransferData.CurrentParseTreeNode is null, set the
			// .ParseTreeRoot, .FindPatternRoot and .ReplacePatternRoot
			// properties of the TreeTransferData object.
			//
			// If TreeTransferData.CurrentParseTreeNode is not null, these
			// properties are not changed, because setting these properties
			// would clear the .CurrentParseTreeNode property (resetting the
			// current search position in the tree).

			if (TreeTransferData.CurrentParseTreeNode == null)
			{
				//**********************************************************
				// Set the TreeTransferData.ParseTreeRoot property to a copy
				// of the parse tree in the linked ParseTreeViewer.

				TreeTransferData.ParseTreeRoot = null;
				if (LinkedParseTreeViewer != null)
				{
					TreeTransferData.ParseTreeRoot
						= LinkedParseTreeViewer.CloneTree();
				}

				//**********************************************************
				// Set the TreeTransferData.FindPatternRoot property to the
				// find-pattern of the SelectedRule.

				TreeTransferData.FindPatternRoot = null;
				if (SelectedRule != null)
				{
					TreeTransferData.FindPatternRoot
						= SelectedRule.FindPatternRoot;
				}
				if (TreeTransferData.FindPatternRoot == null)
				{
					TreeTransferData.FindPatternRoot = new SyntaxNode();
				}

				//**********************************************************
				// Set the TreeTransferData.ReplacePatternRoot property to
				// the replace-pattern of the SelectedRule.

				TreeTransferData.ReplacePatternRoot = null;
				if (SelectedRule != null)
				{
					TreeTransferData.ReplacePatternRoot
						= SelectedRule.ReplacePatternRoot;
				}
				if (TreeTransferData.ReplacePatternRoot == null)
				{
					TreeTransferData.ReplacePatternRoot = new SyntaxNode();
				}
			}
		}
		#endregion
		//******************************************************************
		#region [ResetTreeTransferData() Method]
		//******************************************************************
		/// <summary>
		/// Sets the TreeTransferData object to null and then calls the
		/// InitializeTreeTransferData() method to reinitialize the
		/// TreeTransferData object.
		/// </summary>
		private void ResetTreeTransferData()
		{
			TreeTransferData = null;
			InitializeTreeTransferData();
		}
		#endregion
		//******************************************************************
		#region [FindMatchingBranch() and CanFindMatchingBranch() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the displayed rules can be used to search for a
		/// matching parse-tree branch. Returns false otherwise.
		/// </summary>
		public bool CanFindMatchingBranch()
		{
			if (moListView.Items.Count > 0)
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Uses the displayed rules to search for the next matching
		/// parse-tree branch (starting after the last branch that was
		/// matched). The search result is highlighted in the
		/// LinkedParseTreeViewer. Returns true if a match is found.
		/// Otherwise, false is returned.
		/// </summary>
		public bool FindMatchingBranch()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanFindMatchingBranch())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.FindMatchingBranch() "
					+ "is not allowed if "
					+ "RuleListViewer.CanFindMatchingBranch() "
					+ "returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Validate the linked viewers.
			//
			// The LinkedParseTreeViewer cannot be null, because there would
			// be no parse tree to search.
			//
			// The LinkedParseListViewer can be null (in which case we only
			// search the single parse tree in the LinkedParseTreeViewer).
			// But if the LinkedParseListViewer is not null, it must have
			// the same LinkedParseTreeViewer as this control.
			//
			// The LinkedFindPatternViewer and LinkedReplacePatternViewer
			// can be null (in which case we use the rules in the list,
			// without displaying their find and replace patterns).

			if (LinkedParseTreeViewer == null)
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.FindMatchingBranch() "
					+ "is not allowed if the "
					+ "LinkedParseTreeViewer is null.";
				throw new Exception(sMessage);
			}
			if (LinkedParseListViewer != null)
			{
				if (LinkedParseListViewer.LinkedParseTreeViewer
					!= LinkedParseTreeViewer)
				{
					string sMessage = "Invalid state: "
						+ "A call to RuleListViewer.FindMatchingBranch() "
						+ "is not allowed if the LinkedParseListViewer "
						+ "and the RuleListViewer are not using the same "
						+ "LinkedParseTreeViewer.";
					throw new Exception(sMessage);
				}
			}

			//**************************************************************
			// Make sure the TreeTransferData object is initialized.

			InitializeTreeTransferData();

			//**************************************************************
			// Search for the next matching parse-tree branch.

			while (true)
			{
				//**********************************************************
				// Search for a matching parse-tree branch using the current
				// parse tree and transfer rule.

				bool bFound = TreeTransferData.FindNextMatchingBranch();

				//**********************************************************
				// Update the ParseTreeViewer.

				UpdateParseTreeViewer();

				//**********************************************************
				// If a matching branch was found, return true.

				if (bFound)
				{
					return true;
				}

				//**********************************************************
				// Otherwise, select the next transfer rule and try
				// searching again.
				//
				// If there are no more transfer rules, select the next
				// parse tree and try searching again (using the initial
				// transfer rule).
				//
				// If there are no more parse trees, return false.

				if (FindOnlyWithCurrentRule)
				{
					if (FindOnlyInCurrentParse)
					{
						return false;
					}
					if (! SelectNextParse())
					{
						return false;
					}
				}
				else
				{
					if (! SelectNextRule())
					{
						if (FindOnlyInCurrentParse)
						{
							return false;
						}
						if (! SelectNextParse())
						{
							return false;
						}
					}
				}
			}
		}
		#endregion
		//******************************************************************
		#region [ReplaceMatchingBranch() and CanReplaceMatchingBranch()]
		//******************************************************************
		/// <summary>
		/// Returns true if the displayed rules can be used to find and
		/// replace a parse-tree branch. Returns false otherwise.
		/// </summary>
		public bool CanReplaceMatchingBranch()
		{
			return CanFindMatchingBranch();
		}
		//******************************************************************
		/// <summary>
		/// Uses the displayed rules to find and replace a matching
		/// parse-tree branch (starting at the last branch that was
		/// matched). The replacement result is highlighted in the
		/// LinkedParseTreeViewer. Returns true if a match is found and
		/// replaced. Otherwise, false is returned.
		/// </summary>
		public bool ReplaceMatchingBranch()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanReplaceMatchingBranch())
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.ReplaceMatchingBranch() "
					+ "is not allowed if "
					+ "RuleListViewer.CanReplaceMatchingBranch() "
					+ "returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Validate the linked viewers.
			//
			// The LinkedParseTreeViewer cannot be null, because there would
			// be no parse tree to search.
			//
			// The LinkedParseListViewer can be null (in which case we only
			// search the single parse tree in the LinkedParseTreeViewer).
			// But if the LinkedParseListViewer is not null, it must have
			// the same LinkedParseTreeViewer as this control.
			//
			// The LinkedFindPatternViewer and LinkedReplacePatternViewer
			// can be null (in which case we use the rules in the list,
			// without displaying their find and replace patterns).

			if (LinkedParseTreeViewer == null)
			{
				string sMessage = "Invalid state: "
					+ "A call to RuleListViewer.ReplaceMatchingBranch() "
					+ "is not allowed if the "
					+ "LinkedParseTreeViewer is null.";
				throw new Exception(sMessage);
			}
			if (LinkedParseListViewer != null)
			{
				if (LinkedParseListViewer.LinkedParseTreeViewer
					!= LinkedParseTreeViewer)
				{
					string sMessage = "Invalid state: "
						+ "A call to "
						+ "RuleListViewer.ReplaceMatchingBranch() "
						+ "is not allowed if the LinkedParseListViewer "
						+ "and the RuleListViewer are not using the same "
						+ "LinkedParseTreeViewer.";
					throw new Exception(sMessage);
				}
			}

			//**************************************************************
			// Make sure the TreeTransferData object is initialized.

			InitializeTreeTransferData();

			//**************************************************************
			// Check if the TreeTransferData object represents a matching
			// parse-tree branch.
			//
			// If not, search for the next matching parse-tree branch, and
			// return false if a matching branch is not found.

			if ((TreeTransferData.MatchingNodes.Count == 0)
				|| (TreeTransferData.ReplacedNodes.Count > 0)
				|| (TreeTransferData.CurrentParseTreeNode == null))
			{
				if (! FindMatchingBranch())
				{
					return false;
				}
			}

			Debug.Assert(TreeTransferData.MatchingNodes.Count > 0);
			Debug.Assert(TreeTransferData.ReplacedNodes.Count == 0);
			Debug.Assert(TreeTransferData.CurrentParseTreeNode != null);

			//**************************************************************
			// Replace the matching parse-tree branch.

			TreeTransferData.ReplaceCurrentMatchingBranch();

			//**************************************************************
			// Update the ParseTreeViewer.

			UpdateParseTreeViewer();

			//**************************************************************
			// Return true for success.

			return true;
		}
		#endregion
		//******************************************************************
		#region [FindOnlyWithCurrentRule Property]
		//******************************************************************
		/// <summary>
		/// The FindOnlyWithCurrentRule property value.
		/// </summary>
		private bool mbFindOnlyWithCurrentRule = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the FindOnlyWithCurrentRule property. When this
		/// property is true, the search for a matching sub-tree will use
		/// only the current rule. Otherwise, all rules will be used.
		/// </summary>
		public bool FindOnlyWithCurrentRule
		{
			set
			{
				mbFindOnlyWithCurrentRule = value;
			}
			get
			{
				return mbFindOnlyWithCurrentRule;
			}
		}
		#endregion
		//******************************************************************
		#region [FindOnlyInCurrentParse Property]
		//******************************************************************
		/// <summary>
		/// The FindOnlyInCurrentParse property value.
		/// </summary>
		private bool mbFindOnlyInCurrentParse = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the FindOnlyInCurrentParse property. When this
		/// property is true, the search for a matching sub-tree will look
		/// only in the current parse. Otherwise, the search will look in
		/// all parses.
		/// </summary>
		public bool FindOnlyInCurrentParse
		{
			set
			{
				mbFindOnlyInCurrentParse = value;
			}
			get
			{
				return mbFindOnlyInCurrentParse;
			}
		}
		#endregion
		//******************************************************************
		#region [LinkedParseListViewer Property]
		//******************************************************************
		/// <summary>
		/// The LinkedParseListViewer property value.
		/// </summary>
		private ParseListViewer moLinkedParseListViewer = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the LinkedParseListViewer property, which indicates
		/// the ParseListViewer control that is used to display the list of
		/// parse trees that are manipulated by the FindMatchingBranch() and
		/// ReplaceMatchingBranch() methods. (A null value indicates no
		/// linked ParseListViewer control.)
		/// </summary>
		public ParseListViewer LinkedParseListViewer
		{
			set
			{
				ParseListViewer oParseListViewer = value;

				//**********************************************************
				// Reset the TreeTransferData object if the linked
				// ParseListViewer is changing.

				if (moLinkedParseListViewer != oParseListViewer)
				{
					ResetTreeTransferData();
				}

				//**********************************************************
				// Set the LinkedParseListViewer property.

				moLinkedParseListViewer = oParseListViewer;
			}
			get
			{
				return moLinkedParseListViewer;
			}
		}
		#endregion
		//******************************************************************
		#region [LinkedParseTreeViewer Property]
		//******************************************************************
		/// <summary>
		/// The LinkedParseTreeViewer property value.
		/// </summary>
		private ParseTreeViewer moLinkedParseTreeViewer = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the LinkedParseTreeViewer property, which indicates
		/// the ParseTreeViewer control that is used to display the parse
		/// trees that are manipulated by the FindMatchingBranch() and
		/// ReplaceMatchingBranch() methods. (A null value indicates no
		/// linked ParseTreeViewer control.)
		/// </summary>
		public ParseTreeViewer LinkedParseTreeViewer
		{
			set
			{
				ParseTreeViewer oParseTreeViewer = value;

				//**********************************************************
				// Reset the TreeTransferData object if the linked
				// ParseTreeViewer is changing.

				if (moLinkedParseTreeViewer != oParseTreeViewer)
				{
					ResetTreeTransferData();
				}

				//**********************************************************
				// Set the LinkedParseTreeViewer property.

				moLinkedParseTreeViewer = oParseTreeViewer;

				//**********************************************************
				// Connect the TreeChanged event handler for the linked
				// ParseTreeViewer.

				if (moLinkedParseTreeViewer != null)
				{
					moLinkedParseTreeViewer.TreeChanged +=
						new EventHandler(LinkedParseTreeViewer_TreeChanged);
				}
			}
			get
			{
				return moLinkedParseTreeViewer;
			}
		}
		#endregion
		//******************************************************************
		#region [LinkedFindPatternViewer Property]
		//******************************************************************
		/// <summary>
		/// The LinkedFindPatternViewer property value.
		/// </summary>
		private FindPatternViewer moLinkedFindPatternViewer = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the LinkedFindPatternViewer property, which
		/// indicates the FindPatternViewer control that is used to display
		/// the find-pattern tree of the selected rule. (A null value
		/// indicates no linked FindPatternViewer control.)
		/// </summary>
		public FindPatternViewer LinkedFindPatternViewer
		{
			set
			{
				FindPatternViewer oFindPatternViewer = value;

				//**********************************************************
				// Reset the TreeTransferData object if the linked
				// FindPatternViewer is changing.

				if (moLinkedFindPatternViewer != oFindPatternViewer)
				{
					ResetTreeTransferData();
				}

				//**********************************************************
				// Set the LinkedFindPatternViewer property.

				moLinkedFindPatternViewer = oFindPatternViewer;

				//**********************************************************
				// Connect the TreeChanged event handler for the linked
				// FindPatternViewer.

				if (moLinkedFindPatternViewer != null)
				{
					moLinkedFindPatternViewer.TreeChanged +=
						new EventHandler(
						LinkedFindPatternViewer_TreeChanged);
				}
			}
			get
			{
				return moLinkedFindPatternViewer;
			}
		}
		#endregion
		//******************************************************************
		#region [LinkedReplacePatternViewer Property]
		//******************************************************************
		/// <summary>
		/// The LinkedReplacePatternViewer property value.
		/// </summary>
		private ReplacePatternViewer moLinkedReplacePatternViewer = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the LinkedReplacePatternViewer property, which
		/// indicates the ReplacePatternViewer control that is used to
		/// display the replace-pattern tree of the selected rule. (A null
		/// value indicates no linked ReplacePatternViewer control.)
		/// </summary>
		public ReplacePatternViewer LinkedReplacePatternViewer
		{
			set
			{
				ReplacePatternViewer oReplacePatternViewer = value;

				//**********************************************************
				// Reset the TreeTransferData object if the linked
				// ReplacePatternViewer is changing.

				if (moLinkedReplacePatternViewer != oReplacePatternViewer)
				{
					ResetTreeTransferData();
				}

				//**********************************************************
				// Set the LinkedReplacePatternViewer property.

				moLinkedReplacePatternViewer = oReplacePatternViewer;

				//**********************************************************
				// Connect the TreeChanged event handler for the linked
				// ReplacePatternViewer.

				if (moLinkedReplacePatternViewer != null)
				{
					moLinkedReplacePatternViewer.TreeChanged +=
						new EventHandler(
						LinkedReplacePatternViewer_TreeChanged);
				}
			}
			get
			{
				return moLinkedReplacePatternViewer;
			}
		}
		#endregion
		//******************************************************************
		#region [UpdateParseTreeViewer() Method]
		//******************************************************************
		/// <summary>
		/// Uses the TreeTransferData object to populate the linked
		/// ParseTreeViewer.
		/// </summary>
		private void UpdateParseTreeViewer()
		{
			Debug.Assert(TreeTransferData != null);

			//**************************************************************
			// The LinkedParseTreeViewer TreeChanged event handler resets
			// the TreeTransferData object. But we do not want this to
			// happen when we populate the parse-tree viewer, because this
			// would reset the current search position in the tree.
			//
			// So, to prevent this, we save the TreeTransferData object, and
			// then temporarily set the TreeTransferData property to null.

			TreeTransfer oTreeTransferData = TreeTransferData;
			TreeTransferData = null;

			//**************************************************************
			// Populate the linked parse-tree viewer.

			if (LinkedParseTreeViewer != null)
			{
				LinkedParseTreeViewer.PopulateTree(oTreeTransferData);
			}

			//**************************************************************
			// Now we set the TreeTransferData property back to the saved
			// oTreeTransferData object.

			TreeTransferData = oTreeTransferData;
		}
		#endregion
		//******************************************************************
		#region [UpdateFindAndReplacePatternViewers() Method]
		//******************************************************************
		/// <summary>
		/// Uses the .FindPatternRoot and .ReplacePatternRoot properties of
		/// the given oSelectedRule object to populate the linked
		/// FindPatternViewer and ReplacePatternViewer. The SelectedRule
		/// property is set to the given oSelectedRule object.
		/// </summary>
		private void UpdateFindAndReplacePatternViewers(
			RuleListViewerItem oSelectedRule)
		{
			//**************************************************************
			// Use the given oSelectedRule to initialize a TreeTransfer
			// object, which will be used to populate the find-pattern and
			// replace-pattern viewers.
			//
			// If oSelectedRule is null, blank nodes will be used to
			// populate the find-pattern and replace-pattern viewers.
			//
			// If oSelectedRule is not null, its .FindPatternRoot tree and
			// .ReplacePatternRoot tree will be used to populate the
			// find-pattern and replace-pattern viewers.

			TreeTransfer oTreeTransfer = new TreeTransfer();
			if (oSelectedRule == null)
			{
				oTreeTransfer.ParseTreeRoot = null;
				oTreeTransfer.FindPatternRoot = new SyntaxNode();
				oTreeTransfer.ReplacePatternRoot = new SyntaxNode();
			}
			else
			{
				oTreeTransfer.ParseTreeRoot = null;
				oTreeTransfer.FindPatternRoot
					= oSelectedRule.FindPatternRoot;
				oTreeTransfer.ReplacePatternRoot
					= oSelectedRule.ReplacePatternRoot;
			}

			//**************************************************************
			// Temporarily set the SelectedRule property to null, because we
			// do not want the LinkedFindPatternViewer TreeChanged event and
			// the LinkedReplacePatternViewer TreeChanged event to update
			// the SelectedRule (and set the Modified property to true) when
			// we populate the find-pattern and replace-pattern trees.

			moSelectedRule = null;

			//**************************************************************
			// Populate the linked find-pattern viewer.

			if (LinkedFindPatternViewer != null)
			{
				LinkedFindPatternViewer.PopulateTree(oTreeTransfer);
			}

			//**************************************************************
			// Populate the linked replace-pattern viewer.

			if (LinkedReplacePatternViewer != null)
			{
				LinkedReplacePatternViewer.PopulateTree(oTreeTransfer);
			}

			//**************************************************************
			// Now set the SelectedRule property to the given oSelectedRule
			// object, because we want the TreeChanged events to update the
			// SelectedRule (and set the Modified property to true) when the
			// user edits the find-pattern and replace-pattern trees.

			moSelectedRule = oSelectedRule;
		}
		#endregion
		//******************************************************************
		#region [SelectedRule Property]
		//******************************************************************
		/// <summary>
		/// The SelectedRule property value.
		/// </summary>
		private RuleListViewerItem moSelectedRule = null;
		//******************************************************************
		/// <summary>
		/// Gets the RuleListViewerItem in the ListView that was most
		/// recently used to populate the linked find-pattern and
		/// replace-pattern viewers. The SelectedRule property is only set
		/// by a call to the UpdateFindAndReplacePatternViewers() method.
		/// (The SelectedRule property is null if a ListView item is not
		/// currently associated with the contents of the find-pattern and
		/// replace-pattern viewers.)
		/// </summary>
		private RuleListViewerItem SelectedRule
		{
			get
			{
				return moSelectedRule;
			}
		}
		#endregion
		//******************************************************************
		#region [SelectNextRule() Method]
		//******************************************************************
		/// <summary>
		/// Checks if there is another rule in the list after the current
		/// SelectedRule. If so, the next rule is selected and true is
		/// returned. If not, the first rule in the list is selected and
		/// false is returned.
		/// </summary>
		private bool SelectNextRule()
		{
			//**************************************************************
			// If the list contains another rule after the current
			// SelectedRule, select the next rule and return true. (Make
			// sure the new selected rule is scrolled into view and has
			// focus within the ListView.)

			if (SelectedRule != null)
			{
				int iIndex = SelectedRule.Index;
				ClearSelection();
				++iIndex;
				if (iIndex < moListView.Items.Count)
				{
					ListViewItem oItem = moListView.Items[iIndex];
					oItem.Selected = true;
					oItem.EnsureVisible();
					oItem.Focused = true;
					return true;
				}
			}

			//**************************************************************
			// Otherwise, select the first rule in the list (so we start at
			// the beginning the next time we cycle through the list) and
			// return false. (Make sure the new selected rule is scrolled
			// into view and has focus within the ListView.)

			if (moListView.Items.Count > 0)
			{
				ListViewItem oItem = moListView.Items[0];
				oItem.Selected = true;
				oItem.EnsureVisible();
				oItem.Focused = true;
			}
			return false;
		}
		#endregion
		//******************************************************************
		#region [SelectNextParse() Method]
		//******************************************************************
		/// <summary>
		/// Checks if there is another parse after the current selected
		/// parse in the linked ParseListViewer. If so, the next parse in
		/// the ParseListViewer is selected and true is returned. If not,
		/// the first parse in the ParseListViewer is selected and false is
		/// returned. (Also returns false if there is no linked
		/// ParseListViewer.)
		/// </summary>
		private bool SelectNextParse()
		{
			if (LinkedParseListViewer != null)
			{
				return LinkedParseListViewer.SelectNextParse();
			}
			return false;
		}
		#endregion
		//******************************************************************

		// EVENTS

		//******************************************************************
		#region [SelectionChanged Event]
		//******************************************************************
		/// <summary>
		/// Occurs when the selection of list items has changed.
		/// </summary>
		public event EventHandler SelectionChanged;
		//******************************************************************
		/// <summary>
		/// Raises the SelectionChanged event.
		/// </summary>
		protected virtual void OnSelectionChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (SelectionChanged != null)
				{
					SelectionChanged(this,oArgs);
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListChanged Event]
		//******************************************************************
		/// <summary>
		/// Occurs when the list contents change. (This includes any changes
		/// to the trees represented by the list items.)
		/// </summary>
		public event EventHandler ListChanged;
		//******************************************************************
		/// <summary>
		/// Raises the ListChanged event.
		/// </summary>
		protected virtual void OnListChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (ListChanged != null)
				{
					ListChanged(this,oArgs);
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Enter Event Handler]
		//******************************************************************
		/// <summary>
		/// Sets focus to an item in the ListView, if no ListView item has
		/// focus when the control is entered.
		/// </summary>
		private void RuleListViewer_Enter(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Make sure an item has focus within the ListView. Set
				// focus to the first item if no other item has focus.

				bool bFocused = false;
				foreach (ListViewItem oItem in moListView.Items)
				{
					if (oItem.Focused)
					{
						bFocused = true;
					}
				}
				if (! bFocused)
				{
					if (moListView.Items.Count > 0)
					{
						moListView.Items[0].Focused = true;
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
		#region [Leave Event Handler]
		//******************************************************************
		/// <summary>
		/// Makes sure a rule is selected when the input focus leaves this
		/// control.
		/// </summary>
		private void RuleListViewer_Leave(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If the list is empty (and not read-only), add a new rule
				// to the list and select it.

				if (moListView.Items.Count == 0)
				{
					if (! ReadOnly)
					{
						//**************************************************
						// Set the Modified property to true.

						Modified = true;

						//**************************************************
						// Reset the TreeTransferData object.

						ResetTreeTransferData();

						//**************************************************
						// Clear the undo information.

						ClearUndoInformation();

						//**************************************************
						// Create a new rule item and append it to the list.

						RuleListViewerItem oRuleItem
							= new RuleListViewerItem();
						oRuleItem.Text = "(new rule)";
						oRuleItem.FindPatternRoot = new SyntaxNode();
						oRuleItem.ReplacePatternRoot = new SyntaxNode();
						moListView.Items.Add(oRuleItem);

						//**************************************************
						// Select the item.

						oRuleItem.Selected = true;

						//**************************************************
						// Raise the ListChanged event.

						OnListChanged(new EventArgs());
					}
				}

				//**********************************************************
				// If the list is not empty, one of the items should be the
				// SelectedRule.

				if (moListView.Items.Count > 0)
				{
					Debug.Assert(SelectedRule != null);
					Debug.Assert(moListView.Items.Contains(SelectedRule));
				}

				//**********************************************************
				// Make sure the SelectedRule item is selected.

				if (SelectedRule != null)
				{
					if (SelectedRule != FirstSelectedItem())
					{
						ClearSelection();
						SelectedRule.Selected = true;
					}
				}

				//**********************************************************
				// Make sure the SelectedRule item is scrolled into view and
				// has focus within the ListView.

				if (SelectedRule != null)
				{
					SelectedRule.EnsureVisible();
					SelectedRule.Focused = true;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView Resize Event Handler]
		//******************************************************************
		/// <summary>
		/// Starts the timer when the control changes size. The timer will
		/// fire once and its tick event handler will adjust the ListView
		/// column width.
		/// </summary>
		private void moListView_Resize(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Start the timer, which will fire once and adjust the
				// ListView column width (in the tick event handler).

				moTimer.Interval = 100;
				moTimer.Start();
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView SelectedIndexChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Calls the UpdateFindAndReplacePatternViewers() method to change
		/// the SelectedRule value and update the linked find-pattern and
		/// replace-pattern viewers when a new item is selected in the
		/// ListView.
		/// </summary>
		private void moListView_SelectedIndexChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If any items are selected in the ListView, the first
				// selected item will become the new SelectedRule value.

				RuleListViewerItem oNewSelectedRule = FirstSelectedItem();

				//**********************************************************
				// If no items are selected in the ListView, check if the
				// current SelectedRule is still an item in the ListView.
				//
				// If so, the new SelectedRule value will remain the same as
				// the current SelectedRule.
				//
				// If not, the new SelectedRule value will be null.

				if (oNewSelectedRule == null)
				{
					if (SelectedRule != null)
					{
						if (moListView.Items.Contains(SelectedRule))
						{
							oNewSelectedRule = SelectedRule;
						}
					}
				}

				//**********************************************************
				// If the current SelectedRule value is different than the
				// new value, call UpdateFindAndReplacePatternViewers(),
				// which will set the new SelectedRule value and update the
				// linked FindPatternViewer and ReplacePatternViewer to
				// display the new selected rule.
				//
				// After calling UpdateFindAndReplacePatternViewers(), reset
				// the TreeTransferData object, so it will be reinitialized
				// using the find and replace patterns of the new selected
				// rule.

				if (SelectedRule != oNewSelectedRule)
				{
					UpdateFindAndReplacePatternViewers(oNewSelectedRule);
					ResetTreeTransferData();
				}

				//**********************************************************
				// Raise the SelectionChanged event.

				OnSelectionChanged(new EventArgs());
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView BeforeLabelEdit Event Handler]
		//******************************************************************
		/// <summary>
		/// Sets the InEditMode property to true when a rule name enters
		/// edit mode.
		/// </summary>
		private void moListView_BeforeLabelEdit(object oSender,
			LabelEditEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Prevent modification to a read-only list.

				if (ReadOnly)
				{
					oArgs.CancelEdit = true;
					return;
				}

				//**********************************************************
				// Set the InEditMode property to true. (The AfterLabelEdit
				// event handler will set InEditMode back to false when the
				// rule name leaves edit mode.)

				InEditMode = true;

				//**********************************************************
				// Raise the SelectionChanged event, so the form will update
				// the state of its menus.
				//
				// When a rule name is in edit mode, the following functions
				// return false: CanUndo(), CanCut(), CanCopy(), CanPaste()
				// and CanDelete(). The form should disable the associated
				// edit menus so the keyboard shortcuts (Control+C, etc.)
				// can be used to edit the rule name.

				OnSelectionChanged(new EventArgs());
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView AfterLabelEdit Event Handler]
		//******************************************************************
		/// <summary>
		/// Sets the InEditMode property back to false when a rule name
		/// leaves edit mode. If the user modified the rule name, the undo
		/// information is cleared, the Modified property is set to true,
		/// and the ListChanged event is raised.
		/// </summary>
		private void moListView_AfterLabelEdit(object oSender,
			LabelEditEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Set the InEditMode property back to false.

				InEditMode = false;

				//**********************************************************
				// If the rule name was changed, set the Modified property
				// to true, clear the undo information, and raise the
				// ListChanged event.
				//
				// Note: The oArgs.Label value will be null if the user made
				// no edits. We also check to see if the old name is the
				// same as the new name.

				if (oArgs.Label != null)
				{
					string sOldName = moListView.Items[oArgs.Item].Text;
					string sNewName = oArgs.Label;
					if (sOldName != sNewName)
					{
						Modified = true;
						ClearUndoInformation();
						OnListChanged(new EventArgs());
					}
				}

				//**********************************************************
				// Raise the SelectionChanged event, so the form will update
				// the state of its menus (and enable edit menus that were
				// disabled while the rule was in edit mode).

				OnSelectionChanged(new EventArgs());
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [LinkedParseTreeViewer TreeChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Resets the TreeTransferData object when changes are made to the
		/// parse tree in the LinkedParseTreeViewer.
		/// </summary>
		private void LinkedParseTreeViewer_TreeChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oSender != null);

				//**********************************************************
				// Make sure the TreeChanged event was raised by the current
				// LinkedParseTreeViewer.
				//
				// Ignore this event if the oSender is not the current
				// LinkedParseTreeViewer.

				if ((LinkedParseTreeViewer != null)
					&& (LinkedParseTreeViewer == oSender))
				{
					//******************************************************
					// Reset the TreeTransferData object.

					ResetTreeTransferData();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [LinkedFindPatternViewer TreeChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the SelectedRule.FindPatternRoot to reflect changes to
		/// the find-pattern tree in the LinkedFindPatternViewer. Also
		/// resets the TreeTransferData object.
		/// </summary>
		private void LinkedFindPatternViewer_TreeChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oSender != null);

				//**********************************************************
				// Make sure the TreeChanged event was raised by the current
				// LinkedFindPatternViewer.
				//
				// Ignore this event if the oSender is not the current
				// LinkedFindPatternViewer (or if this list is read-only).

				if ((LinkedFindPatternViewer != null)
					&& (LinkedFindPatternViewer == oSender)
					&& (! ReadOnly))
				{
					//******************************************************
					// Update the SelectedRule.FindPatternRoot to reflect
					// the user's edits in the find-pattern viewer.

					if (SelectedRule != null)
					{
						//**************************************************
						// Set the Modified property to true.

						Modified = true;

						//**************************************************
						// Clear the undo information.

						ClearUndoInformation();

						//**************************************************
						// Set the SelectedRule.FindPatternRoot to a copy of
						// the current find-pattern tree.

						SelectedRule.FindPatternRoot
							= LinkedFindPatternViewer.CloneTree();
					}

					//******************************************************
					// Reset the TreeTransferData object.

					ResetTreeTransferData();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [LinkedReplacePatternViewer TreeChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the SelectedRule.ReplacePatternRoot to reflect changes
		/// to the replace-pattern tree in the LinkedReplacePatternViewer.
		/// Also resets the TreeTransferData object.
		/// </summary>
		private void LinkedReplacePatternViewer_TreeChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oSender != null);

				//**********************************************************
				// Make sure the TreeChanged event was raised by the current
				// LinkedReplacePatternViewer.
				//
				// Ignore this event if the oSender is not the current
				// LinkedReplacePatternViewer (or if this list is
				// read-only).

				if ((LinkedReplacePatternViewer != null)
					&& (LinkedReplacePatternViewer == oSender)
					&& (! ReadOnly))
				{
					//******************************************************
					// Update the SelectedRule.ReplacePatternRoot to reflect
					// the user's edits in the replace-pattern viewer.

					if (SelectedRule != null)
					{
						//**************************************************
						// Set the Modified property to true.

						Modified = true;

						//**************************************************
						// Clear the undo information.

						ClearUndoInformation();

						//**************************************************
						// Set the SelectedRule.ReplacePatternRoot to a copy
						// of the current replace-pattern tree.

						SelectedRule.ReplacePatternRoot
							= LinkedReplacePatternViewer.CloneTree();
					}

					//******************************************************
					// Reset the TreeTransferData object.

					ResetTreeTransferData();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Menu Popup Event Handler]
		//******************************************************************
		/// <summary>
		/// Enables the context-menu items that are appropriate for the
		/// current state and selection.
		/// </summary>
		private void moMenu_Popup(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Disable all menu items.

				moUndoMenu.Enabled = false;
				moCutMenu.Enabled = false;
				moCopyMenu.Enabled = false;
				moPasteMenu.Enabled = false;
				moDeleteMenu.Enabled = false;
				moNewRuleMenu.Enabled = false;
				moRenameMenu.Enabled = false;
				moSelectAllMenu.Enabled = false;

				//**********************************************************
				// Enable menu items that are appropriate for the current
				// state and selection.

				moUndoMenu.Enabled = CanUndo();
				moCutMenu.Enabled = CanCut();
				moCopyMenu.Enabled = CanCopy();
				moPasteMenu.Enabled = CanPaste();
				moDeleteMenu.Enabled = CanDelete();
				moNewRuleMenu.Enabled = CanAddNewRule();
				moRenameMenu.Enabled = CanRenameRule();
				moSelectAllMenu.Enabled = CanSelectAll();
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [UndoMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Undoes the last edit operation.
		/// </summary>
		private void moUndoMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Undo();
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
		/// Cuts the current selection to the clipboard.
		/// </summary>
		private void moCutMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Cut();
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
		/// Copies the current selection to the clipboard.
		/// </summary>
		private void moCopyMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Copy();
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
		/// Pastes the current contents of the clipboard.
		/// </summary>
		private void moPasteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Paste();
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
		/// Deletes the current selection.
		/// </summary>
		private void moDeleteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Delete();
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
				AddNewRule();
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
				RenameRule();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [SelectAllMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Selects all the rules in the list.
		/// </summary>
		private void moSelectAllMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				SelectAll();
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
		/// Adjusts the ListView column width to prevent the horizontal
		/// scroll bar from showing.
		/// </summary>
		private void moTimer_Tick(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Stop the timer (so it only fires once after each resize
				// event).

				moTimer.Stop();

				//**********************************************************
				// Set the ListView column width to be the same as the width
				// of its client rectangle (which does not include scroll
				// bars). This will prevent the horizontal scroll bar from
				// showing.

				moColumnHeader.Width = moListView.ClientRectangle.Width;
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
