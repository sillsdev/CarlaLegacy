using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace LingTree
{
	/// <summary>
	/// Summary description for DlgSaveFormat.
	/// </summary>
	public class DlgSaveFormat : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.CheckBox cbBmp;
		private System.Windows.Forms.CheckBox cbGif;
		private System.Windows.Forms.CheckBox cbJpg;
		private System.Windows.Forms.CheckBox cbPng;
		private System.Windows.Forms.CheckBox cbTif;
		private System.Windows.Forms.CheckBox cbEmf;
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Button btnCancel;
		private System.Windows.Forms.HelpProvider helpProvider;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgSaveFormat()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			btnOK.DialogResult = DialogResult.OK;
			btnCancel.DialogResult = DialogResult.Cancel;
			InitHelp();
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
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
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgSaveFormat));
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.cbEmf = new System.Windows.Forms.CheckBox();
			this.cbTif = new System.Windows.Forms.CheckBox();
			this.cbPng = new System.Windows.Forms.CheckBox();
			this.cbJpg = new System.Windows.Forms.CheckBox();
			this.cbGif = new System.Windows.Forms.CheckBox();
			this.cbBmp = new System.Windows.Forms.CheckBox();
			this.btnOK = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			this.helpProvider = new System.Windows.Forms.HelpProvider();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			//
			// groupBox1
			//
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.cbEmf,
																					this.cbTif,
																					this.cbPng,
																					this.cbJpg,
																					this.cbGif,
																					this.cbBmp});
			this.groupBox1.Location = new System.Drawing.Point(16, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(264, 272);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Check all the formats to use when saving";
			//
			// cbEmf
			//
			this.cbEmf.Location = new System.Drawing.Point(16, 59);
			this.cbEmf.Name = "cbEmf";
			this.cbEmf.Size = new System.Drawing.Size(240, 32);
			this.cbEmf.TabIndex = 1;
			this.cbEmf.Text = "Windows Enhanced Metafile format (*.emf) (Useful for importing into WinWord)";
			//
			// cbTif
			//
			this.cbTif.Location = new System.Drawing.Point(16, 240);
			this.cbTif.Name = "cbTif";
			this.cbTif.Size = new System.Drawing.Size(240, 16);
			this.cbTif.TabIndex = 5;
			this.cbTif.Text = "Tagged Image File Format (*.tif)";
			//
			// cbPng
			//
			this.cbPng.Location = new System.Drawing.Point(16, 196);
			this.cbPng.Name = "cbPng";
			this.cbPng.Size = new System.Drawing.Size(240, 28);
			this.cbPng.TabIndex = 4;
			this.cbPng.Text = "Portable NetWork Graphics  (*.png)            (Useful for Web pages)";
			//
			// cbJpg
			//
			this.cbJpg.Location = new System.Drawing.Point(16, 161);
			this.cbJpg.Name = "cbJpg";
			this.cbJpg.Size = new System.Drawing.Size(240, 16);
			this.cbJpg.TabIndex = 3;
			this.cbJpg.Text = "JPEG File Interchange Format (*.jpg)";
			//
			// cbGif
			//
			this.cbGif.Enabled = false;
			this.cbGif.Location = new System.Drawing.Point(16, 110);
			this.cbGif.Name = "cbGif";
			this.cbGif.Size = new System.Drawing.Size(240, 32);
			this.cbGif.TabIndex = 2;
			this.cbGif.Text = "Graphics Interchange Format (*.gif)       (Useful for Web pages)";
			//
			// cbBmp
			//
			this.cbBmp.Location = new System.Drawing.Point(16, 24);
			this.cbBmp.Name = "cbBmp";
			this.cbBmp.Size = new System.Drawing.Size(240, 16);
			this.cbBmp.TabIndex = 0;
			this.cbBmp.Text = "Windows Bitmap (*.bmp)";
			//
			// btnOK
			//
			this.btnOK.Location = new System.Drawing.Point(296, 16);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(80, 24);
			this.btnOK.TabIndex = 1;
			this.btnOK.Text = "OK";
			//
			// btnCancel
			//
			this.btnCancel.Location = new System.Drawing.Point(296, 48);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(80, 24);
			this.btnCancel.TabIndex = 2;
			this.btnCancel.Text = "Cancel";
			//
			// DlgSaveFormat
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(378, 295);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.btnCancel,
																		  this.btnOK,
																		  this.groupBox1});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.HelpButton = true;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "DlgSaveFormat";
			this.Text = "Set Save Formats";
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion
		/// <summary>
		/// Gets/sets use *.bmp format.
		/// </summary>
		public bool UseBmp
		{
			get
			{
				return cbBmp.Checked;
			}
			set
			{
				cbBmp.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets use *.emf format.
		/// </summary>
		public bool UseEmf
		{
			get
			{
				return cbEmf.Checked;
			}
			set
			{
				cbEmf.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets use *.gif format.
		/// </summary>
		public bool UseGif
		{
			get
			{
				return cbGif.Checked;
			}
			set
			{
				cbGif.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets use *.jpg format.
		/// </summary>
		public bool UseJpg
		{
			get
			{
				return cbJpg.Checked;
			}
			set
			{
				cbJpg.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets use *.png format.
		/// </summary>
		public bool UsePng
		{
			get
			{
				return cbPng.Checked;
			}
			set
			{
				cbPng.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets use *.tif format.
		/// </summary>
		public bool UseTif
		{
			get
			{
				return cbTif.Checked;
			}
			set
			{
				cbTif.Checked = value;
			}
		}
		void InitHelp()
		{
			helpProvider.SetHelpString(cbBmp, "If this is checked, the tree display will be saved as a bitmap file.\n" +
					"You can use this with a program like Paint.");
			helpProvider.SetHelpString(this.cbEmf, "If this is checked, the tree display will be saved as a Windows metafile file.\n" +
				"You can use this with a program like Word for Windows (use Insert / Picture / From File...).");
			helpProvider.SetHelpString(this.cbGif, "If this is checked, the tree display will be saved as a Graphics Interchange Format file.\n" +
				"You can use this in a web page (e.g. use a <img> HTML element).");
			helpProvider.SetHelpString(this.cbJpg, "If this is checked, the tree display will be saved as a JPEG File Interchange Format file.\n" +
				"You can use this in a web page (e.g. use a <img> HTML element).");
			helpProvider.SetHelpString(this.cbPng, "If this is checked, the tree display will be saved as a Portable Network Graphics file.\n" +
				"You can use this in a web page (e.g. use a <img> HTML element).");
			helpProvider.SetHelpString(this.cbTif, "If this is checked, the tree display will be saved as a Tagged Image file.\n" +
				"You can use this in a web page (e.g. use a <img> HTML element).");
		}
	}
}
