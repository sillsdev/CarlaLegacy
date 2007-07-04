//**************************************************************************
// File: "TreeTran\ParseListViewerItem.cs".
//
// This file defines the ParseListViewerItem class, which represents a list
// item in the ParseListViewer control.
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
	/// Represents a list item in the ParseListViewer control.
	/// </summary>
	internal class ParseListViewerItem: System.Windows.Forms.ListViewItem
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the ParseListViewerItem class,
		/// which represents a list item in the ParseListViewer control.
		/// </summary>
		public ParseListViewerItem()
		{
			//**************************************************************
			// Set the ImageIndex to the first (and only) image in the
			// ParseListViewer's ImageList.

			ImageIndex = 0;
		}
		#endregion
		//******************************************************************
		#region [ParseTreeRoot Property]
		//******************************************************************
		/// <summary>
		/// The ParseTreeRoot property value.
		/// </summary>
		private SyntaxNode moParseTreeRoot = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the root node of the parse tree.
		/// </summary>
		public SyntaxNode ParseTreeRoot
		{
			set
			{
				moParseTreeRoot = value;
			}
			get
			{
				return moParseTreeRoot;
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
