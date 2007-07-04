//**************************************************************************
// File: "TreeTran\TreeViewerNodeCollection.cs".
//
// This file defines the TreeViewerNodeCollection class, which implements a
// collection of TreeViewerNode items.
//
// History:
//     2006-Aug-16 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Implements a collection of TreeViewerNode items.
	/// </summary>
	public class TreeViewerNodeCollection: ReadOnlyCollectionBase
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the TreeViewerNodeCollection
		/// class, using the indicated oParentNode to set the collection's
		/// private ParentNode property, which will be used to initialize
		/// the ParentNode property of each node that is added to this
		/// collection.
		/// </summary>
		public TreeViewerNodeCollection(TreeViewerNode oParentNode)
		{
			Debug.Assert(oParentNode != null);

			moParentNode = oParentNode;
		}
		#endregion
		//******************************************************************
		#region [ParentNode and ParentTree Properties]
		//******************************************************************
		/// <summary>
		/// The ParentNode property value.
		/// </summary>
		private TreeViewerNode moParentNode = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection's ParentNode property, which will be used to
		/// initialize the ParentNode property of each node that is added to
		/// this collection.
		/// </summary>
		private TreeViewerNode ParentNode
		{
			get
			{
				return moParentNode;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the parent TreeViewer control, which displays each node
		/// that is added to this collection.
		/// </summary>
		private TreeViewer ParentTree
		{
			get
			{
				TreeViewer oParentTree = null;
				if (ParentNode != null)
				{
					if (ParentNode.Parent != null)
					{
						if (ParentNode.Parent is TreeViewer)
						{
							oParentTree = (TreeViewer) ParentNode.Parent;
						}
					}
				}
				return oParentTree;
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
		public void Insert(int iIndex,TreeViewerNode oNode)
		{
			//**************************************************************
			// Validate the parameters.

			Debug.Assert(iIndex >= 0);
			Debug.Assert(iIndex <= InnerList.Count);

			if (oNode == null)
			{
				string sMessage = "Invalid argument: "
					+ "TreeViewerNodeCollection "
					+ "cannot insert a null item.";
				throw new Exception(sMessage);
			}
			if (InnerList.Contains(oNode))
			{
				string sMessage = "Invalid argument: "
					+ "TreeViewerNodeCollection "
					+ "already contains this item.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Call BeginUpdate() to disable redrawing the tree, but not if
			// redrawing was already disabled by the calling code.

			bool bCallEndUpdate = false;
			if (ParentTree != null)
			{
				if (! ParentTree.IsUpdating)
				{
					ParentTree.BeginUpdate();
					bCallEndUpdate = true;
				}
			}

			//**************************************************************
			// Insert the node into the list.

			InnerList.Insert(iIndex,oNode);

			//**************************************************************
			// Set the node's ParentNode property.

			oNode.ParentNode = ParentNode;

			//**************************************************************
			// Position the node at negative coordinates off the screen (so
			// it will not appear until the EndUpdate() call arranges the
			// tree). Then add the node to the TreeViewer container.

			if (ParentTree != null)
			{
				oNode.Left = -oNode.Width;
				oNode.Top = -oNode.Height;
				ParentTree.Controls.Add(oNode);
			}

			//**************************************************************
			// Call EndUpdate() to redraw the tree, but not if redrawing was
			// already disabled by the calling code.

			if (ParentTree != null)
			{
				if (bCallEndUpdate)
				{
					ParentTree.EndUpdate();
				}
			}
		}
		//******************************************************************
		/// <summary>
		/// Adds the given node to the end of the collection, then sets the
		/// node's ParentNode property. Returns the zero-based index of the
		/// added node.
		/// </summary>
		public int Add(TreeViewerNode oNode)
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
		public TreeViewerNode this[int iIndex]
		{
			get
			{
				Debug.Assert(iIndex >= 0);
				Debug.Assert(iIndex < InnerList.Count);

				return (TreeViewerNode) InnerList[iIndex];
			}
		}
		//******************************************************************
		/// <summary>
		/// Returns true if the collection contains the given node. Returns
		/// false otherwise.
		/// </summary>
		public bool Contains(TreeViewerNode oNode)
		{
			Debug.Assert(oNode != null);

			return InnerList.Contains(oNode);
		}
		//******************************************************************
		/// <summary>
		/// Searches the collection for the given node. Returns the node's
		/// zero-based index if it was found. Returns -1 otherwise.
		/// </summary>
		public int IndexOf(TreeViewerNode oNode)
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
		public void Remove(TreeViewerNode oNode)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(InnerList.Contains(oNode));

			//**************************************************************
			// Call BeginUpdate() to disable redrawing the tree, but not if
			// redrawing was already disabled by the calling code.

			bool bCallEndUpdate = false;
			if (ParentTree != null)
			{
				if (! ParentTree.IsUpdating)
				{
					ParentTree.BeginUpdate();
					bCallEndUpdate = true;
				}
			}

			//**************************************************************
			// Recursively clear the children of the indicated node.

			oNode.ChildNodes.Clear();

			//**************************************************************
			// Remove the indicated node from the collection.

			InnerList.Remove(oNode);

			//**************************************************************
			// Set the parent of the removed node to null.

			oNode.ParentNode = null;

			//**************************************************************
			// Remove the indicated node from the TreeViewer container.

			if (ParentTree != null)
			{
				//**********************************************************
				// Determine if the TreeViewer contains input focus.

				bool bContainsFocus = ParentTree.ContainsFocus;

				//**********************************************************
				// Remove the node from the TreeViewer container.

				ParentTree.Controls.Remove(oNode);

				//**********************************************************
				// Set focus to the TreeViewer if it does not contain focus
				// now but it contained focus before the node was removed.
				// (The removed node contained the input focus.)

				if (bContainsFocus)
				{
					if (! ParentTree.ContainsFocus)
					{
						ParentTree.Focus();
					}
				}
			}

			//**************************************************************
			// Call EndUpdate() to redraw the tree, but not if redrawing was
			// already disabled by the calling code.

			if (ParentTree != null)
			{
				if (bCallEndUpdate)
				{
					ParentTree.EndUpdate();
				}
			}
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
			//**************************************************************
			// Call BeginUpdate() to disable redrawing the tree, but not if
			// redrawing was already disabled by the calling code.

			bool bCallEndUpdate = false;
			if (ParentTree != null)
			{
				if (! ParentTree.IsUpdating)
				{
					ParentTree.BeginUpdate();
					bCallEndUpdate = true;
				}
			}

			//**************************************************************
			// Remove each node from the collection.

			while (Count > 0)
			{
				RemoveAt(0);
			}

			//**************************************************************
			// Call EndUpdate() to redraw the tree, but not if redrawing was
			// already disabled by the calling code.

			if (ParentTree != null)
			{
				if (bCallEndUpdate)
				{
					ParentTree.EndUpdate();
				}
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
