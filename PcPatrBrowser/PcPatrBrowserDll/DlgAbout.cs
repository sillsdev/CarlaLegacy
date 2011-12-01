using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace SIL.PcPatrBrowser
{
	/// <summary>
	/// Summary description for DlgAbout.
	/// </summary>
	public class DlgAbout : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label lblVersion;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgAbout()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			lblVersion.Text = "Beta Version " + ProductVersion;
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DlgAbout));
			this.button1 = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.lblVersion = new System.Windows.Forms.Label();
			this.SuspendLayout();
			//
			// button1
			//
			this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.button1.Location = new System.Drawing.Point(120, 224);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(104, 24);
			this.button1.TabIndex = 0;
			this.button1.Text = "&OK";
			//
			// label1
			//
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.label1.Location = new System.Drawing.Point(24, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(248, 24);
			this.label1.TabIndex = 1;
			this.label1.Text = "PcPatr Browser";
			//
			// label2
			//
			this.label2.Location = new System.Drawing.Point(24, 40);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(317, 24);
			this.label2.TabIndex = 2;
			this.label2.Text = "A tool to aid in studying syntactic tree output from PC-PATR.";
			//
			// label3
			//
			this.label3.Location = new System.Drawing.Point(24, 104);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(188, 24);
			this.label3.TabIndex = 3;
			this.label3.Text = "Copyright © 2011, SIL International";
			//
			// label4
			//
			this.label4.Location = new System.Drawing.Point(24, 160);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(296, 24);
			this.label4.TabIndex = 4;
			this.label4.Text = "For support, contact andy_black@sil.org";
			//
			// lblVersion
			//
			this.lblVersion.Location = new System.Drawing.Point(24, 64);
			this.lblVersion.Name = "lblVersion";
			this.lblVersion.Size = new System.Drawing.Size(256, 24);
			this.lblVersion.TabIndex = 5;
			this.lblVersion.Text = "Beta Version";
			//
			// DlgAbout
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(344, 266);
			this.Controls.Add(this.lblVersion);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.button1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "DlgAbout";
			this.Text = "About PcPatrBrowser";
			this.ResumeLayout(false);

		}
		#endregion
	}
}
