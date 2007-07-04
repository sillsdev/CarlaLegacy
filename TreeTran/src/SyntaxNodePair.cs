//**************************************************************************
// File: "TreeTran\SyntaxNodePair.cs".
//
// This file defines the SyntaxNodePair class, which represents a pair of
// SyntaxNode objects: a node in the parse tree and the matching node from
// the find-pattern tree.
//
// History:
//     2005-Mar-10 David Bullock: Code complete.
//**************************************************************************
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Represents a pair of SyntaxNode objects: a node in the parse tree
	/// and the matching node from the find-pattern tree.
	/// </summary>
	public class SyntaxNodePair
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
		/// Gets or sets the ParseTreeNode property, representing a node in
		/// the parse-tree branch that was matched.
		/// </summary>
		public SyntaxNode ParseTreeNode
		{
			set
			{
				Debug.Assert(moParseTreeNode == null);

				moParseTreeNode = value;
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
		/// Gets or sets the FindPatternNode property, representing a node
		/// from the find-pattern tree that matches the ParseTreeNode in
		/// this node pair.
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
		#region [ToString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string representing the contents of the node pair.
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
			return "(" + sParseString + "," + sFindString + ")";
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
