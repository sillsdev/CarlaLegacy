using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.IO;
using System.Windows.Forms;
using Microsoft.Win32;

namespace LingTree
{
	/// <summary>
	/// Summary description for DlgHelpTopics.
	/// </summary>
	public class DlgHelpTopics : System.Windows.Forms.Form
	{
		const string m_strDlgHTLocationX = "DlgHTLocationX";
		const string m_strDlgHTLocationY = "DlgHTLocationY";
		const string m_strDlgHTSizeHeight = "DlgHTSizeHeight";
		const string m_strDlgHTSizeWidth = "DlgHTSizeWidth";

		private AxSHDocVw.AxWebBrowser axwbHelpTopics;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgHelpTopics()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			RegistryKey regkey = Registry.CurrentUser.OpenSubKey(LingTreeApp.m_strRegKey);
			if (regkey != null)
			{
				// Window location
				int iX = Convert.ToInt32((string)regkey.GetValue(m_strDlgHTLocationX));
				int iY = Convert.ToInt32((string)regkey.GetValue(m_strDlgHTLocationY));
				int iWidth = Convert.ToInt32((string)regkey.GetValue(m_strDlgHTSizeWidth));
				iWidth = Math.Max(500, iWidth);
				int iHeight = Convert.ToInt32((string)regkey.GetValue(m_strDlgHTSizeHeight));
				iHeight = Math.Max(500, iHeight);
				StartPosition = FormStartPosition.Manual;
				this.Location = new Point(iX, iY);
				this.Size = new Size(iWidth, iHeight);
				regkey.Close();
			}

			string strCurDir = Application.StartupPath;
			string strHelpTopicsHtm = Path.Combine(strCurDir, @"Documentation\HelpTopics.htm");

			System.Object nullObject = 0;
			System.Object nullObjStr = "";
			axwbHelpTopics.Navigate(strHelpTopicsHtm, ref nullObject, ref nullObjStr, ref
				nullObjStr, ref nullObjStr);
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgHelpTopics));
			this.axwbHelpTopics = new AxSHDocVw.AxWebBrowser();
			((System.ComponentModel.ISupportInitialize)(this.axwbHelpTopics)).BeginInit();
			this.SuspendLayout();
			//
			// axwbHelpTopics
			//
			this.axwbHelpTopics.Dock = System.Windows.Forms.DockStyle.Fill;
			this.axwbHelpTopics.Enabled = true;
			this.axwbHelpTopics.Location = new System.Drawing.Point(0, 0);
			this.axwbHelpTopics.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axwbHelpTopics.OcxState")));
			this.axwbHelpTopics.Size = new System.Drawing.Size(520, 517);
			this.axwbHelpTopics.TabIndex = 0;
			//
			// DlgHelpTopics
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(520, 517);
			this.Controls.Add(this.axwbHelpTopics);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Name = "DlgHelpTopics";
			this.Text = "LingTree Help Topics";
			((System.ComponentModel.ISupportInitialize)(this.axwbHelpTopics)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion
		protected override void OnClosed(EventArgs ea)
		{
			RegistryKey regkey = Registry.CurrentUser.OpenSubKey(LingTreeApp.m_strRegKey, true);
			if (regkey == null)
			{
				regkey = Registry.CurrentUser.CreateSubKey(LingTreeApp.m_strRegKey);
			}
			// Window position and location
			regkey.SetValue(m_strDlgHTLocationX, this.Location.X.ToString());
			regkey.SetValue(m_strDlgHTLocationY, this.Location.Y.ToString());
			regkey.SetValue(m_strDlgHTSizeWidth, this.Size.Width.ToString());
			regkey.SetValue(m_strDlgHTSizeHeight, this.Size.Height.ToString());
			regkey.Close();
		}
	}
}
