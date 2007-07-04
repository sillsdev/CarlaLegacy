//**************************************************************************
// File: "TreeTran\ReplaceAlgorithm.cs".
//
// This file defines the ReplaceAlgorithm class, which implements an
// algorithm to replace a branch of the parse tree, using the
// replace-pattern tree and the list of matching nodes.
//
// History:
//     2007-Feb-16 David Bullock: Code complete (except feature paths).
//**************************************************************************
using System;
using System.Collections;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements an algorithm to replace a branch of the parse tree,
	/// using the replace-pattern tree and the list of matching nodes.
	/// </summary>
	internal class ReplaceAlgorithm
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
		/// Initializes a new instance of the ReplaceAlgorithm class, which
		/// will access the tree data through the given TreeTransfer object.
		/// </summary>
		public ReplaceAlgorithm(TreeTransfer oTreeTransfer)
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
		/// Gets the ReplacePatternRoot property of the TreeTransfer object.
		/// </summary>
		private SyntaxNode ReplacePatternRoot
		{
			get
			{
				return moTreeTransfer.ReplacePatternRoot;
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
			Debug.WriteLineIf(VerboseDebugging,
				"ReplaceAlgorithm.ReplaceCurrentMatchingBranch() called.");

			//**************************************************************
			// Validate the current state.

			if (ParseTreeRoot == null)
			{
				string sMessage = "ReplaceCurrentMatchingBranch() "
					+ "called with an invalid state: "
					+ "ParseTreeRoot is null.";
				throw new Exception(sMessage);
			}

			if (MatchingNodes.Count < 1)
			{
				string sMessage = "ReplaceCurrentMatchingBranch() "
					+ "called with an invalid state: "
					+ "MatchingNodes is empty.";
				throw new Exception(sMessage);
			}

			foreach (SyntaxNodePair oNodePair in MatchingNodes)
			{
				if (oNodePair.ParseTreeNode == null)
				{
					string sMessage = "ReplaceCurrentMatchingBranch() "
						+ "called with an invalid state: "
						+ "MatchingNodes contains an item where "
						+ ".ParseTreeNode is null.";
					throw new Exception(sMessage);
				}
				if (oNodePair.FindPatternNode == null)
				{
					string sMessage = "ReplaceCurrentMatchingBranch() "
						+ "called with an invalid state: "
						+ "MatchingNodes contains an item where "
						+ ".FindPatternNode is null.";
					throw new Exception(sMessage);
				}
			}

			if (ReplacedNodes.Count > 0)
			{
				string sMessage = "ReplaceCurrentMatchingBranch() "
					+ "called with an invalid state: "
					+ "ReplacedNodes is not empty.";
				throw new Exception(sMessage);
			}

			if (CurrentParseTreeNode == null)
			{
				string sMessage = "ReplaceCurrentMatchingBranch() "
					+ "called with an invalid state: "
					+ "CurrentParseTreeNode is null.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Clear the ReplacedNodes list.

			ReplacedNodes.Clear();

			//**************************************************************
			// If ReplacePatternRoot is null, use an empty SyntaxNode (one
			// with no features and no children) instead.

			SyntaxNode oReplacePatternRoot = ReplacePatternRoot;
			if (oReplacePatternRoot == null)
			{
				oReplacePatternRoot = new SyntaxNode();
			}

			//**************************************************************
			// Use the oReplacePatternRoot and the MatchingNodes list to
			// create a new branch to replace the CurrentParseTreeNode.

			SyntaxNode oNewBranch =
				CopyNodeAndChildren(oReplacePatternRoot);

			//**************************************************************
			// BUGBUG: We may need to make another pass through the new
			// branch to:
			//
			// (1) copy features (or substrings) from another node using a
			//     path <../DP/NP/featurename>.
			//
			// (2) recompute any feature values after other features have
			//     changed (like changes to the word string because
			//     morphology strings have changed).

			//**************************************************************
			// If the new branch is null, use an empty SyntaxNode (one with
			// no features and no children) instead, and add this to the
			// ReplacedNodes list.

			if (oNewBranch == null)
			{
				oNewBranch = new SyntaxNode();
				SyntaxNodeTriple oNodeTriple = new SyntaxNodeTriple();
				oNodeTriple.ParseTreeNode = oNewBranch;
				oNodeTriple.FindPatternNode = null;
				oNodeTriple.ReplacePatternNode = new SyntaxNode();
				ReplacedNodes.Push(oNodeTriple);
			}

			Debug.Assert(ReplacedNodes.Count > 0);

			//**************************************************************
			// If the CurrentParseTreeNode has a parent node, find its
			// index in the parent's ChildNodes collection, and replace the
			// child at that index with the new branch.

			SyntaxNode oParent = CurrentParseTreeNode.ParentNode;
			if (oParent != null)
			{
				int iIndex
					= oParent.ChildNodes.IndexOf(CurrentParseTreeNode);
				oParent.ChildNodes.Insert(iIndex,oNewBranch);
				oParent.ChildNodes.Remove(CurrentParseTreeNode);
			}

			//**************************************************************
			// If the CurrentParseTreeNode is the same as the ParseTreeRoot,
			// replace the ParseTreeRoot with the new branch.

			if (CurrentParseTreeNode == ParseTreeRoot)
			{
				ParseTreeRoot = oNewBranch;
			}

			//**************************************************************
			// Set CurrentParseTreeNode to the new branch.

			CurrentParseTreeNode = oNewBranch;

			//**************************************************************
			// Dump the ReplacedNodes list for verbose debugging.

			if (VerboseDebugging)
			{
				foreach (SyntaxNodeTriple oNodeTriple in ReplacedNodes)
				{
					Debug.Assert(oNodeTriple.ParseTreeNode != null);
					Debug.Assert(oNodeTriple.ReplacePatternNode != null);
				}

				Debug.WriteLine("ReplacedNodes: "
					+ ReplacedNodes.ToString() + ".");
			}

			Debug.WriteLineIf(VerboseDebugging,
				"ReplaceAlgorithm.ReplaceCurrentMatchingBranch() returns.");
		}
		#endregion
		//******************************************************************
		#region [CopyNodeAndChildren() Method]
		//******************************************************************
		/// <summary>
		/// For the given oReplacePatternNode, this method finds the
		/// corresponding find-pattern node and the parse-tree node it
		/// matched. (The parse-tree node must be in the branch indicated by
		/// oMorphologyParseRoot if this optional argument is not null.) A
		/// new node is created by copying features from the parse-tree node
		/// and merging features from the oReplacePatternNode. Then children
		/// are copied recursively either from the parse-tree node or from
		/// the oReplacePatternNode. Returns null if the oReplacePatternNode
		/// was optional and the parse-tree node was not found. Otherwise,
		/// returns the new node after adding it to the ReplacedNodes list.
		/// (Note that this method calls the CopyLeafAndChildren() method if
		/// it determines that the node is a leaf node.)
		/// </summary>
		SyntaxNode CopyNodeAndChildren(SyntaxNode oReplacePatternNode)
		{
			return CopyNodeAndChildren(oReplacePatternNode,null);
		}
		//******************************************************************
		/// <summary>
		/// For the given oReplacePatternNode, this method finds the
		/// corresponding find-pattern node and the parse-tree node it
		/// matched. (The parse-tree node must be in the branch indicated by
		/// oMorphologyParseRoot if this optional argument is not null.) A
		/// new node is created by copying features from the parse-tree node
		/// and merging features from the oReplacePatternNode. Then children
		/// are copied recursively either from the parse-tree node or from
		/// the oReplacePatternNode. Returns null if the oReplacePatternNode
		/// was optional and the parse-tree node was not found. Otherwise,
		/// returns the new node after adding it to the ReplacedNodes list.
		/// (Note that this method calls the CopyLeafAndChildren() method if
		/// it determines that the node is a leaf node.)
		/// </summary>
		SyntaxNode CopyNodeAndChildren(SyntaxNode oReplacePatternNode,
			SyntaxNode oMorphologyParseRoot)
		{
			Debug.Assert(oReplacePatternNode != null);

			//**************************************************************
			// For the given oReplacePatternNode, find the corresponding
			// find-pattern node and the parse-tree node it matched:
			//
			// Search the MatchingNodes list for a node pair where the
			// .FindPatternNode has the same label as the given
			// oReplacePatternNode.
			//
			// If oMorphologyParseRoot is not null, restrict this search to
			// node pairs where the .ParseTreeNode is contained in the
			// branch dominated by this oMorphologyParseRoot.
			//
			// If a matching node pair is found, set oParseTreeNode and
			// oFindPatternNode to the node-pair values. Otherwise, set
			// oParseTreeNode and oFindPatternNode both to null.

			SyntaxNode oParseTreeNode = null;
			SyntaxNode oFindPatternNode = null;
			SyntaxNodePair oNodePair = FindMatchingPairFromLabel(
				oReplacePatternNode.Label,oMorphologyParseRoot);
			if (oNodePair != null)
			{
				oParseTreeNode = oNodePair.ParseTreeNode;
				oFindPatternNode = oNodePair.FindPatternNode;
			}

			//**************************************************************
			// If a matching node pair was not found and oReplacePatternNode
			// is optional, nothing will be copied, so return null.

			if ((oNodePair == null) && (oReplacePatternNode.IsOptionalNode))
			{
				return null;
			}

			//**************************************************************
			// If this is a leaf node, call CopyLeafAndChildren() instead.
			//
			// Each child of a syntax leaf is the root of a morphology
			// parse. (A syntax leaf may have one or more alternative
			// morphology parses.) CopyLeafAndChildren() is called because
			// a different algorithm is needed to copy these children.

			bool bIsSyntaxLeaf = false;
			if (oParseTreeNode != null)
			{
				if (oParseTreeNode.IsSyntaxLeaf)
				{
					bIsSyntaxLeaf = true;
				}
			}
			if (oReplacePatternNode.IsSyntaxLeaf)
			{
				bIsSyntaxLeaf = true;
			}
			if (bIsSyntaxLeaf)
			{
				return CopyLeafAndChildren(oReplacePatternNode);
			}

			//**************************************************************
			// Create a new parse-tree node by copying the features from the
			// matching oParseTreeNode (if found) and then merging the
			// features from oReplacePatternNode.

			if (VerboseDebugging)
			{
				string sParseString = "null";
				if (oParseTreeNode != null)
				{
					sParseString = oParseTreeNode.ToString();
				}
				string sReplaceString = "null";
				if (oReplacePatternNode != null)
				{
					sReplaceString = oReplacePatternNode.ToString();
				}
				Debug.WriteLine("Copying node: CopyFeatures("
					+ sParseString + "," + sReplaceString + ").");
			}

			SyntaxNode oNewNode
				= CopyFeatures(oParseTreeNode,oReplacePatternNode);

			//**************************************************************
			// Check if any children are specified by oFindPatternNode or
			// oReplacePatternNode.

			bool bFindPatternHasChildren = false;
			if (oFindPatternNode != null)
			{
				if (oFindPatternNode.ChildNodes.Count > 0)
				{
					bFindPatternHasChildren = true;
				}
			}
			bool bReplacePatternHasChildren = false;
			if (oReplacePatternNode.ChildNodes.Count > 0)
			{
				bReplacePatternHasChildren = true;
			}

			//**************************************************************
			// Copy children either from the matching oParseTreeNode or from
			// the oReplacePatternNode:
			//
			// If oParseTreeNode is not null and no children are specified
			// by oFindPatternNode or oReplacePatternNode, copy the
			// oParseTreeNode children.
			//
			// Otherwise, copy the oReplacePatternNode children.

			if ((oParseTreeNode != null) && (! bFindPatternHasChildren)
				&& (! bReplacePatternHasChildren))
			{
				//**********************************************************
				// Copy the oParseTreeNode children.

				foreach (SyntaxNode oParseChild in
					oParseTreeNode.ChildNodes)
				{
					SyntaxNode oNewChild = oParseChild.CloneBranch();
					oNewNode.ChildNodes.Add(oNewChild);
				}
			}
			else
			{
				//**********************************************************
				// Copy the oReplacePatternNode children.

				foreach (SyntaxNode oReplaceChild in
					oReplacePatternNode.ChildNodes)
				{
					SyntaxNode oNewChild = CopyNodeAndChildren(
						oReplaceChild,oMorphologyParseRoot);
					if (oNewChild != null)
					{
						oNewNode.ChildNodes.Add(oNewChild);
					}
				}
			}

			//**************************************************************
			// Return the new parse-tree node after adding it to the
			// ReplacedNodes list.

			SyntaxNodeTriple oNodeTriple = new SyntaxNodeTriple();
			oNodeTriple.ParseTreeNode = oNewNode;
			oNodeTriple.FindPatternNode = oFindPatternNode;
			oNodeTriple.ReplacePatternNode = oReplacePatternNode;
			ReplacedNodes.Push(oNodeTriple);
			return oNewNode;
		}
		#endregion
		//******************************************************************
		#region [CopyLeafAndChildren() Method]
		//******************************************************************
		/// <summary>
		/// For the given oReplacePatternNode, this method finds the
		/// corresponding find-pattern node and the parse-tree node it
		/// matched. A new node is created by copying features from the
		/// parse-tree node and merging features from the
		/// oReplacePatternNode. Then children are copied recursively from
		/// the parse-tree node. Children are also copied recursively from
		/// the oReplacePatternNode if they do not correspond to children of
		/// the parse-tree node. Returns null if the oReplacePatternNode was
		/// optional and the parse-tree node was not found. Otherwise,
		/// returns the new node after adding it to the ReplacedNodes list.
		/// (Note that this method is only for copying leaf nodes.)
		/// </summary>
		SyntaxNode CopyLeafAndChildren(SyntaxNode oReplacePatternNode)
		{
			Debug.Assert(oReplacePatternNode != null);

			//**************************************************************
			// For the given oReplacePatternNode, find the corresponding
			// find-pattern node and the parse-tree node it matched:
			//
			// Search the MatchingNodes list for a node pair where the
			// .FindPatternNode has the same label as the given
			// oReplacePatternNode.
			//
			// If a matching node pair is found, set oParseTreeNode and
			// oFindPatternNode to the node-pair values. Otherwise, set
			// oParseTreeNode and oFindPatternNode both to null.

			SyntaxNode oParseTreeNode = null;
			SyntaxNode oFindPatternNode = null;
			SyntaxNodePair oNodePair =
				FindMatchingPairFromLabel(oReplacePatternNode.Label);
			if (oNodePair != null)
			{
				oParseTreeNode = oNodePair.ParseTreeNode;
				oFindPatternNode = oNodePair.FindPatternNode;
			}

			//**************************************************************
			// If a matching node pair was not found and oReplacePatternNode
			// is optional, nothing will be copied, so return null.

			if ((oNodePair == null) && (oReplacePatternNode.IsOptionalNode))
			{
				return null;
			}

			//**************************************************************
			// This method should only be called for leaf nodes.

			if (oParseTreeNode != null)
			{
				Debug.Assert(oParseTreeNode.IsSyntaxLeaf
					|| oReplacePatternNode.IsSyntaxLeaf);
			}
			else
			{
				Debug.Assert(oReplacePatternNode.IsSyntaxLeaf);
			}

			//**************************************************************
			// Create a new parse-tree node by copying the features from the
			// matching oParseTreeNode (if found) and then merging the
			// features from oReplacePatternNode.

			if (VerboseDebugging)
			{
				string sParseString = "null";
				if (oParseTreeNode != null)
				{
					sParseString = oParseTreeNode.ToString();
				}
				string sReplaceString = "null";
				if (oReplacePatternNode != null)
				{
					sReplaceString = oReplacePatternNode.ToString();
				}
				Debug.WriteLine("Copying leaf: CopyFeatures("
					+ sParseString + "," + sReplaceString + ").");
			}

			SyntaxNode oNewNode
				= CopyFeatures(oParseTreeNode,oReplacePatternNode);

			//**************************************************************
			// Each child of a syntax leaf is the root of a morphology
			// parse. (A syntax leaf may have one or more alternative
			// morphology parses.)
			//
			// Each child will be copied recursively from oParseTreeNode.
			// Additional children will also be copied recursively from
			// oReplacePatternNode if they do not correspond to children of
			// oParseTreeNode.
			//
			// Create a list to keep track of the oReplacePatternNode
			// children as they are used. (A replace-pattern child is marked
			// as used if it has the same label as a find-pattern child
			// matching one of the oParseTreeNode children.)

			ArrayList oUsedReplaceChildren = new ArrayList();

			//**************************************************************
			// Copy the oParseTreeNode children.

			if (oParseTreeNode != null)
			{
				foreach (SyntaxNode oParseChild in
					oParseTreeNode.ChildNodes)
				{
					//******************************************************
					// Look for the find-pattern node that matched this
					// parse-tree child:
					//
					// Search the MatchingNodes list for a node pair where
					// the .ParseTreeNode is the same as oParseChild.
					//
					// If found, set oFindChild to the .FindPatternNode
					// value from the node pair. Otherwise, set oFindChild
					// to null.

					SyntaxNodePair oChildNodePair
						= FindMatchingPairFromNode(oParseChild);
					SyntaxNode oFindChild = null;
					if (oChildNodePair != null)
					{
						oFindChild = oChildNodePair.FindPatternNode;
					}

					//******************************************************
					// If oFindChild is null (no find-pattern matched
					// this parse-tree child), copy oParseChild.
					//
					// Otherwise, copy each oReplacePatternNode child that
					// has the same label as oFindChild.

					if (oFindChild == null)
					{
						//**************************************************
						// Copy oParseChild.

						SyntaxNode oNewChild = oParseChild.CloneBranch();
						oNewNode.ChildNodes.Add(oNewChild);
					}
					else
					{
						//**************************************************
						// Copy each oReplacePatternNode child that has the
						// same label as oFindChild.

						foreach (SyntaxNode oReplaceChild in
							oReplacePatternNode.ChildNodes)
						{
							if (oReplaceChild.Label == oFindChild.Label)
							{
								//******************************************
								// Copy the oReplacePatternNode child.
								//
								// Since oParseTreeNode is a syntax leaf,
								// each of its children is the root of a
								// morphology parse. So oParseChild is used
								// as the oMorphologyParseRoot argument to
								// the CopyNodeAndChildren() method.

								SyntaxNode oNewChild = CopyNodeAndChildren(
									oReplaceChild,oParseChild);
								if (oNewChild != null)
								{
									oNewNode.ChildNodes.Add(oNewChild);
								}

								//******************************************
								// Add this oReplaceChild to the list of
								// oUsedReplaceChildren (if not already
								// there).

								if (! oUsedReplaceChildren
									.Contains(oReplaceChild))
								{
									oUsedReplaceChildren.Add(oReplaceChild);
								}
							}
						}
					}
				}
			}

			//**************************************************************
			// Copy any oReplacePatternNode children that have not yet been
			// used.

			foreach (SyntaxNode oReplaceChild in
				oReplacePatternNode.ChildNodes)
			{
				if (! oUsedReplaceChildren.Contains(oReplaceChild))
				{
					SyntaxNode oNewChild =
						CopyNodeAndChildren(oReplaceChild);
					if (oNewChild != null)
					{
						oNewNode.ChildNodes.Add(oNewChild);
					}
				}
			}

			//**************************************************************
			// Return the new parse-tree node after adding it to the
			// ReplacedNodes list.

			SyntaxNodeTriple oNodeTriple = new SyntaxNodeTriple();
			oNodeTriple.ParseTreeNode = oNewNode;
			oNodeTriple.FindPatternNode = oFindPatternNode;
			oNodeTriple.ReplacePatternNode = oReplacePatternNode;
			ReplacedNodes.Push(oNodeTriple);
			return oNewNode;
		}
		#endregion
		//******************************************************************
		#region [CopyFeatures() Method]
		//******************************************************************
		/// <summary>
		/// Creates a new parse-tree node. Features are copied from the
		/// given oParseTreeNode (if not null). Then features are merged
		/// from the given oReplacePatternNode (if not null). Returns the
		/// new parse-tree node.
		/// </summary>
		private SyntaxNode CopyFeatures(SyntaxNode oParseTreeNode,
			SyntaxNode oReplacePatternNode)
		{
			Debug.Assert((oParseTreeNode != null)
				|| (oReplacePatternNode != null));

			//**************************************************************
			// Create a new SyntaxNode.

			SyntaxNode oNewNode = new SyntaxNode();

			//**************************************************************
			// Copy all the features from oParseTreeNode (if not null).

			if (oParseTreeNode != null)
			{
				foreach (SyntaxFeature oFeature in oParseTreeNode.Features)
				{
					oNewNode.Features[oFeature.Name] = oFeature.Value;
				}
			}

			//**************************************************************
			// Merge the features from oReplacePatternNode (if not null):
			//
			// Copy each feature from oReplacePatternNode, except for the
			// node-label feature. (Copied features will replace existing
			// features with the same name.)
			//
			// If a feature from oReplacePatternNode has the delete-feature
			// string for its value, delete the feature from the new node.

			if (oReplacePatternNode != null)
			{
				foreach (SyntaxFeature oFeature in
					oReplacePatternNode.Features)
				{
					if (oFeature.Name != TreeTranEngineString.NodeLabel)
					{
						oNewNode.Features[oFeature.Name] = oFeature.Value;
					}
					if (oFeature.Value
						== TreeTranEngineString.DeleteFeature)
					{
						oNewNode.Features.Remove(oFeature.Name);
					}
				}
			}

			//**************************************************************
			// Return the new SyntaxNode.

			return oNewNode;
		}
		#endregion
		//******************************************************************
		#region [FindMatchingPairFromLabel() Method]
		//******************************************************************
		/// <summary>
		/// Searches the MatchingNodes list for a node pair where the
		/// .FindPatternNode label matches the given sLabel string. If the
		/// optional oMorphologyParseRoot argument is not null, the search
		/// is restricted to node pairs where the .ParseTreeNode is
		/// contained in the branch dominated by the oMorphologyParseRoot
		/// node. Returns the first matching node pair, if a match is found.
		/// Returns null otherwise.
		/// </summary>
		private SyntaxNodePair FindMatchingPairFromLabel(string sLabel)
		{
			return FindMatchingPairFromLabel(sLabel,null);
		}
		//******************************************************************
		/// <summary>
		/// Searches the MatchingNodes list for a node pair where the
		/// .FindPatternNode label matches the given sLabel string. If the
		/// optional oMorphologyParseRoot argument is not null, the search
		/// is restricted to node pairs where the .ParseTreeNode is
		/// contained in the branch dominated by the oMorphologyParseRoot
		/// node. Returns the first matching node pair, if a match is found.
		/// Returns null otherwise.
		/// </summary>
		private SyntaxNodePair FindMatchingPairFromLabel(string sLabel,
			SyntaxNode oMorphologyParseRoot)
		{
			Debug.Assert(sLabel != null);

			//**************************************************************
			// Check if a oMorphologyParseRoot is specified.

			if (oMorphologyParseRoot != null)
			{
				//**********************************************************
				// If a oMorphologyParseRoot is specified, search the
				// MatchingNodes list for a node pair where the
				// .FindPatternNode label matches the sLabel string and the
				// .ParseTreeNode is contained in the parse-tree branch
				// dominated by oMorphologyParseRoot. Return the (first)
				// matching node pair if found.

				foreach (SyntaxNodePair oPair in MatchingNodes)
				{
					Debug.Assert(oPair.ParseTreeNode != null);
					Debug.Assert(oPair.FindPatternNode != null);

					if (oPair.FindPatternNode.Label == sLabel)
					{
						if (BranchContainsNode(oMorphologyParseRoot,
							oPair.ParseTreeNode))
						{
							return oPair;
						}
					}
				}
			}
			else
			{
				//**********************************************************
				// Otherwise, search the MatchingNodes list for any node
				// pair where the .FindPatternNode label matches the sLabel
				// string. Return the (first) matching node pair if found.

				foreach (SyntaxNodePair oPair in MatchingNodes)
				{
					Debug.Assert(oPair.ParseTreeNode != null);
					Debug.Assert(oPair.FindPatternNode != null);

					if (oPair.FindPatternNode.Label == sLabel)
					{
						return oPair;
					}
				}
			}

			//**************************************************************
			// Return null if a match was not found.

			return null;
		}
		//******************************************************************
		/// <summary>
		/// Returns true if the indicated tree branch (dominated by oBranch)
		/// contains the given node (oNode). Returns false otherwise.
		/// </summary>
		private bool BranchContainsNode(SyntaxNode oBranch,SyntaxNode oNode)
		{
			Debug.Assert(oBranch != null);
			Debug.Assert(oNode != null);

			//**************************************************************
			// Search the branch recursively.

			if (oBranch == oNode)
			{
				return true;
			}
			foreach (SyntaxNode oChildBranch in oBranch.ChildNodes)
			{
				if (BranchContainsNode(oChildBranch,oNode))
				{
					return true;
				}
			}
			return false;
		}
		#endregion
		//******************************************************************
		#region [FindMatchingPairFromNode() Method]
		//******************************************************************
		/// <summary>
		/// Searches the MatchingNodes list for a node pair where the
		/// .ParseTreeNode is the same as the given oParseTreeNode. Returns
		/// the first matching node pair, if a match is found. Returns null
		/// otherwise.
		/// </summary>
		private SyntaxNodePair FindMatchingPairFromNode(
			SyntaxNode oParseTreeNode)
		{
			Debug.Assert(oParseTreeNode != null);

			//**************************************************************
			// Search the MatchingNodes list for a node pair where the
			// .ParseTreeNode is the same as the given oParseTreeNode.
			// Return the (first) matching node pair if found.

			foreach (SyntaxNodePair oPair in MatchingNodes)
			{
				Debug.Assert(oPair.ParseTreeNode != null);
				Debug.Assert(oPair.FindPatternNode != null);

				if (oPair.ParseTreeNode == oParseTreeNode)
				{
					return oPair;
				}
			}

			//**************************************************************
			// Return null if a match was not found.

			return null;
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
