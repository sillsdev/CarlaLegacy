using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace PAWSStarterKit
{
	/// <summary>
	/// Summary description for DlgLanguageProperties.
	/// </summary>
	public class DlgLanguageProperties : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		public System.Windows.Forms.TextBox tbAbbreviation;
		public System.Windows.Forms.TextBox tbLanguage;
		private System.Windows.Forms.Label label3;
		public System.Windows.Forms.Label lblFontName;
		private System.Windows.Forms.Button btnFont;
		private System.Windows.Forms.Label label4;
		public System.Windows.Forms.TextBox tbFieldCode;
		private System.Windows.Forms.Button btnCancel;
		private System.Windows.Forms.Button btnOK;
		public string strFontName;
		public string strFontSize;
		public string strFontColor;
		public bool bFontBold;
		public bool bFontItalic;
		public bool bFontUnderline;
		public bool bFontStrikeout;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgLanguageProperties()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			btnOK.DialogResult = DialogResult.OK;

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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgLanguageProperties));
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.tbAbbreviation = new System.Windows.Forms.TextBox();
			this.tbLanguage = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.lblFontName = new System.Windows.Forms.Label();
			this.btnFont = new System.Windows.Forms.Button();
			this.label4 = new System.Windows.Forms.Label();
			this.tbFieldCode = new System.Windows.Forms.TextBox();
			this.btnCancel = new System.Windows.Forms.Button();
			this.btnOK = new System.Windows.Forms.Button();
			this.SuspendLayout();
			//
			// label1
			//
			this.label1.Location = new System.Drawing.Point(32, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(120, 16);
			this.label1.TabIndex = 0;
			this.label1.Text = "Language &Name:";
			//
			// label2
			//
			this.label2.Location = new System.Drawing.Point(32, 64);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(128, 16);
			this.label2.TabIndex = 2;
			this.label2.Text = "Language &Abbreviation:";
			//
			// tbAbbreviation
			//
			this.tbAbbreviation.Location = new System.Drawing.Point(176, 62);
			this.tbAbbreviation.MaxLength = 3;
			this.tbAbbreviation.Name = "tbAbbreviation";
			this.tbAbbreviation.Size = new System.Drawing.Size(32, 20);
			this.tbAbbreviation.TabIndex = 3;
			this.tbAbbreviation.Text = "Abbr";
			//
			// tbLanguage
			//
			this.tbLanguage.Location = new System.Drawing.Point(176, 22);
			this.tbLanguage.Name = "tbLanguage";
			this.tbLanguage.Size = new System.Drawing.Size(312, 20);
			this.tbLanguage.TabIndex = 1;
			this.tbLanguage.Text = "Language";
			//
			// label3
			//
			this.label3.Location = new System.Drawing.Point(232, 64);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(104, 16);
			this.label3.TabIndex = 4;
			this.label3.Text = "(Up to three letters)";
			//
			// lblFontName
			//
			this.lblFontName.Location = new System.Drawing.Point(32, 104);
			this.lblFontName.Name = "lblFontName";
			this.lblFontName.Size = new System.Drawing.Size(232, 16);
			this.lblFontName.TabIndex = 5;
			this.lblFontName.Text = "Font Name shown at runtime";
			//
			// btnFont
			//
			this.btnFont.Location = new System.Drawing.Point(288, 100);
			this.btnFont.Name = "btnFont";
			this.btnFont.Size = new System.Drawing.Size(112, 24);
			this.btnFont.TabIndex = 6;
			this.btnFont.Text = "Change &Font...";
			this.btnFont.Click += new System.EventHandler(this.ChangeFontOnClick);
			//
			// label4
			//
			this.label4.Location = new System.Drawing.Point(32, 152);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(216, 32);
			this.label4.TabIndex = 7;
			this.label4.Text = "Enter the field code to use for examples (Include the backslash)";
			//
			// tbFieldCode
			//
			this.tbFieldCode.Location = new System.Drawing.Point(280, 158);
			this.tbFieldCode.Name = "tbFieldCode";
			this.tbFieldCode.Size = new System.Drawing.Size(96, 20);
			this.tbFieldCode.TabIndex = 8;
			this.tbFieldCode.Text = "Field Code";
			//
			// btnCancel
			//
			this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.btnCancel.Location = new System.Drawing.Point(392, 240);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(96, 24);
			this.btnCancel.TabIndex = 10;
			this.btnCancel.Text = "Cancel";
			//
			// btnOK
			//
			this.btnOK.Location = new System.Drawing.Point(280, 240);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(96, 24);
			this.btnOK.TabIndex = 9;
			this.btnOK.Text = "OK";
			//
			// DlgLanguageProperties
			//
			this.AcceptButton = this.btnOK;
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.CancelButton = this.btnCancel;
			this.ClientSize = new System.Drawing.Size(496, 273);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.btnOK,
																		  this.btnCancel,
																		  this.tbFieldCode,
																		  this.label4,
																		  this.btnFont,
																		  this.lblFontName,
																		  this.label3,
																		  this.tbLanguage,
																		  this.tbAbbreviation,
																		  this.label2,
																		  this.label1});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "DlgLanguageProperties";
			this.Text = "Language Properties";
			this.ResumeLayout(false);

		}
		#endregion

		private void ChangeFontOnClick(object sender, System.EventArgs e)
		{
			FontDialog fontdlg = new FontDialog();
			fontdlg.ShowEffects = true;
			fontdlg.ShowColor = true;
			if (strFontName == null)
				strFontName = SystemInformation.MenuFont.ToString();
			if (strFontSize == null)
				strFontSize = "12";
			if (strFontColor == null)
				strFontColor = SystemColors.WindowText.ToString();
			fontdlg.Color = System.Drawing.Color.FromName(strFontColor);
			// set style
			FontStyle fst = new FontStyle();
			fst = FontStyle.Regular;
			if (bFontBold)
				fst |= FontStyle.Bold;
			if (bFontItalic)
				fst |= FontStyle.Italic;
			if (bFontUnderline)
				fst |= FontStyle.Underline;
			if (bFontStrikeout)
				fst |= FontStyle.Strikeout;
			System.Drawing.Font font = new System.Drawing.Font(strFontName,
				(float)Convert.ToDouble(strFontSize), fst);
			fontdlg.Font = font;
			if (fontdlg.ShowDialog() == DialogResult.OK)
			{
				// set the values
				strFontName = fontdlg.Font.Name;
				strFontSize = fontdlg.Font.Size.ToString();
				strFontColor = fontdlg.Color.ToString();
				strFontColor = strFontColor.Substring(7, strFontColor.Length-8);
				bFontBold = fontdlg.Font.Bold;
				bFontItalic = fontdlg.Font.Italic;
				bFontUnderline = fontdlg.Font.Underline;
				bFontStrikeout = fontdlg.Font.Strikeout;
				this.lblFontName.Text = strFontName;
			}
		}
	}
}
