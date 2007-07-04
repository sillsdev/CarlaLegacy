//**************************************************************************
// File: "TreeTran\TreeViewerNode.cs".
//
// This file defines the TreeViewerNode class, which represents a node
// displayed in a TreeViewer control.
//
// History:
//     2006-Aug-12 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Represents a node displayed in a TreeViewer control.
	/// </summary>
	public class TreeViewerNode: System.Windows.Forms.UserControl
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		// <summary>
		// Required designer variable.
		// </summary>
		private System.ComponentModel.Container components = null;

		public TreeViewerNode()
		{
			// This call is required by the Windows.Forms Form Designer.
			InitializeComponent();

			// TO DO: Add any initialization after the InitForm call

		}

		// <summary>
		// Clean up any resources being used.
		// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Component Designer generated code
		// <summary>
		// Required method for Designer support - do not modify
		// the contents of this method with the code editor.
		// </summary>
		private void InitializeComponent()
		{
			//
			// TreeViewerNode
			//
			this.Name = "TreeViewerNode";

		}
		#endregion
		#endregion
		//******************************************************************
		#region [ParentTree Property]
		//******************************************************************
		/// <summary>
		/// Gets the parent TreeViewer control that displays this node.
		/// </summary>
		private TreeViewer ParentTree
		{
			get
			{
				TreeViewer oParentTree = null;
				if (Parent != null)
				{
					if (Parent is TreeViewer)
					{
						oParentTree = (TreeViewer) Parent;
					}
				}
				return oParentTree;
			}
		}
		#endregion
		//******************************************************************
		#region [ParentNode Property]
		//******************************************************************
		/// <summary>
		/// The ParentNode property value.
		/// </summary>
		private TreeViewerNode moParentNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the parent of this node. This value is null if the
		/// node does not have a parent. A node's ParentNode property is
		/// automatically set when the node is added to the ChildNodes
		/// collection of another node.
		/// </summary>
		public TreeViewerNode ParentNode
		{
			set
			{
				TreeViewerNode oParentNode = value;

				//**********************************************************
				// Validate the given parent node.

				if (oParentNode != null)
				{
					if (! oParentNode.ChildNodes.Contains(this))
					{
						string sMessage = "Invalid argument: "
							+ "TreeViewerNode.ParentNode can only be set "
							+ "if the indicated parent node contains this "
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
		private TreeViewerNodeCollection moChildNodes = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of all child nodes immediately dominated by
		/// this node.
		/// </summary>
		public TreeViewerNodeCollection ChildNodes
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moChildNodes == null)
				{
					moChildNodes = new TreeViewerNodeCollection(this);
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
		public TreeViewerNode FirstChild
		{
			get
			{
				TreeViewerNode oFirstChild = null;
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
		public TreeViewerNode LastChild
		{
			get
			{
				TreeViewerNode oLastChild = null;
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
		public TreeViewerNode PreviousSibling
		{
			get
			{
				TreeViewerNode oPreviousSibling = null;
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
		public TreeViewerNode NextSibling
		{
			get
			{
				TreeViewerNode oNextSibling = null;
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
		#region [BranchLeft, BranchWidth and BranchRight Properties]
		//******************************************************************
		/// <summary>
		/// The BranchLeft property value. This value is set by the
		/// ArrangeChildNodes() method each time it is called.
		/// </summary>
		private int miBranchLeft = 0;
		//******************************************************************
		/// <summary>
		/// Gets the left-most x-coordinate of any node in the branch
		/// dominated by this node.
		/// </summary>
		public int BranchLeft
		{
			get
			{
				return miBranchLeft;
			}
		}
		//******************************************************************
		/// <summary>
		/// The BranchWidth property value. This value is set by the
		/// ArrangeChildNodes() method each time it is called.
		/// </summary>
		private int miBranchWidth = 0;
		//******************************************************************
		/// <summary>
		/// Gets the width of the branch dominated by this node, from the
		/// left-most x-coordinate of any node in the branch to the
		/// right-most x-coordinate of any node in the branch.
		/// </summary>
		public int BranchWidth
		{
			get
			{
				return miBranchWidth;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the right-most x-coordinate of any node in the branch
		/// dominated by this node.
		/// </summary>
		public int BranchRight
		{
			get
			{
				return BranchLeft + BranchWidth;
			}
		}
		#endregion
		//******************************************************************
		#region [ArrangeChildNodes() Method]
		//******************************************************************
		/// <summary>
		/// Arranges this node and it child branches by recursively calling
		/// the ArrangeChildNodes() method of each child node. First the
		/// child branches are arranged below this node, using the given
		/// iBranchLeft value to determine the left-most edge. Next this
		/// node is centered horizontally above its children (its vertical
		/// position is not changed). The BranchLeft, BranchWidth and
		/// BranchRight properties are set to reflect the updated dimensions
		/// of the branch.
		/// </summary>
		public void ArrangeChildNodes(int iBranchLeft)
		{
			//**************************************************************
			// Get the horizontal and vertical spacing between nodes.

			int iHorizontalSpacing = 10;
			int iVerticalSpacing = 10;
			if (ParentTree != null)
			{
				iHorizontalSpacing = ParentTree.HorizontalSpacing;
				iVerticalSpacing = ParentTree.VerticalSpacing;
			}

			//**************************************************************
			// Set the node's BranchLeft property to the given iBranchLeft
			// value. Initially set the node's BranchWidth property to zero.

			miBranchLeft = iBranchLeft;
			miBranchWidth = 0;

			//**************************************************************
			// First arrange the child branches dominated by each child
			// node, increasing the BranchWidth as each branch is arranged.
			//
			// The left-most x-coordinate for the first child branch is
			// BranchLeft.
			//
			// The top-most y-coordinate of each child node is determined by
			// adding the vertical-spacing offset to the bottom edge of the
			// parent node.

			int iChildLeft = BranchLeft;
			int iChildTop = Bottom + iVerticalSpacing;

			foreach (TreeViewerNode oChild in ChildNodes)
			{
				//**********************************************************
				// Set the top of the child node. Then make a recursive call
				// to the child's ArrangeChildNodes() method.

				oChild.Top = iChildTop;
				oChild.ArrangeChildNodes(iChildLeft);

				//**********************************************************
				// Increase the BranchWidth to include the child branch.

				miBranchWidth = oChild.BranchRight - BranchLeft;

				//**********************************************************
				// The left-most x-coordinate for the next child branch is
				// determined by adding the horizontal-spacing offset to the
				// right-most edge in the current child branch.

				iChildLeft = oChild.BranchRight + iHorizontalSpacing;
			}

			//**************************************************************
			// Next center this node over its child nodes (but no farther
			// left than BranchLeft).
			//
			// If there are no child nodes, set the node's left edge to
			// BranchLeft.

			int iLeft = BranchLeft;
			if ((FirstChild != null) && (LastChild != null))
			{
				iLeft = (FirstChild.Left + LastChild.Right - Width) / 2;
				if (iLeft < BranchLeft)
				{
					iLeft = BranchLeft;
				}
			}
			Left = iLeft;

			//**************************************************************
			// Make sure the BranchWidth is at least as wide as this node.

			if (BranchWidth < Width)
			{
				miBranchWidth = Width;
			}
		}
		#endregion
		//******************************************************************
		#region [PaintChildLines() Method]
		//******************************************************************
		/// <summary>
		/// Draws lines on the TreeViewer control to show the connection
		/// from this node to each of its child nodes. Then a recursive call
		/// is made to the PaintChildLines() method of each child node. The
		/// PaintEventArgs argument must specify the Graphics object and
		/// ClipRectangle for painting the parent TreeViewer control.
		/// </summary>
		public void PaintChildLines(PaintEventArgs oArgs)
		{
			Debug.Assert(oArgs != null);
			Debug.Assert(oArgs.Graphics != null);

			//**************************************************************
			// If this node has child nodes, draw a line to each child.

			if (ChildNodes.Count > 0)
			{
				//**********************************************************
				// Create a pen to draw one-pixel-width lines using the
				// foreground color of the parent TreeViewer control.

				Color oForeColor = SystemColors.ControlText;
				if (ParentTree != null)
				{
					oForeColor = ParentTree.ForeColor;
				}
				Pen oPen = new Pen(oForeColor,1);

				//**********************************************************
				// Set the smoothing mode to anti-alias.

				oArgs.Graphics.SmoothingMode = SmoothingMode.AntiAlias;

				//**********************************************************
				// Calculate the middle-bottom coordinates of this node.

				int iParentX = (FirstChild.Left + LastChild.Right) / 2;
				int iParentY = Bottom;

				//**********************************************************
				// Draw lines to each child node.

				foreach (TreeViewerNode oChild in ChildNodes)
				{
					//******************************************************
					// Calculate the child's middle-top coordinates, and
					// draw a line between the parent and child.

					int iChildX = (oChild.Left + oChild.Right) / 2;
					int iChildY = oChild.Top;
					oArgs.Graphics.DrawLine(oPen,
						iParentX,iParentY,iChildX,iChildY);

					//******************************************************
					// Make a recursive call to the child node's
					// PaintChildLines() method.

					oChild.PaintChildLines(oArgs);
				}
			}
		}
		#endregion
		//******************************************************************
		#region [Text Property and ResetText() Method]
		//******************************************************************
		/// <summary>
		/// The Text property value.
		/// </summary>
		private string msText = "";
		//******************************************************************
		/// <summary>
		/// Gets or sets the text associated with this node.
		/// </summary>
		public override string Text
		{
			set
			{
				//**********************************************************
				// Set the Text property for this node.
				//
				// Note that the Text property of the UserControl class is
				// not visible in the development environment, so I am
				// overriding it with a visible Text property, as well as a
				// ResetText() method.

				msText = value;

				//**********************************************************
				// Raise the TextChanged event.

				OnTextChanged(new EventArgs());
			}
			get
			{
				return msText;
			}
		}
		//******************************************************************
		/// <summary>
		/// Resets the Text property to its default value.
		/// </summary>
		public override void ResetText()
		{
			//**********************************************************
			// Reset the Text property to a blank string.
			//
			// Note that the Text property of the UserControl class is
			// not visible in the development environment, so I am
			// overriding it with a visible Text property, as well as a
			// ResetText() method.

			Text = "";
		}
		#endregion
		//******************************************************************
		#region [IsInputKey() Method]
		//******************************************************************
		/// <summary>
		/// Identifies tree-navigation keys as input keys so they will be
		/// sent to the TreeViewer control without preprocessing.
		/// </summary>
		protected override bool IsInputKey(Keys iKeyData)
		{
			//**************************************************************
			// For arrows, home, end, page-up and page-down keys (ignoring
			// their shift, control and alt bits), return true so they will
			// be treated as input keys and sent to the TreeViewer control
			// without preprocessing.

			Keys iKey = iKeyData;
			iKey = iKey & (~ Keys.Shift);
			iKey = iKey & (~ Keys.Control);
			iKey = iKey & (~ Keys.Alt);
			switch (iKey)
			{
				case Keys.Left:
				case Keys.Right:
				case Keys.Up:
				case Keys.Down:
				case Keys.Home:
				case Keys.End:
				case Keys.PageUp:
				case Keys.PageDown:
					return true;
			}

			//**************************************************************
			// Call the base method to return the default input-key result
			// for all other keys.

			return base.IsInputKey(iKeyData);
		}
		#endregion
		//******************************************************************

		// EVENTS

		//******************************************************************
		#region [MeasureNode Event]
		//******************************************************************
		/// <summary>
		/// Occurs when a TreeViewer node is created or its displayed data
		/// is changed. The event handler receives an argument of type
		/// TreeViewerNodeEventArgs, and the node is indicated by the .Node
		/// property. The event handler must resize this node to fit the new
		/// displayed data and then set the .Handled property to true.
		/// </summary>
		public event TreeViewerNodeEventHandler MeasureNode;
		//******************************************************************
		/// <summary>
		/// Raises the MeasureNode event.
		/// </summary>
		protected virtual void OnMeasureNode(TreeViewerNodeEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (MeasureNode != null)
				{
					MeasureNode(this,oArgs);
				}
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [DrawNode Event]
		//******************************************************************
		/// <summary>
		/// Occurs when a TreeViewer node needs to draw its displayed data.
		/// The event handler receives an argument of type
		/// TreeViewerNodeEventArgs, in which the node is indicated by the
		/// .Node property. The event handler must draw this node (including
		/// the node's background) to display its data and then set the
		/// .Handled property to true. The event handler needs to check the
		/// TreeViewer's SelectedNode property to determine whether or not
		/// the displayed node needs to indicate a selected state.
		/// </summary>
		public event TreeViewerNodeEventHandler DrawNode;
		//******************************************************************
		/// <summary>
		/// Raises the DrawNode event.
		/// </summary>
		protected virtual void OnDrawNode(TreeViewerNodeEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (DrawNode != null)
				{
					DrawNode(this,oArgs);
				}
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnTextChanged() and OnFontChanged() Methods]
		//******************************************************************
		/// <summary>
		/// Raises the MeasureNode event (to resize the node to fit its
		/// displayed data) when a node's Text property changes.
		/// </summary>
		protected override void OnTextChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call BeginUpdate() to disable redrawing the tree, but not
				// if redrawing was already disabled by the calling code.

				bool bCallEndUpdate = false;
				if (ParentTree != null)
				{
					if (! ParentTree.IsUpdating)
					{
						ParentTree.BeginUpdate();
						bCallEndUpdate = true;
					}
				}

				//**********************************************************
				// Call the base method to raise the TextChanged event.

				base.OnTextChanged(oArgs);

				//**********************************************************
				// Raise the MeasureNode event to resize the node to fit its
				// displayed data.

				OnMeasureNode(new TreeViewerNodeEventArgs(this));

				//**********************************************************
				// Invalidate the control so the node will be repainted.

				Invalidate();

				//**********************************************************
				// Call EndUpdate() to redraw the tree, but not if redrawing
				// was already disabled by the calling code.

				if (ParentTree != null)
				{
					if (bCallEndUpdate)
					{
						ParentTree.EndUpdate();
					}
				}
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Raises the MeasureNode event (to resize the node to fit its
		/// displayed data) when a node's Font property changes.
		/// </summary>
		protected override void OnFontChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call BeginUpdate() to disable redrawing the tree, but not
				// if redrawing was already disabled by the calling code.

				bool bCallEndUpdate = false;
				if (ParentTree != null)
				{
					if (! ParentTree.IsUpdating)
					{
						ParentTree.BeginUpdate();
						bCallEndUpdate = true;
					}
				}

				//**********************************************************
				// Call the base method to raise the FontChanged event.

				base.OnFontChanged(oArgs);

				//**********************************************************
				// Raise the MeasureNode event to resize the node to fit its
				// displayed data.

				OnMeasureNode(new TreeViewerNodeEventArgs(this));

				//**********************************************************
				// Invalidate the control so the node will be repainted.

				Invalidate();

				//**********************************************************
				// Call EndUpdate() to redraw the tree, but not if redrawing
				// was already disabled by the calling code.

				if (ParentTree != null)
				{
					if (bCallEndUpdate)
					{
						ParentTree.EndUpdate();
					}
				}
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnForeColorChanged() and OnBackColorChanged() Methods]
		//******************************************************************
		/// <summary>
		/// Invalidates the control so the node will be redrawn when its
		/// ForeColor property changes.
		/// </summary>
		protected override void OnForeColorChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call the base method to raise the ForeColorChanged event.

				base.OnForeColorChanged(oArgs);

				//**********************************************************
				// Invalidate the control so the node will be repainted.

				Invalidate();
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Invalidates the control so the node will be redrawn when its
		/// BackColor property changes.
		/// </summary>
		protected override void OnBackColorChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call the base method to raise the BackColorChanged event.

				base.OnBackColorChanged(oArgs);

				//**********************************************************
				// Invalidate the control so the node will be repainted.

				Invalidate();
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnPaint() Method]
		//******************************************************************
		/// <summary>
		/// Raises the DrawNode event (to draw the node's displayed data)
		/// when a node needs to be painted.
		/// </summary>
		protected override void OnPaint(PaintEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call the base method to raise the OnPaint event.

				base.OnPaint(oArgs);

				//**********************************************************
				// Raise the DrawNode event to draw the node's displayed
				// data.

				OnDrawNode(new TreeViewerNodeEventArgs(this));
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnPaintBackground() Method]
		//******************************************************************
		/// <summary>
		/// Overrides the PaintBackground event so it will not repaint the
		/// node's background color. (The DrawNode event handler needs to
		/// draw the node's background as well as its foreground.)
		/// </summary>
		protected override void OnPaintBackground(PaintEventArgs oArgs)
		{
			//**************************************************************
			// We override the PaintBackground event so it will not repaint
			// the node's background color, since this was causing a lot of
			// flicker when tree nodes were being arranged.
			//
			// We do NOT call the base.OnPaintBackground() method, because
			// this would cause the background to be painted.
		}
		#endregion
		//******************************************************************
		#region [OnEnter() and OnLeave() Methods]
		//******************************************************************
		/// <summary>
		/// Sets the TreeViewer's SelectedNode property to the node that was
		/// entered. The node will be redrawn to indicated its selected
		/// state.
		/// </summary>
		protected override void OnEnter(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Set the TreeViewer's SelectedNode property to this node
				// when it is entered (for example when the user clicks the
				// node).

				if (ParentTree != null)
				{
					ParentTree.SelectedNode = this;
				}

				//**********************************************************
				// Invalidate the control so the node will be repainted to
				// indicated its selected state.

				Invalidate();

				//**********************************************************
				// Call the base method to raise the OnEnter event.

				base.OnEnter(oArgs);
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Redraws the node to indicated its selected state when the input
		/// focus leaves the control.
		/// </summary>
		protected override void OnLeave(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Invalidate the control so the node will be repainted to
				// indicated its selected state.

				Invalidate();

				//**********************************************************
				// Call the base method to raise the OnLeave event.

				base.OnLeave(oArgs);
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************

		// ERROR HANDLING

		//******************************************************************
		#region [Static ShowException() and LogException() Methods]
		//******************************************************************
		/// <summary>
		/// Shows the user the message from the given exception object.
		/// </summary>
		private static void ShowException(Exception oException)
		{
			try
			{
				LogException(oException);
				MessageBox.Show(oException.Message,"Error");
			}
			catch
			{
				Debug.Fail("ShowException() failed.");
			}
		}
		//******************************************************************
		/// <summary>
		/// Logs the message from the given exception object.
		/// </summary>
		private static void LogException(Exception oException)
		{
			try
			{
				Debug.WriteLine("Error: " + oException.Message);
				Debug.WriteLine(oException.StackTrace);
			}
			catch
			{
				Debug.Fail("LogException() failed.");
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
