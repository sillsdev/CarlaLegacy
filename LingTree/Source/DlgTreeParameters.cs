using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace LingTree
{
	/// <summary>
	/// Summary description for DlgTreeParameters.
	/// </summary>
	public class DlgTreeParameters : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.TextBox tbLexGlossGap;
		private System.Windows.Forms.TextBox tbVerticalGap;
		private System.Windows.Forms.TextBox tbHorizontalGap;
		private System.Windows.Forms.TextBox tbInitialYCoord;
		private System.Windows.Forms.TextBox tbInitialXCoord;
		private System.Windows.Forms.Button btnOK;
		private System.Windows.Forms.Button btnCancel;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.Button btnNTFont;
		private System.Windows.Forms.Button btnLexFont;
		private System.Windows.Forms.Button btnGlossFont;
		private System.Windows.Forms.CheckBox cbFlat;
		private System.Windows.Forms.CheckBox cbDefault;
		private System.Windows.Forms.Label lblGlossFont;
		private System.Windows.Forms.Label lblLexFont;
		private System.Windows.Forms.Label lblNTFont;
		private System.Windows.Forms.Label lblLineColor;
		private System.Windows.Forms.Button btnLineColor;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		private Font m_fntNTFont;
		private Font m_fntLexFont;
		private Font m_fntGlossFont;
		private Color m_clrNTColor;
		private Color m_clrLexColor;
		private Color m_clrGlossColor;
		private System.Windows.Forms.Label lblLexGlossGap;
		private System.Windows.Forms.Label lblVerticalGap;
		private System.Windows.Forms.Label lblHorizontalGap;
		private System.Windows.Forms.Label lblInitialYCoord;
		private System.Windows.Forms.Label lblInitialXCoord;
		private Color m_clrTreeLinesColor;
		private Color m_clrTreeBackgroundColor;
		private System.Windows.Forms.TextBox tbLineWidth;
		private System.Windows.Forms.Label lblLineWidth;
		private System.Windows.Forms.Button btnBackgroundColor;
		private System.Windows.Forms.Label lblBackgroundColor;
		private System.Windows.Forms.HelpProvider helpProvider;
		private System.Windows.Forms.Label lblBackgroundColor1;
		private System.Windows.Forms.Label lblLineColor1;
		private System.Windows.Forms.Label lblGlossFont1;
		private System.Windows.Forms.Label lblLexFont1;
		private System.Windows.Forms.Label lblNTFont1;
		private System.Windows.Forms.CheckBox cbSmoothing;
		private System.Windows.Forms.CheckBox cbPixelOffset;
		private int[] m_aiCustomColors = new int[16];

		public DlgTreeParameters()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			btnOK.DialogResult = DialogResult.OK;
			btnCancel.DialogResult = DialogResult.Cancel;
			FormBorderStyle = FormBorderStyle.FixedDialog;
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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgTreeParameters));
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.tbInitialXCoord = new System.Windows.Forms.TextBox();
			this.tbInitialYCoord = new System.Windows.Forms.TextBox();
			this.tbHorizontalGap = new System.Windows.Forms.TextBox();
			this.tbVerticalGap = new System.Windows.Forms.TextBox();
			this.tbLexGlossGap = new System.Windows.Forms.TextBox();
			this.lblLexGlossGap = new System.Windows.Forms.Label();
			this.lblVerticalGap = new System.Windows.Forms.Label();
			this.lblHorizontalGap = new System.Windows.Forms.Label();
			this.lblInitialYCoord = new System.Windows.Forms.Label();
			this.lblInitialXCoord = new System.Windows.Forms.Label();
			this.btnOK = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.cbPixelOffset = new System.Windows.Forms.CheckBox();
			this.cbSmoothing = new System.Windows.Forms.CheckBox();
			this.btnBackgroundColor = new System.Windows.Forms.Button();
			this.lblBackgroundColor = new System.Windows.Forms.Label();
			this.lblBackgroundColor1 = new System.Windows.Forms.Label();
			this.tbLineWidth = new System.Windows.Forms.TextBox();
			this.lblLineWidth = new System.Windows.Forms.Label();
			this.btnLineColor = new System.Windows.Forms.Button();
			this.lblLineColor = new System.Windows.Forms.Label();
			this.lblLineColor1 = new System.Windows.Forms.Label();
			this.btnGlossFont = new System.Windows.Forms.Button();
			this.btnLexFont = new System.Windows.Forms.Button();
			this.btnNTFont = new System.Windows.Forms.Button();
			this.lblGlossFont = new System.Windows.Forms.Label();
			this.lblLexFont = new System.Windows.Forms.Label();
			this.lblNTFont = new System.Windows.Forms.Label();
			this.lblGlossFont1 = new System.Windows.Forms.Label();
			this.lblLexFont1 = new System.Windows.Forms.Label();
			this.lblNTFont1 = new System.Windows.Forms.Label();
			this.cbFlat = new System.Windows.Forms.CheckBox();
			this.cbDefault = new System.Windows.Forms.CheckBox();
			this.helpProvider = new System.Windows.Forms.HelpProvider();
			this.groupBox1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.SuspendLayout();
			//
			// groupBox1
			//
			this.groupBox1.Controls.Add(this.tbInitialXCoord);
			this.groupBox1.Controls.Add(this.tbInitialYCoord);
			this.groupBox1.Controls.Add(this.tbHorizontalGap);
			this.groupBox1.Controls.Add(this.tbVerticalGap);
			this.groupBox1.Controls.Add(this.tbLexGlossGap);
			this.groupBox1.Controls.Add(this.lblLexGlossGap);
			this.groupBox1.Controls.Add(this.lblVerticalGap);
			this.groupBox1.Controls.Add(this.lblHorizontalGap);
			this.groupBox1.Controls.Add(this.lblInitialYCoord);
			this.groupBox1.Controls.Add(this.lblInitialXCoord);
			this.groupBox1.Location = new System.Drawing.Point(16, 8);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(304, 168);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "(X, Y) Parameters (units are in .01 mm)";
			//
			// tbInitialXCoord
			//
			this.tbInitialXCoord.Location = new System.Drawing.Point(240, 24);
			this.tbInitialXCoord.MaxLength = 8;
			this.tbInitialXCoord.Name = "tbInitialXCoord";
			this.tbInitialXCoord.Size = new System.Drawing.Size(48, 20);
			this.tbInitialXCoord.TabIndex = 1;
			this.tbInitialXCoord.Text = "xCoord";
			this.tbInitialXCoord.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.tbInitialXCoord.WordWrap = false;
			//
			// tbInitialYCoord
			//
			this.tbInitialYCoord.Location = new System.Drawing.Point(240, 52);
			this.tbInitialYCoord.MaxLength = 8;
			this.tbInitialYCoord.Name = "tbInitialYCoord";
			this.tbInitialYCoord.Size = new System.Drawing.Size(48, 20);
			this.tbInitialYCoord.TabIndex = 3;
			this.tbInitialYCoord.Text = "yCoord";
			this.tbInitialYCoord.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.tbInitialYCoord.WordWrap = false;
			//
			// tbHorizontalGap
			//
			this.tbHorizontalGap.Location = new System.Drawing.Point(240, 80);
			this.tbHorizontalGap.MaxLength = 8;
			this.tbHorizontalGap.Name = "tbHorizontalGap";
			this.tbHorizontalGap.Size = new System.Drawing.Size(48, 20);
			this.tbHorizontalGap.TabIndex = 5;
			this.tbHorizontalGap.Text = "hgap";
			this.tbHorizontalGap.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.tbHorizontalGap.WordWrap = false;
			//
			// tbVerticalGap
			//
			this.tbVerticalGap.Location = new System.Drawing.Point(240, 108);
			this.tbVerticalGap.MaxLength = 8;
			this.tbVerticalGap.Name = "tbVerticalGap";
			this.tbVerticalGap.Size = new System.Drawing.Size(48, 20);
			this.tbVerticalGap.TabIndex = 7;
			this.tbVerticalGap.Text = "vgap";
			this.tbVerticalGap.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.tbVerticalGap.WordWrap = false;
			//
			// tbLexGlossGap
			//
			this.tbLexGlossGap.Location = new System.Drawing.Point(240, 136);
			this.tbLexGlossGap.MaxLength = 8;
			this.tbLexGlossGap.Name = "tbLexGlossGap";
			this.tbLexGlossGap.Size = new System.Drawing.Size(48, 20);
			this.tbLexGlossGap.TabIndex = 9;
			this.tbLexGlossGap.Text = "lgGap";
			this.tbLexGlossGap.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.tbLexGlossGap.WordWrap = false;
			//
			// lblLexGlossGap
			//
			this.lblLexGlossGap.Location = new System.Drawing.Point(16, 136);
			this.lblLexGlossGap.Name = "lblLexGlossGap";
			this.lblLexGlossGap.Size = new System.Drawing.Size(208, 16);
			this.lblLexGlossGap.TabIndex = 8;
			this.lblLexGlossGap.Text = "Gap &adjustment between Lex and Gloss:";
			//
			// lblVerticalGap
			//
			this.lblVerticalGap.Location = new System.Drawing.Point(16, 108);
			this.lblVerticalGap.Name = "lblVerticalGap";
			this.lblVerticalGap.Size = new System.Drawing.Size(208, 16);
			this.lblVerticalGap.TabIndex = 6;
			this.lblVerticalGap.Text = "&Vertical gap between nodes:";
			//
			// lblHorizontalGap
			//
			this.lblHorizontalGap.Location = new System.Drawing.Point(16, 80);
			this.lblHorizontalGap.Name = "lblHorizontalGap";
			this.lblHorizontalGap.Size = new System.Drawing.Size(208, 16);
			this.lblHorizontalGap.TabIndex = 4;
			this.lblHorizontalGap.Text = "&Horizontal gap between terminal nodes:";
			//
			// lblInitialYCoord
			//
			this.lblInitialYCoord.Location = new System.Drawing.Point(16, 52);
			this.lblInitialYCoord.Name = "lblInitialYCoord";
			this.lblInitialYCoord.Size = new System.Drawing.Size(120, 16);
			this.lblInitialYCoord.TabIndex = 2;
			this.lblInitialYCoord.Text = "Topmost &Y-coordinate:";
			//
			// lblInitialXCoord
			//
			this.lblInitialXCoord.Location = new System.Drawing.Point(16, 24);
			this.lblInitialXCoord.Name = "lblInitialXCoord";
			this.helpProvider.SetShowHelp(this.lblInitialXCoord, true);
			this.lblInitialXCoord.Size = new System.Drawing.Size(120, 16);
			this.lblInitialXCoord.TabIndex = 0;
			this.lblInitialXCoord.Text = "Leftmost &X-coordinate:";
			//
			// btnOK
			//
			this.btnOK.Location = new System.Drawing.Point(360, 16);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(80, 24);
			this.btnOK.TabIndex = 4;
			this.btnOK.Text = "OK";
			this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
			//
			// btnCancel
			//
			this.btnCancel.Location = new System.Drawing.Point(360, 48);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(80, 24);
			this.btnCancel.TabIndex = 5;
			this.btnCancel.Text = "Cancel";
			//
			// groupBox2
			//
			this.groupBox2.Controls.Add(this.cbPixelOffset);
			this.groupBox2.Controls.Add(this.cbSmoothing);
			this.groupBox2.Controls.Add(this.btnBackgroundColor);
			this.groupBox2.Controls.Add(this.lblBackgroundColor);
			this.groupBox2.Controls.Add(this.lblBackgroundColor1);
			this.groupBox2.Controls.Add(this.tbLineWidth);
			this.groupBox2.Controls.Add(this.lblLineWidth);
			this.groupBox2.Controls.Add(this.btnLineColor);
			this.groupBox2.Controls.Add(this.lblLineColor);
			this.groupBox2.Controls.Add(this.lblLineColor1);
			this.groupBox2.Controls.Add(this.btnGlossFont);
			this.groupBox2.Controls.Add(this.btnLexFont);
			this.groupBox2.Controls.Add(this.btnNTFont);
			this.groupBox2.Controls.Add(this.lblGlossFont);
			this.groupBox2.Controls.Add(this.lblLexFont);
			this.groupBox2.Controls.Add(this.lblNTFont);
			this.groupBox2.Controls.Add(this.lblGlossFont1);
			this.groupBox2.Controls.Add(this.lblLexFont1);
			this.groupBox2.Controls.Add(this.lblNTFont1);
			this.groupBox2.Location = new System.Drawing.Point(16, 192);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(440, 256);
			this.groupBox2.TabIndex = 1;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Fonts";
			//
			// cbPixelOffset
			//
			this.cbPixelOffset.Enabled = false;
			this.cbPixelOffset.Location = new System.Drawing.Point(16, 232);
			this.cbPixelOffset.Name = "cbPixelOffset";
			this.cbPixelOffset.Size = new System.Drawing.Size(280, 16);
			this.cbPixelOffset.TabIndex = 18;
			this.cbPixelOffset.Text = "Also try to enhance the smoothing of slanted lines";
			//
			// cbSmoothing
			//
			this.cbSmoothing.Location = new System.Drawing.Point(16, 208);
			this.cbSmoothing.Name = "cbSmoothing";
			this.cbSmoothing.Size = new System.Drawing.Size(224, 16);
			this.cbSmoothing.TabIndex = 17;
			this.cbSmoothing.Text = "Try to smooth slanted lines ";
			this.cbSmoothing.CheckedChanged += new System.EventHandler(this.cbSmoothing_CheckedChanged);
			//
			// btnBackgroundColor
			//
			this.btnBackgroundColor.Location = new System.Drawing.Point(344, 120);
			this.btnBackgroundColor.Name = "btnBackgroundColor";
			this.btnBackgroundColor.Size = new System.Drawing.Size(88, 24);
			this.btnBackgroundColor.TabIndex = 11;
			this.btnBackgroundColor.Text = "&Background...";
			this.btnBackgroundColor.Click += new System.EventHandler(this.btnBackgroundColor_Click);
			//
			// lblBackgroundColor
			//
			this.lblBackgroundColor.Location = new System.Drawing.Point(144, 120);
			this.lblBackgroundColor.Name = "lblBackgroundColor";
			this.lblBackgroundColor.Size = new System.Drawing.Size(192, 16);
			this.lblBackgroundColor.TabIndex = 10;
			this.lblBackgroundColor.Text = "BackgroundColor";
			//
			// lblBackgroundColor1
			//
			this.lblBackgroundColor1.Location = new System.Drawing.Point(16, 120);
			this.lblBackgroundColor1.Name = "lblBackgroundColor1";
			this.lblBackgroundColor1.Size = new System.Drawing.Size(112, 16);
			this.lblBackgroundColor1.TabIndex = 9;
			this.lblBackgroundColor1.Text = "Background color:";
			//
			// tbLineWidth
			//
			this.tbLineWidth.Location = new System.Drawing.Point(144, 176);
			this.tbLineWidth.MaxLength = 8;
			this.tbLineWidth.Name = "tbLineWidth";
			this.tbLineWidth.Size = new System.Drawing.Size(48, 20);
			this.tbLineWidth.TabIndex = 16;
			this.tbLineWidth.Text = "width";
			this.tbLineWidth.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			//
			// lblLineWidth
			//
			this.lblLineWidth.Location = new System.Drawing.Point(16, 184);
			this.lblLineWidth.Name = "lblLineWidth";
			this.lblLineWidth.Size = new System.Drawing.Size(112, 16);
			this.lblLineWidth.TabIndex = 15;
			this.lblLineWidth.Text = "Line thickness:";
			//
			// btnLineColor
			//
			this.btnLineColor.Location = new System.Drawing.Point(344, 152);
			this.btnLineColor.Name = "btnLineColor";
			this.btnLineColor.Size = new System.Drawing.Size(88, 24);
			this.btnLineColor.TabIndex = 14;
			this.btnLineColor.Text = "Line &Color...";
			this.btnLineColor.Click += new System.EventHandler(this.btnLineColor_Click);
			//
			// lblLineColor
			//
			this.lblLineColor.Location = new System.Drawing.Point(144, 152);
			this.lblLineColor.Name = "lblLineColor";
			this.lblLineColor.Size = new System.Drawing.Size(192, 16);
			this.lblLineColor.TabIndex = 13;
			this.lblLineColor.Text = "LineColor";
			//
			// lblLineColor1
			//
			this.lblLineColor1.Location = new System.Drawing.Point(16, 152);
			this.lblLineColor1.Name = "lblLineColor1";
			this.lblLineColor1.Size = new System.Drawing.Size(112, 16);
			this.lblLineColor1.TabIndex = 12;
			this.lblLineColor1.Text = "Color of lines:";
			//
			// btnGlossFont
			//
			this.btnGlossFont.Location = new System.Drawing.Point(344, 88);
			this.btnGlossFont.Name = "btnGlossFont";
			this.btnGlossFont.Size = new System.Drawing.Size(88, 24);
			this.btnGlossFont.TabIndex = 8;
			this.btnGlossFont.Text = "&Gloss Font...";
			this.btnGlossFont.Click += new System.EventHandler(this.btnGlossFont_Click);
			//
			// btnLexFont
			//
			this.btnLexFont.Location = new System.Drawing.Point(344, 56);
			this.btnLexFont.Name = "btnLexFont";
			this.btnLexFont.Size = new System.Drawing.Size(88, 24);
			this.btnLexFont.TabIndex = 5;
			this.btnLexFont.Text = "&Lex Font...";
			this.btnLexFont.Click += new System.EventHandler(this.btnLexFont_Click);
			//
			// btnNTFont
			//
			this.btnNTFont.Location = new System.Drawing.Point(344, 24);
			this.btnNTFont.Name = "btnNTFont";
			this.btnNTFont.Size = new System.Drawing.Size(88, 24);
			this.btnNTFont.TabIndex = 2;
			this.btnNTFont.Text = "&NT Font...";
			this.btnNTFont.Click += new System.EventHandler(this.btnNTFont_Click);
			//
			// lblGlossFont
			//
			this.lblGlossFont.Location = new System.Drawing.Point(144, 88);
			this.lblGlossFont.Name = "lblGlossFont";
			this.lblGlossFont.Size = new System.Drawing.Size(192, 16);
			this.lblGlossFont.TabIndex = 7;
			this.lblGlossFont.Text = "GlossFont";
			//
			// lblLexFont
			//
			this.lblLexFont.Location = new System.Drawing.Point(144, 56);
			this.lblLexFont.Name = "lblLexFont";
			this.lblLexFont.Size = new System.Drawing.Size(192, 16);
			this.lblLexFont.TabIndex = 4;
			this.lblLexFont.Text = "LexFont";
			//
			// lblNTFont
			//
			this.lblNTFont.Location = new System.Drawing.Point(144, 24);
			this.lblNTFont.Name = "lblNTFont";
			this.lblNTFont.Size = new System.Drawing.Size(192, 16);
			this.lblNTFont.TabIndex = 1;
			this.lblNTFont.Text = "NTFont";
			//
			// lblGlossFont1
			//
			this.lblGlossFont1.Location = new System.Drawing.Point(16, 88);
			this.lblGlossFont1.Name = "lblGlossFont1";
			this.lblGlossFont1.Size = new System.Drawing.Size(112, 16);
			this.lblGlossFont1.TabIndex = 6;
			this.lblGlossFont1.Text = "Glosses:";
			//
			// lblLexFont1
			//
			this.lblLexFont1.Location = new System.Drawing.Point(16, 56);
			this.lblLexFont1.Name = "lblLexFont1";
			this.lblLexFont1.Size = new System.Drawing.Size(112, 16);
			this.lblLexFont1.TabIndex = 3;
			this.lblLexFont1.Text = "Lexical items:";
			//
			// lblNTFont1
			//
			this.lblNTFont1.Location = new System.Drawing.Point(16, 24);
			this.lblNTFont1.Name = "lblNTFont1";
			this.lblNTFont1.Size = new System.Drawing.Size(112, 16);
			this.lblNTFont1.TabIndex = 0;
			this.lblNTFont1.Text = "Non-terminal nodes:";
			//
			// cbFlat
			//
			this.cbFlat.Location = new System.Drawing.Point(24, 456);
			this.cbFlat.Name = "cbFlat";
			this.cbFlat.Size = new System.Drawing.Size(240, 16);
			this.cbFlat.TabIndex = 2;
			this.cbFlat.Text = "Show\"&flat\" view of lexical and gloss items";
			//
			// cbDefault
			//
			this.cbDefault.Location = new System.Drawing.Point(24, 480);
			this.cbDefault.Name = "cbDefault";
			this.cbDefault.Size = new System.Drawing.Size(280, 16);
			this.cbDefault.TabIndex = 3;
			this.cbDefault.Text = "Use these parameters as the &default for new trees";
			//
			// DlgTreeParameters
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(464, 501);
			this.Controls.Add(this.cbDefault);
			this.Controls.Add(this.cbFlat);
			this.Controls.Add(this.groupBox2);
			this.Controls.Add(this.btnCancel);
			this.Controls.Add(this.btnOK);
			this.Controls.Add(this.groupBox1);
			this.HelpButton = true;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "DlgTreeParameters";
			this.Text = "Tree Parameters";
			this.groupBox1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void btnOK_Click(object sender, System.EventArgs e)
		{
			int i;
			try
			{
				i = Convert.ToInt32(tbInitialXCoord.Text);
			}
			catch (FormatException fex)
			{
				string str = fex.Message; // make compiler happy
				giveNumberMessage(lblInitialXCoord.Text);
			}
			try
			{
				i = Convert.ToInt32(tbInitialYCoord.Text);
			}
			catch (FormatException fex)
			{
				string str = fex.Message; // make compiler happy
				giveNumberMessage(lblInitialYCoord.Text);
			}
			try
			{
				i = Convert.ToInt32(tbHorizontalGap.Text);
			}
			catch (FormatException fex)
			{
				string str = fex.Message; // make compiler happy
				giveNumberMessage(lblHorizontalGap.Text);
			}
			try
			{
				i = Convert.ToInt32(tbLexGlossGap.Text);
			}
			catch (FormatException fex)
			{
				string str = fex.Message; // make compiler happy
				giveNumberMessage(this.lblLexGlossGap.Text);
			}
			try
			{
				i = Convert.ToInt32(tbVerticalGap.Text);
			}
			catch (FormatException fex)
			{
				string str = fex.Message; // make compiler happy
				giveNumberMessage(this.lblVerticalGap.Text);
			}
			try
			{
				double d= Convert.ToDouble(this.tbLineWidth.Text);
			}
			catch (FormatException fex)
			{
				string str = fex.Message; // make compiler happy
				giveNumberMessage(lblLineWidth.Text);
			}
		}
		/// <summary>
		/// Gets/sets TrySmoothing.
		/// </summary>
		public bool TrySmoothing
		{
			get
			{
				return cbSmoothing.Checked;
			}
			set
			{
				cbSmoothing.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets TryPixelOffset.
		/// </summary>
		public bool TryPixelOffset
		{
			get
			{
				return cbPixelOffset.Checked;
			}
			set
			{
				cbPixelOffset.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets ShowFlatView.
		/// </summary>
		public bool ShowFlatView
		{
			get
			{
				return cbFlat.Checked;
			}
			set
			{
				cbFlat.Checked = value;
			}
		}
		/// <summary>
		/// Gets/sets Gloss Font.
		/// </summary>
		public Font GlossFont
		{
			get
			{
				return m_fntGlossFont;
			}
			set
			{
				m_fntGlossFont = value;
				lblGlossFont.Text = m_fntGlossFont.Name;  // also set label
			}
		}
		/// <summary>
		/// Gets/sets Lexical Item Font.
		/// </summary>
		public Font LexFont
		{
			get
			{
				return m_fntLexFont;
			}
			set
			{
				m_fntLexFont = value;
				lblLexFont.Text = m_fntLexFont.Name;  // also set label
			}
		}
		/// <summary>
		/// Gets/sets NonTerminal Font.
		/// </summary>
		public Font NTFont
		{
			get
			{
				return m_fntNTFont;
			}
			set
			{
				m_fntNTFont = value;
				lblNTFont.Text = m_fntNTFont.Name;  // also set label
			}
		}
		/// <summary>
		/// Gets/sets Gloss Color.
		/// </summary>
		public Color GlossColor
		{
			get
			{
				return m_clrGlossColor;
			}
			set
			{
				m_clrGlossColor = value;
			}
		}
		/// <summary>
		/// Gets/sets Lexical Item Color.
		/// </summary>
		public Color LexColor
		{
			get
			{
				return m_clrLexColor;
			}
			set
			{
				m_clrLexColor = value;
			}
		}
		/// <summary>
		/// Gets/sets Color of tree lines.
		/// </summary>
		public Color TreeLinesColor
		{
			get
			{
				return m_clrTreeLinesColor;
			}
			set
			{
				m_clrTreeLinesColor = value;
				lblLineColor.Text = m_clrTreeLinesColor.Name;   // also set the label
			}
		}
		/// <summary>
		/// Gets/sets Color of tree Background.
		/// </summary>
		public Color TreeBackgroundColor
		{
			get
			{
				return m_clrTreeBackgroundColor;
			}
			set
			{
				m_clrTreeBackgroundColor = value;
				lblBackgroundColor.Text = m_clrTreeBackgroundColor.Name;   // also set the label
			}
		}
		/// <summary>
		/// Gets/sets NonTerminal Color.
		/// </summary>
		public Color NTColor
		{
			get
			{
				return m_clrNTColor;
			}
			set
			{
				m_clrNTColor = value;
			}
		}
		/// <summary>
		/// Gets/sets LexGlossGap.
		/// </summary>
		public int LexGlossGap
		{
			get
			{
				return Convert.ToInt32(tbLexGlossGap.Text);
			}
			set
			{
				tbLexGlossGap.Text = value.ToString();
			}
		}
		/// <summary>
		/// Gets/sets VerticalGap.
		/// </summary>
		public int VerticalGap
		{
			get
			{
				return Convert.ToInt32(tbVerticalGap.Text);
			}
			set
			{
				tbVerticalGap.Text = value.ToString();
			}
		}
		/// <summary>
		/// Gets/sets HorizontalGap.
		/// </summary>
		public int HorizontalGap
		{
			get
			{
				return Convert.ToInt32(tbHorizontalGap.Text);
			}
			set
			{
				tbHorizontalGap.Text = value.ToString();
			}
		}
		/// <summary>
		/// Gets/sets the initial XCoord.
		/// </summary>
		public int InitialXCoord
		{
			get
			{
				return Convert.ToInt32(tbInitialXCoord.Text);
			}
			set
			{
				tbInitialXCoord.Text = value.ToString();
			}
		}
		/// <summary>
		/// Gets/sets the initial YCoord.
		/// </summary>
		public int InitialYCoord
		{
			get
			{
				int iResult;
				try
				{
					iResult = Convert.ToInt32(tbInitialYCoord.Text);
					return iResult;
				}
				catch
				{
				int i = 1;
					return i;

				}
			}
			set
			{
				tbInitialYCoord.Text = value.ToString();
			}
		}
		/// <summary>
		/// Gets/sets  UseAsDefaults.
		/// </summary>
		public bool UseAsDefaults
		{
			get
			{
				return  cbDefault.Checked;
			}
			set
			{
				cbDefault.Checked = value;
			}
		}
		void giveNumberMessage(string strLabel)
		{
			strLabel = strLabel.Replace("&", "");
			MessageBox.Show(strLabel + " must be a number", "Need a number!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
			DialogResult = DialogResult.Retry;
		}

		private void btnNTFont_Click(object sender, System.EventArgs e)
		{
			doFont(ref m_fntNTFont, ref m_clrNTColor, lblNTFont);
		}

		private void btnLexFont_Click(object sender, System.EventArgs e)
		{
			doFont(ref m_fntLexFont, ref m_clrLexColor, lblLexFont);
		}

		private void btnGlossFont_Click(object sender, System.EventArgs e)
		{
			doFont(ref m_fntGlossFont, ref m_clrGlossColor, lblGlossFont);
		}
		void doFont(ref Font fnt, ref Color clr, Label lbl)
		{
			FontDialog fontdlg = new FontDialog();
			fontdlg.ShowEffects = true;
			fontdlg.ShowColor = true;
			fontdlg.Font = fnt;
			fontdlg.Color = clr;
			if (fontdlg.ShowDialog() == DialogResult.OK)
			{
				// set the values
				fnt = fontdlg.Font;
				clr = fontdlg.Color;
				lbl.Text = fnt.Name;
			}
		}

		private void btnLineColor_Click(object sender, System.EventArgs e)
		{
			ColorDialog clrdlg = new ColorDialog();
			clrdlg.Color = TreeLinesColor;
			clrdlg.CustomColors = m_aiCustomColors;
			clrdlg.ShowHelp = true;
			if (clrdlg.ShowDialog() == DialogResult.OK)
			{
				TreeLinesColor = clrdlg.Color;
				lblLineColor.Text = TreeLinesColor.Name;
				m_aiCustomColors = clrdlg.CustomColors;
			}
		}

		private void btnBackgroundColor_Click(object sender, System.EventArgs e)
		{
			ColorDialog clrdlg = new ColorDialog();
			clrdlg.Color = TreeBackgroundColor;
			clrdlg.CustomColors = m_aiCustomColors;
			if (clrdlg.ShowDialog() == DialogResult.OK)
			{
				TreeBackgroundColor = clrdlg.Color;
				lblBackgroundColor.Text = TreeBackgroundColor.Name;
				m_aiCustomColors = clrdlg.CustomColors;
			}
		}

		public int[] CustomColors
		{
			get
			{
				return m_aiCustomColors;
			}
			set
			{
				m_aiCustomColors = value;
			}
		}
		/// <summary>
		/// Gets/sets Line width.
		/// </summary>
		public double TreeLineWidth
		{
			get
			{
				return Convert.ToDouble(tbLineWidth.Text);
			}
			set
			{
				tbLineWidth.Text = value.ToString();
			}
		}
		void InitHelp()
		{
			const string strInitialXCoordHelp = "This is where the leftmost edge of the tree begins (usually the leftmost terminal node).\n" +
					  "It is in units of .01 mm (so a value of 200 means 2mm from the left edge).";
			helpProvider.SetHelpString(lblInitialXCoord, strInitialXCoordHelp);
			helpProvider.SetHelpString(tbInitialXCoord, strInitialXCoordHelp);
			const string strInitialYCoordHelp = "This is where the top of the tree begins.\n" +
					  "It is in units of .01 mm (so a value of 200 means 2mm down from the top).";
			helpProvider.SetHelpString(lblInitialYCoord, strInitialYCoordHelp);
			helpProvider.SetHelpString(tbInitialYCoord, strInitialYCoordHelp);
			const string strHorizontalGapHelp = "This is the minimum extra space between horizontally adjacent nodes.\n" +
					  "It is in units of .01 mm (so a value of 200 means 2mm between the nodes).";
			helpProvider.SetHelpString(lblHorizontalGap, strHorizontalGapHelp);
			helpProvider.SetHelpString(tbHorizontalGap, strHorizontalGapHelp);
			const string strVerticalGapHelp = "This is the extra vertical space between levels in the tree (e.g. between a non-terminal node and its mother node).\n" +
					  "It is in units of .01 mm (so a value of 200 means 2mm between the nodes).";
			helpProvider.SetHelpString(lblVerticalGap, strVerticalGapHelp);
			helpProvider.SetHelpString(tbVerticalGap, strVerticalGapHelp);
			const string strLexGlossGapHelp = "This is the extra vertical space between a lexical item and its gloss in the tree.\n" +
					  "It is in units of .01 mm (so a value of 200 means 2mm between the nodes).";
			helpProvider.SetHelpString(lblLexGlossGap, strLexGlossGapHelp);
			helpProvider.SetHelpString(tbLexGlossGap, strLexGlossGapHelp);
			const string strNTFontHelp = "Clicking on the button allows you to set the font that is used for Non-Terminal nodes in the tree.";
			helpProvider.SetHelpString(lblNTFont1, strNTFontHelp);
			helpProvider.SetHelpString(btnNTFont, strNTFontHelp);
			helpProvider.SetHelpString(lblNTFont, "This is the name of the current Non-Terminal font.\n" +
				"Click on the button to change it.");
			const string strLexFontHelp = "Clicking on the button allows you to set the font that is used for Lexical nodes in the tree.";
			helpProvider.SetHelpString(lblLexFont1, strLexFontHelp);
			helpProvider.SetHelpString(btnLexFont, strLexFontHelp);
			helpProvider.SetHelpString(lblLexFont, "This is the name of the current Lexical font.\n" +
				"Click on the button to change it.");
			const string strGlossFontHelp = "Clicking on the button allows you to set the font that is used for Gloss nodes in the tree.";
			helpProvider.SetHelpString(lblGlossFont1, strGlossFontHelp);
			helpProvider.SetHelpString(btnGlossFont, strGlossFontHelp);
			helpProvider.SetHelpString(lblGlossFont, "This is the name of the current Gloss font.\n" +
				"Click on the button to change it.");
			const string strBackgroundColorHelp = "Clicking on the button allows you to set the background color of the tree.";
			helpProvider.SetHelpString(lblBackgroundColor1, strBackgroundColorHelp);
			helpProvider.SetHelpString(btnBackgroundColor, strBackgroundColorHelp);
			helpProvider.SetHelpString(lblBackgroundColor, "This is the name or special code defining the current background color of the tree.\n" +
				"Click on the button to change it.");
			const string strLineColorHelp = "Clicking on the button allows you to set the color of the lines in the tree.";
			helpProvider.SetHelpString(lblLineColor1, strLineColorHelp);
			helpProvider.SetHelpString(btnLineColor, strLineColorHelp);
			helpProvider.SetHelpString(lblLineColor, "This is the name or special code defining the current color of the lines in the tree.\n" +
				"Click on the button to change it.");
			const string strLineThicknessHelp = "This is thickness of the lines in the tree.  If the units are too small, a default thickness is used.";
			helpProvider.SetHelpString(lblLineWidth, strLineThicknessHelp);
			helpProvider.SetHelpString(tbLineWidth, strLineThicknessHelp);
			helpProvider.SetHelpString(cbSmoothing, "If this is checked, LingTree will attempt to make any slanted or angled lines appear smoother or less jagged.");
			helpProvider.SetHelpString(cbPixelOffset, "This will only be used if smoothing is also checked.  If this is checked, LingTree will attempt to offset any slanted or angled lines a bit to further make them appear smoother or less jagged.");
			helpProvider.SetHelpString(cbFlat, "If this is checked, all of the lexical and any gloss nodes will appear at the same vertical position.");
			helpProvider.SetHelpString(cbDefault, "If this is checked, the current parameter settings will be used for any new trees you create.");


		}

		private void cbSmoothing_CheckedChanged(object sender, System.EventArgs e)
		{
			if (cbSmoothing.Checked)
				cbPixelOffset.Enabled = true;
			else
				cbPixelOffset.Enabled = false;

		}


	}
}
