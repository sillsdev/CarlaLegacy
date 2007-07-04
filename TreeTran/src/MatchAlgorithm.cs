//**************************************************************************
// File: "TreeTran\MatchAlgorithm.cs".
//
// This file defines the MatchAlgorithm class, which implements an algorithm
// to compare a branch of the parse tree against the find-pattern tree and
// produce a list of matching nodes.
//
// History:
//     2007-Feb-16 David Bullock: Code complete (except feature paths).
//**************************************************************************
using System;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements an algorithm to compare a branch of the parse tree
	/// against the find-pattern tree and produce a list of matching nodes.
	/// </summary>
	internal class MatchAlgorithm
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
		/// Initializes a new instance of the MatchAlgorithm class, which
		/// will access the tree data through the given TreeTransfer object.
		/// </summary>
		public MatchAlgorithm(TreeTransfer oTreeTransfer)
		{
			Debug.Assert(oTreeTransfer != null);

			moTreeTransfer = oTreeTransfer;
		}
		#endregion
		//******************************************************************
		#region [TreeTransfer Properties]
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
		/// Gets the CurrentParseTreeNode property of the TreeTransfer
		/// object.
		/// </summary>
		private SyntaxNode CurrentParseTreeNode
		{
			get
			{
				return moTreeTransfer.CurrentParseTreeNode;
			}
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
		public bool CurrentBranchMatchesPattern()
		{
			Debug.WriteLineIf(VerboseDebugging,
				"MatchAlgorithm.CurrentBranchMatchesPattern() called.");

			//**************************************************************
			// Validate the current state.

			if (FindPatternRoot == null)
			{
				string sMessage = "CurrentBranchMatchesPattern() "
					+ "called with an invalid state: "
					+ "FindPatternRoot is null.";
				throw new Exception(sMessage);
			}

			if (CurrentParseTreeNode == null)
			{
				string sMessage = "CurrentBranchMatchesPattern() "
					+ "called with an invalid state: "
					+ "CurrentParseTreeNode is null.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Clear the stack of matching node pairs.

			MatchingNodes.Clear();

			//**************************************************************
			// Call FeaturesAndChildrenMatch() to check if the current
			// parse-tree branch matches the find-pattern tree. If so,
			// return true.

			SyntaxNodePair oNodePair = new SyntaxNodePair();
			oNodePair.ParseTreeNode = CurrentParseTreeNode;
			oNodePair.FindPatternNode = FindPatternRoot;
			if (FeaturesAndChildrenMatch(oNodePair))
			{
				Debug.Assert(MatchingNodes.Count > 0);

				Debug.WriteLineIf(VerboseDebugging,
					"MatchAlgorithm.CurrentBranchMatchesPattern() returns "
					+ "true.");

				return true;
			}

			//**************************************************************
			// The current parse-tree branch does not match the find-pattern
			// tree, so return false.
			//
			// Note: The matching procedure should have cleared all node
			// pairs from the MatchingNodes stack if the match failed.

			Debug.Assert(MatchingNodes.Count == 0);

			MatchingNodes.Clear();

			Debug.WriteLineIf(VerboseDebugging,
				"MatchAlgorithm.CurrentBranchMatchesPattern() returns "
				+ "false.");

			return false;
		}
		#endregion
		//******************************************************************
		#region [FeaturesAndChildrenMatch() Method]
		//******************************************************************
		/// <summary>
		/// Compares the sub-trees dominated by oNodePair.ParseTreeNode and
		/// oNodePair.FindPatternNode. If the features and children of the
		/// pattern sub-tree match the features and children of the parse
		/// sub-tree, the matching node pairs are pushed onto the
		/// MatchingNodes stack and true is returned. Otherwise, false is
		/// returned (after any added partial matches are popped of the
		/// MatchingNodes stack, restoring it to the same state as when this
		/// method was called).
		/// </summary>
		private bool FeaturesAndChildrenMatch(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);

			//**************************************************************
			// Compare the features of oNodePair.ParseTreeNode and
			// oNodePair.FindPatternNode.
			//
			// If the features do not match (or if either node is null),
			// return false.
			//
			// Otherwise, push the oNodePair onto the MatchingNodes stack.

			if (! FeaturesMatch(oNodePair))
			{
				return false;
			}

			Debug.Assert(oNodePair.ParseTreeNode != null);
			Debug.Assert(oNodePair.FindPatternNode != null);

			MatchingNodes.Push(oNodePair);

			Debug.WriteLineIf(VerboseDebugging,
				"MatchingNodes: " + MatchingNodes.ToString() + ".");

			//**************************************************************
			// If oNodePair.FindPatternNode has children, compare these
			// children to the children of oNodePair.ParseTreeNode.
			//
			// (Note that the children of the ParseTreeNode do not need to
			// be matched if the FindPatternNode does not have children.)
			//
			// If the children do not match, pop everything off the
			// MatchingNodes stack up to and including the oNodePair, and
			// then return false.

			if (oNodePair.FindPatternNode.ChildNodes.Count > 0)
			{
				//**********************************************************
				// If oNodePair.ParseTreeNode is a syntax leaf node, call
				// LeafChildrenMatch() to compare the children.
				//
				// Otherwise, call NodeChildrenMatch() to compare the
				// children.

				bool bChildrenMatch = false;
				if (oNodePair.ParseTreeNode.IsSyntaxLeaf)
				{
					bChildrenMatch = LeafChildrenMatch(oNodePair);
				}
				else
				{
					bChildrenMatch = NodeChildrenMatch(oNodePair);
				}

				//**********************************************************
				// If the children do not match, pop everything off the
				// MatchingNodes stack up to and including the oNodePair,
				// and then return false.

				if (! bChildrenMatch)
				{
					ClearNodePairFromStack(oNodePair);
					return false;
				}
			}

			//**************************************************************
			// The features and children match, so return true.

			return true;
		}
		#endregion
		//******************************************************************
		#region [NodeChildrenMatch() Method]
		//******************************************************************
		// EXAMPLE WALKTHROUGH OF BACKTRACKING
		//
		// Suppose NodeChildrenMatch() is called with the following state:
		//
		// MatchingNodes = {(VP,VP)}
		// oNodePair.ParseTreeNode.ChildNodes = {V,PP}
		// oNodePair.FindPatternNode.ChildNodes = {V,(NP),(PP),PP}
		//
		// 1. Compare the first child pair (V,V). They match, so push the
		// pair onto the stack and move to the next sibling pair (PP,(NP)).
		// The stack now contains:
		//
		// MatchingNodes = {(V,V)(VP,VP)}
		//
		// 2. Compare the child pair (PP,(NP)). They do not match. Since
		// (NP) is optional, skip this node to get the next child pair to
		// compare (PP,(PP)).
		//
		// 3. Compare the child pair (PP,(PP)). They match, so push the pair
		// onto the stack and move to the next sibling pair (null,PP). The
		// stack now contains:
		//
		// MatchingNodes = {(PP,(PP))(V,V)(VP,VP)}
		//
		// 4. Compare the child pair (null,PP). They do not match. Since PP
		// is not optional, we need to backtrack to find a child pair with
		// an optional find-pattern node. The child pair (PP,(PP)) is found
		// on the stack. Skip the optional node to get the next child pair
		// to compare (PP,PP). Backtracking removed one pair from the stack:
		//
		// MatchingNodes = {(V,V)(VP,VP)}
		//
		// 5. Compare the child pair (PP,PP). They match, so push the pair
		// onto the stack and move to the next sibling pair (null,null). The
		// stack now contains:
		//
		// MatchingNodes = {(PP,PP)(V,V)(VP,VP)}
		//
		// 6. We reached the end of both ChildNodes collections at the same
		// time. This means we successfully matched all the children, so
		// return true.
		//******************************************************************
		/// <summary>
		/// Compares the children of oNodePair.ParseTreeNode to the children
		/// of oNodePair.FindPatternNode by making recursive calls to
		/// FeaturesAndChildrenMatch() for each pair of child nodes.
		/// Backtracks and/or skips optional nodes if necessary to find
		/// matching pairs of child nodes. Returns true if all the children
		/// are matched successfully. Returns false otherwise. (This is an
		/// ordered comparison. The given oNodePair.ParseTreeNode must not
		/// be a syntax leaf.)
		/// </summary>
		private bool NodeChildrenMatch(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);
			Debug.Assert(oNodePair.ParseTreeNode != null);
			Debug.Assert(oNodePair.FindPatternNode != null);
			Debug.Assert(! oNodePair.ParseTreeNode.IsSyntaxLeaf);
			Debug.Assert(oNodePair.FindPatternNode.ChildNodes.Count > 0);

			//**************************************************************
			// Iterate through the children of the oNodePair.ParseTreeNode
			// and the children of the oNodePair.FindPatternNode, starting
			// with the first child in each collection.
			//
			// For each child pair, compare their features and children.
			//
			// If the pair matches:
			//
			//     Get the next child pair to compare by moving forward to
			//     the next sibling in each collection.
			//
			// Otherwise:
			//
			//     Get the next child pair to compare by backtracking and/or
			//     skipping an optional node.
			//
			// If we reach the end of both collections at the same time (the
			// child ParseTreeNode and the child FindPatternNode are both
			// null), we have successfully matched all the children.

			SyntaxNodePair oChildPair = FirstChildNodePair(oNodePair);
			while ((oChildPair.ParseTreeNode != null)
				|| (oChildPair.FindPatternNode != null))
			{
				if (FeaturesAndChildrenMatch(oChildPair))
				{
					//******************************************************
					// The pair matches.
					//
					// Move forward to the next sibling pair.

					oChildPair = NextSiblingNodePair(oChildPair);
				}
				else
				{
					//******************************************************
					// The pair does not match.
					//
					// Try to find another child pair to compare by skipping
					// an optional node.
					//
					// If the child FindPatternNode is not optional, we need
					// to backtrack to a node pair on the stack that (1) is
					// a child of oNodePair and (2) has a FindPatternNode
					// that is optional. If backtracking fails to find such
					// a node pair, return false.
					//
					// Once we have a child FindPatternNode that is
					// optional, skip the optional node to get the next
					// child pair to compare.

					bool bChildFindPatternNodeIsOptional = false;
					if (oChildPair.FindPatternNode != null)
					{
						if (oChildPair.FindPatternNode.IsOptionalNode)
						{
							bChildFindPatternNodeIsOptional = true;
						}
					}
					if (! bChildFindPatternNodeIsOptional)
					{
						oChildPair = BacktrackToOptionalNode(oNodePair);
						if (oChildPair == null)
						{
							return false;
						}
					}

					Debug.Assert(oChildPair.FindPatternNode != null);
					Debug.Assert(oChildPair.FindPatternNode.IsOptionalNode);

					oChildPair = SkipOptionalNode(oChildPair);
				}
			}

			//**************************************************************
			// We have successfully matched all the children, so return
			// true.

			return true;
		}
		#endregion
		//******************************************************************
		#region [LeafChildrenMatch() Method]
		//******************************************************************
		/// <summary>
		/// Compares each child of oNodePair.ParseTreeNode by making
		/// recursive calls to FeaturesAndChildrenMatch() to see if it
		/// matches any child of oNodePair.FindPatternNode. Returns true if
		/// at least one child pair matched successfully. Returns false
		/// otherwise. (This is not an ordered comparison. The given
		/// oNodePair.ParseTreeNode must be a syntax leaf.)
		/// </summary>
		private bool LeafChildrenMatch(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);
			Debug.Assert(oNodePair.ParseTreeNode != null);
			Debug.Assert(oNodePair.FindPatternNode != null);
			Debug.Assert(oNodePair.ParseTreeNode.IsSyntaxLeaf);
			Debug.Assert(oNodePair.FindPatternNode.ChildNodes.Count > 0);

			//**************************************************************
			// Since oNodePair.ParseTreeNode is a syntax leaf, each of its
			// children is the root of a morphology parse. (A syntax leaf
			// may have one or more alternative morphology parses.)
			//
			// For each of these morphology-parse children of
			// oNodePair.ParseTreeNode, see if it matches any child of
			// oNodePair.FindPatternNode. If so, increment the counter.

			int iMatchCount = 0;
			foreach (SyntaxNode oParseChild in
				oNodePair.ParseTreeNode.ChildNodes)
			{
				//**********************************************************
				// Loop through the oNodePair.FindPatternNode children.
				// Stop if we find a match to the morphology-parse child of
				// oNodePair.ParseTreeNode.

				SyntaxNode oFindChild
					= oNodePair.FindPatternNode.FirstChild;
				while (oFindChild != null)
				{
					SyntaxNodePair oChildPair = new SyntaxNodePair();
					oChildPair.ParseTreeNode = oParseChild;
					oChildPair.FindPatternNode = oFindChild;
					if (FeaturesAndChildrenMatch(oChildPair))
					{
						//**************************************************
						// Found a match. Increment the counter and end the
						// loop (by setting oFindChild to null).

						++iMatchCount;
						oFindChild = null;
					}
					else
					{
						//**************************************************
						// Continue looping (by setting oFindChild to the
						// next sibling).

						Debug.Assert(oFindChild != FindPatternRoot);

						oFindChild = oFindChild.NextSibling;
					}
				}
			}

			//**************************************************************
			// If at least one child of oNodePair.ParseTreeNode matched,
			// return true. Otherwise, return false.

			if (iMatchCount > 0)
			{
				return true;
			}
			return false;
		}
		#endregion
		//******************************************************************
		#region [FirstChildNodePair() Method]
		//******************************************************************
		/// <summary>
		/// Returns a new node pair containing the first child of the
		/// ParseTreeNode and the first child of the FindPatternNode from
		/// the given oNodePair.
		/// </summary>
		private SyntaxNodePair FirstChildNodePair(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);
			Debug.Assert(oNodePair.ParseTreeNode != null);
			Debug.Assert(oNodePair.FindPatternNode != null);

			SyntaxNodePair oChildPair = new SyntaxNodePair();
			oChildPair.ParseTreeNode
				= oNodePair.ParseTreeNode.FirstChild;
			oChildPair.FindPatternNode
				= oNodePair.FindPatternNode.FirstChild;
			return oChildPair;
		}
		#endregion
		//******************************************************************
		#region [NextSiblingNodePair() Method]
		//******************************************************************
		/// <summary>
		/// Returns a new node pair containing the next sibling of the
		/// ParseTreeNode and the next sibling of the FindPatternNode from
		/// the given oNodePair.
		/// </summary>
		private SyntaxNodePair NextSiblingNodePair(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);
			Debug.Assert(oNodePair.ParseTreeNode != null);
			Debug.Assert(oNodePair.FindPatternNode != null);
			Debug.Assert(oNodePair.ParseTreeNode != CurrentParseTreeNode);
			Debug.Assert(oNodePair.FindPatternNode != FindPatternRoot);

			SyntaxNodePair oSiblingPair = new SyntaxNodePair();
			oSiblingPair.ParseTreeNode
				= oNodePair.ParseTreeNode.NextSibling;
			oSiblingPair.FindPatternNode
				= oNodePair.FindPatternNode.NextSibling;
			return oSiblingPair;
		}
		#endregion
		//******************************************************************
		#region [BacktrackToOptionalNode() Method]
		//******************************************************************
		/// <summary>
		/// Attempts to backtrack to a node pair on the MatchingNodes stack
		/// that (1) is a child of the given oParentNodePair and (2) has an
		/// optional FindPatternNode. If such a node pair is found, items
		/// are popped from the stack until this node pair is popped, and
		/// then this node pair is returned. If no such node pair is found,
		/// null is returned (and no items are popped from the stack).
		/// </summary>
		private SyntaxNodePair BacktrackToOptionalNode(
			SyntaxNodePair oParentNodePair)
		{
			Debug.Assert(oParentNodePair != null);
			Debug.Assert(oParentNodePair.ParseTreeNode != null);
			Debug.Assert(oParentNodePair.FindPatternNode != null);

			//**************************************************************
			// Search backwards through the MatchingNodes stack (starting
			// with the most recently pushed node pair), looking for a node
			// pair where (1) the ParseTreeNode is a child of the given
			// oParentNodePair.ParseTreeNode, (2) the FindPatternNode is a
			// child of the given oParentNodePair.FindPatternNode, and (3)
			// the FindPatternNode is optional.
			//
			// If such a node pair is found, pop items from the stack until
			// this node pair is popped, and then return this node pair.

			int iIndex = MatchingNodes.Count - 1;
			while (iIndex >= 0)
			{
				SyntaxNodePair oNodePair = MatchingNodes[iIndex];
				if ((oNodePair.ParseTreeNode.ParentNode
					== oParentNodePair.ParseTreeNode)
					&& (oNodePair.FindPatternNode.ParentNode
					== oParentNodePair.FindPatternNode)
					&& (oNodePair.FindPatternNode.IsOptionalNode))
				{
					//******************************************************
					// Found a node pair that is a child of the given
					// oParentNodePair and has an optional FindPatternNode.
					// So pop items from the stack until this node pair is
					// popped, and then return this node pair.
					//
					// This restores the stack to the same state as when
					// this node pair was matched, but this time we can skip
					// the optional node and attempt to continue the match.

					ClearNodePairFromStack(oNodePair);

					Debug.WriteLineIf(VerboseDebugging,
						"Backtracking to optional node....");

					return oNodePair;
				}
				--iIndex;
			}

			//**************************************************************
			// The stack does not contain a child of the oParentNodePair
			// with an optional FindPatternNode, so return null.

			Debug.WriteLineIf(VerboseDebugging,
				"Backtracking... cannot find an optional child of "
				+ oParentNodePair.ToString() + " on the stack.");

			return null;
		}
		#endregion
		//******************************************************************
		#region [SkipOptionalNode() Method]
		//******************************************************************
		/// <summary>
		/// Returns a new node pair containing the same ParseTreeNode as the
		/// given oNodePair and the next sibling of the FindPatternNode from
		/// the given oNodePair. (The given oNodePair.FindPatternNode must
		/// be an optional node, so by moving to its next sibling we skip
		/// the optional node.)
		/// </summary>
		private SyntaxNodePair SkipOptionalNode(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);
			Debug.Assert(oNodePair.FindPatternNode != null);
			Debug.Assert(oNodePair.FindPatternNode.IsOptionalNode);
			Debug.Assert(oNodePair.FindPatternNode != FindPatternRoot);

			SyntaxNodePair oNextNodePair = new SyntaxNodePair();
			oNextNodePair.ParseTreeNode
				= oNodePair.ParseTreeNode;
			oNextNodePair.FindPatternNode
				= oNodePair.FindPatternNode.NextSibling;

			Debug.WriteLineIf(VerboseDebugging,
				"Skipping optional node....");

			return oNextNodePair;
		}
		#endregion
		//******************************************************************
		#region [ClearNodePairFromStack() Method]
		//******************************************************************
		/// <summary>
		/// Pops node pairs from the MatchingNodes stack until the indicated
		/// node pair (oNodePair) has been popped. (The indicated node pair
		/// must exist on the stack.)
		/// </summary>
		private void ClearNodePairFromStack(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);
			Debug.Assert(oNodePair.ParseTreeNode != null);
			Debug.Assert(oNodePair.FindPatternNode != null);

			while (MatchingNodes.Count > 0)
			{
				SyntaxNodePair oStackPair = MatchingNodes.Pop();
				if (oStackPair == oNodePair)
				{
					return;
				}
			}
			Debug.Fail("Node pair not found in MatchingNodes stack.");
		}
		#endregion
		//******************************************************************
		#region [FeaturesMatch() Method]
		//******************************************************************
		/// <summary>
		/// Compares the ParseTreeNode and the FindPatternNode specified by
		/// the given oNodePair. If both nodes are not null, the node
		/// features are compared, and true is returned if the ParseTreeNode
		/// has a matching feature value for each feature in the
		/// FindPatternNode.Features collection. Otherwise, false is
		/// returned.
		/// </summary>
		private bool FeaturesMatch(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);

			//**************************************************************
			// For verbose debugging output, determine if the parse-tree
			// node is a syntax leaf.

			string sPair = "Node pair";
			if (VerboseDebugging)
			{
				if (oNodePair.ParseTreeNode != null)
				{
					if (oNodePair.ParseTreeNode.IsSyntaxLeaf)
					{
						sPair = "Leaf pair";
					}
				}
			}

			//**************************************************************
			// Return false if either node in the node pair is null.

			if ((oNodePair.ParseTreeNode == null)
				|| (oNodePair.FindPatternNode == null))
			{
				Debug.WriteLineIf(VerboseDebugging,
					sPair + " does not match: "
					+ oNodePair.ToString() + ".");

				return false;
			}

			//**************************************************************
			// For each feature in the find-pattern node (except for the
			// node label), check if the parse-tree node has a matching
			// value for that feature.

			foreach (SyntaxFeature oFeature in
				oNodePair.FindPatternNode.Features)
			{
				if (oFeature.Name != TreeTranEngineString.NodeLabel)
				{
					//******************************************************
					// Return false if the parse-tree feature does not have
					// a matching value.
					//
					// Note: If the parse-tree node does not have a feature
					// with the same name, the default feature value is
					// used: an empty string (""). Because of this, we can
					// check if a feature matches a pattern like "!xxx", and
					// the match will succeed if (1) the parse-tree node has
					// that feature with any value other than "xxx" or (2)
					// the parse-tree node does not have that feature.

					string sString =
						oNodePair.ParseTreeNode.Features[oFeature.Name];
					string sPattern = oFeature.Value;
					if (! StringMatchesPattern(sString,sPattern))
					{
						Debug.WriteLineIf(VerboseDebugging,
							sPair + " does not match: "
							+ oNodePair.ToString() + " "
							+ oFeature.Name + " = "
							+ "\"" + sString + "\" vs "
							+ "\"" + sPattern + "\".");

						return false;
					}
				}
			}

			//**************************************************************
			// Return true if all of the features matched.

			Debug.WriteLineIf(VerboseDebugging,
				sPair + " matches: " + oNodePair.ToString() + ".");

			return true;
		}
		#endregion
		//******************************************************************
		#region [StringMatchesPattern() Method]
		//******************************************************************
		/// <summary>
		/// Returns true if the given string (sString) matches the indicated
		/// pattern (sPattern). Returns false otherwise. The pattern can
		/// start with a logical-not character ("!") to invert the match
		/// (to be true if the string does NOT match the following pattern,
		/// and false otherwise).
		/// </summary>
		private bool StringMatchesPattern(string sString,string sPattern)
		{
			Debug.Assert(sString != null);
			Debug.Assert(sPattern != null);
			Debug.Assert(TreeTranEngineString.NotCharacter.Length == 1);
			Debug.Assert(TreeTranEngineString.EscapeCharacter.Length == 1);

			//**************************************************************
			// BUGBUG: We may need to expand string matches:
			//
			// (1) to match features (or substrings) from another node using
			//     a path <../DP/NP/featurename>.
			//
			// (2) to support alternate values (like "DP|NP|VP") or more
			//     complex regular expressions.

			//**************************************************************
			// If the pattern starts with a logical-not character ("!"), the
			// match is inverted. Strip the first character off the pattern.
			// Then compare the string to the pattern. Return true if they
			// do NOT match and false otherwise.

			if (sPattern.StartsWith(TreeTranEngineString.NotCharacter))
			{
				sPattern = sPattern.Substring(1);
				if (sString == sPattern)
				{
					return false;
				}
				return true;
			}

			//**************************************************************
			// If the pattern starts with an excape character ("\"), strip
			// the first character off the pattern.

			if (sPattern.StartsWith(TreeTranEngineString.EscapeCharacter))
			{
				sPattern = sPattern.Substring(1);
			}

			//**************************************************************
			// Compare the string to the pattern. Return true if they match
			// and false otherwise.

			if (sString == sPattern)
			{
				return true;
			}
			return false;
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
