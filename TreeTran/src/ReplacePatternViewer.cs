//**************************************************************************
// File: "TreeTran\ReplacePatternViewer.cs".
//
// This file defines the ReplacePatternViewer class, which implements a
// control that allows the user to view and edit the replace-pattern tree of
// a transfer rule.
//
// History:
//     2006-Aug-23 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.Windows.Forms;
using TreeTranEngine;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Implements a control that allows the user to view and edit the
	/// replace-pattern tree of a transfer rule.
	/// </summary>
	public class ReplacePatternViewer: System.Windows.Forms.UserControl
	{
		//******************************************************************
		#region [Generated Code]

		private TreeTranViewer.ParseTreeViewer moParseTreeViewer;
		// <summary>
		// Required designer variable.
		// </summary>
		private System.ComponentModel.Container components = null;

		public ReplacePatternViewer()
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
			this.moParseTreeViewer = new TreeTranViewer.ParseTreeViewer();
			this.SuspendLayout();
			//
			// moParseTreeViewer
			//
			this.moParseTreeViewer.DisplayFindPattern = false;
			this.moParseTreeViewer.DisplayReplacePattern = true;
			this.moParseTreeViewer.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moParseTreeViewer.Modified = false;
			this.moParseTreeViewer.Name = "moParseTreeViewer";
			this.moParseTreeViewer.ReadOnly = false;
			this.moParseTreeViewer.ShowFeatures = true;
			this.moParseTreeViewer.ShowMorphology = true;
			this.moParseTreeViewer.TabIndex = 0;
			this.moParseTreeViewer.SelectionChanged += new System.EventHandler(this.moParseTreeViewer_SelectionChanged);
			this.moParseTreeViewer.TreeChanged += new System.EventHandler(this.moParseTreeViewer_TreeChanged);
			//
			// ReplacePatternViewer
			//
			this.BackColor = System.Drawing.SystemColors.Window;
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moParseTreeViewer});
			this.ForeColor = System.Drawing.SystemColors.WindowText;
			this.Name = "ReplacePatternViewer";
			this.ResumeLayout(false);

		}
		#endregion
		#endregion
		//******************************************************************
		#region [IsUpdating Property]
		//******************************************************************
		/// <summary>
		/// Gets a value indicating whether redrawing of the tree is
		/// disabled. The IsUpdating property is initially false. It is set
		/// to true when BeginUpdate() is called and set back to false when
		/// EndUpdate() is called.
		/// </summary>
		public bool IsUpdating
		{
			get
			{
				return moParseTreeViewer.IsUpdating;
			}
		}
		#endregion
		//******************************************************************
		#region [BeginUpdate() and EndUpdate() Methods]
		//******************************************************************
		/// <summary>
		/// Sets the IsUpdating property to true and disables any redrawing
		/// of the tree until the EndUpdate() method is called.
		/// </summary>
		public void BeginUpdate()
		{
			Debug.Assert(! IsUpdating);

			moParseTreeViewer.BeginUpdate();
		}
		//******************************************************************
		/// <summary>
		/// Redraws the tree and sets the IsUpdating property back to false.
		/// </summary>
		public void EndUpdate()
		{
			Debug.Assert(IsUpdating);

			moParseTreeViewer.EndUpdate();
		}
		#endregion
		//******************************************************************
		#region [PopulateTree() Method]
		//******************************************************************
		/// <summary>
		/// Displays the replace-pattern tree specified by the
		/// ReplacePatternRoot property of the given TreeTransfer object.
		/// </summary>
		public void PopulateTree(TreeTransfer oTreeTransfer)
		{
			//**************************************************************
			// The viewer must be set up to display replace-pattern trees.

			Debug.Assert(moParseTreeViewer.DisplayReplacePattern);
			Debug.Assert(moParseTreeViewer.ShowFeatures);
			Debug.Assert(moParseTreeViewer.ShowMorphology);

			//**************************************************************
			// Display the replace-pattern tree.

			moParseTreeViewer.PopulateTree(oTreeTransfer);
		}
		#endregion
		//******************************************************************
		#region [CloneTree() Method]
		//******************************************************************
		/// <summary>
		/// Creates a tree of SyntaxNode objects that represents the nodes
		/// and features displayed by this tree. Returns the root node of
		/// the created SyntaxNode tree.
		/// </summary>
		public SyntaxNode CloneTree()
		{
			return moParseTreeViewer.CloneTree();
		}
		#endregion
		//******************************************************************
		#region [ReadOnly Property]
		//******************************************************************
		/// <summary>
		/// Gets or sets the ReadOnly property, which is false if the user
		/// can edit the tree, and true if the user is not allowed to edit.
		/// </summary>
		public bool ReadOnly
		{
			set
			{
				moParseTreeViewer.ReadOnly = value;
			}
			get
			{
				return moParseTreeViewer.ReadOnly;
			}
		}
		#endregion
		//******************************************************************
		#region [Modified Property]
		//******************************************************************
		/// <summary>
		/// Gets or sets the Modified property, which is set to false by the
		/// PopulateTree() method and then set to true whenever the tree
		/// contents change.
		/// </summary>
		public bool Modified
		{
			set
			{
				moParseTreeViewer.Modified = value;
			}
			get
			{
				return moParseTreeViewer.Modified;
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
			return moParseTreeViewer.CanUndo();
		}
		//******************************************************************
		/// <summary>
		/// Undoes the last edit operation.
		/// </summary>
		public void Undo()
		{
			moParseTreeViewer.Undo();
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
			return moParseTreeViewer.CanCut();
		}
		//******************************************************************
		/// <summary>
		/// Cuts the current selection to the clipboard.
		/// </summary>
		public void Cut()
		{
			moParseTreeViewer.Cut();
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
			return moParseTreeViewer.CanCopy();
		}
		//******************************************************************
		/// <summary>
		/// Copies the current selection to the clipboard.
		/// </summary>
		public void Copy()
		{
			moParseTreeViewer.Copy();
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
			return moParseTreeViewer.CanPaste();
		}
		//******************************************************************
		/// <summary>
		/// Pastes the current contents of the clipboard.
		/// </summary>
		public void Paste()
		{
			moParseTreeViewer.Paste();
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
			return moParseTreeViewer.CanDelete();
		}
		//******************************************************************
		/// <summary>
		/// Deletes the current selection.
		/// </summary>
		public void Delete()
		{
			moParseTreeViewer.Delete();
		}
		#endregion
		//******************************************************************
		#region [OpenFeatures() and CanOpenFeatures() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection is a node whose syntax
		/// features can be displayed in the FeaturesForm. Returns false
		/// otherwise.
		/// </summary>
		public bool CanOpenFeatures()
		{
			return moParseTreeViewer.CanOpenFeatures();
		}
		//******************************************************************
		/// <summary>
		/// Opens the FeaturesForm to display the syntax features of the
		/// selected node.
		/// </summary>
		public void OpenFeatures()
		{
			moParseTreeViewer.OpenFeatures();
		}
		#endregion
		//******************************************************************

		// EVENTS

		//******************************************************************
		#region [SelectionChanged Event]
		//******************************************************************
		/// <summary>
		/// Occurs when the selected node in the tree changes.
		/// </summary>
		public event EventHandler SelectionChanged;
		//******************************************************************
		/// <summary>
		/// Raises the SelectionChanged event.
		/// </summary>
		private void moParseTreeViewer_SelectionChanged(object oSender,
			EventArgs oArgs)
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
		#region [TreeChanged Event]
		//******************************************************************
		/// <summary>
		/// Occurs when the tree contents change.
		/// </summary>
		public event EventHandler TreeChanged;
		//******************************************************************
		/// <summary>
		/// Raises the TreeChanged event.
		/// </summary>
		private void moParseTreeViewer_TreeChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (TreeChanged != null)
				{
					TreeChanged(this,oArgs);
				}
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
