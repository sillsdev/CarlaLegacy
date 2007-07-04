//**************************************************************************
// File: "TreeTran\ParseTreeViewer.cs".
//
// This file defines the ParseTreeViewer class, which implements a control
// that allows the user to view and edit a parse tree.
//
// History:
//     2007-Feb-15 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections.Specialized;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using TreeTranEngine;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Implements a control that allows the user to view and edit a parse
	/// tree.
	/// </summary>
	public class ParseTreeViewer: System.Windows.Forms.UserControl
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		// <summary>
		// Required designer variable.
		// </summary>
		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.ContextMenu moMenu;
		private System.Windows.Forms.MenuItem moUndoMenu;
		private System.Windows.Forms.MenuItem moCutSeparator;
		private System.Windows.Forms.MenuItem moCutMenu;
		private System.Windows.Forms.MenuItem moCopyMenu;
		private System.Windows.Forms.MenuItem moPasteMenu;
		private System.Windows.Forms.MenuItem moDeleteMenu;
		private System.Windows.Forms.MenuItem moFeaturesSeparator;
		private System.Windows.Forms.MenuItem moFeaturesMenu;
		private System.Windows.Forms.Panel moPanel;
		private TreeTranViewer.TreeViewer moTreeViewer;

		public ParseTreeViewer()
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
			this.moTreeViewer = new TreeTranViewer.TreeViewer();
			this.moMenu = new System.Windows.Forms.ContextMenu();
			this.moUndoMenu = new System.Windows.Forms.MenuItem();
			this.moCutSeparator = new System.Windows.Forms.MenuItem();
			this.moCutMenu = new System.Windows.Forms.MenuItem();
			this.moCopyMenu = new System.Windows.Forms.MenuItem();
			this.moPasteMenu = new System.Windows.Forms.MenuItem();
			this.moDeleteMenu = new System.Windows.Forms.MenuItem();
			this.moFeaturesSeparator = new System.Windows.Forms.MenuItem();
			this.moFeaturesMenu = new System.Windows.Forms.MenuItem();
			this.moPanel = new System.Windows.Forms.Panel();
			this.moPanel.SuspendLayout();
			this.SuspendLayout();
			//
			// moTreeViewer
			//
			this.moTreeViewer.AutoScroll = true;
			this.moTreeViewer.AutoScrollMargin = new System.Drawing.Size(10, 10);
			this.moTreeViewer.ContextMenu = this.moMenu;
			this.moTreeViewer.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moTreeViewer.HorizontalSpacing = 10;
			this.moTreeViewer.Name = "moTreeViewer";
			this.moTreeViewer.RootNode = null;
			this.moTreeViewer.SelectedNode = null;
			this.moTreeViewer.Size = new System.Drawing.Size(146, 146);
			this.moTreeViewer.TabIndex = 0;
			this.moTreeViewer.VerticalSpacing = 10;
			this.moTreeViewer.SelectionChanged += new System.EventHandler(this.moTreeViewer_SelectionChanged);
			this.moTreeViewer.DoubleClick += new System.EventHandler(this.moTreeViewer_DoubleClick);
			//
			// moMenu
			//
			this.moMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																				   this.moUndoMenu,
																				   this.moCutSeparator,
																				   this.moCutMenu,
																				   this.moCopyMenu,
																				   this.moPasteMenu,
																				   this.moDeleteMenu,
																				   this.moFeaturesSeparator,
																				   this.moFeaturesMenu});
			this.moMenu.Popup += new System.EventHandler(this.moMenu_Popup);
			//
			// moUndoMenu
			//
			this.moUndoMenu.Index = 0;
			this.moUndoMenu.Text = "&Undo";
			this.moUndoMenu.Click += new System.EventHandler(this.moUndoMenu_Click);
			//
			// moCutSeparator
			//
			this.moCutSeparator.Index = 1;
			this.moCutSeparator.Text = "-";
			//
			// moCutMenu
			//
			this.moCutMenu.Index = 2;
			this.moCutMenu.Text = "Cu&t";
			this.moCutMenu.Click += new System.EventHandler(this.moCutMenu_Click);
			//
			// moCopyMenu
			//
			this.moCopyMenu.Index = 3;
			this.moCopyMenu.Text = "&Copy";
			this.moCopyMenu.Click += new System.EventHandler(this.moCopyMenu_Click);
			//
			// moPasteMenu
			//
			this.moPasteMenu.Index = 4;
			this.moPasteMenu.Text = "&Paste";
			this.moPasteMenu.Click += new System.EventHandler(this.moPasteMenu_Click);
			//
			// moDeleteMenu
			//
			this.moDeleteMenu.Index = 5;
			this.moDeleteMenu.Text = "&Delete";
			this.moDeleteMenu.Click += new System.EventHandler(this.moDeleteMenu_Click);
			//
			// moFeaturesSeparator
			//
			this.moFeaturesSeparator.Index = 6;
			this.moFeaturesSeparator.Text = "-";
			//
			// moFeaturesMenu
			//
			this.moFeaturesMenu.DefaultItem = true;
			this.moFeaturesMenu.Index = 7;
			this.moFeaturesMenu.Text = "&Features...";
			this.moFeaturesMenu.Click += new System.EventHandler(this.moFeaturesMenu_Click);
			//
			// moPanel
			//
			this.moPanel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			this.moPanel.Controls.AddRange(new System.Windows.Forms.Control[] {
																				  this.moTreeViewer});
			this.moPanel.Dock = System.Windows.Forms.DockStyle.Fill;
			this.moPanel.Name = "moPanel";
			this.moPanel.Size = new System.Drawing.Size(150, 150);
			this.moPanel.TabIndex = 0;
			//
			// ParseTreeViewer
			//
			this.BackColor = System.Drawing.SystemColors.Window;
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moPanel});
			this.ForeColor = System.Drawing.SystemColors.WindowText;
			this.Name = "ParseTreeViewer";
			this.moPanel.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion
		#endregion
		//******************************************************************
		#region [DisplayFindPattern and DisplayReplacePattern Properties]
		//******************************************************************
		/// <summary>
		/// The DisplayFindPattern property value.
		/// </summary>
		private bool mbDisplayFindPattern = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the DisplayFindPattern property, which is set to
		/// true if this control should display find-pattern trees instead
		/// of parse trees. (This property is set to true in the
		/// FindPatternViewer control.)
		/// </summary>
		public bool DisplayFindPattern
		{
			set
			{
				//**********************************************************
				// If the property is changing, clear the displayed tree and
				// the undo information.

				bool bDisplayFindPattern = value;
				if (mbDisplayFindPattern != bDisplayFindPattern)
				{
					moTreeViewer.RootNode = null;
					TreeTransferForUndo = null;
				}

				//**********************************************************
				// Set the DisplayFindPattern property.

				mbDisplayFindPattern = bDisplayFindPattern;

				//**********************************************************
				// If the DisplayFindPattern property is true, make sure the
				// DisplayReplacePattern property is false.

				if (mbDisplayFindPattern)
				{
					Debug.Assert(! DisplayReplacePattern);

					DisplayReplacePattern = false;
				}
			}
			get
			{
				return mbDisplayFindPattern;
			}
		}
		//******************************************************************
		/// <summary>
		/// The DisplayReplacePattern property value.
		/// </summary>
		private bool mbDisplayReplacePattern = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the DisplayReplacePattern property, which is set to
		/// true if this control should display replace-pattern trees
		/// instead of parse trees. (This property is set to true in the
		/// ReplacePatternViewer control.)
		/// </summary>
		public bool DisplayReplacePattern
		{
			set
			{
				//**********************************************************
				// If the property is changing, clear the displayed tree and
				// the undo information.

				bool bDisplayReplacePattern = value;
				if (mbDisplayReplacePattern != bDisplayReplacePattern)
				{
					moTreeViewer.RootNode = null;
					TreeTransferForUndo = null;
				}

				//**********************************************************
				// Set the DisplayReplacePattern property.

				mbDisplayReplacePattern = bDisplayReplacePattern;

				//**********************************************************
				// If the DisplayReplacePattern property is true, make sure
				// the DisplayFindPattern property is false.

				if (mbDisplayReplacePattern)
				{
					Debug.Assert(! DisplayFindPattern);

					DisplayFindPattern = false;
				}
			}
			get
			{
				return mbDisplayReplacePattern;
			}
		}
		#endregion
		//******************************************************************
		#region [FindPatternColor and ReplacePatternColor Properties]
		//******************************************************************
		/// <summary>
		/// Gets the background color used to highlight nodes in the find
		/// pattern and nodes that were matched by the find pattern.
		/// </summary>
		private Color FindPatternColor
		{
			get
			{
				return Color.Yellow;
			}
		}
		//******************************************************************
		/// <summary>
		/// Gets the background color used to highlight nodes in the replace
		/// pattern and nodes that were changed by the replace pattern.
		/// </summary>
		private Color ReplacePatternColor
		{
			get
			{
				return Color.Cyan;
			}
		}
		#endregion
		//******************************************************************
		#region [ShowFeatures and ShowMorphology Properties]
		//******************************************************************
		/// <summary>
		/// The ShowFeatures property value.
		/// </summary>
		private bool mbShowFeatures = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ShowFeatures property, which is set to true if
		/// node features should be displayed in the tree (in addition to
		/// the label on each node).
		/// </summary>
		public bool ShowFeatures
		{
			set
			{
				//**********************************************************
				// If the property is changing, refresh the displayed tree.

				bool bShowFeatures = value;
				if (mbShowFeatures != bShowFeatures)
				{
					//******************************************************
					// Set the ShowFeatures property.

					mbShowFeatures = bShowFeatures;

					//******************************************************
					// Refresh the displayed tree (without changing the
					// Modified property, raising the TreeChanged event or
					// clearing the undo information).

					TreeTransfer oTreeTransfer = RecreateTreeTransfer();
					PopulateRoot(oTreeTransfer);
				}
			}
			get
			{
				return mbShowFeatures;
			}
		}
		//******************************************************************
		/// <summary>
		/// The ShowMorphology property value.
		/// </summary>
		private bool mbShowMorphology = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ShowMorphology property, which is set to true
		/// if morphology nodes should be displayed in the tree (in addition
		/// to syntax nodes).
		/// </summary>
		public bool ShowMorphology
		{
			set
			{
				//**********************************************************
				// If the property is changing, refresh the displayed tree.

				bool bShowMorphology = value;
				if (mbShowMorphology != bShowMorphology)
				{
					//******************************************************
					// Set the ShowMorphology property.

					mbShowMorphology = bShowMorphology;

					//******************************************************
					// If the morphology nodes are about to be hidden, check
					// the selected node. If the selected node is below a
					// leaf node, move the selection up to the leaf node so
					// it will not be hidden.

					if (! mbShowMorphology)
					{
						//**************************************************
						// Walk up the tree from the selected node to the
						// root node, looking for any leaf nodes.

						TreeViewerNode oTreeLeaf = null;
						TreeViewerNode oTreeNode
							= moTreeViewer.SelectedNode;
						while (oTreeNode != null)
						{
							SyntaxNode oSyntaxNode = CloneNode(oTreeNode);
							if (oSyntaxNode.IsSyntaxLeaf)
							{
								oTreeLeaf = oTreeNode;
							}
							oTreeNode = oTreeNode.ParentNode;
						}

						//**************************************************
						// If a leaf node was found above the selected node,
						// change the selection to the leaf node.

						if (oTreeLeaf != null)
						{
							moTreeViewer.SelectedNode = oTreeLeaf;
						}
					}

					//******************************************************
					// Refresh the displayed tree (without changing the
					// Modified property, raising the TreeChanged event or
					// clearing the undo information).

					TreeTransfer oTreeTransfer = RecreateTreeTransfer();
					PopulateRoot(oTreeTransfer);
				}
			}
			get
			{
				return mbShowMorphology;
			}
		}
		#endregion
		//******************************************************************
		#region [FavoriteTreeFeatures Property]
		//******************************************************************
		/// <summary>
		/// The FavoriteTreeFeatures property value.
		/// </summary>
		private StringCollection moFavoriteTreeFeatures = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of feature names to be displayed on nodes in
		/// the tree. The PopulateRoot() method copies these feature names
		/// from the FeaturesForm.FavoriteTreeFeatures collection, and this
		/// private copy is used until PopulateRoot() is called again.
		/// </summary>
		private StringCollection FavoriteTreeFeatures
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moFavoriteTreeFeatures == null)
				{
					moFavoriteTreeFeatures = new StringCollection();
				}

				//**********************************************************
				// Return the collection.

				return moFavoriteTreeFeatures;
			}
		}
		#endregion
		//******************************************************************
		#region [IsUpdating Property]
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
				return moTreeViewer.IsUpdating;
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

			moTreeViewer.BeginUpdate();
		}
		//******************************************************************
		/// <summary>
		/// Redraws the tree and sets the IsUpdating property back to false.
		/// </summary>
		public void EndUpdate()
		{
			Debug.Assert(IsUpdating);

			//**************************************************************
			// Have the TreeViewer redraw the tree (which also sets the
			// IsUpdating property back to false).

			moTreeViewer.EndUpdate();

			//**************************************************************
			// Make sure the selected node and nearby nodes are visible. If
			// no node is selected, make sure the root node and nearby nodes
			// are visible.

			TreeViewerNode oTreeNode = moTreeViewer.SelectedNode;
			if (oTreeNode == null)
			{
				oTreeNode = moTreeViewer.RootNode;
			}
			if (oTreeNode != null)
			{
				if (oTreeNode.ParentNode != null)
				{
					moTreeViewer.EnsureVisible(oTreeNode.ParentNode);
				}
				if (oTreeNode.NextSibling != null)
				{
					moTreeViewer.EnsureVisible(oTreeNode.NextSibling);
				}
				if (oTreeNode.PreviousSibling != null)
				{
					moTreeViewer.EnsureVisible(oTreeNode.PreviousSibling);
				}
				if (oTreeNode.LastChild != null)
				{
					moTreeViewer.EnsureVisible(oTreeNode.LastChild);
				}
				if (oTreeNode.FirstChild != null)
				{
					moTreeViewer.EnsureVisible(oTreeNode.FirstChild);
				}
				moTreeViewer.EnsureVisible(oTreeNode);
			}
		}
		#endregion
		//******************************************************************
		#region [PopulateTree() and PopulateRoot() Methods]
		//******************************************************************
		/// <summary>
		/// Displays the parse tree specified by the ParseTreeRoot property
		/// of the given TreeTransfer object. The TreeTransfer object also
		/// specifies the node to select (CurrentParseTreeNode property) and
		/// the nodes to highlight (in the MatchingNodes and ReplacedNodes
		/// collections).
		/// </summary>
		public void PopulateTree(TreeTransfer oTreeTransfer)
		{
			//**************************************************************
			// Validate the parameters.

			if (oTreeTransfer == null)
			{
				string sMessage = "Invalid argument: "
					+ "ParseTreeViewer.PopulateTree() requires "
					+ "a TreeTransfer object that is not null.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Clear the undo information.

			TreeTransferForUndo = null;

			//**************************************************************
			// Populate the tree.

			PopulateRoot(oTreeTransfer);

			//**************************************************************
			// Set the Modified property to false and raise the TreeChanged
			// event.

			Modified = false;
			OnTreeChanged(new EventArgs());
		}
		//******************************************************************
		/// <summary>
		/// Displays the parse tree specified by the ParseTreeRoot property
		/// (or the FindPatternRoot or the DisplayPatternRoot) of the given
		/// TreeTransfer object. The TreeTransfer object also specifies the
		/// node to select (CurrentParseTreeNode property) and the nodes to
		/// highlight (in the MatchingNodes and ReplacedNodes collections).
		/// This method does not change the Modified property, raise the
		/// TreeChanged event or clear the undo information.
		/// </summary>
		private void PopulateRoot(TreeTransfer oTreeTransfer)
		{
			Debug.Assert(oTreeTransfer != null);

			//**************************************************************
			// Make a private copy of the FeaturesForm.FavoriteTreeFeatures
			// collection. This private copy will be used until the
			// PopulateRoot() method is called again, so this tree will
			// display a consistent set of features when parts of the tree
			// are edited (even if the FeaturesForm collection changes).

			FavoriteTreeFeatures.Clear();
			foreach (string sName in FeaturesForm.FavoriteTreeFeatures)
			{
				FavoriteTreeFeatures.Add(sName);
			}

			//**************************************************************
			// Call BeginUpdate() to disable redrawing the tree, but not if
			// redrawing was already disabled by the calling code.

			bool bCallEndUpdate = false;
			if (! IsUpdating)
			{
				BeginUpdate();
				bCallEndUpdate = true;
			}

			//**************************************************************
			// Get the root node that specifies the tree to display.
			//
			// Display the find-pattern tree if DisplayFindPattern is true.
			// Display the replace-pattern tree if DisplayReplacePattern is
			// true. Display the parse tree otherwise.

			SyntaxNode oSyntaxRoot = oTreeTransfer.ParseTreeRoot;
			if (DisplayFindPattern)
			{
				oSyntaxRoot = oTreeTransfer.FindPatternRoot;
			}
			if (DisplayReplacePattern)
			{
				oSyntaxRoot = oTreeTransfer.ReplacePatternRoot;
			}

			//**************************************************************
			// If the specified root node is null, display a blank node.

			if (oSyntaxRoot == null)
			{
				oSyntaxRoot = new SyntaxNode();
			}

			//**************************************************************
			// Create the root TreeViewerNode and then call PopulateBranch()
			// to display the tree.

			TreeViewerNode oTreeRoot = new TreeViewerNode();
			moTreeViewer.RootNode = oTreeRoot;
			PopulateBranch(oTreeRoot,oSyntaxRoot,oTreeTransfer);

			//**************************************************************
			// If no node is selected, select the root node.

			if (moTreeViewer.SelectedNode == null)
			{
				moTreeViewer.SelectedNode = moTreeViewer.RootNode;
			}

			//**************************************************************
			// Call EndUpdate() to redraw the tree, but not if redrawing was
			// already disabled by the calling code.

			if (bCallEndUpdate)
			{
				EndUpdate();
			}
		}
		#endregion
		//******************************************************************
		#region [PopulateBranch() Method]
		//******************************************************************
		/// <summary>
		/// Uses the given oTreeNode to display features of the indicated
		/// oSyntaxNode. Children are then recursively added to oTreeNode to
		/// represent the children of oSyntaxNode (unless it is a leaf node
		/// and morphology nodes are hidden). If the optional oTreeTransfer
		/// argument is given, its CurrentParseTreeNode indicates the node
		/// to select, and items in its MatchingNodes and ReplacedNodes
		/// collections indicate nodes to highlight.
		/// </summary>
		private void PopulateBranch(TreeViewerNode oTreeNode,
			SyntaxNode oSyntaxNode)
		{
			TreeTransfer oTreeTransfer = new TreeTransfer();
			PopulateBranch(oTreeNode,oSyntaxNode,oTreeTransfer);
		}
		//******************************************************************
		/// <summary>
		/// Uses the given oTreeNode to display features of the indicated
		/// oSyntaxNode. Children are then recursively added to oTreeNode to
		/// represent the children of oSyntaxNode (unless it is a leaf node
		/// and morphology nodes are hidden). If the optional oTreeTransfer
		/// argument is given, its CurrentParseTreeNode indicates the node
		/// to select, and items in its MatchingNodes and ReplacedNodes
		/// collections indicate nodes to highlight.
		/// </summary>
		private void PopulateBranch(TreeViewerNode oTreeNode,
			SyntaxNode oSyntaxNode,TreeTransfer oTreeTransfer)
		{
			Debug.Assert(oTreeNode != null);
			Debug.Assert(oSyntaxNode != null);
			Debug.Assert(oTreeTransfer != null);

			//**************************************************************
			// The given oTreeNode should not already have children.

			Debug.Assert(oTreeNode.ChildNodes.Count == 0);

			//**************************************************************
			// Set the node's context menu.

			oTreeNode.ContextMenu = moMenu;

			//**************************************************************
			// Use the oTreeTransfer.CurrentParseTreeNode property to
			// determine if the node is selected.

			if (oSyntaxNode == oTreeTransfer.CurrentParseTreeNode)
			{
				moTreeViewer.SelectedNode = oTreeNode;
			}

			//**************************************************************
			// Use the oTreeTransfer.MatchingNodes and .ReplacedNodes
			// collections to determine the node's background color.

			Color oForeColor = SystemColors.WindowText;
			Color oBackColor = SystemColors.Window;

			foreach (SyntaxNodePair oNodePair in
				oTreeTransfer.MatchingNodes)
			{
				if (oSyntaxNode == oNodePair.ParseTreeNode)
				{
					oBackColor = FindPatternColor;
				}
			}
			foreach (SyntaxNodeTriple oNodeTriple in
				oTreeTransfer.ReplacedNodes)
			{
				if (oSyntaxNode == oNodeTriple.ParseTreeNode)
				{
					oBackColor = ReplacePatternColor;
				}
			}

			if (DisplayFindPattern)
			{
				oBackColor = FindPatternColor;
			}
			if (DisplayReplacePattern)
			{
				oBackColor = ReplacePatternColor;
			}

			oTreeNode.ForeColor = oForeColor;
			oTreeNode.BackColor = oBackColor;

			//**************************************************************
			// Determine if the node's children should be shown.
			//
			// A node's children are usually shown, but if the node is a
			// leaf node and ShowMorphology is false, the leaf node's
			// children (representing morphology) are not shown (unless the
			// leaf node's children are selected or highlighted).

			bool bShowChildNodes = true;
			if (oSyntaxNode.IsSyntaxLeaf)
			{
				if (! ShowMorphology)
				{
					bShowChildNodes = false;

					//******************************************************
					// Even if ShowMorphology is false, a leaf node's
					// children are shown if any of the child branches
					// contains a selected or highlighted node.

					foreach (SyntaxNode oSyntaxChild in
						oSyntaxNode.ChildNodes)
					{
						if (BranchContainsSelectionOrHighlight(
							oSyntaxChild,oTreeTransfer))
						{
							bShowChildNodes = true;
						}
					}
				}
			}

			//**************************************************************
			// Display the node (showing or hiding its children).

			if (bShowChildNodes)
			{
				//**********************************************************
				// Display the node and its children.
				//
				// Clone the oSyntaxNode (without including child nodes) and
				// call PopulateNode().

				PopulateNode(oTreeNode,oSyntaxNode.CloneNode());

				//**********************************************************
				// For each child node, add a new TreeViewerNode to the tree
				// and make a recursive call to PopulateBranch().

				foreach (SyntaxNode oSyntaxChild in oSyntaxNode.ChildNodes)
				{
					TreeViewerNode oTreeChild = new TreeViewerNode();
					oTreeNode.ChildNodes.Add(oTreeChild);
					PopulateBranch(oTreeChild,oSyntaxChild,oTreeTransfer);
				}
			}
			else
			{
				//**********************************************************
				// Display the node, but hide its children.
				//
				// Clone the entire oSyntaxNode branch (so the cloned branch
				// includes child nodes that represent morphology) and call
				// PopulateNode().

				PopulateNode(oTreeNode,oSyntaxNode.CloneBranch());
			}
		}
		#endregion
		//******************************************************************
		#region [PopulateNode() Method]
		//******************************************************************
		/// <summary>
		/// Associates the given oTreeNode with with the indicated
		/// oSyntaxNode (by setting oTreeNode.Tag to oSyntaxNode). The
		/// oSyntaxNode features are then used to determine the text that is
		/// displayed by the oTreeNode. (If this node is a leaf node and
		/// morphology nodes are not shown, the oSyntaxNode can have child
		/// nodes to represent morphology. Otherwise, the given oSyntaxNode
		/// cannot have child nodes.)
		/// </summary>
		private void PopulateNode(TreeViewerNode oTreeNode,
			SyntaxNode oSyntaxNode)
		{
			Debug.Assert(oTreeNode != null);
			Debug.Assert(oSyntaxNode != null);

			//**************************************************************
			// The oSyntaxNode can have child nodes (representing
			// morphology) only if this is a leaf node and morphology nodes
			// are not shown.

			if (! oSyntaxNode.IsSyntaxLeaf)
			{
				Debug.Assert(oSyntaxNode.ChildNodes.Count == 0);
			}
			if (ShowMorphology)
			{
				Debug.Assert(oSyntaxNode.ChildNodes.Count == 0);
			}

			//**************************************************************
			// Set the oTreeNode.Tag to associate the displayed node with
			// the indicated oSyntaxNode.

			oTreeNode.Tag = oSyntaxNode;

			//**************************************************************
			// If this is a leaf node, display the node's text in a bold
			// font style. Otherwise, use a regular font style.

			if (oSyntaxNode.IsSyntaxLeaf)
			{
				Font oFont = Font;
				if (oFont.FontFamily.IsStyleAvailable(FontStyle.Bold))
				{
					oFont = new Font(oFont,FontStyle.Bold);
				}
				oTreeNode.Font = oFont;
			}
			else
			{
				Font oFont = Font;
				if (oFont.FontFamily.IsStyleAvailable(FontStyle.Regular))
				{
					oFont = new Font(oFont,FontStyle.Regular);
				}
				oTreeNode.Font = oFont;
			}

			//**************************************************************
			// The displayed text always starts with the node's label.

			string sText = oSyntaxNode.Label;

			//**************************************************************
			// If the ShowFeatures property is true, add the name and value
			// text for each feature.

			if (ShowFeatures)
			{
				//**********************************************************
				// For find-pattern and replace-pattern nodes, show all
				// features.
				//
				// For parse-tree nodes, only show the features that are
				// named in the FavoriteTreeFeatures collection.

				SyntaxNode oFilteredSyntaxNode = oSyntaxNode.CloneNode();
				if ((! DisplayFindPattern) && (! DisplayReplacePattern))
				{
					FilterFeatures(oFilteredSyntaxNode,
						FavoriteTreeFeatures);
				}

				//**********************************************************
				// Append the name and value text for each feature (except
				// the node-label feature, since the text already starts
				// with the node's label).

				foreach (SyntaxFeature oFeature in
					oFilteredSyntaxNode.Features)
				{
					if (oFeature.Name != TreeTranEngineString.NodeLabel)
					{
						string sName = oFeature.Name;
						string sValue = oFeature.Value;
						sText = sText + Environment.NewLine
							+ sName + "=" + sValue;
					}
				}
			}

			//**************************************************************
			// Set the text of the displayed node.

			oTreeNode.Text = sText;
		}
		#endregion
		//******************************************************************
		#region [CloneTree() Method]
		//******************************************************************
		/// <summary>
		/// Creates a tree of SyntaxNode objects that represents the nodes
		/// and features displayed by this tree. Returns the root node of
		/// the created SyntaxNode tree.
		/// </summary>
		public SyntaxNode CloneTree()
		{
			if (moTreeViewer.RootNode != null)
			{
				return CloneBranch(moTreeViewer.RootNode);
			}
			return null;
		}
		#endregion
		//******************************************************************
		#region [CloneBranch() Method]
		//******************************************************************
		/// <summary>
		/// Creates a branch of SyntaxNode objects representing the nodes
		/// and features displayed by the given oTreeNode and its children
		/// (recursively). If the optional oTreeTransfer argument is given,
		/// its CurrentParseTreeNode is set to indicate the selected node
		/// (if any) in the branch, and items are added to its MatchingNodes
		/// and ReplacedNodes collections to indicate highlighted nodes in
		/// the branch. The root node of the created SyntaxNode branch is
		/// returned.
		/// </summary>
		private SyntaxNode CloneBranch(TreeViewerNode oTreeNode)
		{
			TreeTransfer oTreeTransfer = new TreeTransfer();
			return CloneBranch(oTreeNode,oTreeTransfer);
		}
		//******************************************************************
		/// <summary>
		/// Creates a branch of SyntaxNode objects representing the nodes
		/// and features displayed by the given oTreeNode and its children
		/// (recursively). If the optional oTreeTransfer argument is given,
		/// its CurrentParseTreeNode is set to indicate the selected node
		/// (if any) in the branch, and items are added to its MatchingNodes
		/// and ReplacedNodes collections to indicate highlighted nodes in
		/// the branch. The root node of the created SyntaxNode branch is
		/// returned.
		/// </summary>
		private SyntaxNode CloneBranch(TreeViewerNode oTreeNode,
			TreeTransfer oTreeTransfer)
		{
			Debug.Assert(oTreeNode != null);
			Debug.Assert(oTreeTransfer != null);

			//**************************************************************
			// Clone the SyntaxNode branch associated with the given
			// oTreeNode.

			SyntaxNode oSyntaxNode = CloneNode(oTreeNode);

			//**************************************************************
			// The oTreeNode can have child nodes. Or the oSyntaxNode can
			// have child nodes (representing morphology nodes that were not
			// shown). But the oTreeNode and oSyntaxNode cannot both have
			// child nodes.

			if (oTreeNode.ChildNodes.Count > 0)
			{
				Debug.Assert(oSyntaxNode.ChildNodes.Count == 0);
			}
			if (oSyntaxNode.ChildNodes.Count > 0)
			{
				Debug.Assert(oTreeNode.ChildNodes.Count == 0);
			}

			//**************************************************************
			// Recursively clone each child branch of oTreeNode, and add
			// each cloned branch as a child of oSyntaxNode.

			foreach (TreeViewerNode oTreeChild in oTreeNode.ChildNodes)
			{
				SyntaxNode oSyntaxChild
					= CloneBranch(oTreeChild,oTreeTransfer);
				oSyntaxNode.ChildNodes.Add(oSyntaxChild);
			}

			//**************************************************************
			// If this node is the SelectedNode, set the
			// oTreeTransfer.CurrentParseTreeNode property to indicate this
			// node.

			if (oTreeNode == moTreeViewer.SelectedNode)
			{
				oTreeTransfer.CurrentParseTreeNode = oSyntaxNode;
			}

			//**************************************************************
			// If this node is highlighted as a matching node, add an item
			// indicating this node to the oTreeTransfer.MatchingNodes
			// collection.
			//
			// If this node is highlighted as a replaced node, add an item
			// indicating this node to the oTreeTransfer.ReplacedNodes
			// collection.

			if ((! DisplayFindPattern) && (! DisplayReplacePattern))
			{
				if (oTreeNode.BackColor == FindPatternColor)
				{
					SyntaxNodePair oNodePair = new SyntaxNodePair();
					oNodePair.ParseTreeNode = oSyntaxNode;
					oTreeTransfer.MatchingNodes.Push(oNodePair);
				}
				if (oTreeNode.BackColor == ReplacePatternColor)
				{
					SyntaxNodeTriple oNodeTriple = new SyntaxNodeTriple();
					oNodeTriple.ParseTreeNode = oSyntaxNode;
					oTreeTransfer.ReplacedNodes.Push(oNodeTriple);
				}
			}

			//**************************************************************
			// Return the cloned SyntaxNode branch.

			return oSyntaxNode;
		}
		#endregion
		//******************************************************************
		#region [CloneNode() Method]
		//******************************************************************
		/// <summary>
		/// Returns a cloned copy of the SyntaxNode branch associated with
		/// the given oTreeNode (via the oTreeNode.Tag). If this node is a
		/// leaf node and morphology nodes are not shown, the returned
		/// SyntaxNode can have child nodes (representing morphology).
		/// Otherwise, the returned SyntaxNode has no child nodes.
		/// </summary>
		private SyntaxNode CloneNode(TreeViewerNode oTreeNode)
		{
			Debug.Assert(oTreeNode != null);
			Debug.Assert(oTreeNode.Tag != null);
			Debug.Assert(oTreeNode.Tag is SyntaxNode);

			//**************************************************************
			// Get the SyntaxNode associated with the given oTreeNode by
			// retrieving the oTreeNode.Tag (which was set by the
			// PopulateNode() method) and casting it back to a SyntaxNode.

			SyntaxNode oSyntaxNode = (SyntaxNode) oTreeNode.Tag;

			//**************************************************************
			// Return a cloned copy of the SyntaxNode branch.

			return oSyntaxNode.CloneBranch();
		}
		#endregion
		//******************************************************************
		#region [RecreateTreeTransfer() Method]
		//******************************************************************
		/// <summary>
		/// Returns a new TreeTransfer object that can be used to repopulate
		/// the tree. This TreeTransfer object points to a cloned copy of
		/// the current state of the tree. It also specifies the node to
		/// select (CurrentParseTreeNode property) and the nodes to
		/// highlight (in the MatchingNodes and ReplacedNodes collections).
		/// </summary>
		private TreeTransfer RecreateTreeTransfer()
		{
			//**************************************************************
			// Create a new TreeTransfer object.

			TreeTransfer oTreeTransfer = new TreeTransfer();

			//**************************************************************
			// Set the TreeTransfer properties to represent the current
			// state of the tree.

			if (moTreeViewer.RootNode != null)
			{
				//**********************************************************
				// Clone the whole tree.

				SyntaxNode oSyntaxRoot
					= CloneBranch(moTreeViewer.RootNode,oTreeTransfer);

				//**********************************************************
				// Copy the CurrentParseTreeNode property and the
				// MatchingNodes and ReplacedNodes collections (since these
				// may be cleared when the ParseTreeRoot, FindPatternRoot
				// and ReplacePatternRoot properties of the TreeTransfer
				// object are set).

				SyntaxNode oCurrentParseTreeNode
					= oTreeTransfer.CurrentParseTreeNode;

				SyntaxNodePairStack oMatchingNodes
					= new SyntaxNodePairStack();
				foreach (SyntaxNodePair oNodePair in
					oTreeTransfer.MatchingNodes)
				{
					oMatchingNodes.Push(oNodePair);
				}

				SyntaxNodeTripleStack oReplacedNodes
					= new SyntaxNodeTripleStack();
				foreach (SyntaxNodeTriple oNodeTriple in
					oTreeTransfer.ReplacedNodes)
				{
					oReplacedNodes.Push(oNodeTriple);
				}

				//**********************************************************
				// If the parse tree is displayed, set the ParseTreeRoot
				// property to the root of the cloned tree.
				//
				// If the find-pattern tree is displayed, set the
				// FindPatternRoot property to the root of the cloned tree.
				//
				// If the replace-pattern tree is displayed, set the
				// ReplacePatternRoot property to the root of the cloned
				// tree.

				oTreeTransfer.ParseTreeRoot = oSyntaxRoot;
				oTreeTransfer.FindPatternRoot = null;
				oTreeTransfer.ReplacePatternRoot = null;
				if (DisplayFindPattern)
				{
					oTreeTransfer.ParseTreeRoot = null;
					oTreeTransfer.FindPatternRoot = oSyntaxRoot;
				}
				if (DisplayReplacePattern)
				{
					oTreeTransfer.ParseTreeRoot = null;
					oTreeTransfer.ReplacePatternRoot = oSyntaxRoot;
				}

				//**********************************************************
				// Set the CurrentParseTreeNode property and the items in
				// the MatchingNodes and ReplacedNodes collections, using
				// the values that were copied earlier.

				oTreeTransfer.CurrentParseTreeNode = oCurrentParseTreeNode;

				oTreeTransfer.MatchingNodes.Clear();
				foreach (SyntaxNodePair oNodePair in oMatchingNodes)
				{
					oTreeTransfer.MatchingNodes.Push(oNodePair);
				}

				oTreeTransfer.ReplacedNodes.Clear();
				foreach (SyntaxNodeTriple oNodeTriple in oReplacedNodes)
				{
					oTreeTransfer.ReplacedNodes.Push(oNodeTriple);
				}
			}

			//**************************************************************
			// Return the TreeTransfer object.

			return oTreeTransfer;
		}
		#endregion
		//******************************************************************
		#region [TreeTransferForUndo Property]
		//******************************************************************
		/// <summary>
		/// The TreeTransferForUndo property value.
		/// </summary>
		private TreeTransfer moTreeTransferForUndo = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets a TreeTransfer object representing the tree
		/// contents before the last edit operation. This property is null
		/// if the user cannot undo the last change.
		/// </summary>
		private TreeTransfer TreeTransferForUndo
		{
			set
			{
				moTreeTransferForUndo = value;
			}
			get
			{
				return moTreeTransferForUndo;
			}
		}
		#endregion
		//******************************************************************
		#region [ReadOnly Property]
		//******************************************************************
		/// <summary>
		/// The ReadOnly property value.
		/// </summary>
		private bool mbReadOnly = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ReadOnly property, which is false if the user
		/// can edit the tree, and true if the user is not allowed to edit.
		/// </summary>
		public bool ReadOnly
		{
			set
			{
				mbReadOnly = value;
			}
			get
			{
				return mbReadOnly;
			}
		}
		#endregion
		//******************************************************************
		#region [Modified Property]
		//******************************************************************
		/// <summary>
		/// The Modified property value.
		/// </summary>
		private bool mbModified = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the Modified property, which is set to false by the
		/// PopulateTree() method and then set to true whenever the tree
		/// contents change.
		/// </summary>
		public bool Modified
		{
			set
			{
				mbModified = value;
			}
			get
			{
				return mbModified;
			}
		}
		#endregion
		//******************************************************************
		#region [Undo() and CanUndo() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the control can undo the last edit operation.
		/// Returns false otherwise.
		/// </summary>
		public bool CanUndo()
		{
			if (! ReadOnly)
			{
				if (TreeTransferForUndo != null)
				{
					return true;
				}
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Undoes the last edit operation.
		/// </summary>
		public void Undo()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanUndo())
			{
				string sMessage = "Invalid state: "
					+ "A call to ParseTreeViewer.Undo() is not allowed "
					+ "if ParseTreeViewer.CanUndo() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only tree.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Get the undo information and then clear the
			// TreeTransferForUndo property.

			TreeTransfer oTreeTransfer = TreeTransferForUndo;
			TreeTransferForUndo = null;

			//**************************************************************
			// Populate the tree using the undo information.

			PopulateRoot(oTreeTransfer);

			//**************************************************************
			// Set the Modified property to true and raise the TreeChanged
			// event.

			Modified = true;
			OnTreeChanged(new EventArgs());
		}
		#endregion
		//******************************************************************
		#region [Cut() and CanCut() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection can be cut to the
		/// clipboard. Returns false otherwise.
		/// </summary>
		public bool CanCut()
		{
			if ((CanCopy()) && (CanDelete()))
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Cuts the current selection to the clipboard.
		/// </summary>
		public void Cut()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanCut())
			{
				string sMessage = "Invalid state: "
					+ "A call to ParseTreeViewer.Cut() is not allowed "
					+ "if ParseTreeViewer.CanCut() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Copy the current selection, then delete it.

			Copy();
			Delete();
		}
		#endregion
		//******************************************************************
		#region [Copy() and CanCopy() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection can be copied to the
		/// clipboard. Returns false otherwise.
		/// </summary>
		public bool CanCopy()
		{
			if (moTreeViewer.RootNode != null)
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Copies the current selection to the clipboard.
		/// </summary>
		public void Copy()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanCopy())
			{
				string sMessage = "Invalid state: "
					+ "A call to ParseTreeViewer.Copy() is not allowed "
					+ "if ParseTreeViewer.CanCopy() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Clone the selected branch. If no branch is selected, clone
			// the whole tree. (As a last result, use an empty node.)

			SyntaxNode oSyntaxBranchToCopy = null;
			if (moTreeViewer.SelectedNode != null)
			{
				oSyntaxBranchToCopy
					= CloneBranch(moTreeViewer.SelectedNode);
			}
			if (oSyntaxBranchToCopy == null)
			{
				oSyntaxBranchToCopy = CloneTree();
			}
			if (oSyntaxBranchToCopy == null)
			{
				oSyntaxBranchToCopy = new SyntaxNode();
			}

			//**************************************************************
			// If the CopyFavoritesOnly option is true and we are copying
			// from a parse tree (not a find pattern or replace pattern),
			// filter out any features that are not named in the
			// FavoriteListFeatures collection.

			if (FeaturesForm.CopyFavoritesOnly)
			{
				if ((! DisplayFindPattern) && (! DisplayReplacePattern))
				{
					FilterFeatures(oSyntaxBranchToCopy,
						FeaturesForm.FavoriteListFeatures);
				}
			}

			//**************************************************************
			// Create a RuleWriter that writes to a string.

			StringBuilder oStringBuilder = new StringBuilder();
			TextWriter oTextWriter = new StringWriter(oStringBuilder);
			RuleWriter oRuleWriter = new RuleWriter(oTextWriter);

			//**************************************************************
			// Make a rule that uses the indicated branch as its find
			// pattern (and has an empty replace pattern).

			oRuleWriter.RuleName = "(tree fragment on clipboard)";
			oRuleWriter.FindPatternRoot = oSyntaxBranchToCopy;
			oRuleWriter.ReplacePatternRoot = null;

			//**************************************************************
			// Write the rule to the string.

			oRuleWriter.Write();

			//**************************************************************
			// Close the RuleWriter.

			oRuleWriter.Close();

			//**************************************************************
			// Copy the string to the clipboard.

			const bool bCopy = true;
			Clipboard.SetDataObject(oStringBuilder.ToString(),bCopy);
		}
		#endregion
		//******************************************************************
		#region [Paste() and CanPaste() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the control can paste the current contents of
		/// the clipboard. Returns false otherwise.
		/// </summary>
		public bool CanPaste()
		{
			if (! ReadOnly)
			{
				if (moTreeViewer.SelectedNode != null)
				{
					return true;
				}
				if (NodeIsNullOrEmpty(moTreeViewer.RootNode))
				{
					return true;
				}
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Pastes the current contents of the clipboard.
		/// </summary>
		public void Paste()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanPaste())
			{
				string sMessage = "Invalid state: "
					+ "A call to ParseTreeViewer.Paste() is not allowed "
					+ "if ParseTreeViewer.CanPaste() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only tree.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Use the current contents of the tree (before the paste
			// operation) to set the undo information.

			TreeTransferForUndo = RecreateTreeTransfer();

			//**************************************************************
			// Get the string data on the clipboard, or return (without
			// reporting an error) if there is no string data on the
			// clipboard.

			IDataObject oDataObject = Clipboard.GetDataObject();
			if (oDataObject == null)
			{
				return;
			}
			if (! oDataObject.GetDataPresent(typeof(string)))
			{
				return;
			}
			string sString = (string) oDataObject.GetData(typeof(string));
			if (sString == null)
			{
				return;
			}

			//**************************************************************
			// Return (without reporting an error) if the string data does
			// not look at all like XML.

			if (sString.IndexOf("<") < 0)
			{
				return;
			}
			if (sString.IndexOf("/") < 0)
			{
				return;
			}
			if (sString.IndexOf(">") < 0)
			{
				return;
			}

			//**************************************************************
			// Get the branch to paste from the first tree represented by
			// the string data.

			SyntaxNode oSyntaxBranchToPaste = null;
			try
			{
				//**********************************************************
				// Use a RuleReader to read the first rule from the string.
				// Get the rule's FindPatternRoot as the branch to paste.

				TextReader oTextReader = new StringReader(sString);
				RuleReader oRuleReader = new RuleReader(oTextReader);
				if (oRuleReader.Read())
				{
					oSyntaxBranchToPaste = oRuleReader.FindPatternRoot;
				}
				oRuleReader.Close();
			}
			catch (Exception oException)
			{
				string sCaption = "Paste";
				string sMessage = "Cannot paste because "
					+ "the clipboard data is not compatible."
					+ Environment.NewLine + Environment.NewLine
					+ "(" + oException.Message  + ")";
				MessageBox.Show(sMessage,sCaption,MessageBoxButtons.OK,
					MessageBoxIcon.Warning);
				return;
			}

			//**************************************************************
			// Return (without reporting an error) if the branch to paste
			// (from the string data) is null.

			if (oSyntaxBranchToPaste == null)
			{
				return;
			}

			//**************************************************************
			// If the displayed tree is a find pattern or a replace pattern,
			// the labels of the new nodes should all be unique.

			if ((DisplayFindPattern) || (DisplayReplacePattern))
			{
				//**********************************************************
				// Collect all the node labels in the current tree. Then go
				// through the new branch and make sure all the nodes have
				// labels that are not already in use.

				SyntaxNode oSyntaxRoot = CloneTree();
				if (oSyntaxRoot != null)
				{
					StringCollection oLabelsInUse = new StringCollection();
					CollectLabelsInUse(oSyntaxRoot,oLabelsInUse);
					RenameLabelsInUse(oSyntaxBranchToPaste,oLabelsInUse);
				}
			}

			//**************************************************************
			// Call BeginUpdate() to disable redrawing the tree, but not if
			// redrawing was already disabled by the calling code.

			bool bCallEndUpdate = false;
			if (! IsUpdating)
			{
				BeginUpdate();
				bCallEndUpdate = true;
			}

			//**************************************************************
			// If the root node is null or empty, paste a new tree.
			// Otherwise, paste a new child of the selected node.

			if (NodeIsNullOrEmpty(moTreeViewer.RootNode))
			{
				//**********************************************************
				// Paste the branch as the root of the tree. Select the new
				// root node.

				moTreeViewer.RootNode = new TreeViewerNode();
				PopulateBranch(moTreeViewer.RootNode,oSyntaxBranchToPaste);
				moTreeViewer.SelectedNode = moTreeViewer.RootNode;
			}
			else
			{
				//**********************************************************
				// Paste the branch as a child of the selected node. Select
				// the new child node that was pasted.

				if (moTreeViewer.SelectedNode != null)
				{
					//******************************************************
					// The entire branch dominated by the selected node will
					// be repopulated. (This is because we want the pasted
					// branch to be displayed, even if ShowMorphology is
					// false and we are pasting a new morphology child of a
					// leaf node).
					//
					// First, clone the entire branch dominated by the
					// selected node. Delete the children of the selected
					// node in the tree.

					SyntaxNode oSyntaxParent
						= CloneBranch(moTreeViewer.SelectedNode);
					moTreeViewer.SelectedNode.ChildNodes.Clear();

					//******************************************************
					// Add the oSyntaxBranchToPaste as a child of the cloned
					// branch. Then use the cloned branch to repopulate the
					// branch in the tree dominated by the selected node.
					//
					// The oTreeTransfer.CurrentParseTreeNode is set to the
					// oSyntaxBranchToPaste, so this new child will be the
					// new selected node (even if it is a morphology node
					// and ShowMorphology is false).

					oSyntaxParent.ChildNodes.Add(oSyntaxBranchToPaste);
					TreeTransfer oTreeTransfer = new TreeTransfer();
					oTreeTransfer.CurrentParseTreeNode
						= oSyntaxBranchToPaste;
					PopulateBranch(moTreeViewer.SelectedNode,oSyntaxParent,
						oTreeTransfer);
				}
			}

			//**************************************************************
			// Call EndUpdate() to redraw the tree, but not if redrawing was
			// already disabled by the calling code.

			if (bCallEndUpdate)
			{
				EndUpdate();
			}

			//**************************************************************
			// Set the Modified property to true and raise the TreeChanged
			// event.

			Modified = true;
			OnTreeChanged(new EventArgs());
		}
		#endregion
		//******************************************************************
		#region [Delete() and CanDelete() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection can be deleted. Returns
		/// false otherwise.
		/// </summary>
		public bool CanDelete()
		{
			if (! ReadOnly)
			{
				if (moTreeViewer.SelectedNode != null)
				{
					return true;
				}
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Deletes the current selection.
		/// </summary>
		public void Delete()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanDelete())
			{
				string sMessage = "Invalid state: "
					+ "A call to ParseTreeViewer.Delete() is not allowed "
					+ "if ParseTreeViewer.CanDelete() returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Prevent modification to a read-only tree.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Use the current contents of the tree (before the delete
			// operation) to set the undo information.

			TreeTransferForUndo = RecreateTreeTransfer();

			//**************************************************************
			// Call BeginUpdate() to disable redrawing the tree, but not if
			// redrawing was already disabled by the calling code.

			bool bCallEndUpdate = false;
			if (! IsUpdating)
			{
				BeginUpdate();
				bCallEndUpdate = true;
			}

			//**************************************************************
			// Delete the branch dominated by the selected node.

			if (moTreeViewer.SelectedNode != null)
			{
				if (moTreeViewer.SelectedNode == moTreeViewer.RootNode)
				{
					//******************************************************
					// The selected node is the root node.
					//
					// Replace the root node with an empty node. Select the
					// new root node.

					moTreeViewer.RootNode = new TreeViewerNode();
					SyntaxNode oSyntaxNode = new SyntaxNode();
					PopulateBranch(moTreeViewer.RootNode,oSyntaxNode);
					moTreeViewer.SelectedNode = moTreeViewer.RootNode;
				}
				else
				{
					//******************************************************
					// The selected node is not the root node.
					//
					// Remove the selected node. Select the parent of the
					// removed node.

					TreeViewerNode oTreeParent
						= moTreeViewer.SelectedNode.ParentNode;
					if (oTreeParent != null)
					{
						oTreeParent.ChildNodes
							.Remove(moTreeViewer.SelectedNode);
						moTreeViewer.SelectedNode = oTreeParent;
					}
				}
			}

			//**************************************************************
			// Call EndUpdate() to redraw the tree, but not if redrawing was
			// already disabled by the calling code.

			if (bCallEndUpdate)
			{
				EndUpdate();
			}

			//**************************************************************
			// Set the Modified property to true and raise the TreeChanged
			// event.

			Modified = true;
			OnTreeChanged(new EventArgs());
		}
		#endregion
		//******************************************************************
		#region [OpenFeatures() and CanOpenFeatures() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the current selection is a node whose syntax
		/// features can be displayed in the FeaturesForm. Returns false
		/// otherwise.
		/// </summary>
		public bool CanOpenFeatures()
		{
			if (moTreeViewer.SelectedNode != null)
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Opens the FeaturesForm to display the syntax features of the
		/// selected node.
		/// </summary>
		public void OpenFeatures()
		{
			//**************************************************************
			// Validate the current state.

			if (! CanOpenFeatures())
			{
				string sMessage = "Invalid state: "
					+ "A call to ParseTreeViewer.OpenFeatures() is not "
					+ "allowed if ParseTreeViewer.CanOpenFeatures() "
					+ "returns false.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Clone the selected branch.
			//
			// We clone the entire branch dominated by the selected node so
			// we can repopulate this entire branch if the node's features
			// are changed. (We need to do this because the user could edit
			// the node-type feature, which determines if the node is a leaf
			// node whose morphology children might be hidden.)

			TreeViewerNode oTreeNode = moTreeViewer.SelectedNode;
			TreeTransfer oTreeTransfer = new TreeTransfer();
			SyntaxNode oSyntaxNode = CloneBranch(oTreeNode,oTreeTransfer);

			//**************************************************************
			// Set the font for displaying features in the FeaturesForm to
			// the same font that this control uses to display parse trees.

			FeaturesForm.FeatureFont = Font;

			//**************************************************************
			// Open the FeaturesForm to display the features of the selected
			// node. (If ReadOnly is true, the user can view the features.
			// If ReadOnly is false, the user can also edit the features.)

			DialogResult iResult = DialogResult.None;
			if (ReadOnly)
			{
				iResult = FeaturesForm.OpenFeaturesReadOnly(oSyntaxNode);
			}
			else
			{
				iResult = FeaturesForm.OpenFeatures(oSyntaxNode);
			}

			//**************************************************************
			// Return without making any changes if the user canceled out of
			// the FeaturesForm.

			if (iResult != DialogResult.OK)
			{
				return;
			}

			//**************************************************************
			// Clear the undo information.

			TreeTransferForUndo = null;

			//**************************************************************
			// Determine if the FeaturesForm.FavoriteTreeFeatures list is
			// now different from the private FavoriteTreeFeatures copy of
			// the list. (If so, we will need to refresh the whole tree to
			// show the new set of features.)

			bool bTreeFeaturesChanged = false;
			if (FavoriteTreeFeatures.Count
				== FeaturesForm.FavoriteTreeFeatures.Count)
			{
				for (int iIndex = 0;
					iIndex < FavoriteTreeFeatures.Count; ++iIndex)
				{
					if (FavoriteTreeFeatures[iIndex]
						!= FeaturesForm.FavoriteTreeFeatures[iIndex])
					{
						bTreeFeaturesChanged = true;
					}
				}
			}
			else
			{
				bTreeFeaturesChanged = true;
			}

			//**************************************************************
			// Call BeginUpdate() to disable redrawing the tree, but not if
			// redrawing was already disabled by the calling code.

			bool bCallEndUpdate = false;
			if (! IsUpdating)
			{
				BeginUpdate();
				bCallEndUpdate = true;
			}

			//**************************************************************
			// Update the selected node. (But not if ReadOnly is true.)

			if (! ReadOnly)
			{
				//**********************************************************
				// Repopulate the entire branch dominated by the selected
				// node.
				//
				// First, delete the children of the selected node in the
				// tree. Then repopulate the branch to display any changes
				// to the features of the selected node (and any changes to
				// whether its children are hidden).

				oTreeNode.ChildNodes.Clear();
				PopulateBranch(oTreeNode,oSyntaxNode,oTreeTransfer);
			}

			//**************************************************************
			// If the FeaturesForm.FavoriteTreeFeatures list was changed,
			// refresh the whole tree to show the new set of features.

			if (bTreeFeaturesChanged)
			{
				oTreeTransfer = RecreateTreeTransfer();
				PopulateRoot(oTreeTransfer);
			}

			//**************************************************************
			// Call EndUpdate() to redraw the tree, but not if redrawing was
			// already disabled by the calling code.

			if (bCallEndUpdate)
			{
				EndUpdate();
			}

			//**************************************************************
			// Set the Modified property to true and raise the TreeChanged
			// event. (But not if ReadOnly is true.)

			if (! ReadOnly)
			{
				Modified = true;
				OnTreeChanged(new EventArgs());
			}
		}
		#endregion
		//******************************************************************
		#region [BranchContainsSelectionOrHighlight() Method]
		//******************************************************************
		/// <summary>
		/// Returns true if the specified tree branch (dominated by
		/// oSyntaxNode) contains a node to be selected or highlighted (as
		/// indicated by the CurrentParseTreeNode, MatchingNodes and
		/// ReplacedNodes properties of the given oTreeTransfer object).
		/// Returns false otherwise.
		/// </summary>
		private bool BranchContainsSelectionOrHighlight(
			SyntaxNode oSyntaxNode,TreeTransfer oTreeTransfer)
		{
			Debug.Assert(oSyntaxNode != null);
			Debug.Assert(oTreeTransfer != null);

			//**************************************************************
			// Use the oTreeTransfer.CurrentParseTreeNode property to
			// determine if this node is selected.

			if (oSyntaxNode == oTreeTransfer.CurrentParseTreeNode)
			{
				return true;
			}

			//**************************************************************
			// Use the oTreeTransfer.MatchingNodes and .ReplacedNodes
			// collections to determine if this node is highlighted.

			foreach (SyntaxNodePair oNodePair in
				oTreeTransfer.MatchingNodes)
			{
				if (oSyntaxNode == oNodePair.ParseTreeNode)
				{
					return true;
				}
			}
			foreach (SyntaxNodeTriple oNodeTriple in
				oTreeTransfer.ReplacedNodes)
			{
				if (oSyntaxNode == oNodeTriple.ParseTreeNode)
				{
					return true;
				}
			}

			//**************************************************************
			// Search the child branches recursively.

			foreach (SyntaxNode oSyntaxChild in oSyntaxNode.ChildNodes)
			{
				if (BranchContainsSelectionOrHighlight(
					oSyntaxChild,oTreeTransfer))
				{
					return true;
				}
			}
			return false;
		}
		#endregion
		//******************************************************************
		#region [NodeIsNullOrEmpty() Method]
		//******************************************************************
		/// <summary>
		/// Returns true if the given oTreeNode is null. Also returns true
		/// if the given oTreeNode has no children and its associated
		/// SyntaxNode has no features and no children. Otherwise, false is
		/// returned.
		/// </summary>
		private bool NodeIsNullOrEmpty(TreeViewerNode oTreeNode)
		{
			if (oTreeNode == null)
			{
				return true;
			}
			if (oTreeNode.ChildNodes.Count == 0)
			{
				SyntaxNode oSyntaxNode = CloneNode(oTreeNode);
				if ((oSyntaxNode.Features.Count == 0)
					&& (oSyntaxNode.ChildNodes.Count == 0))
				{
					return true;
				}
			}
			return false;
		}
		#endregion
		//******************************************************************
		#region [CollectLabelsInUse() and RenameLabelsInUse() Methods]
		//******************************************************************
		/// <summary>
		/// Recursively traverses the tree dominated by the indicated
		/// oSyntaxNode and adds the label string from each node to the
		/// given oLabelsInUse collection.
		/// </summary>
		private void CollectLabelsInUse(SyntaxNode oSyntaxNode,
			StringCollection oLabelsInUse)
		{
			Debug.Assert(oSyntaxNode != null);
			Debug.Assert(oLabelsInUse != null);

			//**************************************************************
			// Add the node's label to the oLabelsInUse collection.

			oLabelsInUse.Add(oSyntaxNode.Label);

			//**************************************************************
			// Recursively traverse each child branch.

			foreach (SyntaxNode oSyntaxChild in oSyntaxNode.ChildNodes)
			{
				CollectLabelsInUse(oSyntaxChild,oLabelsInUse);
			}
		}
		//******************************************************************
		/// <summary>
		/// Recursively traverses the tree dominated by the indicated
		/// oSyntaxNode, making sure each node has a label that is not
		/// already in the given oLabelsInUse collection. If necessary, node
		/// labels are renamed to make them unique. Each node label is added
		/// to the oLabelsInUse collection as nodes are traversed.
		/// </summary>
		private void RenameLabelsInUse(SyntaxNode oSyntaxNode,
			StringCollection oLabelsInUse)
		{
			Debug.Assert(oSyntaxNode != null);
			Debug.Assert(oLabelsInUse != null);

			//**************************************************************
			// Check if the node's label already exists in the oLabelsInUse
			// collection. If so, change the label to a new string
			// consisting of the node's category string followed by the "#"
			// character and a number (for example: "NP#2"). Keep
			// incrementing the number, until the node's label is not found
			// in the oLabelsInUse collection.

			int iNumber = 1;
			while (oLabelsInUse.Contains(oSyntaxNode.Label))
			{
				++iNumber;
				string sLabel = oSyntaxNode.Category
					+ "#" + iNumber.ToString();
				if (oSyntaxNode.IsOptionalNode)
				{
					//******************************************************
					// If the node is optional, make sure its new label
					// indicates that it is optional by enclosing the new
					// label string in parenthesis (for example: "(NP#2)").

					sLabel = TreeTranEngineString.LeftParenthesis + sLabel
						+ TreeTranEngineString.RightParenthesis;
				}
				oSyntaxNode.Features[TreeTranEngineString.NodeLabel]
					= sLabel;
			}

			//**************************************************************
			// Add the node's label to the oLabelsInUse collection.

			oLabelsInUse.Add(oSyntaxNode.Label);

			//**************************************************************
			// Recursively traverse each child branch.

			foreach (SyntaxNode oSyntaxChild in oSyntaxNode.ChildNodes)
			{
				RenameLabelsInUse(oSyntaxChild,oLabelsInUse);
			}
		}
		#endregion
		//******************************************************************
		#region [FilterFeatures() Method]
		//******************************************************************
		/// <summary>
		/// Recursively traverses the tree dominated by the indicated
		/// oSyntaxNode, removing all node features with names that do not
		/// appear in the given oFeatureNames collection.
		/// </summary>
		private void FilterFeatures(SyntaxNode oSyntaxNode,
			StringCollection oFeatureNames)
		{
			Debug.Assert(oSyntaxNode != null);
			Debug.Assert(oFeatureNames != null);

			//**************************************************************
			// Create a filtered-features collection.

			SyntaxFeatureCollection oFilteredFeatures
				= new SyntaxFeatureCollection();

			//**************************************************************
			// Always copy the node's label feature to the filtered-features
			// collection.

			oFilteredFeatures[TreeTranEngineString.NodeLabel]
				= oSyntaxNode.Label;

			//**************************************************************
			// For each feature name in the oFeatureNames collection, copy
			// the named feature (if it exists) from the node to the
			// filtered-features collection. (The features are copied in the
			// same order that the names appear in oFeaturesNames.)

			foreach (string sName in oFeatureNames)
			{
				if (oSyntaxNode.Features.Contains(sName))
				{
					string sValue = oSyntaxNode.Features[sName];
					oFilteredFeatures[sName] = sValue;
				}
			}

			//**************************************************************
			// Clear the node's features, and then copy all the features
			// from the filtered-features collection back to the node.

			oSyntaxNode.Features.Clear();
			foreach (SyntaxFeature oFeature in oFilteredFeatures)
			{
				string sName = oFeature.Name;
				string sValue = oFeature.Value;
				oSyntaxNode.Features[sName] = sValue;
			}

			//**************************************************************
			// Recursively traverse each child branch, filtering features.

			foreach (SyntaxNode oSyntaxChild in oSyntaxNode.ChildNodes)
			{
				FilterFeatures(oSyntaxChild,oFeatureNames);
			}
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
				ShowException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Raises the SelectionChanged event.
		/// </summary>
		private void moTreeViewer_SelectionChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				OnSelectionChanged(oArgs);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [TreeChanged Event]
		//******************************************************************
		/// <summary>
		/// Occurs when the tree contents change.
		/// </summary>
		public event EventHandler TreeChanged;
		//******************************************************************
		/// <summary>
		/// Raises the TreeChanged event.
		/// </summary>
		protected virtual void OnTreeChanged(EventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (TreeChanged != null)
				{
					TreeChanged(this,oArgs);
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Menu Popup Event Handler]
		//******************************************************************
		/// <summary>
		/// Enables the context-menu items that are appropriate for the
		/// current state and selection.
		/// </summary>
		private void moMenu_Popup(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Disable all menu items.

				moUndoMenu.Enabled = false;
				moCutMenu.Enabled = false;
				moCopyMenu.Enabled = false;
				moPasteMenu.Enabled = false;
				moDeleteMenu.Enabled = false;
				moFeaturesMenu.Enabled = false;

				//**********************************************************
				// Enable menu items that are appropriate for the current
				// state and selection.

				moUndoMenu.Enabled = CanUndo();
				moCutMenu.Enabled = CanCut();
				moCopyMenu.Enabled = CanCopy();
				moPasteMenu.Enabled = CanPaste();
				moDeleteMenu.Enabled = CanDelete();
				moFeaturesMenu.Enabled = CanOpenFeatures();
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [UndoMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Undoes the last edit operation.
		/// </summary>
		private void moUndoMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Undo();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [CutMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Cuts the current selection to the clipboard.
		/// </summary>
		private void moCutMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Cut();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [CopyMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Copies the current selection to the clipboard.
		/// </summary>
		private void moCopyMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Copy();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [PasteMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Pastes the current contents of the clipboard.
		/// </summary>
		private void moPasteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Paste();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [DeleteMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Deletes the current selection.
		/// </summary>
		private void moDeleteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				Delete();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FeaturesMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Opens the FeaturesForm to display the syntax features of the
		/// selected node.
		/// </summary>
		private void moFeaturesMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				OpenFeatures();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [TreeViewer DoubleClick Event Handler]
		//******************************************************************
		/// <summary>
		/// Opens the FeaturesForm to display the syntax features of the
		/// selected node.
		/// </summary>
		private void moTreeViewer_DoubleClick(object oSender,
			EventArgs oArgs)
		{
			try
			{
				if (CanOpenFeatures())
				{
					OpenFeatures();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OnFontChanged() Method]
		//******************************************************************
		/// <summary>
		/// Refreshes the displayed tree using the new font.
		/// </summary>
		protected override void OnFontChanged(EventArgs oArgs)
		{
			try
			{
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
				// Refresh the tree to display in the new font (without
				// changing the Modified property, raising the TreeChanged
				// event or clearing the undo information).
				//
				// Note that the base.OnFontChanged() method is not called,
				// so no unwanted font changes will result from the
				// ParentFontChanged events that would have been raised.

				TreeTransfer oTreeTransfer = RecreateTreeTransfer();
				PopulateRoot(oTreeTransfer);

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
				ShowException(oException);
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
