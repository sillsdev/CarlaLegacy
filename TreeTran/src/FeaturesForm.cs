//**************************************************************************
// File: "TreeTran\FeaturesForm.cs".
//
// This file defines the FeaturesForm class, which implements a form that
// allows the user to view and edit the list of features on a node in a
// parse tree or transfer rule.
//
// History:
//     2007-Feb-15 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using Microsoft.Win32;
using TreeTranEngine;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Implements a form that allows the user to view and edit the list of
	/// features on a node in a parse tree or transfer rule.
	/// </summary>
	public class FeaturesForm: System.Windows.Forms.Form
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		private System.Windows.Forms.ListView moListView;
		private System.Windows.Forms.ColumnHeader moNameColumn;
		private System.Windows.Forms.ColumnHeader moValueColumn;
		private System.Windows.Forms.Button moOKButton;
		private System.Windows.Forms.Button moCancelButton;
		private System.Windows.Forms.Button moDeleteButton;
		private System.Windows.Forms.Label moNameLabel;
		private System.Windows.Forms.TextBox moNameTextBox;
		private System.Windows.Forms.Label moValueLabel;
		private System.Windows.Forms.TextBox moValueTextBox;
		private System.Windows.Forms.TextBox moLabelTextBox;
		private System.Windows.Forms.Label moLabelLabel;
		private System.Windows.Forms.Button moPlusButton;
		private System.Windows.Forms.Button moMinusButton;
		private System.Windows.Forms.Label moFilterLabel;
		private System.Windows.Forms.TextBox moFilterTextBox;
		private System.Windows.Forms.CheckBox moShowFavoritesOnlyCheckBox;
		private System.Windows.Forms.CheckBox moShowAllFavoritesCheckBox;
		private System.Windows.Forms.Button moMoreOptionsButton;
		private System.Windows.Forms.CheckBox moShowInTreeCheckBox;
		private System.Windows.Forms.CheckBox moCopyFavoritesOnlyCheckBox;
		private System.Windows.Forms.CheckBox moOptionalNodeCheckBox;
		private System.Windows.Forms.ColumnHeader moFavoriteColumn;
		private System.Windows.Forms.ContextMenu moMenu;
		private System.Windows.Forms.MenuItem moCutMenu;
		private System.Windows.Forms.MenuItem moCopyMenu;
		private System.Windows.Forms.MenuItem moPasteMenu;
		private System.Windows.Forms.MenuItem moDeleteMenu;
		private System.Windows.Forms.MenuItem moSelectAllSeparator;
		private System.Windows.Forms.MenuItem moSelectAllMenu;
		private System.Windows.Forms.CheckBox moFavoriteInListCheckBox;
		private System.Windows.Forms.Panel moPanel;
		private System.ComponentModel.Container components = null;

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

		#region Windows Form Designer generated code
		// <summary>
		// Required method for Designer support - do not modify
		// the contents of this method with the code editor.
		// </summary>
		private void InitializeComponent()
		{
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(FeaturesForm));
			this.moListView = new System.Windows.Forms.ListView();
			this.moNameColumn = new System.Windows.Forms.ColumnHeader();
			this.moValueColumn = new System.Windows.Forms.ColumnHeader();
			this.moFavoriteColumn = new System.Windows.Forms.ColumnHeader();
			this.moMenu = new System.Windows.Forms.ContextMenu();
			this.moCutMenu = new System.Windows.Forms.MenuItem();
			this.moCopyMenu = new System.Windows.Forms.MenuItem();
			this.moPasteMenu = new System.Windows.Forms.MenuItem();
			this.moDeleteMenu = new System.Windows.Forms.MenuItem();
			this.moSelectAllSeparator = new System.Windows.Forms.MenuItem();
			this.moSelectAllMenu = new System.Windows.Forms.MenuItem();
			this.moOKButton = new System.Windows.Forms.Button();
			this.moCancelButton = new System.Windows.Forms.Button();
			this.moDeleteButton = new System.Windows.Forms.Button();
			this.moNameLabel = new System.Windows.Forms.Label();
			this.moNameTextBox = new System.Windows.Forms.TextBox();
			this.moValueLabel = new System.Windows.Forms.Label();
			this.moValueTextBox = new System.Windows.Forms.TextBox();
			this.moLabelTextBox = new System.Windows.Forms.TextBox();
			this.moLabelLabel = new System.Windows.Forms.Label();
			this.moOptionalNodeCheckBox = new System.Windows.Forms.CheckBox();
			this.moPlusButton = new System.Windows.Forms.Button();
			this.moMinusButton = new System.Windows.Forms.Button();
			this.moFilterLabel = new System.Windows.Forms.Label();
			this.moFilterTextBox = new System.Windows.Forms.TextBox();
			this.moShowFavoritesOnlyCheckBox = new System.Windows.Forms.CheckBox();
			this.moShowAllFavoritesCheckBox = new System.Windows.Forms.CheckBox();
			this.moFavoriteInListCheckBox = new System.Windows.Forms.CheckBox();
			this.moShowInTreeCheckBox = new System.Windows.Forms.CheckBox();
			this.moCopyFavoritesOnlyCheckBox = new System.Windows.Forms.CheckBox();
			this.moMoreOptionsButton = new System.Windows.Forms.Button();
			this.moPanel = new System.Windows.Forms.Panel();
			this.SuspendLayout();
			//
			// moListView
			//
			this.moListView.Anchor = (((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
				| System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						 this.moNameColumn,
																						 this.moValueColumn,
																						 this.moFavoriteColumn});
			this.moListView.ContextMenu = this.moMenu;
			this.moListView.FullRowSelect = true;
			this.moListView.GridLines = true;
			this.moListView.HideSelection = false;
			this.moListView.Location = new System.Drawing.Point(8, 72);
			this.moListView.Name = "moListView";
			this.moListView.Size = new System.Drawing.Size(512, 232);
			this.moListView.TabIndex = 0;
			this.moListView.View = System.Windows.Forms.View.Details;
			this.moListView.Resize += new System.EventHandler(this.moListView_Resize);
			this.moListView.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.moListView_KeyPress);
			this.moListView.DoubleClick += new System.EventHandler(this.moListView_DoubleClick);
			this.moListView.SelectedIndexChanged += new System.EventHandler(this.moListView_SelectedIndexChanged);
			//
			// moNameColumn
			//
			this.moNameColumn.Text = "Name";
			this.moNameColumn.Width = 184;
			//
			// moValueColumn
			//
			this.moValueColumn.Text = "Value";
			this.moValueColumn.Width = 184;
			//
			// moFavoriteColumn
			//
			this.moFavoriteColumn.Text = "Favorite";
			this.moFavoriteColumn.Width = 124;
			//
			// moMenu
			//
			this.moMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
																				   this.moCutMenu,
																				   this.moCopyMenu,
																				   this.moPasteMenu,
																				   this.moDeleteMenu,
																				   this.moSelectAllSeparator,
																				   this.moSelectAllMenu});
			//
			// moCutMenu
			//
			this.moCutMenu.Index = 0;
			this.moCutMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlX;
			this.moCutMenu.Text = "Cu&t";
			this.moCutMenu.Click += new System.EventHandler(this.moCutMenu_Click);
			//
			// moCopyMenu
			//
			this.moCopyMenu.Index = 1;
			this.moCopyMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlC;
			this.moCopyMenu.Text = "&Copy";
			this.moCopyMenu.Click += new System.EventHandler(this.moCopyMenu_Click);
			//
			// moPasteMenu
			//
			this.moPasteMenu.Index = 2;
			this.moPasteMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlV;
			this.moPasteMenu.Text = "&Paste";
			this.moPasteMenu.Click += new System.EventHandler(this.moPasteMenu_Click);
			//
			// moDeleteMenu
			//
			this.moDeleteMenu.Index = 3;
			this.moDeleteMenu.Shortcut = System.Windows.Forms.Shortcut.Del;
			this.moDeleteMenu.Text = "&Delete";
			this.moDeleteMenu.Click += new System.EventHandler(this.moDeleteMenu_Click);
			//
			// moSelectAllSeparator
			//
			this.moSelectAllSeparator.Index = 4;
			this.moSelectAllSeparator.Text = "-";
			//
			// moSelectAllMenu
			//
			this.moSelectAllMenu.Index = 5;
			this.moSelectAllMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlA;
			this.moSelectAllMenu.Text = "Select &All";
			this.moSelectAllMenu.Click += new System.EventHandler(this.moSelectAllMenu_Click);
			//
			// moOKButton
			//
			this.moOKButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			this.moOKButton.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.moOKButton.Location = new System.Drawing.Point(368, 376);
			this.moOKButton.Name = "moOKButton";
			this.moOKButton.Size = new System.Drawing.Size(72, 23);
			this.moOKButton.TabIndex = 11;
			this.moOKButton.Text = "OK";
			this.moOKButton.Click += new System.EventHandler(this.moOKButton_Click);
			//
			// moCancelButton
			//
			this.moCancelButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			this.moCancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.moCancelButton.Location = new System.Drawing.Point(448, 376);
			this.moCancelButton.Name = "moCancelButton";
			this.moCancelButton.Size = new System.Drawing.Size(72, 23);
			this.moCancelButton.TabIndex = 12;
			this.moCancelButton.Text = "Cancel";
			//
			// moDeleteButton
			//
			this.moDeleteButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			this.moDeleteButton.Location = new System.Drawing.Point(448, 312);
			this.moDeleteButton.Name = "moDeleteButton";
			this.moDeleteButton.Size = new System.Drawing.Size(72, 23);
			this.moDeleteButton.TabIndex = 5;
			this.moDeleteButton.Text = "&Delete";
			this.moDeleteButton.Click += new System.EventHandler(this.moDeleteButton_Click);
			//
			// moNameLabel
			//
			this.moNameLabel.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left);
			this.moNameLabel.Location = new System.Drawing.Point(8, 312);
			this.moNameLabel.Name = "moNameLabel";
			this.moNameLabel.Size = new System.Drawing.Size(48, 23);
			this.moNameLabel.TabIndex = 1;
			this.moNameLabel.Text = "&Name:";
			this.moNameLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			//
			// moNameTextBox
			//
			this.moNameTextBox.Anchor = ((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moNameTextBox.Location = new System.Drawing.Point(56, 312);
			this.moNameTextBox.Name = "moNameTextBox";
			this.moNameTextBox.Size = new System.Drawing.Size(384, 20);
			this.moNameTextBox.TabIndex = 2;
			this.moNameTextBox.Text = "";
			this.moNameTextBox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.moNameTextBox_KeyDown);
			this.moNameTextBox.TextChanged += new System.EventHandler(this.moNameTextBox_TextChanged);
			this.moNameTextBox.Leave += new System.EventHandler(this.moNameTextBox_Leave);
			//
			// moValueLabel
			//
			this.moValueLabel.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left);
			this.moValueLabel.Location = new System.Drawing.Point(8, 344);
			this.moValueLabel.Name = "moValueLabel";
			this.moValueLabel.Size = new System.Drawing.Size(48, 23);
			this.moValueLabel.TabIndex = 3;
			this.moValueLabel.Text = "&Value:";
			this.moValueLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			//
			// moValueTextBox
			//
			this.moValueTextBox.Anchor = ((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moValueTextBox.Location = new System.Drawing.Point(56, 344);
			this.moValueTextBox.Name = "moValueTextBox";
			this.moValueTextBox.Size = new System.Drawing.Size(384, 20);
			this.moValueTextBox.TabIndex = 4;
			this.moValueTextBox.Text = "";
			this.moValueTextBox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.moValueTextBox_KeyDown);
			this.moValueTextBox.TextChanged += new System.EventHandler(this.moValueTextBox_TextChanged);
			this.moValueTextBox.Leave += new System.EventHandler(this.moValueTextBox_Leave);
			this.moValueTextBox.Enter += new System.EventHandler(this.moValueTextBox_Enter);
			//
			// moLabelTextBox
			//
			this.moLabelTextBox.Anchor = ((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moLabelTextBox.Location = new System.Drawing.Point(56, 8);
			this.moLabelTextBox.Name = "moLabelTextBox";
			this.moLabelTextBox.Size = new System.Drawing.Size(176, 20);
			this.moLabelTextBox.TabIndex = 14;
			this.moLabelTextBox.Text = "";
			this.moLabelTextBox.TextChanged += new System.EventHandler(this.moLabelTextBox_TextChanged);
			//
			// moLabelLabel
			//
			this.moLabelLabel.Location = new System.Drawing.Point(8, 8);
			this.moLabelLabel.Name = "moLabelLabel";
			this.moLabelLabel.Size = new System.Drawing.Size(48, 23);
			this.moLabelLabel.TabIndex = 13;
			this.moLabelLabel.Text = "&Label:";
			this.moLabelLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			//
			// moOptionalNodeCheckBox
			//
			this.moOptionalNodeCheckBox.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			this.moOptionalNodeCheckBox.Location = new System.Drawing.Point(248, 8);
			this.moOptionalNodeCheckBox.Name = "moOptionalNodeCheckBox";
			this.moOptionalNodeCheckBox.Size = new System.Drawing.Size(112, 24);
			this.moOptionalNodeCheckBox.TabIndex = 15;
			this.moOptionalNodeCheckBox.Text = "&Optional node";
			this.moOptionalNodeCheckBox.Click += new System.EventHandler(this.moOptionalNodeCheckBox_Click);
			//
			// moPlusButton
			//
			this.moPlusButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			this.moPlusButton.Location = new System.Drawing.Point(448, 344);
			this.moPlusButton.Name = "moPlusButton";
			this.moPlusButton.Size = new System.Drawing.Size(32, 23);
			this.moPlusButton.TabIndex = 6;
			this.moPlusButton.Text = "+";
			this.moPlusButton.Click += new System.EventHandler(this.moPlusButton_Click);
			//
			// moMinusButton
			//
			this.moMinusButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			this.moMinusButton.Location = new System.Drawing.Point(488, 344);
			this.moMinusButton.Name = "moMinusButton";
			this.moMinusButton.Size = new System.Drawing.Size(32, 23);
			this.moMinusButton.TabIndex = 7;
			this.moMinusButton.Text = "-";
			this.moMinusButton.Click += new System.EventHandler(this.moMinusButton_Click);
			//
			// moFilterLabel
			//
			this.moFilterLabel.Location = new System.Drawing.Point(8, 40);
			this.moFilterLabel.Name = "moFilterLabel";
			this.moFilterLabel.Size = new System.Drawing.Size(48, 23);
			this.moFilterLabel.TabIndex = 17;
			this.moFilterLabel.Text = "&Filter:";
			this.moFilterLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			//
			// moFilterTextBox
			//
			this.moFilterTextBox.Anchor = ((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moFilterTextBox.Location = new System.Drawing.Point(56, 40);
			this.moFilterTextBox.Name = "moFilterTextBox";
			this.moFilterTextBox.Size = new System.Drawing.Size(176, 20);
			this.moFilterTextBox.TabIndex = 18;
			this.moFilterTextBox.Text = "";
			this.moFilterTextBox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.moFilterTextBox_KeyDown);
			this.moFilterTextBox.TextChanged += new System.EventHandler(this.moFilterTextBox_TextChanged);
			this.moFilterTextBox.Leave += new System.EventHandler(this.moFilterTextBox_Leave);
			this.moFilterTextBox.Enter += new System.EventHandler(this.moFilterTextBox_Enter);
			//
			// moShowFavoritesOnlyCheckBox
			//
			this.moShowFavoritesOnlyCheckBox.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			this.moShowFavoritesOnlyCheckBox.Location = new System.Drawing.Point(248, 40);
			this.moShowFavoritesOnlyCheckBox.Name = "moShowFavoritesOnlyCheckBox";
			this.moShowFavoritesOnlyCheckBox.Size = new System.Drawing.Size(144, 24);
			this.moShowFavoritesOnlyCheckBox.TabIndex = 19;
			this.moShowFavoritesOnlyCheckBox.Text = "&Show favorites only";
			this.moShowFavoritesOnlyCheckBox.Click += new System.EventHandler(this.moShowFavoritesOnlyCheckBox_Click);
			//
			// moShowAllFavoritesCheckBox
			//
			this.moShowAllFavoritesCheckBox.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			this.moShowAllFavoritesCheckBox.Location = new System.Drawing.Point(392, 40);
			this.moShowAllFavoritesCheckBox.Name = "moShowAllFavoritesCheckBox";
			this.moShowAllFavoritesCheckBox.Size = new System.Drawing.Size(128, 24);
			this.moShowAllFavoritesCheckBox.TabIndex = 20;
			this.moShowAllFavoritesCheckBox.Text = "Show &all favorites";
			this.moShowAllFavoritesCheckBox.Click += new System.EventHandler(this.moShowAllFavoritesCheckBox_Click);
			//
			// moFavoriteInListCheckBox
			//
			this.moFavoriteInListCheckBox.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left);
			this.moFavoriteInListCheckBox.AutoCheck = false;
			this.moFavoriteInListCheckBox.Location = new System.Drawing.Point(8, 376);
			this.moFavoriteInListCheckBox.Name = "moFavoriteInListCheckBox";
			this.moFavoriteInListCheckBox.Size = new System.Drawing.Size(112, 24);
			this.moFavoriteInListCheckBox.TabIndex = 8;
			this.moFavoriteInListCheckBox.Text = "Favo&rite in list";
			this.moFavoriteInListCheckBox.Click += new System.EventHandler(this.moFavoriteInListCheckBox_Click);
			//
			// moShowInTreeCheckBox
			//
			this.moShowInTreeCheckBox.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left);
			this.moShowInTreeCheckBox.AutoCheck = false;
			this.moShowInTreeCheckBox.Location = new System.Drawing.Point(120, 376);
			this.moShowInTreeCheckBox.Name = "moShowInTreeCheckBox";
			this.moShowInTreeCheckBox.TabIndex = 9;
			this.moShowInTreeCheckBox.Text = "Show in &tree";
			this.moShowInTreeCheckBox.Click += new System.EventHandler(this.moShowInTreeCheckBox_Click);
			//
			// moCopyFavoritesOnlyCheckBox
			//
			this.moCopyFavoritesOnlyCheckBox.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left);
			this.moCopyFavoritesOnlyCheckBox.Location = new System.Drawing.Point(232, 376);
			this.moCopyFavoritesOnlyCheckBox.Name = "moCopyFavoritesOnlyCheckBox";
			this.moCopyFavoritesOnlyCheckBox.Size = new System.Drawing.Size(136, 24);
			this.moCopyFavoritesOnlyCheckBox.TabIndex = 10;
			this.moCopyFavoritesOnlyCheckBox.Text = "&Copy favorites only";
			//
			// moMoreOptionsButton
			//
			this.moMoreOptionsButton.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			this.moMoreOptionsButton.Location = new System.Drawing.Point(392, 8);
			this.moMoreOptionsButton.Name = "moMoreOptionsButton";
			this.moMoreOptionsButton.Size = new System.Drawing.Size(128, 23);
			this.moMoreOptionsButton.TabIndex = 16;
			this.moMoreOptionsButton.Text = "&More Options >>";
			this.moMoreOptionsButton.Click += new System.EventHandler(this.moMoreOptionsButton_Click);
			//
			// moPanel
			//
			this.moPanel.Anchor = ((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moPanel.Location = new System.Drawing.Point(0, 376);
			this.moPanel.Name = "moPanel";
			this.moPanel.Size = new System.Drawing.Size(528, 32);
			this.moPanel.TabIndex = 21;
			//
			// FeaturesForm
			//
			this.AcceptButton = this.moOKButton;
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.CancelButton = this.moCancelButton;
			this.ClientSize = new System.Drawing.Size(528, 406);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moListView,
																		  this.moFilterTextBox,
																		  this.moLabelTextBox,
																		  this.moOKButton,
																		  this.moShowAllFavoritesCheckBox,
																		  this.moCopyFavoritesOnlyCheckBox,
																		  this.moShowInTreeCheckBox,
																		  this.moCancelButton,
																		  this.moMinusButton,
																		  this.moPlusButton,
																		  this.moDeleteButton,
																		  this.moMoreOptionsButton,
																		  this.moFavoriteInListCheckBox,
																		  this.moShowFavoritesOnlyCheckBox,
																		  this.moFilterLabel,
																		  this.moOptionalNodeCheckBox,
																		  this.moLabelLabel,
																		  this.moValueLabel,
																		  this.moNameLabel,
																		  this.moPanel,
																		  this.moValueTextBox,
																		  this.moNameTextBox});
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.MinimumSize = new System.Drawing.Size(536, 344);
			this.Name = "FeaturesForm";
			this.ShowInTaskbar = false;
			this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Features";
			this.Closing += new System.ComponentModel.CancelEventHandler(this.FeaturesForm_Closing);
			this.Load += new System.EventHandler(this.FeaturesForm_Load);
			this.ResumeLayout(false);

		}
		#endregion
		#endregion
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The constructor is private. You can display the form by calling
		/// the static public OpenFeatures() method or the static public
		/// OpenFeaturesReadOnly() method.
		/// </summary>
		private FeaturesForm()
		{
			//**************************************************************
			// As required to support code generated by the Form Designer,
			// make InitializeComponent() the first call in the constructor.

			InitializeComponent();
		}
		#endregion
		//******************************************************************
		#region [Static OpenFeatures() and OpenFeaturesReadOnly() Methods]
		//******************************************************************
		/// <summary>
		/// Displays the Features form so the user can view and edit the
		/// features of the given SyntaxNode. The user can also modify the
		/// FavoriteListFeatures, FavoriteTreeFeatures and CopyFavoritesOnly
		/// settings. If the user clicks OK, the edits are saved to the
		/// SyntaxNode features, changes are saved to the settings, and
		/// DialogResult.OK is returned. Otherwise, DialogResult.Cancel is
		/// returned and any changes are discarded.
		/// </summary>
		public static DialogResult OpenFeatures(SyntaxNode oNode)
		{
			//**************************************************************
			// Validate the parameters.

			if (oNode == null)
			{
				string sMessage = "Invalid argument: "
					+ "FeaturesForm.OpenFeatures() requires "
					+ "a SyntaxNode object that is not null.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create an instance of the FeaturesForm.

			FeaturesForm oForm = new FeaturesForm();

			//**************************************************************
			// Set the form's ReadOnly property to false.

			oForm.ReadOnly = false;

			//**************************************************************
			// Set the form's DisplayedNode property to a copy of the node
			// specified by the oNode parameter.

			oForm.DisplayedNode = oNode.CloneNode();

			//**************************************************************
			// Show the form so the user can view and edit the features of
			// the DisplayedNode.

			DialogResult iResult = oForm.ShowDialog();

			//**************************************************************
			// If the user clicked OK, save the changes that the user made
			// to the features:
			//
			// Update the specified oNode by clearing its features and then
			// copying all the features from the form's DisplayedNode to the
			// oNode.Features collection.

			if (iResult == DialogResult.OK)
			{
				oNode.Features.Clear();
				foreach (SyntaxFeature oFeature in
					oForm.DisplayedNode.Features)
				{
					oNode.Features[oFeature.Name] = oFeature.Value;
				}
			}

			//**************************************************************
			// Return the dialog result.

			return iResult;
		}
		//******************************************************************
		/// <summary>
		/// Displays the Features form so the user can view (but not edit)
		/// the features of the given SyntaxNode. The user can also modify
		/// the FavoriteListFeatures, FavoriteTreeFeatures and
		/// CopyFavoritesOnly settings. If the user clicks OK, changes are
		/// saved to the settings, and DialogResult.OK is returned.
		/// Otherwise, DialogResult.Cancel is returned and any changes are
		/// discarded.
		/// </summary>
		public static DialogResult OpenFeaturesReadOnly(SyntaxNode oNode)
		{
			//**************************************************************
			// Validate the parameters.

			if (oNode == null)
			{
				string sMessage = "Invalid argument: "
					+ "FeaturesForm.OpenFeaturesReadOnly() requires "
					+ "a SyntaxNode object that is not null.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create an instance of the FeaturesForm.

			FeaturesForm oForm = new FeaturesForm();

			//**************************************************************
			// Set the form's ReadOnly property to true (the user is not
			// allowed to edit features).

			oForm.ReadOnly = true;

			//**************************************************************
			// Set the form's DisplayedNode property to a copy of the node
			// specified by the oNode parameter.

			oForm.DisplayedNode = oNode.CloneNode();

			//**************************************************************
			// Show the form so the user can view (but not edit) the
			// features of the DisplayedNode.

			DialogResult iResult = oForm.ShowDialog();

			//**************************************************************
			// Return the dialog result.

			return iResult;
		}
		#endregion
		//******************************************************************
		#region [Static FavoriteListFeatures Property]
		//******************************************************************
		/// <summary>
		/// The FavoriteListFeatures property value.
		/// </summary>
		private static StringCollection moFavoriteListFeatures = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of feature names that are displayed as
		/// favorites in the Features form. This collection also names the
		/// features that should be copied if the CopyFavoritesOnly property
		/// is true. (The collection is loaded from the registry and can be
		/// modified and saved to the registry by the Features form.)
		/// </summary>
		public static StringCollection FavoriteListFeatures
		{
			get
			{
				//**********************************************************
				// Make sure the saved settings (including the
				// FavoriteListFeatures collection) have been loaded from
				// the registry.

				LoadSettings();

				Debug.Assert(moFavoriteListFeatures != null);

				//**********************************************************
				// Return the FavoriteListFeatures collection.

				return moFavoriteListFeatures;
			}
		}
		#endregion
		//******************************************************************
		#region [Static FavoriteTreeFeatures Property]
		//******************************************************************
		/// <summary>
		/// The FavoriteTreeFeatures property value.
		/// </summary>
		private static StringCollection moFavoriteTreeFeatures = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of favorite feature names that should be
		/// displayed by the parse-tree viewer. (The collection is loaded
		/// from the registry and can be modified and saved to the registry
		/// by the Features form.)
		/// </summary>
		public static StringCollection FavoriteTreeFeatures
		{
			get
			{
				//**********************************************************
				// Make sure the saved settings (including the
				// FavoriteTreeFeatures collection) have been loaded from
				// the registry.

				LoadSettings();

				Debug.Assert(moFavoriteTreeFeatures != null);

				//**********************************************************
				// Return the FavoriteTreeFeatures collection.

				return moFavoriteTreeFeatures;
			}
		}
		#endregion
		//******************************************************************
		#region [Static CopyFavoritesOnly Property]
		//******************************************************************
		/// <summary>
		/// The CopyFavoritesOnly property value.
		/// </summary>
		private static bool mbCopyFavoritesOnly = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the CopyFavoritesOnly property, which is false if
		/// all parse-tree features should be copied, and true if only the
		/// favorite features (in the FavoriteListFeatures collection)
		/// should be copied. (The CopyFavoritesOnly value is loaded from
		/// the registry and can be modified and saved to the registry by
		/// the Features form.)
		/// </summary>
		public static bool CopyFavoritesOnly
		{
			set
			{
				//**********************************************************
				// Make sure the saved settings (including the
				// CopyFavoritesOnly value) have been loaded from the
				// registry.

				LoadSettings();

				//**********************************************************
				// Set the CopyFavoritesOnly value.

				mbCopyFavoritesOnly = value;
			}
			get
			{
				//**********************************************************
				// Make sure the saved settings (including the
				// CopyFavoritesOnly value) have been loaded from the
				// registry.

				LoadSettings();

				//**********************************************************
				// Return the CopyFavoritesOnly value.

				return mbCopyFavoritesOnly;
			}
		}
		#endregion
		//******************************************************************
		#region [Static LoadSettings() and SaveSettings() Methods]
		//******************************************************************
		/// <summary>
		/// Name of the registry key used for saving the settings.
		/// </summary>
		private const string msRegistryKey = "Software\\TreeTranViewer";
		//******************************************************************
		/// <summary>
		/// Name of the registry entry used to save the FavoriteListFeatures
		/// collection (as a tab-delimited list of feature names).
		/// </summary>
		private const string msFavoriteListFeaturesRegistryName
			= "FeatureForm.FavoriteListFeatures";
		//******************************************************************
		/// <summary>
		/// Name of the registry entry used to save the FavoriteTreeFeatures
		/// collection (as a tab-delimited list of feature names).
		/// </summary>
		private const string msFavoriteTreeFeaturesRegistryName
			= "FeatureForm.FavoriteTreeFeatures";
		//******************************************************************
		/// <summary>
		/// Name of the registry entry used to save the CopyFavoritesOnly
		/// value (as "true" or "false").
		/// </summary>
		private const string msCopyFavoritesOnlyRegistryName
			= "FeatureForm.CopyFavoritesOnly";
		//******************************************************************
		/// <summary>
		/// Contents of a registry entry representing a true value.
		/// </summary>
		private const string msTrueValue = "true";
		//******************************************************************
		/// <summary>
		/// Contents of a registry entry representing a false value.
		/// </summary>
		private const string msFalseValue = "false";
		//******************************************************************
		/// <summary>
		/// Loads the FavoriteListFeatures, FavoriteTreeFeatures and
		/// CopyFavoritesOnly settings from the registry, if these settings
		/// have not already been loaded.
		/// </summary>
		private static void LoadSettings()
		{
			//**************************************************************
			// Return if the settings have already been loaded.

			if ((moFavoriteListFeatures != null)
				&& (moFavoriteTreeFeatures != null))
			{
				return;
			}

			//**************************************************************
			// Initialize FavoriteListFeatures and FavoriteTreeFeatures as
			// empty string collections.

			moFavoriteListFeatures = new StringCollection();
			moFavoriteTreeFeatures = new StringCollection();

			//**************************************************************
			// Open or create the user's registry key for these settings.

			RegistryKey oKey = Registry.CurrentUser
				.CreateSubKey(msRegistryKey);

			//**************************************************************
			// Load the FavoriteListFeatures collection.

			object oValue
				= oKey.GetValue(msFavoriteListFeaturesRegistryName,"");
			if (oValue is string)
			{
				string sValue = (string) oValue;
				moFavoriteListFeatures = StringCollectionFromString(sValue);
			}

			//**************************************************************
			// Load the FavoriteTreeFeatures collection.

			oValue = oKey.GetValue(msFavoriteTreeFeaturesRegistryName,"");
			if (oValue is string)
			{
				string sValue = (string) oValue;
				moFavoriteTreeFeatures = StringCollectionFromString(sValue);
			}

			//**************************************************************
			// Load the CopyFavoritesOnly value.

			oValue = oKey.GetValue(msCopyFavoritesOnlyRegistryName,"");
			if (oValue is string)
			{
				string sValue = (string) oValue;
				if (sValue == msTrueValue)
				{
					CopyFavoritesOnly = true;
				}
				else
				{
					CopyFavoritesOnly = false;
				}
			}

			//**************************************************************
			// Close the registry key.

			oKey.Close();

			//**************************************************************
			// If either collection is empty, add a default set of feature
			// names.

			if (moFavoriteListFeatures.Count == 0)
			{
				moFavoriteListFeatures.Add(
					TreeTranEngineString.NodeType);
				moFavoriteListFeatures.Add(
					TreeTranEngineString.SyntaxCategory);
				moFavoriteListFeatures.Add(
					TreeTranEngineString.MorphemeCategory);
			}
			if (moFavoriteTreeFeatures.Count == 0)
			{
				moFavoriteTreeFeatures.Add(
					TreeTranEngineString.NodeType);
				moFavoriteTreeFeatures.Add(
					TreeTranEngineString.SyntaxCategory);
				moFavoriteTreeFeatures.Add(
					TreeTranEngineString.MorphemeCategory);
			}

			//**************************************************************
			// Make sure the FavoriteListFeatures collection is a superset
			// of the FavoriteTreeFeatures collection.

			foreach (string sName in moFavoriteTreeFeatures)
			{
				if (! moFavoriteListFeatures.Contains(sName))
				{
					moFavoriteListFeatures.Add(sName);
				}
			}
		}
		//******************************************************************
		/// <summary>
		/// Saves the FavoriteListFeatures, FavoriteTreeFeatures and
		/// CopyFavoritesOnly settings to the registry.
		/// </summary>
		private static void SaveSettings()
		{
			//**************************************************************
			// Open or create the user's registry key for these settings.

			RegistryKey oKey = Registry.CurrentUser
				.CreateSubKey(msRegistryKey);

			//**************************************************************
			// Save the FavoriteListFeatures collection.

			string sValue
				= StringFromStringCollection(FavoriteListFeatures);
			oKey.SetValue(msFavoriteListFeaturesRegistryName,sValue);

			//**************************************************************
			// Save the FavoriteTreeFeatures collection.

			sValue = StringFromStringCollection(FavoriteTreeFeatures);
			oKey.SetValue(msFavoriteTreeFeaturesRegistryName,sValue);

			//**************************************************************
			// Save the CopyFavoritesOnly value.

			if (CopyFavoritesOnly)
			{
				sValue = msTrueValue;
				oKey.SetValue(msCopyFavoritesOnlyRegistryName,sValue);
			}
			else
			{
				sValue = msFalseValue;
				oKey.SetValue(msCopyFavoritesOnlyRegistryName,sValue);
			}

			//**************************************************************
			// Close the registry key.

			oKey.Close();
		}
		#endregion
		//******************************************************************
		#region [Static StringCollectionFromString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a new string collection containing the feature names
		/// represented by the tab-delimited tokens in the given string.
		/// </summary>
		private static StringCollection StringCollectionFromString(
			string sTabDelimitedString)
		{
			Debug.Assert(sTabDelimitedString != null);

			//**************************************************************
			// Create a new string collection.

			StringCollection oStringCollection = new StringCollection();

			//**************************************************************
			// Remove each tab-delimited token from the given string, and
			// add the tokens to the string collection as feature names.

			while (sTabDelimitedString != "")
			{
				//**********************************************************
				// Get the first token from the string:
				//
				// If the string contains a tab character, the token is the
				// substring before the tab. Otherwise, the token is the
				// entire string.
				//
				// The token (and its delimiting tab, if any) is removed
				// from the string.

				string sToken = "";
				int iIndex = sTabDelimitedString.IndexOf("\t");
				if (iIndex >= 0)
				{
					sToken = sTabDelimitedString.Substring(0,iIndex);
					sTabDelimitedString
						= sTabDelimitedString.Remove(0,(iIndex + 1));
				}
				else
				{
					sToken = sTabDelimitedString;
					sTabDelimitedString = "";
				}

				//**********************************************************
				// Remove extraneous white-space characters from the token
				// and add the resulting feature name to the string
				// collection (if the name is not blank and is not already
				// contained in the collection).

				string sName = TrimFeatureName(sToken);
				if (sName != "")
				{
					if (! oStringCollection.Contains(sName))
					{
						oStringCollection.Add(sName);
					}
				}
			}

			//**************************************************************
			// Return the string collection.

			return oStringCollection;
		}
		#endregion
		//******************************************************************
		#region [Static StringFromStringCollection() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string containing the feature names from the given
		/// string collection, represented as tab-delimited tokens.
		/// </summary>
		private static string StringFromStringCollection(
			StringCollection oStringCollection)
		{
			Debug.Assert(oStringCollection != null);

			//**************************************************************
			// Create a string containing each feature name from the given
			// string collection. A tab character is used as a delimiter
			// between feature names.

			string sTabDelimitedString = "";
			foreach (string sString in oStringCollection)
			{
				string sName = TrimFeatureName(sString);
				if (sName != "")
				{
					if (sTabDelimitedString != "")
					{
						sTabDelimitedString = sTabDelimitedString + "\t";
					}
					sTabDelimitedString = sTabDelimitedString + sName;
				}
			}

			//**************************************************************
			// Return the tab-delimited string.

			return sTabDelimitedString;
		}
		#endregion
		//******************************************************************
		#region [Static TrimFeatureName() Method]
		//******************************************************************
		/// <summary>
		/// Trims extraneous white-space characters from the given feature
		/// name.
		/// </summary>
		private static string TrimFeatureName(string sName)
		{
			Debug.Assert(sName != null);

			//**************************************************************
			// Change other white-space characters to space characters.

			sName = sName.Replace("\t"," ");
			sName = sName.Replace("\r"," ");
			sName = sName.Replace("\n"," ");

			//**************************************************************
			// Trim white-space from the beginning and end of the string.

			sName = sName.Trim();

			//**************************************************************
			// Replace all sequences of two (or more) spaces with a single
			// space character.

			while (sName.IndexOf("  ") >= 0)
			{
				sName = sName.Replace("  "," ");
			}

			//**************************************************************
			// Return the trimmed feature name.

			return sName;
		}
		#endregion
		//******************************************************************
		#region [Static FeatureFont Property]
		//******************************************************************
		/// <summary>
		/// The FeatureFont property value.
		/// </summary>
		private static Font moFeatureFont = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the font that will be used by the form to display
		/// the names and values of features. (If FeatureFont is null, the
		/// default font will be used.)
		/// </summary>
		public static Font FeatureFont
		{
			set
			{
				moFeatureFont = value;
			}
			get
			{
				return moFeatureFont;
			}
		}
		#endregion
		//******************************************************************
		#region [Static PreviousLeft and PreviousTop Properties]
		//******************************************************************
		/// <summary>
		/// The PreviousLeft property value.
		/// </summary>
		private static int miPreviousLeft = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the PreviousLeft property, which represents the
		/// left coordinate of the form's position when the form was last
		/// closed. (This value is set by the Closing event and is used by
		/// the Load event to restore the form's previous position and
		/// size.)
		/// </summary>
		private static int PreviousLeft
		{
			set
			{
				miPreviousLeft = value;
			}
			get
			{
				return miPreviousLeft;
			}
		}
		//******************************************************************
		/// <summary>
		/// The PreviousTop property value.
		/// </summary>
		private static int miPreviousTop = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the PreviousTop property, which represents the
		/// top coordinate of the form's position when the form was last
		/// closed. (This value is set by the Closing event and is used by
		/// the Load event to restore the form's previous position and
		/// size.)
		/// </summary>
		private static int PreviousTop
		{
			set
			{
				miPreviousTop = value;
			}
			get
			{
				return miPreviousTop;
			}
		}
		#endregion
		//******************************************************************
		#region [Static PreviousWidth and PreviousHeight Properties]
		//******************************************************************
		/// <summary>
		/// The PreviousWidth property value.
		/// </summary>
		private static int miPreviousWidth = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the PreviousWidth property, which represents the
		/// form's width when it was last closed. (This value is set by the
		/// Closing event and is used by the Load event to restore the
		/// form's previous position and size. If the form has not yet been
		/// loaded and closed, this value is zero.)
		/// </summary>
		private static int PreviousWidth
		{
			set
			{
				miPreviousWidth = value;
			}
			get
			{
				return miPreviousWidth;
			}
		}
		//******************************************************************
		/// <summary>
		/// The PreviousHeight property value.
		/// </summary>
		private static int miPreviousHeight = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the PreviousHeight property, which represents the
		/// form's height when it was last closed. (This value is set by the
		/// Closing event and is used by the Load event to restore the
		/// form's previous position and size. If the form has not yet been
		/// loaded and closed, this value is zero.)
		/// </summary>
		private static int PreviousHeight
		{
			set
			{
				miPreviousHeight = value;
			}
			get
			{
				return miPreviousHeight;
			}
		}
		#endregion
		//******************************************************************
		#region [Static OptionsAreVisible Property]
		//******************************************************************
		/// <summary>
		/// The OptionsAreVisible property value.
		/// </summary>
		private static bool mbOptionsAreVisible = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the OptionsAreVisible property, which is true if
		/// controls for additional options should be shown when the form is
		/// loaded, and false otherwise. (This value is set by the Closing
		/// event and is used by the Load event.)
		/// </summary>
		private static bool OptionsAreVisible
		{
			set
			{
				mbOptionsAreVisible = value;
			}
			get
			{
				return mbOptionsAreVisible;
			}
		}
		#endregion
		//******************************************************************
		#region [Static ShowFavoritesOnly Property]
		//******************************************************************
		/// <summary>
		/// The ShowFavoritesOnly property value.
		/// </summary>
		private static bool mbShowFavoritesOnly = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ShowFavoritesOnly property, which is true if
		/// the ShowFavoritesOnlyCheckBox should be checked when the form is
		/// loaded, and false otherwise. (This value is set by the Closing
		/// event and is used by the Load event.)
		/// </summary>
		private static bool ShowFavoritesOnly
		{
			set
			{
				mbShowFavoritesOnly = value;
			}
			get
			{
				return mbShowFavoritesOnly;
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
		/// can edit the displayed collection of features, and true if the
		/// user is not allowed to edit.
		/// </summary>
		private bool ReadOnly
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
		#region [DisplayedNode Property]
		//******************************************************************
		/// <summary>
		/// The DisplayedNode property value.
		/// </summary>
		private SyntaxNode moDisplayedNode = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the DisplayedNode property, which is the working
		/// copy of the SyntaxNode whose features are displayed and edited
		/// in the FeaturesForm. (The changes to the DisplayedNode will be
		/// saved if the user clicks OK and discarded if the user clicks
		/// Cancel.)
		/// </summary>
		private SyntaxNode DisplayedNode
		{
			set
			{
				moDisplayedNode = value;
			}
			get
			{
				return moDisplayedNode;
			}
		}
		#endregion
		//******************************************************************
		#region [ListFavorites and TreeFavorites Properties]
		//******************************************************************
		/// <summary>
		/// The ListFavorites property value.
		/// </summary>
		private StringCollection moListFavorites = null;
		//******************************************************************
		/// <summary>
		/// Gets the ListFavorites collection, which is the working copy of
		/// the FavoriteListFeatures collection. (The changes to the
		/// ListFavorites collection will be saved if the user clicks OK and
		/// discarded if the user clicks Cancel.)
		/// </summary>
		private StringCollection ListFavorites
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moListFavorites == null)
				{
					moListFavorites = new StringCollection();
				}

				//**********************************************************
				// Return the collection.

				return moListFavorites;
			}
		}
		//******************************************************************
		/// <summary>
		/// The TreeFavorites property value.
		/// </summary>
		private StringCollection moTreeFavorites = null;
		//******************************************************************
		/// <summary>
		/// Gets the TreeFavorites collection, which is the working copy of
		/// the FavoriteTreeFeatures collection. (The changes to the
		/// TreeFavorites collection will be saved if the user clicks OK and
		/// discarded if the user clicks Cancel.)
		/// </summary>
		private StringCollection TreeFavorites
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moTreeFavorites == null)
				{
					moTreeFavorites = new StringCollection();
				}

				//**********************************************************
				// Return the collection.

				return moTreeFavorites;
			}
		}
		#endregion
		//******************************************************************
		#region [OriginalListViewTop Property]
		//******************************************************************
		/// <summary>
		/// The OriginalListViewTop property value.
		/// </summary>
		private int miOriginalListViewTop = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the OriginalListViewTop property, representing the
		/// original offset for the top of the ListView (before the option
		/// controls are hidden). This value is set by the Load event and
		/// then used by the ShowOptions() method to show the hidden
		/// controls.
		/// </summary>
		private int OriginalListViewTop
		{
			set
			{
				miOriginalListViewTop = value;
			}
			get
			{
				return miOriginalListViewTop;
			}
		}
		#endregion
		//******************************************************************
		#region [OriginalFavoriteColumnWidth Property]
		//******************************************************************
		/// <summary>
		/// The OriginalFavoriteColumnWidth property value.
		/// </summary>
		private int miOriginalFavoriteColumnWidth = 0;
		//******************************************************************
		/// <summary>
		/// Gets or sets the OriginalFavoriteColumnWidth property,
		/// representing the original width of the FavoriteColumn (before
		/// the column is hidden). This value is set by the Load event and
		/// then used by the ShowOptions() method to show the hidden column.
		/// </summary>
		private int OriginalFavoriteColumnWidth
		{
			set
			{
				miOriginalFavoriteColumnWidth = value;
			}
			get
			{
				return miOriginalFavoriteColumnWidth;
			}
		}
		#endregion
		//******************************************************************
		#region [ShowOptions() and HideOptions Methods]
		//******************************************************************
		/// <summary>
		/// Shows the controls that represent additional options.
		/// </summary>
		private void ShowOptions()
		{
			Debug.Assert(OriginalListViewTop > 0);
			Debug.Assert(OriginalFavoriteColumnWidth > 0);

			//**************************************************************
			// Show the controls that represent additional options.

			moFilterLabel.Show();
			moFilterTextBox.Show();
			moShowFavoritesOnlyCheckBox.Show();
			moShowAllFavoritesCheckBox.Show();
			moFavoriteInListCheckBox.Show();
			moShowInTreeCheckBox.Show();
			moCopyFavoritesOnlyCheckBox.Show();

			//**************************************************************
			// Make sure the FavoriteColumn is visible.

			moFavoriteColumn.Width = OriginalFavoriteColumnWidth;

			//**************************************************************
			// Resize the ListView (to make room for the filter,
			// show-favorites-only and show-all-favorites controls).

			int iBottom = moListView.Bottom;
			moListView.Top = OriginalListViewTop;
			moListView.Height = iBottom - moListView.Top;

			//**************************************************************
			// Resize the ListView columns.

			ResizeListViewColumns();

			//**************************************************************
			// Toggle the caption on the more-options button.

			moMoreOptionsButton.Text = "<< &Hide Options";

			//**************************************************************
			// Update the controls.

			UpdateControls();
		}
		//******************************************************************
		/// <summary>
		/// Hides the controls that represent additional options.
		/// </summary>
		private void HideOptions()
		{
			//**************************************************************
			// Hide the controls that represent additional options.

			moFilterLabel.Hide();
			moFilterTextBox.Hide();
			moShowFavoritesOnlyCheckBox.Hide();
			moShowAllFavoritesCheckBox.Hide();
			moFavoriteInListCheckBox.Hide();
			moShowInTreeCheckBox.Hide();
			moCopyFavoritesOnlyCheckBox.Hide();

			//**************************************************************
			// Hide the FavoriteColumn by setting its width to zero.

			moFavoriteColumn.Width = 0;

			//**************************************************************
			// Resize the ListView (into the area occupied by the filter,
			// show-favorites-only and show-all-favorites controls that are
			// now hidden).

			int iBottom = moListView.Bottom;
			moListView.Top = moFilterLabel.Top;
			moListView.Height = iBottom - moListView.Top;

			//**************************************************************
			// Resize the ListView columns.

			ResizeListViewColumns();

			//**************************************************************
			// Toggle the caption on the more-options button.

			moMoreOptionsButton.Text = "&More Options >>";

			//**************************************************************
			// Update the controls.

			UpdateControls();
		}
		#endregion
		//******************************************************************
		#region [PopulateList() Method]
		//******************************************************************
		/// <summary>
		/// Uses the features in the DisplayedNode.Features collection to
		/// populate the ListView.
		/// </summary>
		private void PopulateList()
		{
			Debug.Assert(DisplayedNode != null);

			//**************************************************************
			// Make sure the ListFavorites collection is a superset of the
			// TreeFavorites collection.

			foreach (string sName in TreeFavorites)
			{
				if (! ListFavorites.Contains(sName))
				{
					ListFavorites.Add(sName);
				}
			}

			//**************************************************************
			// Clear the ListView.

			moListView.Items.Clear();

			//**************************************************************
			// Populate the ListView with features:
			//
			// If the ShowAllFavoritesCheckBox is checked, show the features
			// named in the ListFavorites collection.
			//
			// Otherwise, show the features in the DisplayedNode.Features
			// collection.

			if (moShowAllFavoritesCheckBox.Checked)
			{
				//**********************************************************
				// Show the features named in the ListFavorites collection.

				foreach (string sName in ListFavorites)
				{
					bool bShowFeature = true;

					//******************************************************
					// The feature must not be the "node:label" feature.

					if (sName == TreeTranEngineString.NodeLabel)
					{
						bShowFeature = false;
					}

					//******************************************************
					// The feature name must contain the substring pattern
					// specified in the FilterTextBox (if the FilterTextBox
					// contains a non-empty string).

					string sFilter = moFilterTextBox.Text.Trim();
					if (sFilter != "")
					{
						sFilter = sFilter.ToLower();
						string sString = sName.ToLower();
						if (sString.IndexOf(sFilter) < 0)
						{
							bShowFeature = false;
						}
					}

					//******************************************************
					// Get the DisplayedNode's value for the feature. If the
					// DisplayedNode.Features collection does not contain
					// the named feature, an empty string will be displayed
					// for the feature's value.

					string sValue = "";
					if (sName != "")
					{
						if (DisplayedNode.Features.Contains(sName))
						{
							sValue = DisplayedNode.Features[sName];
						}
					}

					//******************************************************
					// If the feature should be displayed, add it to the
					// ListView.
					//
					// Each row in the ListView is created with three
					// columns: Name, Value and Favorite. The Name and Value
					// columns are set here, and the Favorite column is set
					// later by the call to UpdateControls().

					if (bShowFeature)
					{
						ListViewItem oItem = new ListViewItem();
						oItem.SubItems.Add("");
						oItem.SubItems.Add("");
						oItem.SubItems[moNameColumn.Index].Text = sName;
						oItem.SubItems[moValueColumn.Index].Text = sValue;
						moListView.Items.Add(oItem);
					}
				}
			}
			else
			{
				//**********************************************************
				// Show the features in the DisplayedNode.Features
				// collection.

				foreach (SyntaxFeature oFeature in DisplayedNode.Features)
				{
					bool bShowFeature = true;

					//******************************************************
					// The feature must not be the "node:label" feature.

					if (oFeature.Name == TreeTranEngineString.NodeLabel)
					{
						bShowFeature = false;
					}

					//******************************************************
					// The feature name must contain the substring pattern
					// specified in the FilterTextBox (if the FilterTextBox
					// contains a non-empty string).

					string sFilter = moFilterTextBox.Text.Trim();
					if (sFilter != "")
					{
						sFilter = sFilter.ToLower();
						string sString = oFeature.Name.ToLower();
						if (sString.IndexOf(sFilter) < 0)
						{
							bShowFeature = false;
						}
					}

					//******************************************************
					// The feature must be a favorite feature if the
					// ShowFavoritesOnlyCheckBox is checked.

					if (moShowFavoritesOnlyCheckBox.Checked)
					{
						if (! ListFavorites.Contains(oFeature.Name))
						{
							bShowFeature = false;
						}
					}

					//******************************************************
					// If the feature should be displayed, add it to the
					// ListView.
					//
					// Each row in the ListView is created with three
					// columns: Name, Value and Favorite. The Name and Value
					// columns are set here, and the Favorite column is set
					// later by the call to UpdateControls().

					if (bShowFeature)
					{
						ListViewItem oItem = new ListViewItem();
						oItem.SubItems.Add("");
						oItem.SubItems.Add("");
						oItem.SubItems[moNameColumn.Index].Text
							= oFeature.Name;
						oItem.SubItems[moValueColumn.Index].Text
							= oFeature.Value;
						moListView.Items.Add(oItem);
					}
				}
			}

			//**************************************************************
			// Select the first item (if any) and give it focus within the
			// ListView.

			if (moListView.Items.Count > 0)
			{
				moListView.Items[0].Selected = true;
				moListView.Items[0].Focused = true;
			}

			//**************************************************************
			// Use the current selection to update controls and menus.

			UpdateControls();
		}
		#endregion
		//******************************************************************
		#region [UpdateControls() Method]
		//******************************************************************
		/// <summary>
		/// Uses the current ListView selection to enable and disable
		/// controls and menus. The values displayed in the FavoriteColumn,
		/// NameTextBox, ValueTextBox, FavoriteInListCheckBox and
		/// ShowInTreeCheckBox are also updated. The ListView is scrolled if
		/// necessary to display its selection.
		/// </summary>
		private void UpdateControls()
		{
			//**************************************************************
			// Enable or disable the LabelTextBox and OptionalNodeCheckBox.

			if (ReadOnly)
			{
				moLabelTextBox.ReadOnly = true;
				moOptionalNodeCheckBox.Enabled = false;
			}
			else
			{
				moLabelTextBox.ReadOnly = false;
				moOptionalNodeCheckBox.Enabled = true;
			}

			//**************************************************************
			// Enable or disable the CutMenu, CopyMenu, PasteMenu and
			// DeleteMenu.

			moCutMenu.Enabled = false;
			moCopyMenu.Enabled = false;
			moPasteMenu.Enabled = false;
			moDeleteMenu.Enabled = false;
			if (ReadOnly)
			{
				if (moListView.SelectedItems.Count > 0)
				{
					moCopyMenu.Enabled = true;
				}
			}
			else
			{
				moPasteMenu.Enabled = true;
				if (moListView.SelectedItems.Count > 0)
				{
					moCutMenu.Enabled = true;
					moCopyMenu.Enabled = true;
					moDeleteMenu.Enabled = true;
				}
			}

			//**************************************************************
			// Enable or disable the NameTextBox and ValueTextBox.

			if (ReadOnly)
			{
				moNameTextBox.ReadOnly = true;
				moValueTextBox.ReadOnly = true;
			}
			else
			{
				moNameTextBox.ReadOnly = false;
				moValueTextBox.ReadOnly = false;
			}

			//**************************************************************
			// Enable or disable the DeleteButton, PlusButton and
			// MinusButton.

			if (ReadOnly)
			{
				moDeleteButton.Enabled = false;
				moPlusButton.Enabled = false;
				moMinusButton.Enabled = false;
			}
			else
			{
				if (moListView.SelectedItems.Count > 0)
				{
					moDeleteButton.Enabled = true;
					moPlusButton.Enabled = true;
					moMinusButton.Enabled = true;
				}
				else
				{
					moDeleteButton.Enabled = false;
					moPlusButton.Enabled = false;
					moMinusButton.Enabled = false;
				}
			}

			//**************************************************************
			// Enable or disable the FavoriteInListCheckBox and
			// ShowInTreeCheckBox.

			if (moListView.SelectedItems.Count > 0)
			{
				moFavoriteInListCheckBox.Enabled = true;
				moShowInTreeCheckBox.Enabled = true;
			}
			else
			{
				moFavoriteInListCheckBox.Enabled = false;
				moShowInTreeCheckBox.Enabled = false;
			}

			//**************************************************************
			// Set the NameTextBox and ValueTextBox to the name and value of
			// the selected feature in the ListView.
			//
			// (The NameTextBox and ValueTextBox are not changed if either
			// one has input focus.)

			if ((! moNameTextBox.ContainsFocus)
				&& (! moValueTextBox.ContainsFocus))
			{
				if (moListView.SelectedItems.Count == 1)
				{
					ListViewItem oItem = moListView.SelectedItems[0];
					moNameTextBox.Text
						= oItem.SubItems[moNameColumn.Index].Text;
					moValueTextBox.Text
						= oItem.SubItems[moValueColumn.Index].Text;
				}
				else
				{
					moNameTextBox.Text = "";
					moValueTextBox.Text = "";
				}
			}

			//**************************************************************
			// Set the FavoriteInListCheckBox and ShowInTreeCheckBox states
			// to reflect the selected features in the ListView:
			//
			// Unchecked = No selected feature is in the ListFavorites (or
			//     TreeFavorites) collection.
			//
			// Indeterminate = Some, but not all, of the selected features
			//     are in the ListFavorites (or TreeFavorites) collection.
			//
			// Checked = All of the selected features are in the
			//     ListFavorites (or TreeFavorites) collection.

			int iListFavorites = 0;
			int iTreeFavorites = 0;
			foreach (ListViewItem oItem in moListView.SelectedItems)
			{
				string sName = oItem.SubItems[moNameColumn.Index].Text;
				if (ListFavorites.Contains(sName))
				{
					++iListFavorites;
				}
				if (TreeFavorites.Contains(sName))
				{
					++iTreeFavorites;
				}
			}

			moFavoriteInListCheckBox.CheckState = CheckState.Unchecked;
			if (iListFavorites > 0)
			{
				if (iListFavorites < moListView.SelectedItems.Count)
				{
					moFavoriteInListCheckBox.CheckState
						= CheckState.Indeterminate;
				}
				else
				{
					moFavoriteInListCheckBox.CheckState
						= CheckState.Checked;
				}
			}

			moShowInTreeCheckBox.CheckState = CheckState.Unchecked;
			if (iTreeFavorites > 0)
			{
				if (iTreeFavorites < moListView.SelectedItems.Count)
				{
					moShowInTreeCheckBox.CheckState
						= CheckState.Indeterminate;
				}
				else
				{
					moShowInTreeCheckBox.CheckState
						= CheckState.Checked;
				}
			}

			//**************************************************************
			// Update the string displayed in the FavoriteColumn for each
			// feature in the ListView:
			//
			// "list" = The feature is in the ListFavorites collection.
			//
			// "tree" = The feature is in the TreeFavorites collection.

			foreach (ListViewItem oItem in moListView.Items)
			{
				string sName = oItem.SubItems[moNameColumn.Index].Text;
				string sString = "";
				if (ListFavorites.Contains(sName))
				{
					sString = "list";
				}
				if (TreeFavorites.Contains(sName))
				{
					if (sString != "")
					{
						sString = sString + ", ";
					}
					sString = sString + "tree";
				}
				oItem.SubItems[moFavoriteColumn.Index].Text = sString;
			}

			//**************************************************************
			// Make sure the first selected feature in the ListView is
			// scrolled into view. (If possible, the last selected feature
			// is also scrolled into view.)
			//
			// (The scroll position is not changed if the ListView has
			// input focus.)

			if (! moListView.ContainsFocus)
			{
				if (moListView.SelectedItems.Count > 0)
				{
					int iLast = moListView.SelectedItems.Count - 1;
					moListView.SelectedItems[iLast].EnsureVisible();
					int iFirst = 0;
					moListView.SelectedItems[iFirst].EnsureVisible();
				}
			}
		}
		#endregion
		//******************************************************************
		#region [ResizeListViewColumns() Method]
		//******************************************************************
		/// <summary>
		/// Adjusts the ListView column widths to fit the width of the
		/// ListView.
		/// </summary>
		private void ResizeListViewColumns()
		{
			//**************************************************************
			// Get the width of the ListView's client rectangle (which does
			// not include scroll bars).

			int iListViewWidth = moListView.ClientRectangle.Width;

			//**************************************************************
			// Get the width of the Favorite column.

			int iFavoriteWidth = moFavoriteColumn.Width;

			//**************************************************************
			// Calculate the new widths for the Name and Value columns: make
			// them wide enough that the Name, Value and Favorite columns
			// occupy the full width of the ListView's client rectangle.

			int iNameWidth = (iListViewWidth - iFavoriteWidth) / 2;
			int iValueWidth = (iListViewWidth - iFavoriteWidth) / 2;

			//**************************************************************
			// Use the OriginalFavoriteColumnWidth as the minimum width for
			// the Name and Value columns.

			if (iNameWidth < OriginalFavoriteColumnWidth)
			{
				iNameWidth = OriginalFavoriteColumnWidth;
			}
			if (iValueWidth < OriginalFavoriteColumnWidth)
			{
				iValueWidth = OriginalFavoriteColumnWidth;
			}

			//**************************************************************
			// Set the widths of the Name and Value columns.

			moNameColumn.Width = iNameWidth;
			moValueColumn.Width = iValueWidth;
		}
		#endregion
		//******************************************************************
		#region [CutSelectedFeatures() Method]
		//******************************************************************
		/// <summary>
		/// Cuts the selected features from the ListView to the clipboard.
		/// (The DisplayedNode and the ListView are both updated.)
		/// </summary>
		private void CutSelectedFeatures()
		{
			CopySelectedFeatures();
			DeleteSelectedFeatures();
		}
		#endregion
		//******************************************************************
		#region [CopySelectedFeatures() Method]
		//******************************************************************
		/// <summary>
		/// Copies the selected features from the ListView to the clipboard.
		/// </summary>
		private void CopySelectedFeatures()
		{
			//**************************************************************
			// Create a SyntaxNode and set its features by copying the
			// selected feature names and values from the ListView.
			//
			// (Do not copy blank features, which can appear when the
			// show-all-favorites option is checked.)

			SyntaxNode oNode = new SyntaxNode();
			foreach (ListViewItem oItem in moListView.SelectedItems)
			{
				string sName = oItem.SubItems[moNameColumn.Index].Text;
				string sValue = oItem.SubItems[moValueColumn.Index].Text;
				if ((sName != "") && (sValue != ""))
				{
					oNode.Features[sName] = sValue;
				}
			}

			//**************************************************************
			// Create a RuleWriter that writes to a string.

			StringBuilder oStringBuilder = new StringBuilder();
			TextWriter oTextWriter = new StringWriter(oStringBuilder);
			RuleWriter oRuleWriter = new RuleWriter(oTextWriter);

			//**************************************************************
			// Make a rule that uses the SyntaxNode with the selected
			// features as its find pattern (and has an empty replace
			// pattern).

			oRuleWriter.RuleName = "(tree fragment on clipboard)";
			oRuleWriter.FindPatternRoot = oNode;
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
		#region [PasteFeatures() Method]
		//******************************************************************
		/// <summary>
		/// Pastes the features from the clipboard to the ListView. (The
		/// DisplayedNode and the ListView are both updated.)
		/// </summary>
		private void PasteFeatures()
		{
			Debug.Assert(DisplayedNode != null);

			//**************************************************************
			// Prevent modification if the feature collection is read-only.

			if (ReadOnly)
			{
				return;
			}

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
			// Use a RuleReader to read the first SyntaxNode represented by
			// the string data (that is, the root node of the find pattern
			// in the first rule).

			SyntaxNode oNode = null;
			try
			{
				TextReader oTextReader = new StringReader(sString);
				RuleReader oRuleReader = new RuleReader(oTextReader);
				if (oRuleReader.Read())
				{
					oNode = oRuleReader.FindPatternRoot;
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
			// Return (without reporting an error) if a node was not read
			// (because the string data represented an empty collection of
			// rules).

			if (oNode == null)
			{
				return;
			}

			//**************************************************************
			// For each of the node's features, call SetFeature() to display
			// the feature in the ListView and to copy it to the
			// DisplayedNode.Features collection.

			foreach (SyntaxFeature oFeature in oNode.Features)
			{
				SetFeature(oFeature.Name,oFeature.Value);
			}

			//**************************************************************
			// In the ListView, select the features that were pasted.

			moListView.SelectedItems.Clear();
			foreach (ListViewItem oItem in moListView.Items)
			{
				string sName = oItem.SubItems[moNameColumn.Index].Text;
				if (oNode.Features.Contains(sName))
				{
					oItem.Selected = true;
				}
			}

			//**************************************************************
			// Make sure the first selected feature is scrolled into view
			// and has focus within the ListView.

			if (moListView.SelectedItems.Count > 0)
			{
				moListView.SelectedItems[0].Focused = true;
				moListView.SelectedItems[0].EnsureVisible();
			}
		}
		#endregion
		//******************************************************************
		#region [DeleteSelectedFeatures() Method]
		//******************************************************************
		/// <summary>
		/// Deletes the features selected in the ListView. (The
		/// DisplayedNode and the ListView are both updated.)
		/// </summary>
		private void DeleteSelectedFeatures()
		{
			Debug.Assert(DisplayedNode != null);

			//**************************************************************
			// Prevent modification if the feature collection is read-only.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Return if no items are selected in the ListView (there is
			// nothing to delete).
			//
			// Otherwise, get the index of the first selected item in the
			// ListView.

			if (moListView.SelectedItems.Count == 0)
			{
				return;
			}
			int iFirstSelectedIndex = moListView.SelectedItems[0].Index;

			//**************************************************************
			// Go through the ListView in reverse order, deleting each
			// selected feature.

			for (int iIndex = (moListView.Items.Count - 1);
				iIndex >= 0; --iIndex)
			{
				ListViewItem oItem = moListView.Items[iIndex];
				if (oItem.Selected)
				{
					//******************************************************
					// Get the name of the selected feature and remove it
					// from the DisplayedNode.Features collection.

					string sName = oItem.SubItems[moNameColumn.Index].Text;
					DisplayedNode.Features.Remove(sName);

					//******************************************************
					// If the show-all-favorites option is checked, set the
					// value of the selected feature to a blank string (to
					// indicated the feature has been deleted).
					//
					// Otherwise, show that the selected feature has been
					// deleted by removing the feature from the ListView.

					if (moShowAllFavoritesCheckBox.Checked)
					{
						oItem.SubItems[moValueColumn.Index].Text = "";
					}
					else
					{
						moListView.Items.Remove(oItem);
					}
				}
			}

			//**************************************************************
			// Make sure the selection is updated and scrolled into view.

			if (moShowAllFavoritesCheckBox.Checked)
			{
				//**********************************************************
				// If the show-all-favorites option is checked, the
				// selection is not changed. Just make sure the first
				// selected item is scrolled into view. (If possible, also
				// scroll the last selected item into view.)

				if (moListView.SelectedItems.Count > 0)
				{
					int iLast = moListView.SelectedItems.Count - 1;
					moListView.SelectedItems[iLast].EnsureVisible();
					int iFirst = 0;
					moListView.SelectedItems[iFirst].EnsureVisible();
				}
			}
			else
			{
				//**********************************************************
				// If the show-all-favorites option is not checked, all the
				// selected items have been removed from the ListView, so
				// select the item at the iFirstSelectedIndex position. If
				// there is no longer an item at that position, select the
				// last item in the list.
				//
				// Make sure the selected item is scrolled into view and has
				// focus within the ListView.

				if (iFirstSelectedIndex >= moListView.Items.Count)
				{
					iFirstSelectedIndex = moListView.Items.Count - 1;
				}
				if (iFirstSelectedIndex >= 0)
				{
					ListViewItem oItem
						= moListView.Items[iFirstSelectedIndex];
					oItem.Selected = true;
					oItem.Focused = true;
					oItem.EnsureVisible();
				}
			}

			//**************************************************************
			// Use the current selection to update controls and menus.

			UpdateControls();
		}
		#endregion
		//******************************************************************
		#region [SetFeature() Method]
		//******************************************************************
		/// <summary>
		/// Sets the feature with the indicated name (sName) to the given
		/// value string (sValue). (The DisplayedNode and the ListView are
		/// both updated.)
		/// </summary>
		private void SetFeature(string sName,string sValue)
		{
			Debug.Assert(sName != null);
			Debug.Assert(sValue != null);
			Debug.Assert(DisplayedNode != null);

			//**************************************************************
			// Prevent modification if the feature collection is read-only.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// Trim extraneous white-space characters from the feature name,
			// and return if the name string is blank.

			sName = TrimFeatureName(sName);
			if (sName == "")
			{
				return;
			}

			//**************************************************************
			// If the feature name indicates the "node:label" feature, set
			// the LabelTextBox to the given value string and return (since
			// the "node:label" feature is not displayed in the ListView).

			if (sName == TreeTranEngineString.NodeLabel)
			{
				moLabelTextBox.Text = sValue;
				return;
			}

			//**************************************************************
			// Set the feature in the DisplayedNode.Features collection.

			DisplayedNode.Features[sName] = sValue;

			//**************************************************************
			// Clear the selection in the ListView.

			moListView.SelectedItems.Clear();

			//**************************************************************
			// If the feature is already displayed in the ListView, select
			// the feature and update its displayed value.

			bool bFound = false;
			foreach (ListViewItem oItem in moListView.Items)
			{
				if (oItem.SubItems[moNameColumn.Index].Text == sName)
				{
					oItem.SubItems[moValueColumn.Index].Text = sValue;
					oItem.Selected = true;
					bFound = true;
				}
			}

			//**************************************************************
			// If the feature does not already appear in the ListView, add
			// the feature to the ListView and select it.
			//
			// Each row in the ListView is created with three columns: Name,
			// Value and Favorite. The Name and Value columns are set here,
			// and the Favorite column is set later by the call to
			// UpdateControls().

			if (! bFound)
			{
				ListViewItem oItem = new ListViewItem();
				oItem.SubItems.Add("");
				oItem.SubItems.Add("");
				oItem.SubItems[moNameColumn.Index].Text = sName;
				oItem.SubItems[moValueColumn.Index].Text = sValue;
				moListView.Items.Add(oItem);
				oItem.Selected = true;
			}

			//**************************************************************
			// Make sure the selection is scrolled into view and has focus
			// within the ListView.

			if (moListView.SelectedItems.Count > 0)
			{
				moListView.SelectedItems[0].Focused = true;
				moListView.SelectedItems[0].EnsureVisible();
			}

			//**************************************************************
			// Use the current selection to update controls and menus.

			UpdateControls();
		}
		#endregion
		//******************************************************************
		#region [SetSelectedFeatures() Method]
		//******************************************************************
		/// <summary>
		/// Sets each of the selected features in the ListView to the given
		/// value string (sValue). (The DisplayedNode and the ListView are
		/// both updated.)
		/// </summary>
		private void SetSelectedFeatures(string sValue)
		{
			Debug.Assert(sValue != null);
			Debug.Assert(DisplayedNode != null);

			//**************************************************************
			// Prevent modification if the feature collection is read-only.

			if (ReadOnly)
			{
				return;
			}

			//**************************************************************
			// For each selected feature in the ListView, set its value to
			// the given sValue string.

			foreach (ListViewItem oItem in moListView.SelectedItems)
			{
				string sName = oItem.SubItems[moNameColumn.Index].Text;

				//**********************************************************
				// Set the feature to the given sValue string in the
				// DisplayedNode.Features collection.

				DisplayedNode.Features[sName] = sValue;

				//**********************************************************
				// Update the feature's displayed value in the ListView.

				oItem.SubItems[moValueColumn.Index].Text = sValue;

				//**********************************************************
				// Make sure the feature is scrolled into view.

				oItem.EnsureVisible();
			}

			//**************************************************************
			// Make sure the first selected feature is scrolled into view
			// within the ListView.

			if (moListView.SelectedItems.Count > 0)
			{
				moListView.SelectedItems[0].EnsureVisible();
			}

			//**************************************************************
			// Use the current selection to update controls and menus.

			UpdateControls();
		}
		#endregion
		//******************************************************************
		#region [AddListFavorite() and RemoveListFavorite() Methods]
		//******************************************************************
		/// <summary>
		/// Adds the given feature name to the ListFavorites collection (if
		/// it does not already appear in the collection).
		/// </summary>
		private void AddListFavorite(string sName)
		{
			Debug.Assert(sName != null);

			//**************************************************************
			// Add the given feature name to the ListFavorites collection
			// (if it does not already appear in the collection).

			if (! ListFavorites.Contains(sName))
			{
				ListFavorites.Add(sName);
			}
		}
		//******************************************************************
		/// <summary>
		/// Removes the given feature name from the ListFavorites collection
		/// (if it appears in the collection). The feature name is also
		/// removed from the TreeFavorites collection (if it appears in that
		/// collection).
		/// </summary>
		private void RemoveListFavorite(string sName)
		{
			Debug.Assert(sName != null);

			//**************************************************************
			// First remove the given feature name from the TreeFavorites
			// collection (if it appears in that collection). This is
			// because we want the TreeFavorites collection to be a subset
			// of the ListFavorites collection.

			RemoveTreeFavorite(sName);

			//**************************************************************
			// Remove the given feature name from the ListFavorites
			// collection (if it appears in the collection).

			while (ListFavorites.Contains(sName))
			{
				ListFavorites.Remove(sName);
			}
		}
		#endregion
		//******************************************************************
		#region [AddTreeFavorite() and RemoveTreeFavorite() Methods]
		//******************************************************************
		/// <summary>
		/// Adds the given feature name to the TreeFavorites collection (if
		/// it does not already appear in the collection). The feature name
		/// is also added to the ListFavorites collection (if it does not
		/// already appear in that collection).
		/// </summary>
		private void AddTreeFavorite(string sName)
		{
			Debug.Assert(sName != null);

			//**************************************************************
			// First add the given feature name to the ListFavorites
			// collection (if it does not already appear in that
			// collection). This is because we want the TreeFavorites
			// collection to be a subset of the ListFavorites collection.

			AddListFavorite(sName);

			//**************************************************************
			// Add the given feature name to the TreeFavorites collection
			// (if it does not already appear in the collection).

			if (! TreeFavorites.Contains(sName))
			{
				TreeFavorites.Add(sName);
			}
		}
		//******************************************************************
		/// <summary>
		/// Removes the given feature name from the TreeFavorites collection
		/// (if it appears in the collection).
		/// </summary>
		private void RemoveTreeFavorite(string sName)
		{
			Debug.Assert(sName != null);

			//**************************************************************
			// Remove the given feature name from the TreeFavorites
			// collection (if it appears in the collection).

			while (TreeFavorites.Contains(sName))
			{
				TreeFavorites.Remove(sName);
			}
		}
		#endregion
		//******************************************************************

		// FORM EVENTS

		//******************************************************************
		#region [Load Event Handler]
		//******************************************************************
		/// <summary>
		/// Uses the DisplayedNode's features to populate the controls on
		/// this form. The form's position, size and display options are
		/// restored, the font is set, and a working copy is made of the
		/// favorite-features settings.
		/// </summary>
		private void FeaturesForm_Load(object oSender,EventArgs oArgs)
		{
			try
			{
				Debug.Assert(DisplayedNode != null);
				Debug.Assert(MinimumSize.Width > 0);
				Debug.Assert(MinimumSize.Height > 0);

				//**********************************************************
				// Save the original values for the top of the ListView and
				// the width of the FavoriteColumn. (These values will be
				// used by the ShowOptions() method.)

				OriginalListViewTop = moListView.Top;
				OriginalFavoriteColumnWidth = moFavoriteColumn.Width;

				//**********************************************************
				// Set the display options:
				//
				// Show or hide the controls that represent additional
				// options.
				//
				// Set the state of the ShowFavoritesOnlyCheckBox.

				if (OptionsAreVisible)
				{
					ShowOptions();
				}
				else
				{
					HideOptions();
				}

				moShowFavoritesOnlyCheckBox.Checked = ShowFavoritesOnly;

				//**********************************************************
				// Copy the loaded favorite-features settings:
				//
				// Copy the FavoriteListFeatures collection to the working
				// ListFavorites collection.
				//
				// Copy the FavoriteTreeFeatures collection to the working
				// TreeFavorites collection.
				//
				// Use the CopyFavoritesOnly property to set the checked
				// state of the CopyFavoritesOnlyCheckBox.

				ListFavorites.Clear();
				foreach (string sName in FavoriteListFeatures)
				{
					ListFavorites.Add(sName);
				}

				TreeFavorites.Clear();
				foreach (string sName in FavoriteTreeFeatures)
				{
					TreeFavorites.Add(sName);
				}

				moCopyFavoritesOnlyCheckBox.Checked = CopyFavoritesOnly;

				//**********************************************************
				// Use the DisplayedNode's label to set the text of the
				// LabelTextBox.

				moLabelTextBox.Text = DisplayedNode.Label;

				//**********************************************************
				// Use the DisplayedNode's features to populate the
				// ListView.

				PopulateList();

				//**********************************************************
				// If the FeatureFont is not null, use it to set the font
				// for displaying feature text.

				if (FeatureFont != null)
				{
					//******************************************************
					// Get the FeatureFont.

					Font oFont = FeatureFont;

					//******************************************************
					// Convert it to an appropriate size, if necessary.

					const int iMinSize = 8;
					const int iMaxSize = 14;

					int iSize = (int) Math.Round(oFont.SizeInPoints);
					if ((iSize < iMinSize) || (iSize > iMaxSize))
					{
						if (iSize < iMinSize)
						{
							iSize = iMinSize;
						}
						if (iSize > iMaxSize)
						{
							iSize = iMaxSize;
						}
						oFont = new Font(oFont.FontFamily,
							iSize,oFont.Style,GraphicsUnit.Point);
					}

					//******************************************************
					// Use the font for the controls that display feature
					// text.

					moLabelTextBox.Font = oFont;
					moFilterTextBox.Font = oFont;
					moListView.Font = oFont;
					moNameTextBox.Font = oFont;
					moValueTextBox.Font = oFont;
				}

				//**********************************************************
				// Restore the form's previous position and size.
				//
				// The form must be at least the minimum size.
				//
				// The form must be positioned so the entire form is visible
				// within the current screen's working area.
				//
				// Otherwise, the form's default position and size are used.
				//
				// (Note that the first time the form is shown, the
				// PreviousWidth and PreviousHeight will both be zero, which
				// is less than the minimum size, so the default position
				// and size will be used.)

				if ((PreviousWidth >= MinimumSize.Width)
					&& (PreviousHeight >= MinimumSize.Height))
				{
					Screen oScreen = Screen.FromControl(this);
					int iPreviousRight = PreviousLeft + PreviousWidth;
					int iPreviousBottom = PreviousTop + PreviousHeight;
					if ((PreviousLeft >= oScreen.WorkingArea.Left)
						&& (PreviousTop >= oScreen.WorkingArea.Top)
						&& (iPreviousRight <= oScreen.WorkingArea.Right)
						&& (iPreviousBottom <= oScreen.WorkingArea.Bottom))
					{
						Left = PreviousLeft;
						Top = PreviousTop;
						Width = PreviousWidth;
						Height = PreviousHeight;
					}
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Closing Event Handler]
		//******************************************************************
		/// <summary>
		/// Saves the form's position, size and display options when the
		/// form is closed.
		/// </summary>
		private void FeaturesForm_Closing(object oSender,
			CancelEventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Save the form's position and size.

				PreviousLeft = Left;
				PreviousTop = Top;
				PreviousWidth = Width;
				PreviousHeight = Height;

				//**********************************************************
				// Save the state of the form's display options.

				OptionsAreVisible = moShowFavoritesOnlyCheckBox.Visible;
				ShowFavoritesOnly = moShowFavoritesOnlyCheckBox.Checked;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************

		// CONTROL EVENTS

		//******************************************************************
		#region [LabelTextBox TextChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates the "node:label" feature of the DisplayedNode. (The
		/// checked state of the OptionalNodeCheckBox is also changed if
		/// necessary).
		/// </summary>
		private void moLabelTextBox_TextChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(DisplayedNode != null);

				//**********************************************************
				// Set the "node:label" feature of the DisplayedNode to the
				// LabelTextBox string. (The "node:label" feature is deleted
				// if the LabelTextBox contains an empty string.)

				if (moLabelTextBox.Text.Length > 0)
				{
					DisplayedNode.Features[TreeTranEngineString.NodeLabel]
						= moLabelTextBox.Text;
				}
				else
				{
					DisplayedNode.Features
						.Remove(TreeTranEngineString.NodeLabel);
				}

				//**********************************************************
				// Make sure the checked state of the OptionalNodeCheckBox
				// matches the parentheses around the LabelTextBox string:
				// the node is optional if and only the label string starts
				// with a left parenthesis.

				if (moLabelTextBox.Text.StartsWith(
					TreeTranEngineString.LeftParenthesis))
				{
					if (! moOptionalNodeCheckBox.Checked)
					{
						moOptionalNodeCheckBox.Checked = true;
					}
				}
				else
				{
					if (moOptionalNodeCheckBox.Checked)
					{
						moOptionalNodeCheckBox.Checked = false;
					}
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OptionalNodeCheckBox Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Changes the parentheses around the LabelTextBox string to match
		/// the optional state indicated by the OptionalNodeCheckBox.
		/// </summary>
		private void moOptionalNodeCheckBox_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Trim any parentheses at the start or end of the
				// LabelTextBox string.

				string sLabel = moLabelTextBox.Text;

				Debug.Assert(
					TreeTranEngineString.LeftParenthesis.Length == 1);

				while (sLabel.StartsWith(
					TreeTranEngineString.LeftParenthesis))
				{
					int iIndex = 0;
					int iCount = 1;
					sLabel = sLabel.Remove(iIndex,iCount);
				}

				Debug.Assert(
					TreeTranEngineString.RightParenthesis.Length == 1);

				while (sLabel.EndsWith(
					TreeTranEngineString.RightParenthesis))
				{
					int iIndex = sLabel.Length - 1;
					int iCount = 1;
					sLabel = sLabel.Remove(iIndex,iCount);
				}

				//**********************************************************
				// Make sure the parentheses around the LabelTextBox string
				// match the checked state of the OptionalNodeCheckBox: the
				// label string starts with a left parenthesis if and only
				// if the node is optional.

				if (moOptionalNodeCheckBox.Checked)
				{
					if (! moLabelTextBox.Text.StartsWith(
						TreeTranEngineString.LeftParenthesis))
					{
						moLabelTextBox.Text
							= TreeTranEngineString.LeftParenthesis
							+ sLabel
							+ TreeTranEngineString.RightParenthesis;
					}
				}
				else
				{
					if (moLabelTextBox.Text.StartsWith(
						TreeTranEngineString.LeftParenthesis))
					{
						moLabelTextBox.Text = sLabel;
					}
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [MoreOptionsButton Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Shows or hides the controls that represent additional options.
		/// </summary>
		private void moMoreOptionsButton_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If the ShowFavoritesOnlyCheckBox is visible, hide the
				// controls that represent additional options.
				//
				// Otherwise, show the controls that represent additional
				// options.

				if (moShowFavoritesOnlyCheckBox.Visible)
				{
					HideOptions();
				}
				else
				{
					ShowOptions();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FilterTextBox Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Disables the form's AcceptButton when the FilterTextBox has
		/// input focus (so the Enter key can be used as a keyboard
		/// shortcut).
		/// </summary>
		private void moFilterTextBox_Enter(object oSender,EventArgs oArgs)
		{
			try
			{
				AcceptButton = null;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Re-enables the form's AcceptButton when input focus leaves the
		/// FilterTextBox.
		/// </summary>
		private void moFilterTextBox_Leave(object oSender,EventArgs oArgs)
		{
			try
			{
				AcceptButton = moOKButton;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FilterTextBox TextChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Re-populates the ListView when the text in the FilterTextBox
		/// changes.
		/// </summary>
		private void moFilterTextBox_TextChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				PopulateList();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FilterTextBox KeyDown Event Handler]
		//******************************************************************
		/// <summary>
		/// Provides two keyboard shortcuts to move to the ListView (Enter
		/// and Down).
		/// </summary>
		private void moFilterTextBox_KeyDown(object oSender,
			KeyEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// The Enter key is a shortcut to move to the ListView.

				if (oArgs.KeyData == Keys.Enter)
				{
					oArgs.Handled = true;
					moListView.Focus();
				}

				//**********************************************************
				// The Down key is a shortcut to move to the ListView.

				if (oArgs.KeyData == Keys.Down)
				{
					oArgs.Handled = true;
					moListView.Focus();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ShowFavoritesOnlyCheckBox Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Re-populates the ListView when the ShowFavoritesOnlyCheckBox is
		/// clicked.
		/// </summary>
		private void moShowFavoritesOnlyCheckBox_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If the ShowFavoritesOnlyCheckBox is not checked, make
				// sure the ShowAllFavoritesCheckBox is also not checked.

				if (! moShowFavoritesOnlyCheckBox.Checked)
				{
					if (moShowAllFavoritesCheckBox.Checked)
					{
						moShowAllFavoritesCheckBox.Checked = false;
					}
				}

				//**********************************************************
				// Re-populate the ListView.

				PopulateList();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ShowAllFavoritesCheckBox Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Re-populates the ListView when the ShowAllFavoritesCheckBox is
		/// clicked.
		/// </summary>
		private void moShowAllFavoritesCheckBox_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// If the ShowAllFavoritesCheckBox is checked, make sure the
				// ShowFavoritesOnlyCheckBox is also checked.

				if (moShowAllFavoritesCheckBox.Checked)
				{
					if (! moShowFavoritesOnlyCheckBox.Checked)
					{
						moShowFavoritesOnlyCheckBox.Checked = true;
					}
				}

				//**********************************************************
				// Re-populate the ListView.

				PopulateList();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView Resize Event Handler]
		//******************************************************************
		/// <summary>
		/// Adjusts the ListView column widths when the ListView changes
		/// size.
		/// </summary>
		private void moListView_Resize(object oSender,EventArgs oArgs)
		{
			try
			{
				ResizeListViewColumns();
			}
			catch (Exception oException)
			{
				LogException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView SelectedIndexChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// Updates controls and menus when the current ListView selection
		/// changes.
		/// </summary>
		private void moListView_SelectedIndexChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				UpdateControls();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView DoubleClick Event Handler]
		//******************************************************************
		/// <summary>
		/// Double-clicking in the ListView moves the input focus to the
		/// ValueTextBox and selects all of its text.
		/// </summary>
		private void moListView_DoubleClick(object oSender,EventArgs oArgs)
		{
			try
			{
				moValueTextBox.Focus();
				moValueTextBox.SelectAll();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ListView KeyPress Event Handler]
		//******************************************************************
		/// <summary>
		/// Provides keyboard shortcuts for the PlusButton ('+') and the
		/// MinusButton ('-').
		/// </summary>
		private void moListView_KeyPress(object oSender,
			KeyPressEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// The '+' character is a shortcut for the PlusButton.

				if (oArgs.KeyChar == '+')
				{
					oArgs.Handled = true;
					if (moPlusButton.Enabled)
					{
						moPlusButton.PerformClick();
					}
				}

				//**********************************************************
				// The '-' character is a shortcut for the MinusButton.

				if (oArgs.KeyChar == '-')
				{
					oArgs.Handled = true;
					if (moMinusButton.Enabled)
					{
						moMinusButton.PerformClick();
					}
				}
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
		/// Cuts the selected features from the ListView to the clipboard.
		/// </summary>
		private void moCutMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				CutSelectedFeatures();
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
		/// Copies the selected features from the ListView to the clipboard.
		/// </summary>
		private void moCopyMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				CopySelectedFeatures();
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
		/// Pastes the features from the clipboard to the ListView.
		/// </summary>
		private void moPasteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				PasteFeatures();
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
		/// Deletes the features selected in the ListView.
		/// </summary>
		private void moDeleteMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				DeleteSelectedFeatures();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [SelectAllMenu Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Selects all items in the ListView.
		/// </summary>
		private void moSelectAllMenu_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				foreach (ListViewItem oItem in moListView.Items)
				{
					oItem.Selected = true;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [NameTextBox Leave Event Handler]
		//******************************************************************
		/// <summary>
		/// Trims extraneous white-space characters from the NameTextBox
		/// when it loses input focus.
		/// </summary>
		private void moNameTextBox_Leave(object oSender,EventArgs oArgs)
		{
			try
			{
				moNameTextBox.Text = TrimFeatureName(moNameTextBox.Text);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [NameTextBox TextChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// When the NameTextBox is edited, select the feature (if any) in
		/// the ListView that matches the feature named in the NameTextBox.
		/// Also set ValueTextBox to the DisplayedNode's value (if any) for
		/// this feature.
		/// </summary>
		private void moNameTextBox_TextChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(DisplayedNode != null);

				//**********************************************************
				// Return if the NameTextBox does not have input focus.

				if (! moNameTextBox.ContainsFocus)
				{
					return;
				}

				//**********************************************************
				// Trim extraneous white-space characters from the name in
				// the NameTextBox.

				string sTrimmedName = TrimFeatureName(moNameTextBox.Text);

				//**********************************************************
				// Check if the DisplayedNode has a feature with the name
				// given by the NameTextBox (after extraneous white-space
				// characters were trimmed).
				//
				// If so, set the ValueTextBox to the value of this feature.
				//
				// Otherwise, set the ValueTextBox to an empty string.

				moValueTextBox.Text = "";
				if (sTrimmedName != "")
				{
					if (DisplayedNode.Features.Contains(sTrimmedName))
					{
						moValueTextBox.Text
							= DisplayedNode.Features[sTrimmedName];
					}
				}

				//**********************************************************
				// Select the feature (if any) in the ListView that matches
				// the feature name in the NameTextBox.

				moListView.SelectedItems.Clear();
				foreach (ListViewItem oItem in moListView.Items)
				{
					string sName = oItem.SubItems[moNameColumn.Index].Text;

					//******************************************************
					// If the name of the feature in the ListView matches
					// the NameTextBox string (after extraneous white-space
					// characters were trimmed), select the feature in the
					// ListView and make sure it is scrolled into view and
					// has focus within the ListView.

					if (sName == sTrimmedName)
					{
						oItem.Selected = true;
						oItem.Focused = true;
						oItem.EnsureVisible();
						return;
					}
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [NameTextBox KeyDown Event Handler]
		//******************************************************************
		/// <summary>
		/// Provides keyboard shortcuts to move to the ListView (Up) and to
		/// move to the ValueTextBox (Down).
		/// </summary>
		private void moNameTextBox_KeyDown(object oSender,
			KeyEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// The Up key is a shortcut to move to the ListView.

				if (oArgs.KeyData == Keys.Up)
				{
					oArgs.Handled = true;
					moListView.Focus();
				}

				//**********************************************************
				// The Down key is a shortcut to move to the ValueTextBox.

				if (oArgs.KeyData == Keys.Down)
				{
					oArgs.Handled = true;
					moValueTextBox.Focus();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ValueTextBox Enter and Leave Event Handlers]
		//******************************************************************
		/// <summary>
		/// Disables the form's AcceptButton when the ValueTextBox has
		/// input focus (so the Enter key can be used as a keyboard
		/// shortcut). Also makes sure the feature named by the NameTextBox
		/// is set to the value specified in the ValueTextBox.
		/// </summary>
		private void moValueTextBox_Enter(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Make sure the feature specified by the NameTextBox is set
				// to the text value in the ValueTextBox.

				SetFeature(moNameTextBox.Text,moValueTextBox.Text);

				//**********************************************************
				// Disable the form's AcceptButton.

				AcceptButton = null;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Re-enables the form's AcceptButton when input focus leaves the
		/// ValueTextBox.
		/// </summary>
		private void moValueTextBox_Leave(object oSender,EventArgs oArgs)
		{
			try
			{
				AcceptButton = moOKButton;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ValueTextBox TextChanged Event Handler]
		//******************************************************************
		/// <summary>
		/// When the ValueTextBox is edited, set the feature named by the
		/// NameTextBox to the value specified in the ValueTextBox.
		/// </summary>
		private void moValueTextBox_TextChanged(object oSender,
			EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Return if the ValueTextBox does not have input focus.

				if (! moValueTextBox.ContainsFocus)
				{
					return;
				}

				//**********************************************************
				// When the ValueTextBox is edited, set the feature
				// indicated by the NameTextBox to the value specified in
				// the ValueTextBox.

				SetFeature(moNameTextBox.Text,moValueTextBox.Text);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ValueTextBox KeyDown Event Handler]
		//******************************************************************
		/// <summary>
		/// Provides keyboard shortcuts to move to the ListView (Enter) and
		/// to move to the NameTextBox (Up).
		/// </summary>
		private void moValueTextBox_KeyDown(object oSender,
			KeyEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// The Enter key is a shortcut to move to the ListView.

				if (oArgs.KeyData == Keys.Enter)
				{
					oArgs.Handled = true;
					moListView.Focus();
				}

				//**********************************************************
				// The Up key is a shortcut to move to the NameTextBox.

				if (oArgs.KeyData == Keys.Up)
				{
					oArgs.Handled = true;
					moNameTextBox.Focus();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [DeleteButton Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Deletes the features selected in the ListView.
		/// </summary>
		private void moDeleteButton_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Check if the Delete button contains focus.

				bool bFocus = moDeleteButton.ContainsFocus;

				//**********************************************************
				// Delete the features selected in the ListView.

				DeleteSelectedFeatures();

				//**********************************************************
				// If the Delete button had focus before, set focus back to
				// the Delete button (since it may have been temporarily
				// disabled and lost focus when the selected features were
				// deleted). Otherwise, set focus to the NameTextBox.

				if ((bFocus) && (moDeleteButton.Enabled))
				{
					moDeleteButton.Focus();
				}
				else
				{
					moNameTextBox.Focus();
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [PlusButton and MinusButton Click Event Handlers]
		//******************************************************************
		/// <summary>
		/// Sets the features selected in the ListView to a plus ("+")
		/// value.
		/// </summary>
		private void moPlusButton_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Set the selected features to a plus ("+") value.

				SetSelectedFeatures("+");

				//**********************************************************
				// Set the input focus to the ListView.

				moListView.Focus();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		//******************************************************************
		/// <summary>
		/// Sets the features selected in the ListView to a minus ("-")
		/// value.
		/// </summary>
		private void moMinusButton_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Set the selected features to a minus ("-") value.

				SetSelectedFeatures("-");

				//**********************************************************
				// Set the input focus to the ListView.

				moListView.Focus();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [FavoriteInListCheckBox Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Toggles the checkbox, adding or removing the selected features
		/// in the ListFavorites collection.
		/// </summary>
		private void moFavoriteInListCheckBox_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(moFavoriteInListCheckBox.AutoCheck == false);

				//**********************************************************
				// To toggle the checkbox, determine if the selected
				// features will be added or removed as favorites.

				bool bAddFavorites = false;
				if (moFavoriteInListCheckBox.CheckState
					!= CheckState.Checked)
				{
					bAddFavorites = true;
				}

				//**********************************************************
				// For each selected feature in the ListView, add or remove
				// the feature name in the ListFavorites collection.

				foreach (ListViewItem oItem in moListView.SelectedItems)
				{
					string sName = oItem.SubItems[moNameColumn.Index].Text;
					if (bAddFavorites)
					{
						AddListFavorite(sName);
					}
					else
					{
						RemoveListFavorite(sName);
					}
				}

				//**********************************************************
				// Call the UpdateControls() method to display the changed
				// favorites in the ListView and to set the checked states
				// of the favorite-in-list and show-in-tree checkboxes.

				UpdateControls();

				//**********************************************************
				// Set the input focus to the ListView.

				moListView.Focus();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [ShowInTreeCheckBox Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Toggles the checkbox, adding or removing the selected features
		/// in the TreeFavorites collection.
		/// </summary>
		private void moShowInTreeCheckBox_Click(object oSender,
			EventArgs oArgs)
		{
			try
			{
				Debug.Assert(moShowInTreeCheckBox.AutoCheck == false);

				//**********************************************************
				// To toggle the checkbox, determine if the selected
				// features will be added or removed as favorites.

				bool bAddFavorites = false;
				if (moShowInTreeCheckBox.CheckState != CheckState.Checked)
				{
					bAddFavorites = true;
				}

				//**********************************************************
				// For each selected feature in the ListView, add or remove
				// the feature name in the TreeFavorites collection.

				foreach (ListViewItem oItem in moListView.SelectedItems)
				{
					string sName = oItem.SubItems[moNameColumn.Index].Text;
					if (bAddFavorites)
					{
						AddTreeFavorite(sName);
					}
					else
					{
						RemoveTreeFavorite(sName);
					}
				}

				//**********************************************************
				// Call the UpdateControls() method to display the changed
				// favorites in the ListView and to set the checked states
				// of the favorite-in-list and show-in-tree checkboxes.

				UpdateControls();

				//**********************************************************
				// Set the input focus to the ListView.

				moListView.Focus();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [OKButton Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Saves the favorite-features settings when the OK button is
		/// clicked.
		/// </summary>
		private void moOKButton_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Copy the working ListFavorites collection to the
				// FavoriteListFeatures collection.
				//
				// Copy the working TreeFavorites collection to the
				// FavoriteTreeFeatures collection.
				//
				// Set the CopyFavoritesOnly property to the checked value
				// of the CopyFavoritesOnlyCheckBox.

				FavoriteListFeatures.Clear();
				foreach (string sName in ListFavorites)
				{
					FavoriteListFeatures.Add(sName);
				}

				FavoriteTreeFeatures.Clear();
				foreach (string sName in TreeFavorites)
				{
					FavoriteTreeFeatures.Add(sName);
				}

				CopyFavoritesOnly = moCopyFavoritesOnlyCheckBox.Checked;

				//**********************************************************
				// Save these settings.

				SaveSettings();
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
