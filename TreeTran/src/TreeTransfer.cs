//**************************************************************************
// File: "TreeTran\TreeTransfer.cs".
//
// This file defines the TreeTransfer class, which represents the properties
// and methods used to apply a tree-transfer rule to a parse tree.
//
// History:
//     2005-Sep-7 David Bullock: Code complete.
//**************************************************************************
// Note that "Esperanto Notation" is used throughout this project:
//
// The following abbreviations are used at the beginning of local variable
// names, and are preceeded by an m in private class-member variable names:
// b = boolean, i = integer, n = real number, s = string, o = object.
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Represents the properties and methods used to apply a tree-transfer
	/// rule to a parse tree.
	/// </summary>
	public class TreeTransfer
	{
		//******************************************************************
		#region [ParseTreeRoot Property]
		//******************************************************************
		/// <summary>
		/// The ParseTreeRoot property value.
		/// </summary>
		private SyntaxNode moParseTreeRoot = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the root node indicating the parse tree to which
		/// the tree-transfer rule will be applied.
		/// </summary>
		public SyntaxNode ParseTreeRoot
		{
			set
			{
				//**********************************************************
				// Set the ParseTreeRoot property.

				moParseTreeRoot = value;

				//**********************************************************
				// When the ParseTreeRoot property is changed, clear the
				// CurrentParseTreeNode property, since it might refer to a
				// node in the old parse tree.
				//
				// (Note that the MatchingNodes and ReplacedNodes stacks
				// cannot be cleared here, because the ParseTreeRoot
				// property might be changed in the middle of a call to
				// ReplaceCurrentMatchingBranch() if the root node of the
				// parse tree is being replaced.)

				CurrentParseTreeNode = null;
			}
			get
			{
				return moParseTreeRoot;
			}
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
		/// Gets or sets the root node indicating the find-pattern tree of
		/// the tree-transfer rule.
		/// </summary>
		public SyntaxNode FindPatternRoot
		{
			set
			{
				//**********************************************************
				// Set the FindPatternRoot property.

				moFindPatternRoot = value;

				//**********************************************************
				// When the FindPatternRoot property is changed, clear the
				// MatchingNodes and ReplacedNodes stacks, since they might
				// refer to nodes in the old find-pattern tree.

				MatchingNodes.Clear();
				ReplacedNodes.Clear();

				//**********************************************************
				// When the FindPatternRoot property is changed, clear the
				// CurrentParseTreeNode property, because we want the
				// FindNextMatchingBranch() method to search for the first
				// branch that matches the new pattern.

				CurrentParseTreeNode = null;
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
		/// Gets or sets the root node indicating the replace-pattern tree
		/// of the tree-transfer rule.
		/// </summary>
		public SyntaxNode ReplacePatternRoot
		{
			set
			{
				//**********************************************************
				// Set the ReplacePatternRoot property.

				moReplacePatternRoot = value;

				//**********************************************************
				// When the ReplacePatternRoot property is changed, clear
				// the ReplacedNodes stack, since it might refer to nodes in
				// the old replace-pattern tree.

				ReplacedNodes.Clear();
			}
			get
			{
				return moReplacePatternRoot;
			}
		}
		#endregion
		//******************************************************************
		#region [MatchingNodes Property]
		//******************************************************************
		/// <summary>
		/// The MatchingNodes property value.
		/// </summary>
		private SyntaxNodePairStack moMatchingNodes = null;
		//******************************************************************
		/// <summary>
		/// Gets the list of node pairs that were matched by the
		/// FindNextMatchingBranch() method.
		/// </summary>
		public SyntaxNodePairStack MatchingNodes
		{
			get
			{
				//**********************************************************
				// Create the stack if it does not already exist.

				if (moMatchingNodes == null)
				{
					moMatchingNodes = new SyntaxNodePairStack();
				}

				//**********************************************************
				// Return the stack.

				return moMatchingNodes;
			}
		}
		#endregion
		//******************************************************************
		#region [ReplacedNodes Property]
		//******************************************************************
		/// <summary>
		/// The ReplacedNodes property value.
		/// </summary>
		private SyntaxNodeTripleStack moReplacedNodes = null;
		//******************************************************************
		/// <summary>
		/// Gets the list of node triples representing the nodes in the
		/// replaced sub-tree created by the ReplaceCurrentMatchingBranch()
		/// method.
		/// </summary>
		public SyntaxNodeTripleStack ReplacedNodes
		{
			get
			{
				//**********************************************************
				// Create the stack if it does not already exist.

				if (moReplacedNodes == null)
				{
					moReplacedNodes = new SyntaxNodeTripleStack();
				}

				//**********************************************************
				// Return the stack.

				return moReplacedNodes;
			}
		}
		#endregion
		//******************************************************************
		#region [CurrentParseTreeNode Property]
		//******************************************************************
		/// <summary>
		/// The CurrentParseTreeNode property value.
		/// </summary>
		private SyntaxNode moCurrentParseTreeNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the current node in the parse tree. The
		/// FindNextMatchingBranch() method sets the current node to
		/// indicate a matching branch in the parse tree, and then the
		/// ReplaceCurrentMatchingBranch() method replaces the branch
		/// indicated by the current node.
		/// </summary>
		public SyntaxNode CurrentParseTreeNode
		{
			set
			{
				moCurrentParseTreeNode = value;
			}
			get
			{
				return moCurrentParseTreeNode;
			}
		}
		#endregion
		//******************************************************************
		#region [FindNextMatchingBranch() Method]
		//******************************************************************
		/// <summary>
		/// Moves the CurrentParseTreeNode forward in the parse tree, until
		/// the sub-tree dominated by this node matches the pattern
		/// dominated by FindPatternRoot. If CurrentParseTreeNode is null
		/// when this method is called, the search starts with the first
		/// node in the parse tree. Otherwise, the search continues with the
		/// next node in the tree. If a matching sub-tree is found, true is
		/// returned and the MatchingNodes stack contains the list of
		/// matching node pairs. If no match is found, CurrentParseTreeNode
		/// is set to null and false is returned.
		/// </summary>
		public bool FindNextMatchingBranch()
		{
			FindAlgorithm oAlgorithm = new FindAlgorithm(this);
			return oAlgorithm.FindNextMatchingBranch();
		}
		#endregion
		//******************************************************************
		#region [ReplaceCurrentMatchingBranch() Method]
		//******************************************************************
		/// <summary>
		/// Replaces the sub-tree dominated by the CurrentParseTreeNode,
		/// using the tree dominated by the ReplacePatternRoot as a pattern.
		/// Corresponding nodes (matched by a find-pattern node with the
		/// same label as the replace-pattern node) are copied from the
		/// MatchingNodes stack and their features are merged with features
		/// from the replace pattern. The replaced nodes in the new sub-tree
		/// are also stored in the ReplacedNodes stack.
		/// </summary>
		public void ReplaceCurrentMatchingBranch()
		{
			ReplaceAlgorithm oAlgorithm = new ReplaceAlgorithm(this);
			oAlgorithm.ReplaceCurrentMatchingBranch();
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
