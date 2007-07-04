//**************************************************************************
// File: "TreeTran\SyntaxNodeTriple.cs".
//
// This file defines the SyntaxNodeTriple class, which represents a triple
// of SyntaxNode objects: a new node in the replaced branch of the parse
// tree and the corresponding nodes from the find and replace patterns.
//
// History:
//     2005-Mar-9 David Bullock: Code complete.
//**************************************************************************
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Represents a triple of SyntaxNode objects: a new node in the
	/// replaced branch of the parse tree and the corresponding nodes from
	/// the find and replace patterns.
	/// </summary>
	public class SyntaxNodeTriple
	{
		//******************************************************************
		#region [ParseTreeNode Property]
		//******************************************************************
		/// <summary>
		/// The ParseTreeNode property value.
		/// </summary>
		private SyntaxNode moParseTreeNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ParseTreeNode property, representing a new node
		/// in the replaced branch of the parse tree.
		/// </summary>
		public SyntaxNode ParseTreeNode
		{
			set
			{
				Debug.Assert(moParseTreeNode == null);

				moParseTreeNode = value;

				Debug.Assert(moParseTreeNode != null);
			}
			get
			{
				return moParseTreeNode;
			}
		}
		#endregion
		//******************************************************************
		#region [FindPatternNode Property]
		//******************************************************************
		/// <summary>
		/// The FindPatternNode property value.
		/// </summary>
		private SyntaxNode moFindPatternNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the FindPatternNode property, representing the node
		/// from the find-pattern tree that corresponds to the new
		/// ParseTreeNode in this node triple: before the parse-tree branch
		/// was replaced, the corresponding old parse-tree node was matched
		/// by this find-pattern node. This value is null if no
		/// corresponding node was matched.
		/// </summary>
		public SyntaxNode FindPatternNode
		{
			set
			{
				Debug.Assert(moFindPatternNode == null);

				moFindPatternNode = value;
			}
			get
			{
				return moFindPatternNode;
			}
		}
		#endregion
		//******************************************************************
		#region [ReplacePatternNode Property]
		//******************************************************************
		/// <summary>
		/// The ReplacePatternNode property value.
		/// </summary>
		private SyntaxNode moReplacePatternNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ReplacePatternNode property, representing the
		/// node from the replace-pattern tree that was used as a pattern to
		/// create the new ParseTreeNode in this node triple.
		/// </summary>
		public SyntaxNode ReplacePatternNode
		{
			set
			{
				Debug.Assert(moReplacePatternNode == null);

				moReplacePatternNode = value;

				Debug.Assert(moReplacePatternNode != null);
			}
			get
			{
				return moReplacePatternNode;
			}
		}
		#endregion
		//******************************************************************
		#region [ToString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string representing the contents of the node triple.
		/// </summary>
		public override string ToString()
		{
			string sParseString = "null";
			if (ParseTreeNode != null)
			{
				sParseString = ParseTreeNode.ToString();
			}
			string sFindString = "null";
			if (FindPatternNode != null)
			{
				sFindString = FindPatternNode.ToString();
			}
			string sReplaceString = "null";
			if (ReplacePatternNode != null)
			{
				sReplaceString = ReplacePatternNode.ToString();
			}
			return "(" + sParseString + "," + sFindString + ","
				+ sReplaceString + ")";
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
