//**************************************************************************
// File: "TreeTran\SyntaxNode.cs".
//
// This file defines the SyntaxNode class, which represents a node in a
// parse tree.
//
// History:
//     2005-Aug-17 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Represents a node in a parse tree.
	/// </summary>
	public class SyntaxNode
	{
		//******************************************************************
		#region [ParentNode Property]
		//******************************************************************
		/// <summary>
		/// The ParentNode property value.
		/// </summary>
		private SyntaxNode moParentNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the parent of this node. This value is null if the
		/// node does not have a parent. A node's ParentNode property is
		/// automatically set when the node is added to the ChildNodes
		/// collection of another node.
		/// </summary>
		public SyntaxNode ParentNode
		{
			set
			{
				SyntaxNode oParentNode = value;

				//**********************************************************
				// Validate the given parent node.

				if (oParentNode != null)
				{
					if (! oParentNode.ChildNodes.Contains(this))
					{
						string sMessage = "Invalid argument: "
							+ "SyntaxNode.ParentNode can only be set if "
							+ "the indicated parent node contains this "
							+ "child node in its ChildNodes collection.";
						throw new Exception(sMessage);
					}
				}

				//**********************************************************
				// Set the parent node.

				moParentNode = oParentNode;
			}
			get
			{
				return moParentNode;
			}
		}
		#endregion
		//******************************************************************
		#region [ChildNodes Property]
		//******************************************************************
		/// <summary>
		/// The ChildNodes property value.
		/// </summary>
		private SyntaxNodeCollection moChildNodes = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of all child nodes immediately dominated by
		/// this node.
		/// </summary>
		public SyntaxNodeCollection ChildNodes
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moChildNodes == null)
				{
					moChildNodes = new SyntaxNodeCollection(this);
				}

				//**********************************************************
				// Return the collection.

				return moChildNodes;
			}
		}
		#endregion
		//******************************************************************
		#region [FirstChild and LastChild Properties]
		//******************************************************************
		/// <summary>
		/// Gets the first child of this node. This value is null if the
		/// node does not have children.
		/// </summary>
		public SyntaxNode FirstChild
		{
			get
			{
				SyntaxNode oFirstChild = null;
				if (ChildNodes.Count > 0)
				{
					oFirstChild = ChildNodes[0];
				}
				return oFirstChild;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the last child of this node. This value is null if the node
		/// does not have children.
		/// </summary>
		public SyntaxNode LastChild
		{
			get
			{
				SyntaxNode oLastChild = null;
				if (ChildNodes.Count > 0)
				{
					oLastChild = ChildNodes[ChildNodes.Count - 1];
				}
				return oLastChild;
			}
		}
		#endregion
		//******************************************************************
		#region [PreviousSibling and NextSibling Properties]
		//******************************************************************
		/// <summary>
		/// Gets the previous sibling of this node. This value is null if
		/// the node does not have a previous sibling.
		/// </summary>
		public SyntaxNode PreviousSibling
		{
			get
			{
				SyntaxNode oPreviousSibling = null;
				if (ParentNode != null)
				{
					int iIndex = ParentNode.ChildNodes.IndexOf(this);
					--iIndex;
					if ((iIndex >= 0)
						&& (iIndex < ParentNode.ChildNodes.Count))
					{
						oPreviousSibling = ParentNode.ChildNodes[iIndex];
					}
				}
				return oPreviousSibling;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the next sibling of this node. This value is null if the
		/// node does not have a next sibling.
		/// </summary>
		public SyntaxNode NextSibling
		{
			get
			{
				SyntaxNode oNextSibling = null;
				if (ParentNode != null)
				{
					int iIndex = ParentNode.ChildNodes.IndexOf(this);
					++iIndex;
					if ((iIndex >= 0)
						&& (iIndex < ParentNode.ChildNodes.Count))
					{
						oNextSibling = ParentNode.ChildNodes[iIndex];
					}
				}
				return oNextSibling;
			}
		}
		#endregion
		//******************************************************************
		#region [Features Property]
		//******************************************************************
		/// <summary>
		/// The Features property value.
		/// </summary>
		private SyntaxFeatureCollection moFeatures = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of features for this node. In this
		/// collection, each feature name is set to a string value (for
		/// example, Features["name"] = "value").
		/// </summary>
		public SyntaxFeatureCollection Features
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moFeatures == null)
				{
					moFeatures = new SyntaxFeatureCollection();
				}

				//**********************************************************
				// Return the collection.

				return moFeatures;
			}
		}
		#endregion
		//******************************************************************
		#region [Label and Category Properties]
		//******************************************************************
		/// <summary>
		/// Gets the value of the node's label feature ("node:label"). If
		/// this feature does not exist, the node's category feature is
		/// returned instead.
		/// </summary>
		public string Label
		{
			get
			{
				//**********************************************************
				// Get the value of the node's label feature.

				string sLabel = Features[TreeTranEngineString.NodeLabel];

				//**********************************************************
				// If the node's label feature does not exist (or is blank),
				// get the node's category feature instead.

				if (sLabel == "")
				{
					sLabel = Category;
				}

				//**********************************************************
				// Return the value.

				return sLabel;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the value of the node's category feature ("cat" or "mcat")
		/// or an empty string ("") if the feature does not exist.
		/// </summary>
		public string Category
		{
			get
			{
				//**********************************************************
				// Get the value of the node's "cat" (syntax category)
				// feature.

				Debug.Assert(TreeTranEngineString.SyntaxCategory
					== ParseXml.CatElement);

				string sCategory =
					Features[TreeTranEngineString.SyntaxCategory];

				//**********************************************************
				// If the "cat" feature does not exist (or is blank), get
				// the value of the node's "mcat" (morpheme category)
				// feature instead.

				Debug.Assert(TreeTranEngineString.MorphemeCategory
					== ParseXml.McatElement);

				if (sCategory == "")
				{
					sCategory =
						Features[TreeTranEngineString.MorphemeCategory];
				}

				//**********************************************************
				// Return the value.

				return sCategory;
			}
		}
		#endregion
		//******************************************************************
		#region [IsSyntaxLeaf Property]
		//******************************************************************
		/// <summary>
		/// Returns true if the node is a syntax leaf. Returns false
		/// otherwise. A syntax leaf is indicated by a "leaf" value for the
		/// node-type feature ("node:type").
		/// </summary>
		public bool IsSyntaxLeaf
		{
			get
			{
				if (Features[TreeTranEngineString.NodeType]
					== TreeTranEngineString.SyntaxLeaf)
				{
					return true;
				}
				return false;
			}
		}
		#endregion
		//******************************************************************
		#region [IsOptionalNode Property]
		//******************************************************************
		/// <summary>
		/// Returns true if the node is optional. Returns false otherwise.
		/// An optional node is indicated by a node label that starts with
		/// a left-parenthesis character (for example: "(NP#1)").
		/// </summary>
		public bool IsOptionalNode
		{
			get
			{
				if (Label.StartsWith(TreeTranEngineString.LeftParenthesis))
				{
					return true;
				}
				return false;
			}
		}
		#endregion
		//******************************************************************
		#region [CloneNode() and CloneBranch() Methods]
		//******************************************************************
		/// <summary>
		/// Returns a new SyntaxNode with a copy of all the Features from
		/// this node. (The new node will have a null ParentNode and an
		/// empty ChildNodes collection.)
		/// </summary>
		public SyntaxNode CloneNode()
		{
			SyntaxNode oNode = new SyntaxNode();
			foreach (SyntaxFeature oFeature in Features)
			{
				oNode.Features[oFeature.Name] = oFeature.Value;
			}
			return oNode;
		}
		//******************************************************************
		/// <summary>
		/// Does a recursive copy of the sub-tree dominated by this node,
		/// copying all Features and recursively copying all ChildNodes from
		/// the original sub-tree. Returns the new SyntaxNode that dominates
		/// the duplicate sub-tree. (The returned node will have a null
		/// ParentNode.)
		/// </summary>
		public SyntaxNode CloneBranch()
		{
			SyntaxNode oNode = CloneNode();
			foreach (SyntaxNode oChild in ChildNodes)
			{
				oNode.ChildNodes.Add(oChild.CloneBranch());
			}
			return oNode;
		}
		#endregion
		//******************************************************************
		#region [ToString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string representing the node.
		/// </summary>
		public override string ToString()
		{
			string sLabelString = "null";
			if (Label != null)
			{
				sLabelString = Label;
			}
			return sLabelString;
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
