using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace PAWSStarterKit
{
	/// <summary>
	/// Summary description for DlgFileNew.
	/// </summary>
	public class DlgFileNew : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		public System.Windows.Forms.RadioButton rbCreate;
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Button btnCancel;
		public System.Windows.Forms.RadioButton rbCopy;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgFileNew()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgFileNew));
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.rbCopy = new System.Windows.Forms.RadioButton();
			this.rbCreate = new System.Windows.Forms.RadioButton();
			this.btnOK = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			//
			// groupBox1
			//
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.rbCopy,
																					this.rbCreate});
			this.groupBox1.Location = new System.Drawing.Point(8, 24);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(280, 72);
			this.groupBox1.TabIndex = 1;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "What do you want to do?";
			//
			// rbCopy
			//
			this.rbCopy.Location = new System.Drawing.Point(8, 48);
			this.rbCopy.Name = "rbCopy";
			this.rbCopy.Size = new System.Drawing.Size(248, 16);
			this.rbCopy.TabIndex = 1;
			this.rbCopy.Text = "&Copy an existing language\'s answer file.";
			//
			// rbCreate
			//
			this.rbCreate.Checked = true;
			this.rbCreate.Location = new System.Drawing.Point(8, 24);
			this.rbCreate.Name = "rbCreate";
			this.rbCreate.Size = new System.Drawing.Size(264, 16);
			this.rbCreate.TabIndex = 0;
			this.rbCreate.TabStop = true;
			this.rbCreate.Text = "Create a &new language from scratch.";
			//
			// btnOK
			//
			this.btnOK.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.btnOK.Location = new System.Drawing.Point(136, 112);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(72, 24);
			this.btnOK.TabIndex = 2;
			this.btnOK.Text = "OK";
			//
			// btnCancel
			//
			this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.btnCancel.Location = new System.Drawing.Point(216, 112);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(72, 24);
			this.btnCancel.TabIndex = 3;
			this.btnCancel.Text = "Cancel";
			//
			// DlgFileNew
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(296, 141);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.btnCancel,
																		  this.btnOK,
																		  this.groupBox1});
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "DlgFileNew";
			this.Text = "Creating a new PAWS language...";
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion
	}
}
