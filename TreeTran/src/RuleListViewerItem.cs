//**************************************************************************
// File: "TreeTran\RuleListViewerItem.cs".
//
// This file defines the RuleListViewerItem class, which represents a list
// item in the RuleListViewer control.
//
// History:
//     2005-Oct-22 David Bullock: Code complete.
//**************************************************************************
using TreeTranEngine;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Represents a list item in the RuleListViewer control.
	/// </summary>
	internal class RuleListViewerItem: System.Windows.Forms.ListViewItem
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the RuleListViewerItem class,
		/// which represents a list item in the RuleListViewer control.
		/// </summary>
		public RuleListViewerItem()
		{
			//**************************************************************
			// Set the ImageIndex to the first (and only) image in the
			// RuleListViewer's ImageList.

			ImageIndex = 0;
		}
		#endregion
		//******************************************************************
		#region [FindPatternRoot Property]
		//******************************************************************
		/// <summary>
		/// The FindPatternRoot property value.
		/// </summary>
		private SyntaxNode moFindPatternRoot = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the root node of the find-pattern tree for this
		/// rule.
		/// </summary>
		public SyntaxNode FindPatternRoot
		{
			set
			{
				moFindPatternRoot = value;
			}
			get
			{
				return moFindPatternRoot;
			}
		}
		#endregion
		//******************************************************************
		#region [ReplacePatternRoot Property]
		//******************************************************************
		/// <summary>
		/// The ReplacePatternRoot property value.
		/// </summary>
		private SyntaxNode moReplacePatternRoot = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the root node of the replace-pattern tree for this
		/// rule.
		/// </summary>
		public SyntaxNode ReplacePatternRoot
		{
			set
			{
				moReplacePatternRoot = value;
			}
			get
			{
				return moReplacePatternRoot;
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
