//**************************************************************************
// File: "TreeTran\ParseListViewer.cs".
//
// This file defines the ParseListViewer class, which implements a control
// that allows the user to view and edit a list of parse trees.
//
// History:
//     2007-Jan-19 David Bullock: Code complete.
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
	/// parse trees.
	/// </summary>
	public class ParseListViewer: System.Windows.Forms.UserControl
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
		private System.Windows.Forms.MenuItem moSelectAllSeparator;
		private System.Windows.Forms.MenuItem moSelectAllMenu;
		private System.ComponentModel.IContainer components;

		public ParseListViewer()
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(ParseListViewer));
			this.moListView = new System.Windows.Forms.ListView();
			this.moColumnHeader = new System.Windows.Forms.ColumnHeader();
			this.moMenu = new System.Windows.Forms.ContextMenu();
			this.moUndoMenu = new System.Windows.Forms.MenuItem();
			this.moCutSeparator = new System.Windows.Forms.MenuItem();
			this.moCutMenu = new System.Windows.Forms.MenuItem();
			this.moCopyMenu = new System.Windows.Forms.MenuItem();
			this.moPasteMenu = new System.Windows.Forms.MenuItem();
			this.moDeleteMenu = new System.Windows.Forms.MenuItem();
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
			this.moListView.Name = "moListView";
			this.moListView.Size = new System.Drawing.Size(150, 150);
			this.moListView.SmallImageList = this.moImageList;
			this.moListView.TabIndex = 0;
			this.moListView.View = System.Windows.Forms.View.Details;
			this.moListView.Resize += new System.EventHandler(this.moListView_Resize);
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
			// moSelectAllSeparator
			//
			this.moSelectAllSeparator.Index = 6;
			this.moSelectAllSeparator.Text = "-";
			//
			// moSelectAllMenu
			//
			this.moSelectAllMenu.Index = 7;
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
			// ParseListViewer
			//
			this.BackColor = System.Drawing.SystemColors.Window;
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moListView});
			this.ForeColor = System.Drawing.SystemColors.WindowText;
			this.Name = "ParseListViewer";
			this.Enter += new System.EventHandler(this.ParseListViewer_Enter);
			this.Leave += new System.EventHandler(this.ParseListViewer_Leave);
			this.ResumeLayout(false);

		}
		#endregion
		#endregion
		//******************************************************************
		#region [LoadParseFile() Method]
		//******************************************************************
		/// <summary>
		/// Loads and displays the indicated parse file (sFileName). The
		/// Modified property is set to false after the file is loaded.
		/// </summary>
		public void LoadParseFile(string sFileName)
		{
			//**************************************************************
			// Validate the parameters.

			if ((sFileName == null) || (sFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "ParseListViewer.LoadParseFile() requires "
					+ "a file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Clear the linked ParseTreeViewer.

			UpdateParseTreeViewer(null);

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Clear the list of items in the ListView.

			moListView.Items.Clear();

			//**************************************************************
			// Create a ParseReader to read from the indicated parse file.

			StreamReader oStreamReader = new StreamReader(sFileName);
			ParseReader oParseReader = new ParseReader(oStreamReader);

			//**************************************************************
			// For each parse loaded from the parse file, create a new parse
			// item and append it to the ListView.

			while (oParseReader.Read())
			{
				ParseListViewerItem oParseItem = new ParseListViewerItem();
				oParseItem.Text = oParseReader.ParseName;
				oParseItem.ParseTreeRoot = oParseReader.ParseTreeRoot;
				moListView.Items.Add(oParseItem);
			}

			//**************************************************************
			// Close the ParseReader.

			oParseReader.Close();

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
		#region [SaveParseFile() Method]
		//******************************************************************
		/// <summary>
		/// Saves the displayed parses to the indicated parse file
		/// (sFileName). The Modified property is set to false after the
		/// file is saved.
		/// </summary>
		public void SaveParseFile(string sFileName)
		{
			//**************************************************************
			// Validate the parameters.

			if ((sFileName == null) || (sFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "ParseListViewer.SaveParseFile() requires "
					+ "a file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create a ParseWriter to write to the indicated parse file.

			StreamWriter oStreamWriter = new StreamWriter(sFileName);
			ParseWriter oParseWriter = new ParseWriter(oStreamWriter);

			//**************************************************************
			// For each item in the ListView, write the parse to the file.

			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the parse from the ListView item.

				Debug.Assert(oItem is ParseListViewerItem);

				ParseListViewerItem oParseItem
					= (ParseListViewerItem) oItem;

				//**********************************************************
				// Make sure the parse tree is not null.

				SyntaxNode oParseTreeRoot = oParseItem.ParseTreeRoot;
				if (oParseTreeRoot == null)
				{
					oParseTreeRoot = new SyntaxNode();
				}

				//**********************************************************
				// Write the parse tree to the file.

				oParseWriter.ParseTreeRoot = oParseTreeRoot;
				oParseWriter.Write();
			}

			//**************************************************************
			// Close the ParseWriter.

			oParseWriter.Close();

			//**************************************************************
			// Set the Modified property to false.

			Modified = false;
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
		/// by the parses in the ParseTreesForUndo collection.
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
		/// by the parses in the ParseTreesForUndo collection.
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
		#region [ParseTreesForUndo Property]
		//******************************************************************
		/// <summary>
		/// The ParseTreesForUndo property value.
		/// </summary>
		private TransferRuleCollection moParseTreesForUndo = null;
		//******************************************************************
		/// <summary>
		/// Gets the ParseTreesForUndo collection. To undo the last edit
		/// operation, a range of items in the ListView (starting at the
		/// index indicated by FirstIndexForUndo and containing the number
		/// of items specified by ItemCountForUndo) must be replaced by the
		/// parses in the ParseTreesForUndo collection. (The parse trees are
		/// stored in a collection of TransferRule items: the .RuleName
		/// property of each item represents its displayed text, the
		/// .FindPatternRoot property represents the item's parse tree, and
		/// the .ReplacePatternRoot property is not used.)
		/// </summary>
		private TransferRuleCollection ParseTreesForUndo
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moParseTreesForUndo == null)
				{
					moParseTreesForUndo = new TransferRuleCollection();
				}

				//**********************************************************
				// Return the collection.

				return moParseTreesForUndo;
			}
		}
		#endregion
		//******************************************************************
		#region [ClearUndoInformation() Method]
		//******************************************************************
		/// <summary>
		/// Clears the undo information. FirstIndexForUndo is set to zero,
		/// ItemCountForUndo is set to zero, and all items are removed from
		/// the ParseTreesForUndo collection.
		/// </summary>
		private void ClearUndoInformation()
		{
			FirstIndexForUndo = 0;
			ItemCountForUndo = 0;
			ParseTreesForUndo.Clear();
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
		/// false by the LoadParseFile() and SaveParseFile() methods. It is
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
		#region [Undo() and CanUndo() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the control can undo the last edit operation.
		/// Returns false otherwise.
		/// </summary>
		public bool CanUndo()
		{
			if (! ReadOnly)
			{
				if (ItemCountForUndo > 0)
				{
					return true;
				}
				if (ParseTreesForUndo.Count > 0)
				{
					return true;
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
					+ "A call to ParseListViewer.Undo() is not allowed "
					+ "if ParseListViewer.CanUndo() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only tree.

			if (ReadOnly)
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
			// Clear the linked ParseTreeViewer.

			UpdateParseTreeViewer(null);

			//**************************************************************
			// Make a copy of the undo information.
			//
			// Note: Read the comments before the Paste() and Delete()
			// methods to see examples of what the undo information looks
			// like.

			int iFirstIndexForUndo = FirstIndexForUndo;
			int iItemCountForUndo = ItemCountForUndo;
			TransferRuleCollection oParseTreesForUndo
				= new TransferRuleCollection();
			foreach (TransferRule oRule in ParseTreesForUndo)
			{
				oParseTreesForUndo.Add(oRule);
			}

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Make a copy of the parses that will be replaced. (Starting at
			// index iFirstIndexForUndo, copy the number of parses specified
			// by iItemCountForUndo.)

			Debug.Assert(iFirstIndexForUndo >= 0);
			Debug.Assert(iItemCountForUndo >= 0);
			Debug.Assert((iFirstIndexForUndo + iItemCountForUndo)
				<= moListView.Items.Count);

			TransferRuleCollection oReplacedParses
				= new TransferRuleCollection();
			for (int iIndex = iFirstIndexForUndo;
				iIndex < (iFirstIndexForUndo + iItemCountForUndo); ++iIndex)
			{
				if (iIndex < moListView.Items.Count)
				{
					ListViewItem oItem = moListView.Items[iIndex];

					//******************************************************
					// Get the parse from the ListView item.

					Debug.Assert(oItem is ParseListViewerItem);

					ParseListViewerItem oParseItem
						= (ParseListViewerItem) oItem;

					//******************************************************
					// Copy the parse information and add it to the
					// oReplacedParses collection. (Use the TransferRule
					// object's .FindPatternRoot to store the parse tree.)

					TransferRule oRule = new TransferRule();
					oRule.RuleName = oParseItem.Text;
					oRule.FindPatternRoot = oParseItem.ParseTreeRoot;
					oRule.ReplacePatternRoot = null;
					oReplacedParses.Add(oRule);
				}
			}

			//**************************************************************
			// Delete the parses that are being replaced. (Starting at index
			// iFirstIndexForUndo, delete the number of parses specified by
			// iItemCountForUndo.)

			if (iItemCountForUndo > 0)
			{
				DeleteParses(iFirstIndexForUndo,iItemCountForUndo);
			}

			//**************************************************************
			// Insert the replacement parses (from the undo information in
			// oParseTreesForUndo). The inserted parses will be selected.

			if (oParseTreesForUndo.Count > 0)
			{
				InsertParses(iFirstIndexForUndo,oParseTreesForUndo);
			}

			//**************************************************************
			// Unselect any parses that appear with the same information in
			// the oReplacedParses collection. (We do not want parses to be
			// selected if they were already in the list when the undo
			// command was issued.)

			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the parse from the ListView item.

				Debug.Assert(oItem is ParseListViewerItem);

				ParseListViewerItem oParseItem
					= (ParseListViewerItem) oItem;

				//**********************************************************
				// Does the parse have the same information as a parse in
				// the oReplacedParses collection? If so, unselect it.

				if (oParseItem.Selected)
				{
					foreach (TransferRule oRule in oReplacedParses)
					{
						if ((oParseItem.Text == oRule.RuleName)
							&& (oParseItem.ParseTreeRoot
							== oRule.FindPatternRoot))
						{
							oParseItem.Selected = false;
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

			ParseListViewerItem oFirstSelectedItem = FirstSelectedItem();
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
		/// clipboard. Returns false otherwise.
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
					+ "A call to ParseListViewer.Cut() is not allowed "
					+ "if ParseListViewer.CanCut() returns false.";
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
		/// clipboard. Returns false otherwise.
		/// </summary>
		public bool CanCopy()
		{
			if (FirstSelectedItem() != null)
			{
				return true;
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
					+ "A call to ParseListViewer.Copy() is not allowed "
					+ "if ParseListViewer.CanCopy() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create a RuleWriter that writes to a string.

			StringBuilder oStringBuilder = new StringBuilder();
			TextWriter oTextWriter = new StringWriter(oStringBuilder);
			RuleWriter oRuleWriter = new RuleWriter(oTextWriter);

			//**************************************************************
			// Write each selected parse to the string.

			foreach (ListViewItem oItem in moListView.Items)
			{
				//**********************************************************
				// Get the parse from the ListView item.

				Debug.Assert(oItem is ParseListViewerItem);

				ParseListViewerItem oParseItem
					= (ParseListViewerItem) oItem;

				//**********************************************************
				// If the item is selected, write the parse to the string.

				if (oParseItem.Selected)
				{
					//******************************************************
					// Make sure the parse tree is not null.

					SyntaxNode oParseTreeRoot = oParseItem.ParseTreeRoot;
					if (oParseTreeRoot == null)
					{
						oParseTreeRoot = new SyntaxNode();
					}

					//******************************************************
					// Write the parse tree to the string.
					//
					// The parse tree is written in the format of a transfer
					// rule: the .RuleName is the item's displayed text, the
					// .FindPatternRoot is the parse tree, and the
					// .ReplacePatternRoot is null.

					oRuleWriter.RuleName = oParseItem.Text;
					oRuleWriter.FindPatternRoot = oParseTreeRoot;
					oRuleWriter.ReplacePatternRoot = null;
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
		/// the clipboard. Returns false otherwise.
		/// </summary>
		public bool CanPaste()
		{
			if (! ReadOnly)
			{
				return true;
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
		//     ParseTreesForUndo = ()
		//
		// This undo information indicates what is needed to reverse the
		// paste operation: replace the 3 items starting at index 2 with
		// the items in the ParseTreesForUndo collection (which in this case
		// contains no items).
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
					+ "A call to ParseListViewer.Paste() is not allowed "
					+ "if ParseListViewer.CanPaste() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only list.

			if (ReadOnly)
			{
				return;
			}

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
			//
			// Each rule is interpreted as a parse tree: the .RuleName will
			// be the displayed text in the list, the .FindPatternRoot is
			// the parse tree, and the .ReplacePatternRoot is ignored.

			TransferRuleCollection oParseTrees
				= new TransferRuleCollection();
			try
			{
				TextReader oTextReader = new StringReader(sString);
				RuleReader oRuleReader = new RuleReader(oTextReader);
				while (oRuleReader.Read())
				{
					TransferRule oRule = new TransferRule();
					oRule.RuleName = oRuleReader.RuleName;
					oRule.FindPatternRoot = oRuleReader.FindPatternRoot;
					oRule.ReplacePatternRoot = null;
					oParseTrees.Add(oRule);
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
			// parses (from the string data) is empty.

			if (oParseTrees.Count == 0)
			{
				return;
			}

			//**************************************************************
			// Set the Modified property to true.

			Modified = true;

			//**************************************************************
			// Determine the first index where the parses will be pasted.

			int iFirstIndex = 0;
			ParseListViewerItem oFirstSelectedItem = FirstSelectedItem();
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
			// Paste the parses. (The pasted parses will be selected.)

			InsertParses(iFirstIndex,oParseTrees);

			Debug.Assert(FirstSelectedItem() != null);

			//**************************************************************
			// Set the undo information.

			FirstIndexForUndo = iFirstIndex;
			ItemCountForUndo = oParseTrees.Count;
			ParseTreesForUndo.Clear();

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
		/// false otherwise.
		/// </summary>
		public bool CanDelete()
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
		//     ParseTreesForUndo = (Item-B,Item-C,Item-D,Item-E,Item-F)
		//
		// This undo information indicates what is needed to reverse the
		// delete operation: replace the 2 items starting at index 1 with
		// the items in the ParseTreesForUndo collection.
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
					+ "A call to ParseListViewer.Delete() is not allowed "
					+ "if ParseListViewer.CanDelete() returns false.";
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

			Modified = true;

			//**************************************************************
			// Clear the undo information.

			ClearUndoInformation();

			//**************************************************************
			// Determine the first and last selected items.

			ParseListViewerItem oFirstSelectedItem = FirstSelectedItem();
			ParseListViewerItem oLastSelectedItem = LastSelectedItem();

			//**************************************************************
			// Create the undo information:
			//
			// Set iFirstIndexForUndo to the first selected index.
			//
			// Copy the parses from the first selected item through (and
			// including) the last selected item, storing the copied parses
			// in the oParseTreesForUndo collection.
			//
			// Count the parses in the oParseTreesForUndo collection that
			// were not selected. Set iItemCountForUndo to this count.
			// (These non-selected parses will not be deleted from the
			// list.)

			int iFirstIndexForUndo = 0;
			int iItemCountForUndo = 0;
			TransferRuleCollection oParseTreesForUndo
				= new TransferRuleCollection();
			if ((oFirstSelectedItem != null) && (oLastSelectedItem != null))
			{
				//**********************************************************
				// Set iFirstIndexForUndo to the first selected index.

				iFirstIndexForUndo = oFirstSelectedItem.Index;

				//**********************************************************
				// Copy the parses from the first selected item through (and
				// including) the last selected item.

				for (int iIndex = oFirstSelectedItem.Index;
					iIndex <= oLastSelectedItem.Index; ++iIndex)
				{
					ListViewItem oItem = moListView.Items[iIndex];

					//******************************************************
					// Get the parse from the ListView item.

					Debug.Assert(oItem is ParseListViewerItem);

					ParseListViewerItem oParseItem
						= (ParseListViewerItem) oItem;

					//******************************************************
					// Copy the parse information and add it to the
					// oParseTreesForUndo collection. (Use the TransferRule
					// object's .FindPatternRoot to store the parse tree.)

					TransferRule oRule = new TransferRule();
					oRule.RuleName = oParseItem.Text;
					oRule.FindPatternRoot = oParseItem.ParseTreeRoot;
					oRule.ReplacePatternRoot = null;
					oParseTreesForUndo.Add(oRule);

					//******************************************************
					// Count the non-selected parses (that were copied to
					// oParseTreesForUndo but will not be deleted).

					if (! oItem.Selected)
					{
						++iItemCountForUndo;
					}
				}
			}

			//**************************************************************
			// Delete the selected items from the ListView in reverse order.
			// (This prevents multiple selection changes that would update
			// the linked tree viewer multiple times.)

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
			// Clear the linked ParseTreeViewer.

			UpdateParseTreeViewer(null);

			//**************************************************************
			// Set the undo information.

			FirstIndexForUndo = iFirstIndexForUndo;
			ItemCountForUndo = iItemCountForUndo;
			ParseTreesForUndo.Clear();
			foreach (TransferRule oRule in oParseTreesForUndo)
			{
				ParseTreesForUndo.Add(oRule);
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
					+ "A call to ParseListViewer.SelectAll() "
					+ "is not allowed "
					+ "if ParseListViewer.CanSelectAll() returns false.";
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
		#region [InsertParses() and DeleteParses() Methods]
		//******************************************************************
		/// <summary>
		/// Inserts the given parses (oParseTrees) into the ListView,
		/// starting at the indicated index (iFirstIndex). The inserted
		/// parses are selected.
		/// </summary>
		private void InsertParses(int iFirstIndex,
			TransferRuleCollection oParseTrees)
		{
			Debug.Assert(iFirstIndex >= 0);
			Debug.Assert(oParseTrees != null);
			Debug.Assert(oParseTrees.Count > 0);

			//**************************************************************
			// Clear the selection.

			ClearSelection();

			//**************************************************************
			// Insert the given parses starting at the indicated index.

			int iIndex = iFirstIndex;
			foreach (TransferRule oRule in oParseTrees)
			{
				//**********************************************************
				// Create the item to display in the ListView. (Get the
				// item's displayed text from the TransferRule object's
				// .RuleName property and the parse tree from its
				// .FindPatternRoot property.)

				ParseListViewerItem oParseItem = new ParseListViewerItem();
				oParseItem.Text = oRule.RuleName;
				oParseItem.ParseTreeRoot = oRule.FindPatternRoot;

				//**********************************************************
				// Insert or append the item in the ListView.

				if (iIndex < moListView.Items.Count)
				{
					moListView.Items.Insert(iIndex,oParseItem);
				}
				else
				{
					moListView.Items.Add(oParseItem);
				}

				//**********************************************************
				// Select the item and make sure it is scrolled into view.

				oParseItem.Selected = true;
				oParseItem.EnsureVisible();

				//**********************************************************
				// Increment the index.

				++iIndex;
			}

			//**************************************************************
			// Make sure the first selected item is scrolled into view and
			// has focus within the ListView.

			ParseListViewerItem oFirstSelectedItem = FirstSelectedItem();
			if (oFirstSelectedItem != null)
			{
				oFirstSelectedItem.EnsureVisible();
				oFirstSelectedItem.Focused = true;
			}
		}
		//******************************************************************
		/// <summary>
		/// Deletes the specified number of items (iParseCount) from the
		/// ListView, starting at the indicated index (iFirstIndex).
		/// </summary>
		private void DeleteParses(int iFirstIndex,int iParseCount)
		{
			Debug.Assert(iFirstIndex >= 0);
			Debug.Assert(iParseCount >= 0);
			Debug.Assert((iFirstIndex + iParseCount)
				<= moListView.Items.Count);

			//**************************************************************
			// Delete the indicated items in reverse order. (This prevents
			// multiple selection changes that would update the linked tree
			// viewer multiple times.)

			int iCount = 0;
			while (iCount < iParseCount)
			{
				++iCount;
				int iIndex = iFirstIndex + iParseCount - iCount;
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
		private ParseListViewerItem FirstSelectedItem()
		{
			foreach (ListViewItem oItem in moListView.Items)
			{
				if (oItem.Selected)
				{
					Debug.Assert(oItem is ParseListViewerItem);

					return (ParseListViewerItem) oItem;
				}
			}
			return null;
		}
		//******************************************************************
		/// <summary>
		/// Returns the last selected item in the ListView. Returns null if
		/// no item is selected.
		/// </summary>
		private ParseListViewerItem LastSelectedItem()
		{
			ParseListViewerItem oParseItem = null;
			foreach (ListViewItem oItem in moListView.Items)
			{
				if (oItem.Selected)
				{
					Debug.Assert(oItem is ParseListViewerItem);

					oParseItem = (ParseListViewerItem) oItem;
				}
			}
			return oParseItem;
		}
		#endregion
		//******************************************************************
		#region [ClearSelection() Method]
		//******************************************************************
		/// <summary>
		/// Clears the selection in the ListView. (The selection is cleared
		/// in reverse order to prevent multiple selection changes that
		/// would update the linked tree viewer multiple times.)
		/// </summary>
		private void ClearSelection()
		{
			ParseListViewerItem oLastSelectedItem = LastSelectedItem();
			while (oLastSelectedItem != null)
			{
				oLastSelectedItem.Selected = false;
				oLastSelectedItem = LastSelectedItem();
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
		/// tree for the selected parse in the list. (A null value indicates
		/// no linked ParseTreeViewer control.)
		/// </summary>
		public ParseTreeViewer LinkedParseTreeViewer
		{
			set
			{
				ParseTreeViewer oParseTreeViewer = value;

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
		#region [UpdateParseTreeViewer() Method]
		//******************************************************************
		/// <summary>
		/// Uses the .ParseTreeRoot property of the given oSelectedParse
		/// object to populate the linked ParseTreeViewer. The SelectedParse
		/// property is set to the given oSelectedParse object.
		/// </summary>
		private void UpdateParseTreeViewer(
			ParseListViewerItem oSelectedParse)
		{
			//**************************************************************
			// Use the given oSelectedParse to initialize a TreeTransfer
			// object, which will be used to populate the parse-tree viewer.
			//
			// If oSelectedParse is null, a blank node will be used to
			// populate the parse-tree viewer.
			//
			// If oSelectedParse is not null, its .ParseTreeRoot tree will
			// be used to populate the parse-tree viewer.

			TreeTransfer oTreeTransfer = new TreeTransfer();
			if (oSelectedParse == null)
			{
				oTreeTransfer.ParseTreeRoot = new SyntaxNode();
				oTreeTransfer.FindPatternRoot = null;
				oTreeTransfer.ReplacePatternRoot = null;
			}
			else
			{
				oTreeTransfer.ParseTreeRoot = oSelectedParse.ParseTreeRoot;
				oTreeTransfer.FindPatternRoot = null;
				oTreeTransfer.ReplacePatternRoot = null;
			}

			//**************************************************************
			// Temporarily set the SelectedParse property to null, because
			// we do not want the LinkedParseTreeViewer TreeChanged event to
			// update the SelectedParse (and set the Modified property to
			// true) when we populate the parse-tree viewer.

			moSelectedParse = null;

			//**************************************************************
			// Populate the linked parse-tree viewer.

			if (LinkedParseTreeViewer != null)
			{
				LinkedParseTreeViewer.PopulateTree(oTreeTransfer);
			}

			//**************************************************************
			// Now set the SelectedParse property to the given
			// oSelectedParse object, because we want the TreeChanged events
			// to update the SelectedParse (and set the Modified property to
			// true) when the user edits the parse tree.

			moSelectedParse = oSelectedParse;
		}
		#endregion
		//******************************************************************
		#region [SelectedParse Property]
		//******************************************************************
		/// <summary>
		/// The SelectedParse property value.
		/// </summary>
		private ParseListViewerItem moSelectedParse = null;
		//******************************************************************
		/// <summary>
		/// Gets the ParseListViewerItem in the ListView that was most
		/// recently used to populate the linked parse-tree viewer. The
		/// SelectedParse property is only set by a call to the
		/// UpdateParseTreeViewer() method. (The SelectedParse property is
		/// null if a ListView item is not currently associated with the
		/// contents of the parse-tree viewer.)
		/// </summary>
		private ParseListViewerItem SelectedParse
		{
			get
			{
				return moSelectedParse;
			}
		}
		#endregion
		//******************************************************************
		#region [SelectNextParse() Method]
		//******************************************************************
		/// <summary>
		/// Checks if there is another parse in the list after the current
		/// selected parse. If so, the next parse is selected and true is
		/// returned. If not, the first parse in the list is selected and
		/// false is returned.
		/// </summary>
		public bool SelectNextParse()
		{
			//**************************************************************
			// If the list contains another parse after the current
			// SelectedParse, select the next parse and return true. (Make
			// sure the new selected parse is scrolled into view and has
			// focus within the ListView.)

			if (SelectedParse != null)
			{
				int iIndex = SelectedParse.Index;
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
			// Otherwise, select the first parse in the list (so we start at
			// the beginning the next time we cycle through the list) and
			// return false. (Make sure the new selected parse is scrolled
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
		private void ParseListViewer_Enter(object oSender,EventArgs oArgs)
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
		/// Makes sure a parse is selected when the input focus leaves this
		/// control.
		/// </summary>
		private void ParseListViewer_Leave(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If the list is empty (and not read-only), add a new parse
				// to the list and select it.

				if (moListView.Items.Count == 0)
				{
					if (! ReadOnly)
					{
						//**************************************************
						// Set the Modified property to true.

						Modified = true;

						//**************************************************
						// Clear the undo information.

						ClearUndoInformation();

						//**************************************************
						// Create a new parse item and append it to the
						// list.

						ParseListViewerItem oParseItem
							= new ParseListViewerItem();
						oParseItem.Text = "(parse)";
						oParseItem.ParseTreeRoot = new SyntaxNode();
						moListView.Items.Add(oParseItem);

						//**************************************************
						// Select the item.

						oParseItem.Selected = true;

						//**************************************************
						// Raise the ListChanged event.

						OnListChanged(new EventArgs());
					}
				}

				//**********************************************************
				// If the list is not empty, one of the items should be the
				// SelectedParse.

				if (moListView.Items.Count > 0)
				{
					Debug.Assert(SelectedParse != null);
					Debug.Assert(moListView.Items.Contains(SelectedParse));
				}

				//**********************************************************
				// Make sure the SelectedParse item is selected.

				if (SelectedParse != null)
				{
					if (SelectedParse != FirstSelectedItem())
					{
						ClearSelection();
						SelectedParse.Selected = true;
					}
				}

				//**********************************************************
				// Make sure the SelectedParse item is scrolled into view
				// and has focus within the ListView.

				if (SelectedParse != null)
				{
					SelectedParse.EnsureVisible();
					SelectedParse.Focused = true;
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
		/// Calls the UpdateParseTreeViewer() method to change the
		/// SelectedParse value and update the linked parse-tree viewer when
		/// a new item is selected in the ListView.
		/// </summary>
		private void moListView_SelectedIndexChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If any items are selected in the ListView, the first
				// selected item will become the new SelectedParse value.

				ParseListViewerItem oNewSelectedParse = FirstSelectedItem();

				//**********************************************************
				// If no items are selected in the ListView, check if the
				// current SelectedParse is still an item in the ListView.
				//
				// If so, the new SelectedParse value will remain the same
				// as the current SelectedParse.
				//
				// If not, the new SelectedParse value will be null.

				if (oNewSelectedParse == null)
				{
					if (SelectedParse != null)
					{
						if (moListView.Items.Contains(SelectedParse))
						{
							oNewSelectedParse = SelectedParse;
						}
					}
				}

				//**********************************************************
				// If the current SelectedParse value is different than the
				// new value, call UpdateParseTreeViewer(), which will set
				// the new SelectedParse value and update the linked
				// ParseTreeViewer to display the new selected parse.

				if (SelectedParse != oNewSelectedParse)
				{
					UpdateParseTreeViewer(oNewSelectedParse);
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
		#region [LinkedParseTreeViewer TreeChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the SelectedParse.ParseTreeRoot to reflect changes to
		/// the parse tree in the LinkedParseTreeViewer.
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
				// LinkedParseTreeViewer (or if this list is read-only).

				if ((LinkedParseTreeViewer != null)
					&& (LinkedParseTreeViewer == oSender)
					&& (! ReadOnly))
				{
					//******************************************************
					// Update the SelectedParse.ParseTreeRoot to reflect the
					// user's edits in the parse-tree viewer.

					if (SelectedParse != null)
					{
						//**************************************************
						// Set the Modified property to true.

						Modified = true;

						//**************************************************
						// Clear the undo information.

						ClearUndoInformation();

						//**************************************************
						// Set the SelectedParse.ParseTreeRoot to a copy of
						// the current parse tree.

						SelectedParse.ParseTreeRoot
							= LinkedParseTreeViewer.CloneTree();
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
				moSelectAllMenu.Enabled = false;

				//**********************************************************
				// Enable menu items that are appropriate for the current
				// state and selection.

				moUndoMenu.Enabled = CanUndo();
				moCutMenu.Enabled = CanCut();
				moCopyMenu.Enabled = CanCopy();
				moPasteMenu.Enabled = CanPaste();
				moDeleteMenu.Enabled = CanDelete();
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
		#region [SelectAllMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Selects all the parses in the list.
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
