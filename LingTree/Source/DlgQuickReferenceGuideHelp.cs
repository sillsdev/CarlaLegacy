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
	/// Summary description for DlgQuickReferenceGuideHelp.
	/// </summary>
	public class DlgQuickReferenceGuideHelp : System.Windows.Forms.Form
	{
		const string m_strDlgQRGLocationX = "DlgQRGLocationX";
		const string m_strDlgQRGLocationY = "DlgQRGLocationY";
		const string m_strDlgQRGSizeHeight = "DlgQRGSizeHeight";
		const string m_strDlgQRGSizeWidth = "DlgQRGSizeWidth";

		private AxSHDocVw.AxWebBrowser axwbQuickRefGuide;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgQuickReferenceGuideHelp()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			RegistryKey regkey = Registry.CurrentUser.OpenSubKey(LingTreeApp.m_strRegKey);
			if (regkey != null)
			{
				// Window location
				int iX = Convert.ToInt32((string)regkey.GetValue(m_strDlgQRGLocationX));
				int iY = Convert.ToInt32((string)regkey.GetValue(m_strDlgQRGLocationY));
				int iWidth = Convert.ToInt32((string)regkey.GetValue(m_strDlgQRGSizeWidth));
				iWidth = Math.Max(400, iWidth);
				int iHeight = Convert.ToInt32((string)regkey.GetValue(m_strDlgQRGSizeHeight));
				iHeight = Math.Max(450, iHeight);
				StartPosition = FormStartPosition.Manual;
				this.Location = new Point(iX, iY);
				this.Size = new Size(iWidth, iHeight);
				regkey.Close();
			}

			string strCurDir = Application.StartupPath;
			string strQuickRefGuideHtm = Path.Combine(strCurDir, @"Documentation\QuickReferenceGuide.htm");

			System.Object nullObject = 0;
			System.Object nullObjStr = "";
			axwbQuickRefGuide.Navigate(strQuickRefGuideHtm, ref nullObject, ref nullObjStr, ref
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgQuickReferenceGuideHelp));
			this.axwbQuickRefGuide = new AxSHDocVw.AxWebBrowser();
			((System.ComponentModel.ISupportInitialize)(this.axwbQuickRefGuide)).BeginInit();
			this.SuspendLayout();
			//
			// axwbQuickRefGuide
			//
			this.axwbQuickRefGuide.Dock = System.Windows.Forms.DockStyle.Fill;
			this.axwbQuickRefGuide.Enabled = true;
			this.axwbQuickRefGuide.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axwbQuickRefGuide.OcxState")));
			this.axwbQuickRefGuide.Size = new System.Drawing.Size(292, 405);
			this.axwbQuickRefGuide.TabIndex = 0;
			//
			// DlgQuickReferenceGuideHelp
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.AutoScroll = true;
			this.ClientSize = new System.Drawing.Size(292, 405);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.axwbQuickRefGuide});
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Name = "DlgQuickReferenceGuideHelp";
			this.Text = "LingTree Quick Reference Guide";
			((System.ComponentModel.ISupportInitialize)(this.axwbQuickRefGuide)).EndInit();
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
			regkey.SetValue(m_strDlgQRGLocationX, this.Location.X.ToString());
			regkey.SetValue(m_strDlgQRGLocationY, this.Location.Y.ToString());
			regkey.SetValue(m_strDlgQRGSizeWidth, this.Size.Width.ToString());
			regkey.SetValue(m_strDlgQRGSizeHeight, this.Size.Height.ToString());
			regkey.Close();
		}
	}
}
