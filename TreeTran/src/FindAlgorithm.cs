//**************************************************************************
// File: "TreeTran\FindAlgorithm.cs".
//
// This file defines the FindAlgorithm class, which implements an algorithm
// to find a branch of the parse tree that matches the find-pattern tree.
//
// History:
//     2007-Feb-16 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements an algorithm to find a branch of the parse tree that
	/// matches the find-pattern tree.
	/// </summary>
	internal class FindAlgorithm
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The TreeTransfer object through which this algorithm will access
		/// the tree data.
		/// </summary>
		private TreeTransfer moTreeTransfer = null;
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the FindAlgorithm class, which
		/// will access the tree data through the given TreeTransfer object.
		/// </summary>
		public FindAlgorithm(TreeTransfer oTreeTransfer)
		{
			Debug.Assert(oTreeTransfer != null);

			moTreeTransfer = oTreeTransfer;
		}
		#endregion
		//******************************************************************
		#region [TreeTransfer Properties]
		//******************************************************************
		/// <summary>
		/// Gets or sets the ParseTreeRoot property of the TreeTransfer
		/// object.
		/// </summary>
		private SyntaxNode ParseTreeRoot
		{
			set
			{
				moTreeTransfer.ParseTreeRoot = value;
			}
			get
			{
				return moTreeTransfer.ParseTreeRoot;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the FindPatternRoot property of the TreeTransfer object.
		/// </summary>
		private SyntaxNode FindPatternRoot
		{
			get
			{
				return moTreeTransfer.FindPatternRoot;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the MatchingNodes property of the TreeTransfer object.
		/// </summary>
		private SyntaxNodePairStack MatchingNodes
		{
			get
			{
				return moTreeTransfer.MatchingNodes;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the ReplacedNodes property of the TreeTransfer object.
		/// </summary>
		private SyntaxNodeTripleStack ReplacedNodes
		{
			get
			{
				return moTreeTransfer.ReplacedNodes;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets or sets the CurrentParseTreeNode property of the
		/// TreeTransfer object.
		/// </summary>
		private SyntaxNode CurrentParseTreeNode
		{
			set
			{
				moTreeTransfer.CurrentParseTreeNode = value;
			}
			get
			{
				return moTreeTransfer.CurrentParseTreeNode;
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
			Debug.WriteLineIf(VerboseDebugging,
				"FindAlgorithm.FindNextMatchingBranch() called.");

			//**************************************************************
			// Validate the current state.

			if (CurrentParseTreeNode != null)
			{
				SyntaxNode oNode = CurrentParseTreeNode;
				while (oNode != ParseTreeRoot)
				{
					if (oNode.ParentNode == null)
					{
						string sMessage = "FindNextMatchingBranch() "
							+ "called with an invalid state: "
							+ "the ParseTreeRoot tree does not contain "
							+ "the CurrentParseTreeNode.";
						throw new Exception(sMessage);
					}
					oNode = oNode.ParentNode;
				}
			}

			//**************************************************************
			// Clear the lists of MatchingNodes and ReplacedNodes.

			MatchingNodes.Clear();
			ReplacedNodes.Clear();

			//**************************************************************
			// Save the previous value of the CurrentParseTreeNode.

			SyntaxNode oPreviousParseTreeNode = CurrentParseTreeNode;

			//**************************************************************
			// Move the CurrentParseTreeNode to the next branch to compare:
			//
			//     If CurrentParseTreeNode is null, start with the first
			//     parse-tree node in post order.
			//
			//     Otherwise, move to the next node in post order.
			//
			// Note: The parse tree is traversed in post-order (parent after
			// its children) to prevent infinite recursion that could occur
			// if an XP node was replaced by a node with XP children, and
			// then the rule was applied recursively to these children.

			if (CurrentParseTreeNode == null)
			{
				CurrentParseTreeNode
					= GetFirstNodeInPostOrder(ParseTreeRoot);
			}
			else
			{
				CurrentParseTreeNode
					= GetNextNodeInPostOrder(CurrentParseTreeNode);
			}

			//**************************************************************
			// Check if the previous branch should be deleted.
			//
			// When the ReplaceCurrentMatchingBranch() method needs to
			// delete the current parse-tree node, it sets it to an empty
			// node (one with no features and no children) instead. This is
			// so we can use the current parse-tree node to determine where
			// to find the next node to compare.
			//
			// If the previous branch is an empty node (with no features and
			// no children), delete it.

			if (oPreviousParseTreeNode != null)
			{
				if ((oPreviousParseTreeNode.Features.Count == 0)
					&& (oPreviousParseTreeNode.ChildNodes.Count == 0))
				{
					//******************************************************
					// Remove the empty node from its parent's ChildNodes
					// collection. If the empty node is the same as the
					// ParseTreeRoot, set the ParseTreeRoot to null.

					SyntaxNode oParent = oPreviousParseTreeNode.ParentNode;
					if (oParent != null)
					{
						oParent.ChildNodes.Remove(oPreviousParseTreeNode);
					}
					if (oPreviousParseTreeNode == ParseTreeRoot)
					{
						ParseTreeRoot = null;
					}
				}
			}

			//**************************************************************
			// If FindPatternRoot is null, nothing can match this pattern.
			// In this case, set CurrentParseTreeNode to null so there will
			// be no comparisons and false will be returned.

			if (FindPatternRoot == null)
			{
				CurrentParseTreeNode = null;
			}

			//**************************************************************
			// Traverse the parse tree (in post order), looking for a match,
			// until there are no more nodes to traverse. Return true if a
			// match is found.

			while (CurrentParseTreeNode != null)
			{
				//**********************************************************
				// Return true if the current branch matches the pattern.

				if (CurrentBranchMatchesPattern())
				{
					Debug.Assert(MatchingNodes.Count > 0);
					Debug.Assert(ReplacedNodes.Count == 0);
					Debug.Assert(CurrentParseTreeNode != null);

					Debug.WriteLineIf(VerboseDebugging,
						"FindAlgorithm.FindNextMatchingBranch() returns "
						+ "true.");

					return true;
				}

				//**********************************************************
				// Move to the next node in post order.

				CurrentParseTreeNode
					= GetNextNodeInPostOrder(CurrentParseTreeNode);
			}

			//**************************************************************
			// A matching branch was not found, so return false.

			Debug.Assert(MatchingNodes.Count == 0);
			Debug.Assert(ReplacedNodes.Count == 0);
			Debug.Assert(CurrentParseTreeNode == null);

			Debug.WriteLineIf(VerboseDebugging,
				"FindAlgorithm.FindNextMatchingBranch() returns false.");

			return false;
		}
		#endregion
		//******************************************************************
		#region [GetFirstNodeInPostOrder() Method]
		//******************************************************************
		/// <summary>
		/// Returns the first node in a depth-first post-order (parent after
		/// its children) traversal of the tree dominated by the given root
		/// node. Returns null if there are no nodes to traverse (because
		/// the given root node is null).
		/// </summary>
		private SyntaxNode GetFirstNodeInPostOrder(SyntaxNode oRoot)
		{
			//**************************************************************
			// If the given oRoot is null, return null, since there are no
			// nodes to traverse.

			if (oRoot == null)
			{
				return null;
			}

			//**************************************************************
			// Find the first node in depth-first post order:
			//
			// From the given root node, move down to the first child
			// repeatedly, as far as possible, and return this node.

			SyntaxNode oNode = oRoot;
			while (oNode.FirstChild != null)
			{
				oNode = oNode.FirstChild;
			}
			return oNode;
		}
		#endregion
		//******************************************************************
		#region [GetNextNodeInPostOrder() Method]
		//******************************************************************
		/// <summary>
		/// Returns the next node after the given node in a depth-first
		/// post-order (parent after its children) traversal of the tree.
		/// Returns null when there are no more nodes to traverse.
		/// </summary>
		private SyntaxNode GetNextNodeInPostOrder(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			//**************************************************************
			// If the given oNode is the parse-tree root, return null, since
			// there are no more nodes to traverse. (If the root has a
			// parent or siblings, they are outside the parse tree we are
			// traversing.)

			if (oNode == ParseTreeRoot)
			{
				return null;
			}

			//**************************************************************
			// Find the next node in depth-first post order:
			//
			// If the given node has a next sibling:
			//
			//     From the next sibling of the given node, move down to the
			//     first child repeatedly, as far as possible, and return
			//     this node.
			//
			// Otherwise:
			//
			//     Return the parent of the given node.

			if (oNode.NextSibling != null)
			{
				oNode = oNode.NextSibling;
				while (oNode.FirstChild != null)
				{
					oNode = oNode.FirstChild;
				}
				return oNode;
			}
			return oNode.ParentNode;
		}
		#endregion
		//******************************************************************
		#region [CurrentBranchMatchesPattern() Method]
		//******************************************************************
		/// <summary>
		/// Compares the trees dominated by the CurrentParseTreeNode and the
		/// FindPatternRoot. If these trees match, true is returned and the
		/// MatchingNodes stack contains the list of matching node pairs.
		/// Otherwise, false is returned.
		/// </summary>
		private bool CurrentBranchMatchesPattern()
		{
			MatchAlgorithm oAlgorithm = new MatchAlgorithm(moTreeTransfer);
			return oAlgorithm.CurrentBranchMatchesPattern();
		}
		#endregion
		//******************************************************************
		#region [Static VerboseDebugging Property]
		//******************************************************************
		/// <summary>
		/// The VerboseDebugging property value.
		/// </summary>
		private static bool mbVerboseDebugging = false;
		//******************************************************************
		/// <summary>
		/// Returns true if verbose debugging is desired for instances of
		/// this class, and false otherwise.
		/// </summary>
		private static bool VerboseDebugging
		{
			get
			{
				return mbVerboseDebugging;
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
