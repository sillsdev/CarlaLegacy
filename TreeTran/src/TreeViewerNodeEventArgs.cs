//**************************************************************************
// File: "TreeTran\TreeViewerNodeEventArgs.cs".
//
// This file defines the TreeViewerNodeEventArgs class, which represents
// event data for node-specific events raised by the TreeViewer control.
// This file also defines the TreeViewerNodeEventHandler delegate for
// event-handler methods that pass a TreeViewerNodeEventArgs argument.
//
// History:
//     2006-Jul-19 David Bullock: Code complete.
//**************************************************************************
using System.Diagnostics;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Represents event data for node-specific events raised by the
	/// TreeViewer control.
	/// </summary>
	public class TreeViewerNodeEventArgs: System.EventArgs
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the TreeViewerNodeEventArgs class,
		/// setting the Node property to the given TreeViewerNode. The
		/// Handled property is also initialized to false.
		/// </summary>
		public TreeViewerNodeEventArgs(TreeViewerNode oNode)
		{
			Debug.Assert(oNode != null);

			moNode = oNode;
			mbHandled = false;
		}
		#endregion
		//******************************************************************
		#region [Node Property]
		//******************************************************************
		/// <summary>
		/// The Node property value.
		/// </summary>
		private TreeViewerNode moNode = null;
		//******************************************************************
		/// <summary>
		/// Gets the TreeViewerNode for which the event was raised.
		/// </summary>
		public TreeViewerNode Node
		{
			get
			{
				return moNode;
			}
		}
		#endregion
		//******************************************************************
		#region [Handled Property]
		//******************************************************************
		/// <summary>
		/// The Handled property value.
		/// </summary>
		private bool mbHandled = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets a value indicating whether the event was handled.
		/// This value is initially false. An event handler sets it to true
		/// if the event has been handled, which overrides the default
		/// behavior.
		/// </summary>
		public bool Handled
		{
			set
			{
				mbHandled = value;
			}
			get
			{
				return mbHandled;
			}
		}
		#endregion
		//******************************************************************
	}
	//**********************************************************************
	/// <summary>
	/// Defines the TreeViewerNodeEventHandler delegate for event-handler
	/// methods that pass a TreeViewerNodeEventArgs argument.
	/// </summary>
	public delegate void TreeViewerNodeEventHandler(object oSender,
		TreeViewerNodeEventArgs oArgs);
}
//**************************************************************************
