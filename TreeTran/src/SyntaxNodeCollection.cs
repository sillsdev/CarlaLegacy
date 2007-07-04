//**************************************************************************
// File: "TreeTran\SyntaxNodeCollection.cs".
//
// This file defines the SyntaxNodeCollection class, which implements a
// collection of SyntaxNode items.
//
// History:
//     2006-Jul-4 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements a collection of SyntaxNode items.
	/// </summary>
	public class SyntaxNodeCollection: ReadOnlyCollectionBase
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the SyntaxNodeCollection class,
		/// using the indicated oParentNode to set the collection's private
		/// ParentNode property, which will be used to initialize the
		/// ParentNode property of each node that is added to this
		/// collection.
		/// </summary>
		public SyntaxNodeCollection(SyntaxNode oParentNode)
		{
			moParentNode = oParentNode;
		}
		#endregion
		//******************************************************************
		#region [ParentNode Property]
		//******************************************************************
		/// <summary>
		/// The ParentNode property value.
		/// </summary>
		private SyntaxNode moParentNode = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection's ParentNode property, which will be used to
		/// initialize the ParentNode property of each node that is added to
		/// this collection.
		/// </summary>
		private SyntaxNode ParentNode
		{
			get
			{
				return moParentNode;
			}
		}
		#endregion
		//******************************************************************
		#region [Insert() and Add() Methods]
		//******************************************************************
		/// <summary>
		/// Inserts the given node into the collection at the specified
		/// zero-based index, then sets the node's ParentNode property.
		/// </summary>
		public void Insert(int iIndex,SyntaxNode oNode)
		{
			//**************************************************************
			// Validate the parameters.

			Debug.Assert(iIndex >= 0);
			Debug.Assert(iIndex <= InnerList.Count);

			if (oNode == null)
			{
				string sMessage = "Invalid argument: "
					+ "SyntaxNodeCollection cannot insert a null item.";
				throw new Exception(sMessage);
			}
			if (InnerList.Contains(oNode))
			{
				string sMessage = "Invalid argument: "
					+ "SyntaxNodeCollection already contains this item.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Insert the node into the list.

			InnerList.Insert(iIndex,oNode);

			//**************************************************************
			// Set the node's ParentNode property.

			oNode.ParentNode = ParentNode;
		}
		//******************************************************************
		/// <summary>
		/// Adds the given node to the end of the collection, then sets the
		/// node's ParentNode property. Returns the zero-based index of the
		/// added node.
		/// </summary>
		public int Add(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(! InnerList.Contains(oNode));

			int iIndex = Count;
			Insert(iIndex,oNode);
			return iIndex;
		}
		#endregion
		//******************************************************************
		#region [Indexer, Contains() and IndexOf() Methods]
		//******************************************************************
		/// <summary>
		/// Gets the node in the collection at the specified zero-based
		/// index.
		/// </summary>
		public SyntaxNode this[int iIndex]
		{
			get
			{
				Debug.Assert(iIndex >= 0);
				Debug.Assert(iIndex < InnerList.Count);

				return (SyntaxNode) InnerList[iIndex];
			}
		}
		//******************************************************************
		/// <summary>
		/// Returns true if the collection contains the given node. Returns
		/// false otherwise.
		/// </summary>
		public bool Contains(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			return InnerList.Contains(oNode);
		}
		//******************************************************************
		/// <summary>
		/// Searches the collection for the given node. Returns the node's
		/// zero-based index if it was found. Returns -1 otherwise.
		/// </summary>
		public int IndexOf(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			return InnerList.IndexOf(oNode);
		}
		#endregion
		//******************************************************************
		#region [Remove(), RemoveAt() and Clear() Methods]
		//******************************************************************
		/// <summary>
		/// Removes the given node from the collection, after recursively
		/// clearing the children of the removed node.
		/// </summary>
		public void Remove(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(InnerList.Contains(oNode));

			//**************************************************************
			// Recursively clear the children of the indicated node.

			oNode.ChildNodes.Clear();

			//**************************************************************
			// Remove the indicated node.

			InnerList.Remove(oNode);

			//**************************************************************
			// Set the parent of the removed node to null.

			oNode.ParentNode = null;
		}
		//******************************************************************
		/// <summary>
		/// Removes the node at the specified zero-based index in the
		/// collection, after recursively clearing the children of the
		/// removed node.
		/// </summary>
		public void RemoveAt(int iIndex)
		{
			Debug.Assert(iIndex >= 0);
			Debug.Assert(iIndex < InnerList.Count);

			Remove(this[iIndex]);
		}
		//******************************************************************
		/// <summary>
		/// Removes all nodes from the collection, after recursively
		/// clearing the children of each removed node.
		/// </summary>
		public void Clear()
		{
			while (Count > 0)
			{
				RemoveAt(0);
			}
		}
		#endregion
		//******************************************************************
		#region [ToString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string representing the contents of the collection.
		/// </summary>
		public override string ToString()
		{
			string sString = "{";
			int iCount = 0;
			foreach (SyntaxNode oNode in this)
			{
				++iCount;
				if (iCount > 1)
				{
					sString = sString + ",";
				}
				if (oNode == null)
				{
					sString = sString + "null";
				}
				else
				{
					sString = sString + oNode.ToString();
				}
			}
			sString = sString + "}";
			return sString;
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
