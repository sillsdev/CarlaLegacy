using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;

namespace PAWSStarterKit
{
	/// <summary>
	/// Summary description for DlgInitProgress.
	/// </summary>
	public class DlgInitProgress : System.Windows.Forms.Form
	{
		public System.Windows.Forms.ProgressBar progressBar;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgInitProgress()
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgInitProgress));
			this.progressBar = new System.Windows.Forms.ProgressBar();
			this.SuspendLayout();
			//
			// progressBar
			//
			this.progressBar.Location = new System.Drawing.Point(12, 38);
			this.progressBar.Name = "progressBar";
			this.progressBar.Size = new System.Drawing.Size(328, 24);
			this.progressBar.TabIndex = 3;
			//
			// DlgInitProgress
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(352, 101);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.progressBar});
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "DlgInitProgress";
			this.ShowInTaskbar = false;
			this.Text = "Initializing New Language.  Please Wait...";
			this.ResumeLayout(false);

		}
		#endregion
		public void doProgressUpdate(string strFile)
		{
			progressBar.PerformStep();
			Invalidate();
		}
	}
}
