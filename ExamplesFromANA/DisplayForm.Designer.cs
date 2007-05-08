namespace ExamplesFromANA
{
	partial class DisplayForm
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DisplayForm));
			this.menuStrip = new System.Windows.Forms.MenuStrip();
			this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.openCarlaStudioProjectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.recentProjectsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
			this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.recentFilesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.closeAllToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
			this.openXMLCorpusToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.recentXMLCorpusesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
			this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.viewReadmeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
			this.splitContainer = new System.Windows.Forms.SplitContainer();
			this.listBoxTokens = new System.Windows.Forms.ListBox();
			this.flowLayoutPanelExamples = new System.Windows.Forms.FlowLayoutPanel();
			this.toolTip = new System.Windows.Forms.ToolTip(this.components);
			this.backgroundWorker = new System.ComponentModel.BackgroundWorker();
			this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.analysisOfSelectedWordToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.menuStrip.SuspendLayout();
			this.splitContainer.Panel1.SuspendLayout();
			this.splitContainer.Panel2.SuspendLayout();
			this.splitContainer.SuspendLayout();
			this.SuspendLayout();
			//
			// menuStrip
			//
			this.menuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
			this.fileToolStripMenuItem,
			this.editToolStripMenuItem,
			this.helpToolStripMenuItem});
			this.menuStrip.Location = new System.Drawing.Point(0, 0);
			this.menuStrip.Name = "menuStrip";
			this.menuStrip.Size = new System.Drawing.Size(628, 24);
			this.menuStrip.TabIndex = 0;
			this.menuStrip.Text = "menuStrip1";
			//
			// fileToolStripMenuItem
			//
			this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
			this.openCarlaStudioProjectToolStripMenuItem,
			this.recentProjectsToolStripMenuItem,
			this.toolStripSeparator2,
			this.openToolStripMenuItem,
			this.recentFilesToolStripMenuItem,
			this.closeAllToolStripMenuItem,
			this.toolStripSeparator3,
			this.openXMLCorpusToolStripMenuItem,
			this.recentXMLCorpusesToolStripMenuItem,
			this.toolStripSeparator1,
			this.exitToolStripMenuItem});
			this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
			this.fileToolStripMenuItem.Size = new System.Drawing.Size(35, 20);
			this.fileToolStripMenuItem.Text = "&File";
			this.fileToolStripMenuItem.DropDownOpening += new System.EventHandler(this.fileToolStripMenuItem_DropDownOpening);
			//
			// openCarlaStudioProjectToolStripMenuItem
			//
			this.openCarlaStudioProjectToolStripMenuItem.Name = "openCarlaStudioProjectToolStripMenuItem";
			this.openCarlaStudioProjectToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.openCarlaStudioProjectToolStripMenuItem.Text = "Open CarlaStudio &Language File";
			this.openCarlaStudioProjectToolStripMenuItem.ToolTipText = "Choose which CarlaStudio language project file to use for project information (e." +
				"g. Font to display examples in)";
			this.openCarlaStudioProjectToolStripMenuItem.Click += new System.EventHandler(this.openCarlaStudioProjectToolStripMenuItem_Click);
			//
			// recentProjectsToolStripMenuItem
			//
			this.recentProjectsToolStripMenuItem.Name = "recentProjectsToolStripMenuItem";
			this.recentProjectsToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.recentProjectsToolStripMenuItem.Text = "Recent Language &Files";
			//
			// toolStripSeparator2
			//
			this.toolStripSeparator2.Name = "toolStripSeparator2";
			this.toolStripSeparator2.Size = new System.Drawing.Size(224, 6);
			//
			// openToolStripMenuItem
			//
			this.openToolStripMenuItem.Name = "openToolStripMenuItem";
			this.openToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
			this.openToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.openToolStripMenuItem.Text = "&Open .ana Files";
			this.openToolStripMenuItem.ToolTipText = "Open one or more .ana files to view the examples in them. This will display the e" +
				"xamples using information from the currently selected CarlaStudio language proje" +
				"ct file";
			this.openToolStripMenuItem.Click += new System.EventHandler(this.openToolStripMenuItem_Click);
			//
			// recentFilesToolStripMenuItem
			//
			this.recentFilesToolStripMenuItem.Name = "recentFilesToolStripMenuItem";
			this.recentFilesToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.recentFilesToolStripMenuItem.Text = "&Recent .ana Files";
			//
			// closeAllToolStripMenuItem
			//
			this.closeAllToolStripMenuItem.Name = "closeAllToolStripMenuItem";
			this.closeAllToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.closeAllToolStripMenuItem.Text = "&Close All";
			this.closeAllToolStripMenuItem.ToolTipText = "Clear out the currently loaded contents (note: the list below is not automaticall" +
				"y cleared when you open more .ana files)";
			this.closeAllToolStripMenuItem.Click += new System.EventHandler(this.closeAllToolStripMenuItem_Click);
			//
			// toolStripSeparator3
			//
			this.toolStripSeparator3.Name = "toolStripSeparator3";
			this.toolStripSeparator3.Size = new System.Drawing.Size(224, 6);
			//
			// openXMLCorpusToolStripMenuItem
			//
			this.openXMLCorpusToolStripMenuItem.Name = "openXMLCorpusToolStripMenuItem";
			this.openXMLCorpusToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.openXMLCorpusToolStripMenuItem.Text = "Open X&ML Corpus";
			this.openXMLCorpusToolStripMenuItem.ToolTipText = "Open a previously saved corpus (the original .ana files turned into XML)";
			this.openXMLCorpusToolStripMenuItem.Click += new System.EventHandler(this.openXMLCorpusToolStripMenuItem_Click);
			//
			// recentXMLCorpusesToolStripMenuItem
			//
			this.recentXMLCorpusesToolStripMenuItem.Name = "recentXMLCorpusesToolStripMenuItem";
			this.recentXMLCorpusesToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.recentXMLCorpusesToolStripMenuItem.Text = "Recent &XML Corpuses";
			//
			// toolStripSeparator1
			//
			this.toolStripSeparator1.Name = "toolStripSeparator1";
			this.toolStripSeparator1.Size = new System.Drawing.Size(224, 6);
			//
			// exitToolStripMenuItem
			//
			this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
			this.exitToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F4)));
			this.exitToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
			this.exitToolStripMenuItem.Text = "&Exit";
			this.exitToolStripMenuItem.ToolTipText = "Exit application";
			this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
			//
			// helpToolStripMenuItem
			//
			this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
			this.viewReadmeToolStripMenuItem});
			this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
			this.helpToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
			this.helpToolStripMenuItem.Text = "&Help";
			//
			// viewReadmeToolStripMenuItem
			//
			this.viewReadmeToolStripMenuItem.Name = "viewReadmeToolStripMenuItem";
			this.viewReadmeToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
			this.viewReadmeToolStripMenuItem.Text = "&View Readme";
			this.viewReadmeToolStripMenuItem.ToolTipText = "Open the readme file in an RTF file viewer";
			this.viewReadmeToolStripMenuItem.Click += new System.EventHandler(this.viewReadmeToolStripMenuItem_Click);
			//
			// openFileDialog
			//
			this.openFileDialog.DefaultExt = "ana";
			this.openFileDialog.Filter = "CarlaStudio ANA Files (*.ana)|*.ana|All files (*.*)|*.*";
			this.openFileDialog.Multiselect = true;
			this.openFileDialog.RestoreDirectory = true;
			this.openFileDialog.SupportMultiDottedExtensions = true;
			//
			// splitContainer
			//
			this.splitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
			this.splitContainer.Location = new System.Drawing.Point(0, 24);
			this.splitContainer.Name = "splitContainer";
			//
			// splitContainer.Panel1
			//
			this.splitContainer.Panel1.Controls.Add(this.listBoxTokens);
			//
			// splitContainer.Panel2
			//
			this.splitContainer.Panel2.Controls.Add(this.flowLayoutPanelExamples);
			this.splitContainer.Size = new System.Drawing.Size(628, 368);
			this.splitContainer.SplitterDistance = 128;
			this.splitContainer.TabIndex = 1;
			//
			// listBoxTokens
			//
			this.listBoxTokens.Dock = System.Windows.Forms.DockStyle.Fill;
			this.listBoxTokens.FormattingEnabled = true;
			this.listBoxTokens.Location = new System.Drawing.Point(0, 0);
			this.listBoxTokens.Name = "listBoxTokens";
			this.listBoxTokens.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
			this.listBoxTokens.Size = new System.Drawing.Size(128, 368);
			this.listBoxTokens.Sorted = true;
			this.listBoxTokens.TabIndex = 0;
			this.listBoxTokens.SelectedIndexChanged += new System.EventHandler(this.listBoxTokens_SelectedIndexChanged);
			this.listBoxTokens.MouseMove += new System.Windows.Forms.MouseEventHandler(this.listBoxTokens_MouseMove);
			//
			// flowLayoutPanelExamples
			//
			this.flowLayoutPanelExamples.AutoScroll = true;
			this.flowLayoutPanelExamples.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
			this.flowLayoutPanelExamples.Dock = System.Windows.Forms.DockStyle.Fill;
			this.flowLayoutPanelExamples.Location = new System.Drawing.Point(0, 0);
			this.flowLayoutPanelExamples.Name = "flowLayoutPanelExamples";
			this.flowLayoutPanelExamples.Size = new System.Drawing.Size(496, 368);
			this.flowLayoutPanelExamples.TabIndex = 0;
			//
			// toolTip
			//
			this.toolTip.AutoPopDelay = 20000;
			this.toolTip.InitialDelay = 500;
			this.toolTip.ReshowDelay = 100;
			//
			// backgroundWorker
			//
			this.backgroundWorker.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker_DoWork);
			//
			// editToolStripMenuItem
			//
			this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
			this.analysisOfSelectedWordToolStripMenuItem});
			this.editToolStripMenuItem.Name = "editToolStripMenuItem";
			this.editToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
			this.editToolStripMenuItem.Text = "&Edit";
			this.editToolStripMenuItem.DropDownOpening += new System.EventHandler(this.editToolStripMenuItem_DropDownOpening);
			//
			// analysisOfSelectedWordToolStripMenuItem
			//
			this.analysisOfSelectedWordToolStripMenuItem.Name = "analysisOfSelectedWordToolStripMenuItem";
			this.analysisOfSelectedWordToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F2;
			this.analysisOfSelectedWordToolStripMenuItem.Size = new System.Drawing.Size(218, 22);
			this.analysisOfSelectedWordToolStripMenuItem.Text = "Analysis of &Selected Word";
			this.analysisOfSelectedWordToolStripMenuItem.ToolTipText = "Edit the analysis (in XML) of the selected words below";
			this.analysisOfSelectedWordToolStripMenuItem.Click += new System.EventHandler(this.analysisOfSelectedWordToolStripMenuItem_Click);
			//
			// DisplayForm
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(628, 392);
			this.Controls.Add(this.splitContainer);
			this.Controls.Add(this.menuStrip);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MainMenuStrip = this.menuStrip;
			this.Name = "DisplayForm";
			this.Text = "Examples from CarlaStudio ANA files";
			this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.DisplayForm_FormClosing);
			this.menuStrip.ResumeLayout(false);
			this.menuStrip.PerformLayout();
			this.splitContainer.Panel1.ResumeLayout(false);
			this.splitContainer.Panel2.ResumeLayout(false);
			this.splitContainer.ResumeLayout(false);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.MenuStrip menuStrip;
		private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
		private System.Windows.Forms.OpenFileDialog openFileDialog;
		private System.Windows.Forms.ToolStripMenuItem recentFilesToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
		private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
		private System.Windows.Forms.SplitContainer splitContainer;
		private System.Windows.Forms.ListBox listBoxTokens;
		private System.Windows.Forms.FlowLayoutPanel flowLayoutPanelExamples;
		private System.Windows.Forms.ToolStripMenuItem closeAllToolStripMenuItem;
		private System.Windows.Forms.ToolTip toolTip;
		private System.Windows.Forms.ToolStripMenuItem openCarlaStudioProjectToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem recentProjectsToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
		private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem viewReadmeToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem recentXMLCorpusesToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
		private System.Windows.Forms.ToolStripMenuItem openXMLCorpusToolStripMenuItem;
		private System.ComponentModel.BackgroundWorker backgroundWorker;
		private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem analysisOfSelectedWordToolStripMenuItem;
	}
}
