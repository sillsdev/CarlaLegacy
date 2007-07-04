//**************************************************************************
// File: "TreeTran\TreeViewer.cs".
//
// This file defines the TreeViewer class, which implements a control that
// displays nodes in a tree.
//
// History:
//     2006-Aug-23 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
//**************************************************************************
// Note that "Esperanto Notation" is used throughout this project:
//
// The following abbreviations are used at the beginning of local variable
// names, and are preceeded by an m in private class-member variable names:
// b = boolean, i = integer, n = real number, s = string, o = object.
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Implements a control that displays nodes in a tree.
	/// </summary>
	public class TreeViewer: System.Windows.Forms.UserControl
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		// <summary>
		// Required designer variable.
		// </summary>
		private System.ComponentModel.Container components = null;

		public TreeViewer()
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
			// TreeViewer
			//
			this.AutoScroll = true;
			this.AutoScrollMargin = new System.Drawing.Size(10, 10);
			this.BackColor = System.Drawing.SystemColors.Window;
			this.ForeColor = System.Drawing.SystemColors.WindowText;
			this.Name = "TreeViewer";

		}
		#endregion
		#endregion
		//******************************************************************
		#region [RootNode Property]
		//******************************************************************
		/// <summary>
		/// The RootNode property value.
		/// </summary>
		private TreeViewerNode moRootNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the tree's root node.
		/// </summary>
		public TreeViewerNode RootNode
		{
			set
			{
				//**********************************************************
				// Set the RootNode property to the given value.

				moRootNode = value;

				//**********************************************************
				// Call BeginUpdate() to disable redrawing the tree, but not
				// if redrawing was already disabled by the calling code.

				bool bCallEndUpdate = false;
				if (! IsUpdating)
				{
					BeginUpdate();
					bCallEndUpdate = true;
				}

				//**********************************************************
				// Determine if the TreeViewer contains input focus.

				bool bContainsFocus = ContainsFocus;

				//**********************************************************
				// Remove any existing nodes from the tree.

				Controls.Clear();

				//**********************************************************
				// Set focus to the TreeViewer if it does not contain focus
				// now but it contained focus before the nodes were cleared.
				// (One of the cleared nodes contained the input focus.)

				if (bContainsFocus)
				{
					if (! ContainsFocus)
					{
						Focus();
					}
				}

				//**********************************************************
				// Make sure the root node's ParentNode property is null.

				if (moRootNode != null)
				{
					moRootNode.ParentNode = null;
				}

				//**********************************************************
				// Add the new root node to the tree, positioning the node
				// at negative coordinates off the screen (so it will not
				// appear until the EndUpdate() call arranges the tree).

				if (moRootNode != null)
				{
					moRootNode.Left = -moRootNode.Width;
					moRootNode.Top = -moRootNode.Height;
					Controls.Add(moRootNode);
				}

				//**********************************************************
				// Call EndUpdate() to redraw the tree, but not if redrawing
				// was already disabled by the calling code.

				if (bCallEndUpdate)
				{
					EndUpdate();
				}
			}
			get
			{
				return moRootNode;
			}
		}
		#endregion
		//******************************************************************
		#region [SelectedNode Property]
		//******************************************************************
		/// <summary>
		/// The SelectedNode property value.
		/// </summary>
		private TreeViewerNode moSelectedNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the selected node in the tree.
		/// </summary>
		public TreeViewerNode SelectedNode
		{
			set
			{
				//**********************************************************
				// Validate the parameters.

				TreeViewerNode oNode = value;
				if (oNode != null)
				{
					if (RootNode == null)
					{
						string sMessage = "Invalid argument: "
							+ "TreeViewer.SelectedNode must be set to "
							+ "a node that is displayed in this tree.";
						throw new Exception(sMessage);
					}
					if (! BranchContainsNode(RootNode,oNode))
					{
						string sMessage = "Invalid argument: "
							+ "TreeViewer.SelectedNode must be set to "
							+ "a node that is displayed in this tree.";
						throw new Exception(sMessage);
					}
				}

				//**********************************************************
				// Invalidate the previously selected node (if a node in the
				// tree was selected) so it will be redrawn to indicate its
				// selected state.

				if (moSelectedNode != null)
				{
					if (RootNode != null)
					{
						if (BranchContainsNode(RootNode,moSelectedNode))
						{
							moSelectedNode.Invalidate();
						}
					}
				}

				//**********************************************************
				// Make the given node the ActiveControl and ensure that it
				// is visible.

				if (oNode != null)
				{
					//******************************************************
					// If IsUpdating is true, do not set the ActiveControl
					// or call EnsureVisible(), because the nodes may not be
					// arranged yet. When EndUpdate() is called, it will set
					// the ActiveControl to the selected node and call
					// EnsureVisible() for the selected node.

					if (! IsUpdating)
					{
						//**************************************************
						// Make the given node the ActiveControl of the
						// TreeViewer, so it will get input focus when the
						// TreeViewer contains the focus. (If the TreeViewer
						// contains focus now, its ActiveControl gets input
						// focus immediately. Otherwise, its ActiveControl
						// gets input focus whenever focus enters the
						// TreeViewer control.)

						ActiveControl = oNode;

						//**************************************************
						// Make sure the given node is visible.

						EnsureVisible(oNode);
					}
				}

				//**********************************************************
				// Invalidate the given node so it will be redrawn to
				// indicate its selected state.

				if (oNode != null)
				{
					oNode.Invalidate();
				}

				//**********************************************************
				// If the given value changes the selected node, set the
				// SelectedNode property and raise the SelectionChanged
				// event.

				if (moSelectedNode != oNode)
				{
					moSelectedNode = oNode;
					OnSelectionChanged(new EventArgs());
				}
			}
			get
			{
				return moSelectedNode;
			}
		}
		#endregion
		//******************************************************************
		#region [HorizontalSpacing and VerticalSpacing Properties]
		//******************************************************************
		/// <summary>
		/// The HorizontalSpacing property value.
		/// </summary>
		private int miHorizontalSpacing = 10;
		//******************************************************************
		/// <summary>
		/// Gets or sets the horizontal spacing between the right-most edge
		/// of a child branch and the left-most edge of its next sibling
		/// branch. (This spacing will be used the next time the tree nodes
		/// are arranged.)
		/// </summary>
		public int HorizontalSpacing
		{
			set
			{
				int iHorizontalSpacing = value;

				Debug.Assert(iHorizontalSpacing >= 0);

				miHorizontalSpacing = iHorizontalSpacing;
			}
			get
			{
				return miHorizontalSpacing;
			}
		}
		//******************************************************************
		/// <summary>
		/// The VerticalSpacing property value.
		/// </summary>
		private int miVerticalSpacing = 10;
		//******************************************************************
		/// <summary>
		/// Gets or sets the vertical spacing between the bottom edge of a
		/// parent node and the top edge of each of its child nodes. (This
		/// spacing will be used the next time the tree nodes are arranged.)
		/// </summary>
		public int VerticalSpacing
		{
			set
			{
				int iVerticalSpacing = value;

				Debug.Assert(iVerticalSpacing >= 0);

				miVerticalSpacing = iVerticalSpacing;
			}
			get
			{
				return miVerticalSpacing;
			}
		}
		#endregion
		//******************************************************************
		#region [ScrollX and ScrollY Properties]
		//******************************************************************
		/// <summary>
		/// Gets or sets the horizontal auto-scroll position, using the
		/// positive offset from the Left of the TreeViewer control.
		/// </summary>
		private int ScrollX
		{
			set
			{
				int iScrollX = value;

				Debug.Assert(iScrollX >= 0);

				int iScrollY = ScrollY;
				AutoScrollPosition = new Point(iScrollX,iScrollY);
			}
			get
			{
				//**********************************************************
				// Get the horizontal scroll position. Note that for some
				// bizarre reason when you GET the AutoScrollPosition it
				// gives you NEGATIVE coordinates, but when you SET the
				// AutoScrollPosition you must use POSITIVE coordinates.

				return Math.Abs(AutoScrollPosition.X);
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets or sets the vertical auto-scroll position, using the
		/// positive offset from the Top of the TreeViewer control.
		/// </summary>
		private int ScrollY
		{
			set
			{
				int iScrollY = value;

				Debug.Assert(iScrollY >= 0);

				int iScrollX = ScrollX;
				AutoScrollPosition = new Point(iScrollX,iScrollY);
			}
			get
			{
				//**********************************************************
				// Get the vertical scroll position. Note that for some
				// bizarre reason when you GET the AutoScrollPosition it
				// gives you NEGATIVE coordinates, but when you SET the
				// AutoScrollPosition you must use POSITIVE coordinates.

				return Math.Abs(AutoScrollPosition.Y);
			}
		}
		#endregion
		//******************************************************************
		#region [IsUpdating Property]
		//******************************************************************
		/// <summary>
		/// The IsUpdating property value.
		/// </summary>
		private bool mbIsUpdating = false;
		//******************************************************************
		/// <summary>
		/// Gets a value indicating whether redrawing of the tree is
		/// disabled. The IsUpdating property is initially false. It is set
		/// to true when BeginUpdate() is called and set back to false when
		/// EndUpdate() is called.
		/// </summary>
		public bool IsUpdating
		{
			get
			{
				return mbIsUpdating;
			}
		}
		#endregion
		//******************************************************************
		#region [BeginUpdate() and EndUpdate() Methods]
		//******************************************************************
		/// <summary>
		/// Sets the IsUpdating property to true and disables any redrawing
		/// of the tree until the EndUpdate() method is called.
		/// </summary>
		public void BeginUpdate()
		{
			Debug.Assert(! IsUpdating);

			mbIsUpdating = true;
		}
		//******************************************************************
		/// <summary>
		/// Redraws the tree and sets the IsUpdating property back to false.
		/// </summary>
		public void EndUpdate()
		{
			Debug.Assert(IsUpdating);

			//**************************************************************
			// Arrange the root node and its children.

			if (RootNode != null)
			{
				//**********************************************************
				// The top-left coordinates for the tree are determined by
				// subtracting the current scroll offsets from the top-left
				// margin.

				int iLeft = AutoScrollMargin.Width - ScrollX;
				int iTop = AutoScrollMargin.Height - ScrollY;

				//**********************************************************
				// Position the top of the root node. Then arrange the root
				// node and its children by calling the ArrangeChildNodes()
				// method recursively from the root node.

				RootNode.Top = iTop;
				RootNode.ArrangeChildNodes(iLeft);
			}

			//**************************************************************
			// Set the IsUpdating property back to false. (This must be done
			// before calling the EnsureVisible() method.)

			mbIsUpdating = false;

			//**************************************************************
			// Make sure the selected node is the active control and ensure
			// that it is visible. If no node is selected, ensure that the
			// root node is visible.

			if (SelectedNode != null)
			{
				ActiveControl = SelectedNode;
				EnsureVisible(SelectedNode);
			}
			else
			{
				if (RootNode != null)
				{
					EnsureVisible(RootNode);
				}
			}

			//**************************************************************
			// Invalidate the TreeViewer control so the OnPaint() method
			// will draw lines between each node and its children.

			Invalidate();
		}
		#endregion
		//******************************************************************
		#region [EnsureVisible() Method]
		//******************************************************************
		/// <summary>
		/// Ensures that the specified node is visible within the control,
		/// scrolling the contents of the control if necessary.
		/// </summary>
		public void EnsureVisible(TreeViewerNode oNode)
		{
			//**************************************************************
			// Validate the parameters.

			if (oNode == null)
			{
				string sMessage = "Invalid argument: "
					+ "TreeViewer.EnsureVisible() requires "
					+ "a node that is not null.";
				throw new Exception(sMessage);
			}
			if (RootNode == null)
			{
				string sMessage = "Invalid argument: "
					+ "TreeViewer.EnsureVisible() requires "
					+ "a node that is displayed in this tree.";
				throw new Exception(sMessage);
			}
			if (! BranchContainsNode(RootNode,oNode))
			{
				string sMessage = "Invalid argument: "
					+ "TreeViewer.EnsureVisible() requires "
					+ "a node that is displayed in this tree.";
				throw new Exception(sMessage);
			}
			if (IsUpdating)
			{
				string sMessage = "Invalid state: "
					+ "TreeViewer.EnsureVisible() must not be called "
					+ "while TreeViewer.IsUpdating is true.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Determine what the node's Left, Right, Top and Bottom values
			// would be if the ScrollX and ScrollY positions were both zero.

			int iNodeLeft = oNode.Left + ScrollX;
			int iNodeRight = oNode.Right + ScrollX;
			int iNodeTop = oNode.Top + ScrollY;
			int iNodeBottom = oNode.Bottom + ScrollY;

			//**************************************************************
			// Get the left and right margins as offsets from the ScrollX
			// position. Get the top and bottom margins as offsets from the
			// ScrollY position. (The ClientSize does not include the area
			// occupied by the vertical and horizontal scroll bars.)

			int iLeftMargin = AutoScrollMargin.Width;
			int iRightMargin = ClientSize.Width - AutoScrollMargin.Width;
			int iTopMargin = AutoScrollMargin.Height;
			int iBottomMargin = ClientSize.Height - AutoScrollMargin.Height;

			//**************************************************************
			// To ensure the node is visible, the minimum ScrollX position
			// places the node's right edge at the client area's right
			// margin:
			//
			//     iMinScrollX + iRightMargin = iNodeRight
			//
			// And the maximum ScrollY position places the node's left edge
			// at the client area's left margin:
			//
			//     iMaxScrollY + iLeftMargin = iNodeLeft

			int iMinScrollX = iNodeRight - iRightMargin;
			int iMaxScrollX = iNodeLeft - iLeftMargin;

			//**************************************************************
			// To ensure the node is visible, the minimum ScrollY position
			// places the node's bottom edge at the client area's bottom
			// margin:
			//
			//     iMinScrollY + iBottomMargin = iNodeBottom
			//
			// And the maximum ScrollY position places the node's top edge
			// at the client area's top margin:
			//
			//     iMaxScrollY + iTopMargin = iNodeTop

			int iMinScrollY = iNodeBottom - iBottomMargin;
			int iMaxScrollY = iNodeTop - iTopMargin;

			//**************************************************************
			// Change the ScrollX and ScrollY as necessary to ensure that
			// the node is visible.

			int iScrollX = ScrollX;
			if (iScrollX < iMinScrollX)
			{
				iScrollX = iMinScrollX;
			}
			if (iScrollX > iMaxScrollX)
			{
				iScrollX = iMaxScrollX;
			}
			ScrollX = iScrollX;

			int iScrollY = ScrollY;
			if (iScrollY < iMinScrollY)
			{
				iScrollY = iMinScrollY;
			}
			if (iScrollY > iMaxScrollY)
			{
				iScrollY = iMaxScrollY;
			}
			ScrollY = iScrollY;
		}
		#endregion
		//******************************************************************
		#region [BranchContainsNode() Method]
		//******************************************************************
		/// <summary>
		/// Returns true if the indicated tree branch (dominated by oBranch)
		/// contains the given node (oNode). Returns false otherwise.
		/// </summary>
		private bool BranchContainsNode(TreeViewerNode oBranch,
			TreeViewerNode oNode)
		{
			Debug.Assert(oBranch != null);
			Debug.Assert(oNode != null);

			//**************************************************************
			// Search the branch recursively.

			if (oBranch == oNode)
			{
				return true;
			}
			foreach (TreeViewerNode oChildBranch in oBranch.ChildNodes)
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
		#region [SelectionChanged Event]
		//******************************************************************
		/// <summary>
		/// Occurs when the selected node in the tree changes.
		/// </summary>
		public event EventHandler SelectionChanged;
		//******************************************************************
		/// <summary>
		/// Raises the SelectionChanged event.
		/// </summary>
		protected virtual void OnSelectionChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (SelectionChanged != null)
				{
					SelectionChanged(this,oArgs);
				}
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
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
		/// Raises the MeasureNode event (this event comes from nodes in the
		/// tree). If the event handlers do not set the oArgs.Handled
		/// property to true, default node resizing is performed.
		/// </summary>
		private void OnMeasureNode(object oSender,
			TreeViewerNodeEventArgs oArgs)
		{
			OnMeasureNode(oArgs);
		}
		//******************************************************************
		/// <summary>
		/// Raises the MeasureNode event (this event comes from nodes in the
		/// tree). If the event handlers do not set the oArgs.Handled
		/// property to true, default node resizing is performed.
		/// </summary>
		protected virtual void OnMeasureNode(TreeViewerNodeEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);
				Debug.Assert(oArgs.Node != null);

				//**********************************************************
				// Call BeginUpdate() to disable redrawing the tree, but not
				// if redrawing was already disabled by the calling code.

				bool bCallEndUpdate = false;
				if (! IsUpdating)
				{
					BeginUpdate();
					bCallEndUpdate = true;
				}

				//**********************************************************
				// Raise the MeasureNode event.

				if (MeasureNode != null)
				{
					MeasureNode(this,oArgs);
				}

				//**********************************************************
				// If the oArgs.Handled property was not set to true by an
				// event handler, perform default node resizing.

				if (! oArgs.Handled)
				{
					//******************************************************
					// Create a graphics object.

					Graphics oGraphics = oArgs.Node.CreateGraphics();

					//******************************************************
					// Measure the size of the node's text.

					string sText = oArgs.Node.Text;
					if (sText == null)
					{
						sText = "";
					}
					SizeF oSizeF = oGraphics.MeasureString(
						sText,oArgs.Node.Font);
					float nWidth = oSizeF.Width;
					float nHeight = oSizeF.Height;

					//******************************************************
					// Make sure we use at least a minimum size.

					const string sMinimum = ".";
					oSizeF = oGraphics.MeasureString(
						sMinimum,oArgs.Node.Font);
					if (nWidth < oSizeF.Width)
					{
						nWidth = oSizeF.Width;
					}
					if (nHeight < oSizeF.Height)
					{
						nHeight = oSizeF.Height;
					}

					//******************************************************
					// Add a little width for italics or overhangs.

					const int iExtraWidth = 1;
					nWidth = nWidth	+ iExtraWidth;

					//******************************************************
					// Increase the size to include the borders.

					nWidth = nWidth	+ 2;
					nHeight = nHeight + 2;

					//******************************************************
					// Round up to an integer size.

					oSizeF = new SizeF(nWidth,nHeight);
					Size oSize = Size.Ceiling(oSizeF);

					//******************************************************
					// Resize the node.

					oArgs.Node.Size = oSize;

					//******************************************************
					// Invalidate the control so the node will be repainted.

					oArgs.Node.Invalidate();
				}

				//**********************************************************
				// Call EndUpdate() to redraw the tree, but not if redrawing
				// was already disabled by the calling code.

				if (bCallEndUpdate)
				{
					EndUpdate();
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
		/// Raises the DrawNode event (this event comes from nodes in the
		/// tree). If the event handlers do not set the oArgs.Handled
		/// property to true, default node drawing is performed.
		/// </summary>
		private void OnDrawNode(object oSender,
			TreeViewerNodeEventArgs oArgs)
		{
			OnDrawNode(oArgs);
		}
		//******************************************************************
		/// <summary>
		/// Raises the DrawNode event (this event comes from nodes in the
		/// tree). If the event handlers do not set the oArgs.Handled
		/// property to true, default node drawing is performed.
		/// </summary>
		protected virtual void OnDrawNode(TreeViewerNodeEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);
				Debug.Assert(oArgs.Node != null);

				//**********************************************************
				// Raise the DrawNode event.

				if (DrawNode != null)
				{
					DrawNode(this,oArgs);
				}

				//**********************************************************
				// If the oArgs.Handled property was not set to true by an
				// event handler, perform default node drawing.

				if (! oArgs.Handled)
				{
					//******************************************************
					// Determine the background, foreground and border
					// colors.

					Color oBackColor = oArgs.Node.BackColor;
					Color oForeColor = oArgs.Node.ForeColor;
					Color oBorderColor = oArgs.Node.BackColor;

					//******************************************************
					// Use different colors to highlight the selected node.

					if (oArgs.Node == SelectedNode)
					{
						if (oArgs.Node.ContainsFocus)
						{
							//**********************************************
							// Selected-node colors when the TreeViewer
							// contains focus.

							if (oBackColor == BackColor)
							{
								oBackColor = SystemColors.Highlight;
								oForeColor = SystemColors.HighlightText;
							}
							oBorderColor = SystemColors.Highlight;
						}
						else
						{
							//**********************************************
							// Selected-node colors when the TreeViewer does
							// not contain focus.

							if (oBackColor == BackColor)
							{
								oBackColor = SystemColors.Control;
								oForeColor = SystemColors.ControlText;
							}
							oBorderColor = SystemColors.ControlDark;
						}
					}

					//******************************************************
					// The border color should be different than the
					// TreeViewer's backround color.

					if (oBorderColor == BackColor)
					{
						oBorderColor = oArgs.Node.ForeColor;
					}

					//******************************************************
					// Create a graphics object. Get the width and height
					// for drawing inside the node.

					Graphics oGraphics = oArgs.Node.CreateGraphics();
					int iWidth = oArgs.Node.Width - 1;
					int iHeight = oArgs.Node.Height - 1;

					//******************************************************
					// Draw the background (background color).

					Brush oBrush = new SolidBrush(oBackColor);
					oGraphics.FillRectangle(oBrush,0,0,iWidth,iHeight);

					//******************************************************
					// Draw the text (foreground color), starting at offset
					// (1,1) just inside the border.

					oBrush = new SolidBrush(oForeColor);
					string sText = oArgs.Node.Text;
					if (sText == null)
					{
						sText = "";
					}
					oGraphics.DrawString(sText,oArgs.Node.Font,oBrush,1,1);

					//******************************************************
					// Draw the border (border color).

					Pen oPen = new Pen(oBorderColor,1);
					oGraphics.DrawLine(oPen,0,0,iWidth,0);
					oGraphics.DrawLine(oPen,iWidth,0,iWidth,iHeight);
					oGraphics.DrawLine(oPen,iWidth,iHeight,0,iHeight);
					oGraphics.DrawLine(oPen,0,iHeight,0,0);
				}
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnControlAdded() and OnControlRemoved() Methods]
		//******************************************************************
		/// <summary>
		/// Hooks up the event handlers for each TreeViewerNode that is
		/// added to the tree.
		/// </summary>
		protected override void OnControlAdded(ControlEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);
				Debug.Assert(oArgs.Control != null);

				//**********************************************************
				// Set the added control to visible, enabled and not a tab
				// stop.

				oArgs.Control.Visible = true;
				oArgs.Control.Enabled = true;
				oArgs.Control.TabStop = false;

				//**********************************************************
				// Hook up the event handlers for the node's MeasureNode,
				// DrawNode, KeyDown and DoubleClick events. Then make the
				// node resize itself by raising the MeasureNode event.

				if (oArgs.Control is TreeViewerNode)
				{
					TreeViewerNode oNode = (TreeViewerNode) oArgs.Control;

					//******************************************************
					// Hook up event handlers.

					oNode.MeasureNode
						+= new TreeViewerNodeEventHandler(OnMeasureNode);
					oNode.DrawNode
						+= new TreeViewerNodeEventHandler(OnDrawNode);
					oNode.KeyDown
						+= new KeyEventHandler(OnKeyDown);
					oNode.DoubleClick
						+= new EventHandler(OnDoubleClick);

					//******************************************************
					// Resize the node.

					OnMeasureNode(new TreeViewerNodeEventArgs(oNode));
				}

				//**********************************************************
				// Call the base method to raise the ControlAdded event.

				base.OnControlAdded(oArgs);
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Sets the SelectedNode property to null if the selected node is
		/// removed from the tree.
		/// </summary>
		protected override void OnControlRemoved(ControlEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);
				Debug.Assert(oArgs.Control != null);

				//**********************************************************
				// If the selected node is removed, set the SelectedNode
				// property to null.

				if (oArgs.Control == SelectedNode)
				{
					SelectedNode = null;
				}

				//**********************************************************
				// Call the base method to raise the ControlRemoved event.

				base.OnControlRemoved(oArgs);
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
		/// Draws lines to show the connection from each node in the tree to
		/// each of its child nodes.
		/// </summary>
		protected override void OnPaint(PaintEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call the base method to raise the Paint event.

				base.OnPaint(oArgs);

				//**********************************************************
				// Call the PaintChildLines() method recursively from the
				// root node to draw lines from each node in the tree to
				// each of its child nodes.

				if (RootNode != null)
				{
					RootNode.PaintChildLines(oArgs);
				}
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnKeyDown() Method]
		//******************************************************************
		/// <summary>
		/// Raises the KeyDown event (including KeyDown events coming from
		/// nodes in the tree). If the event handlers do not set the
		/// oArgs.Handled property to true, default tree navigation is
		/// performed.
		/// </summary>
		private void OnKeyDown(object oSender,KeyEventArgs oArgs)
		{
			OnKeyDown(oArgs);
		}
		//******************************************************************
		/// <summary>
		/// Raises the KeyDown event (including KeyDown events coming from
		/// nodes in the tree). If the event handlers do not set the
		/// oArgs.Handled property to true, default tree navigation is
		/// performed.
		/// </summary>
		protected override void OnKeyDown(KeyEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call the base method to raise the KeyDown event.

				base.OnKeyDown(oArgs);

				//**********************************************************
				// If the key event was not handled, perform the default
				// tree navigation.

				if (! oArgs.Handled)
				{
					//******************************************************
					// If no node is selected, select the root node.

					if (SelectedNode == null)
					{
						switch (oArgs.KeyData)
						{
							case Keys.Left:
							case (Keys.Control | Keys.Left):
							case Keys.Right:
							case (Keys.Control | Keys.Right):
							case Keys.Up:
							case (Keys.Control | Keys.Up):
							case Keys.Down:
							case (Keys.Control | Keys.Down):
							case Keys.Home:
							case (Keys.Control | Keys.Home):
							case Keys.End:
							case (Keys.Control | Keys.End):
							{
								SelectedNode = RootNode;
								break;
							}
						}
					}

					//******************************************************
					// Perform the tree navigation.

					switch (oArgs.KeyData)
					{
						case Keys.Left:
						{
							//**********************************************
							// Left: Move to the previous sibling.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								oNode = oNode.PreviousSibling;
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
						case (Keys.Control | Keys.Left):
						{
							//**********************************************
							// Control-Left: Move to the first sibling.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								oNode = oNode.ParentNode;
								if (oNode != null)
								{
									oNode = oNode.FirstChild;
									if (oNode != null)
									{
										SelectedNode = oNode;
									}
								}
							}
							break;
						}
						case Keys.Right:
						{
							//**********************************************
							// Right: Move to the next sibling.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								oNode = oNode.NextSibling;
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
						case (Keys.Control | Keys.Right):
						{
							//**********************************************
							// Control-Right: Move to the last sibling.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								oNode = oNode.ParentNode;
								if (oNode != null)
								{
									oNode = oNode.LastChild;
									if (oNode != null)
									{
										SelectedNode = oNode;
									}
								}
							}
							break;
						}
						case Keys.Up:
						{
							//**********************************************
							// Up: Move to the parent.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								oNode = oNode.ParentNode;
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
						case (Keys.Control | Keys.Up):
						{
							//**********************************************
							// Control-Up: Move to the next ancestor that
							// has at least one sibling.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								TreeViewerNode oParent = oNode.ParentNode;
								while (oParent != null)
								{
									oNode = oParent;
									if ((oNode.PreviousSibling == null)
										&& (oNode.NextSibling == null))
									{
										oParent = oNode.ParentNode;
									}
									else
									{
										oParent = null;
									}
								}
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
						case Keys.Down:
						{
							//**********************************************
							// Down: Move to the first child.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								oNode = oNode.FirstChild;
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
						case (Keys.Control | Keys.Down):
						{
							//**********************************************
							// Control-Down: Move to the last child.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								oNode = oNode.LastChild;
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
						case Keys.Home:
						{
							//**********************************************
							// Home: Move to the root.

							SelectedNode = RootNode;
							break;
						}
						case (Keys.Control | Keys.Home):
						{
							//**********************************************
							// Control-Home: Move to the root.

							SelectedNode = RootNode;
							break;
						}
						case Keys.End:
						{
							//**********************************************
							// End: Move to the left-most descendent.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								TreeViewerNode oChild = oNode.FirstChild;
								while (oChild != null)
								{
									oNode = oChild;
									oChild = oNode.FirstChild;
								}
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
						case (Keys.Control | Keys.End):
						{
							//**********************************************
							// Control-End: Move to the right-most
							// descendent.

							TreeViewerNode oNode = SelectedNode;
							if (oNode != null)
							{
								TreeViewerNode oChild = oNode.LastChild;
								while (oChild != null)
								{
									oNode = oChild;
									oChild = oNode.LastChild;
								}
								if (oNode != null)
								{
									SelectedNode = oNode;
								}
							}
							break;
						}
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
		#region [OnDoubleClick() Method]
		//******************************************************************
		/// <summary>
		/// Raises the DoubleClick event (including DoubleClick events
		/// coming from nodes in the tree).
		/// </summary>
		private void OnDoubleClick(object oSender,EventArgs oArgs)
		{
			OnDoubleClick(oArgs);
		}
		//******************************************************************
		/// <summary>
		/// Raises the DoubleClick event (including DoubleClick events
		/// coming from nodes in the tree).
		/// </summary>
		protected override void OnDoubleClick(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Call the base method to raise the DoubleClick event.

				base.OnDoubleClick(oArgs);
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnFontChanged() Method]
		//******************************************************************
		/// <summary>
		/// Raises the FontChanged event, making sure BeginUpdate() is
		/// called before the event and EndUpdate() is called after the
		/// event.
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
				if (! IsUpdating)
				{
					BeginUpdate();
					bCallEndUpdate = true;
				}

				//**********************************************************
				// Call the base method to raise the FontChanged event,
				// which will result in a ParentFontChanged event (and
				// potentially a FontChanged event) to each node.

				base.OnFontChanged(oArgs);

				//**********************************************************
				// Call EndUpdate() to redraw the tree, but not if redrawing
				// was already disabled by the calling code.

				if (bCallEndUpdate)
				{
					EndUpdate();
				}
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
