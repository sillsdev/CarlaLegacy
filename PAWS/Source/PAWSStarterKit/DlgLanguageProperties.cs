using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.IO;
using System.Windows.Forms;

namespace PAWSStarterKit
{
	/// <summary>
	/// Summary description for DlgLanguageProperties.
	/// </summary>
	public class DlgLanguageProperties : System.Windows.Forms.Form
	{
		public System.Windows.Forms.TextBox tbAbbreviation;
		public System.Windows.Forms.TextBox tbLanguage;
		public System.Windows.Forms.Label lblFontName;
		private System.Windows.Forms.Button btnFont;
		public System.Windows.Forms.TextBox tbFieldCode;
		private System.Windows.Forms.Button btnCancel;
		private System.Windows.Forms.Button btnOK;
		private string strFontName;
		private string strFontSize;
		private string strFontColor;
		private bool bFontBold;
		private bool bFontItalic;
		private bool bFontUnderline;
		private bool bFontStrikeout;
		private string strAnswerFile;
		private string strGrammarFile;
		private string strWriterFile;
		private string strExampleFiles;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Button btnAnswerFile;
		private System.Windows.Forms.TextBox tbExampleFiles;
		private System.Windows.Forms.Button btnExampleFiles;
		private System.Windows.Forms.TextBox tbWriterFile;
		private System.Windows.Forms.Button btnWriterFile;
		private System.Windows.Forms.TextBox tbGrammarFile;
		private System.Windows.Forms.Button btnGrammarFile;
		private System.Windows.Forms.Label lblAnswerFile;
		private System.Windows.Forms.HelpProvider helpProvider;
		private System.Windows.Forms.ToolTip toolTip;
		private System.Windows.Forms.Label lblExampleFiles;
		private System.Windows.Forms.Label lblGrammarFile;
		private System.Windows.Forms.Label lblWriterFile;
		private System.Windows.Forms.Label lblLanguage;
		private System.Windows.Forms.Label lblAbbreviation;
		private System.Windows.Forms.Label lblThreeLetters;
		private System.Windows.Forms.Label lblFieldCode;
		private System.Windows.Forms.TextBox tbAnswerFile;
		private System.ComponentModel.IContainer components;

		public DlgLanguageProperties()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			InitHelp();
			btnCancel.DialogResult = DialogResult.Cancel;
		}
		/* *******************************************
		 * Properties
		 * *******************************************/
		/// <summary>
		/// Gets/sets language abbreviation.
		/// </summary>
		public string Abbreviation
		{
			get
			{
				return tbAbbreviation.Text;
			}
			set
			{
				tbAbbreviation.Text = value;
			}
		}
		/// <summary>
		/// Gets/sets examples field code (SFM marker).
		/// </summary>
		public string FieldCode
		{
			get
			{
				return tbFieldCode.Text;
			}
			set
			{
				tbFieldCode.Text = value;
			}
		}
		/// <summary>
		/// Gets/sets font bold.
		/// </summary>
		public bool FontBold
		{
			get
			{
				return bFontBold;
			}
			set
			{
				bFontBold = value;
			}
		}
		/// <summary>
		/// Gets/sets font color.
		/// </summary>
		public string FontColor
		{
			get
			{
				return strFontColor;
			}
			set
			{
				strFontColor = value;
			}
		}
		/// <summary>
		/// Gets/sets font name.
		/// </summary>
		public string FontName
		{
			get
			{
				return strFontName;
			}
			set
			{
				strFontName = value;
				lblFontName.Text = value;  // also set the label
			}
		}
		/// <summary>
		/// Gets/sets font italic.
		/// </summary>
		public bool FontItalic
		{
			get
			{
				return bFontItalic;
			}
			set
			{
				bFontItalic = value;
			}
		}
		/// <summary>
		/// Gets/sets font size.
		/// </summary>
		public string FontSize
		{
			get
			{
				return strFontSize;
			}
			set
			{
				strFontSize = value;
			}
		}
		/// <summary>
		/// Gets/sets font strikeout.
		/// </summary>
		public bool FontStrikeout
		{
			get
			{
				return bFontStrikeout;
			}
			set
			{
				bFontStrikeout = value;
			}
		}
		/// <summary>
		/// Gets/sets font underline.
		/// </summary>
		public bool FontUnderline
		{
			get
			{
				return bFontUnderline;
			}
			set
			{
				bFontUnderline = value;
			}
		}
		/// <summary>
		/// Gets/sets language name.
		/// </summary>
		public string Language
		{
			get
			{
				return tbLanguage.Text;
			}
			set
			{
				tbLanguage.Text = value;
			}
		}
		/// <summary>
		/// Gets/sets answer file name.
		/// </summary>
		public string AnswerFile
		{
			get
			{
				return strAnswerFile;
			}
			set
			{
				strAnswerFile = value;
				tbAnswerFile.Text = value;  // also set the text box contents
			}
		}
		/// <summary>
		/// Gets/sets grammar file name.
		/// </summary>
		public string GrammarFile
		{
			get
			{
				return strGrammarFile;
			}
			set
			{
				strGrammarFile = value;
				tbGrammarFile.Text = value;  // also set the text box contents
			}
		}
		/// <summary>
		/// Gets/sets writer file name.
		/// </summary>
		public string WriterFile
		{
			get
			{
				return strWriterFile;
			}
			set
			{
				strWriterFile = value;
				tbWriterFile.Text = value;  // also set the text box contents
			}
		}
		/// <summary>
		/// Gets/sets example files directory name.
		/// </summary>
		public string ExampleFiles
		{
			get
			{
				return strExampleFiles;
			}
			set
			{
				strExampleFiles = value;
				tbExampleFiles.Text = value;  // also set the text box contents
			}
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
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgLanguageProperties));
			this.lblLanguage = new System.Windows.Forms.Label();
			this.lblAbbreviation = new System.Windows.Forms.Label();
			this.tbAbbreviation = new System.Windows.Forms.TextBox();
			this.tbLanguage = new System.Windows.Forms.TextBox();
			this.lblThreeLetters = new System.Windows.Forms.Label();
			this.lblFontName = new System.Windows.Forms.Label();
			this.btnFont = new System.Windows.Forms.Button();
			this.lblFieldCode = new System.Windows.Forms.Label();
			this.tbFieldCode = new System.Windows.Forms.TextBox();
			this.btnCancel = new System.Windows.Forms.Button();
			this.btnOK = new System.Windows.Forms.Button();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.btnAnswerFile = new System.Windows.Forms.Button();
			this.tbAnswerFile = new System.Windows.Forms.TextBox();
			this.lblAnswerFile = new System.Windows.Forms.Label();
			this.btnGrammarFile = new System.Windows.Forms.Button();
			this.tbGrammarFile = new System.Windows.Forms.TextBox();
			this.lblGrammarFile = new System.Windows.Forms.Label();
			this.btnWriterFile = new System.Windows.Forms.Button();
			this.tbWriterFile = new System.Windows.Forms.TextBox();
			this.btnExampleFiles = new System.Windows.Forms.Button();
			this.tbExampleFiles = new System.Windows.Forms.TextBox();
			this.lblExampleFiles = new System.Windows.Forms.Label();
			this.lblWriterFile = new System.Windows.Forms.Label();
			this.helpProvider = new System.Windows.Forms.HelpProvider();
			this.toolTip = new System.Windows.Forms.ToolTip(this.components);
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			//
			// lblLanguage
			//
			this.lblLanguage.Location = new System.Drawing.Point(8, 16);
			this.lblLanguage.Name = "lblLanguage";
			this.lblLanguage.Size = new System.Drawing.Size(120, 16);
			this.lblLanguage.TabIndex = 0;
			this.lblLanguage.Text = "Language &Name:";
			//
			// lblAbbreviation
			//
			this.lblAbbreviation.Location = new System.Drawing.Point(8, 48);
			this.lblAbbreviation.Name = "lblAbbreviation";
			this.lblAbbreviation.Size = new System.Drawing.Size(128, 16);
			this.lblAbbreviation.TabIndex = 2;
			this.lblAbbreviation.Text = "Language &Abbreviation:";
			//
			// tbAbbreviation
			//
			this.tbAbbreviation.Location = new System.Drawing.Point(152, 48);
			this.tbAbbreviation.MaxLength = 3;
			this.tbAbbreviation.Name = "tbAbbreviation";
			this.tbAbbreviation.Size = new System.Drawing.Size(32, 20);
			this.tbAbbreviation.TabIndex = 3;
			this.tbAbbreviation.Text = "Abbr";
			//
			// tbLanguage
			//
			this.tbLanguage.Location = new System.Drawing.Point(152, 16);
			this.tbLanguage.Name = "tbLanguage";
			this.tbLanguage.Size = new System.Drawing.Size(336, 20);
			this.tbLanguage.TabIndex = 1;
			this.tbLanguage.Text = "Language";
			//
			// lblThreeLetters
			//
			this.lblThreeLetters.Location = new System.Drawing.Point(208, 48);
			this.lblThreeLetters.Name = "lblThreeLetters";
			this.lblThreeLetters.Size = new System.Drawing.Size(104, 16);
			this.lblThreeLetters.TabIndex = 4;
			this.lblThreeLetters.Text = "(Up to three letters)";
			//
			// lblFontName
			//
			this.lblFontName.Location = new System.Drawing.Point(8, 80);
			this.lblFontName.Name = "lblFontName";
			this.lblFontName.Size = new System.Drawing.Size(232, 16);
			this.lblFontName.TabIndex = 5;
			this.lblFontName.Text = "Font Name shown at runtime";
			//
			// btnFont
			//
			this.btnFont.Location = new System.Drawing.Point(264, 72);
			this.btnFont.Name = "btnFont";
			this.btnFont.Size = new System.Drawing.Size(112, 24);
			this.btnFont.TabIndex = 6;
			this.btnFont.Text = "Change &Font...";
			this.btnFont.Click += new System.EventHandler(this.ChangeFontOnClick);
			//
			// lblFieldCode
			//
			this.lblFieldCode.Location = new System.Drawing.Point(8, 112);
			this.lblFieldCode.Name = "lblFieldCode";
			this.lblFieldCode.Size = new System.Drawing.Size(216, 32);
			this.lblFieldCode.TabIndex = 7;
			this.lblFieldCode.Text = "Enter the field code to use for e&xamples (Include the backslash)";
			//
			// tbFieldCode
			//
			this.tbFieldCode.Location = new System.Drawing.Point(256, 120);
			this.tbFieldCode.Name = "tbFieldCode";
			this.tbFieldCode.Size = new System.Drawing.Size(96, 20);
			this.tbFieldCode.TabIndex = 8;
			this.tbFieldCode.Text = "Field Code";
			//
			// btnCancel
			//
			this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.btnCancel.Location = new System.Drawing.Point(392, 344);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.Size = new System.Drawing.Size(96, 24);
			this.btnCancel.TabIndex = 10;
			this.btnCancel.Text = "Cancel";
			//
			// btnOK
			//
			this.btnOK.Location = new System.Drawing.Point(280, 344);
			this.btnOK.Name = "btnOK";
			this.btnOK.Size = new System.Drawing.Size(96, 24);
			this.btnOK.TabIndex = 9;
			this.btnOK.Text = "OK";
			this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
			//
			// groupBox1
			//
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.btnAnswerFile,
																					this.tbAnswerFile,
																					this.lblAnswerFile,
																					this.btnGrammarFile,
																					this.tbGrammarFile,
																					this.lblGrammarFile,
																					this.btnWriterFile,
																					this.tbWriterFile,
																					this.btnExampleFiles,
																					this.tbExampleFiles,
																					this.lblExampleFiles,
																					this.lblWriterFile});
			this.groupBox1.Location = new System.Drawing.Point(8, 160);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(488, 176);
			this.groupBox1.TabIndex = 23;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "PAWS File Locatons";
			//
			// btnAnswerFile
			//
			this.btnAnswerFile.Location = new System.Drawing.Point(416, 24);
			this.btnAnswerFile.Name = "btnAnswerFile";
			this.btnAnswerFile.Size = new System.Drawing.Size(64, 24);
			this.btnAnswerFile.TabIndex = 32;
			this.btnAnswerFile.Text = "&Change";
			this.btnAnswerFile.Click += new System.EventHandler(this.btnAnswerFile_Click);
			//
			// tbAnswerFile
			//
			this.tbAnswerFile.Location = new System.Drawing.Point(96, 24);
			this.tbAnswerFile.Name = "tbAnswerFile";
			this.tbAnswerFile.ReadOnly = true;
			this.tbAnswerFile.Size = new System.Drawing.Size(312, 20);
			this.tbAnswerFile.TabIndex = 31;
			this.tbAnswerFile.Text = "Answer File directory/filename shown at runtime";
			//
			// lblAnswerFile
			//
			this.lblAnswerFile.Location = new System.Drawing.Point(8, 24);
			this.lblAnswerFile.Name = "lblAnswerFile";
			this.lblAnswerFile.Size = new System.Drawing.Size(72, 16);
			this.lblAnswerFile.TabIndex = 30;
			this.lblAnswerFile.Text = "Answer File:";
			//
			// btnGrammarFile
			//
			this.btnGrammarFile.Location = new System.Drawing.Point(416, 64);
			this.btnGrammarFile.Name = "btnGrammarFile";
			this.btnGrammarFile.Size = new System.Drawing.Size(64, 24);
			this.btnGrammarFile.TabIndex = 29;
			this.btnGrammarFile.Text = "Chan&ge";
			this.btnGrammarFile.Click += new System.EventHandler(this.btnGrammarFile_Click);
			//
			// tbGrammarFile
			//
			this.tbGrammarFile.Location = new System.Drawing.Point(96, 64);
			this.tbGrammarFile.Name = "tbGrammarFile";
			this.tbGrammarFile.ReadOnly = true;
			this.tbGrammarFile.Size = new System.Drawing.Size(312, 20);
			this.tbGrammarFile.TabIndex = 28;
			this.tbGrammarFile.Text = "Grammar File directory/filename shown at runtime";
			//
			// lblGrammarFile
			//
			this.lblGrammarFile.Location = new System.Drawing.Point(8, 64);
			this.lblGrammarFile.Name = "lblGrammarFile";
			this.lblGrammarFile.Size = new System.Drawing.Size(80, 16);
			this.lblGrammarFile.TabIndex = 27;
			this.lblGrammarFile.Text = "Grammar File:";
			//
			// btnWriterFile
			//
			this.btnWriterFile.Location = new System.Drawing.Point(416, 104);
			this.btnWriterFile.Name = "btnWriterFile";
			this.btnWriterFile.Size = new System.Drawing.Size(64, 24);
			this.btnWriterFile.TabIndex = 26;
			this.btnWriterFile.Text = "C&hange";
			this.btnWriterFile.Click += new System.EventHandler(this.btnWriterFile_Click);
			//
			// tbWriterFile
			//
			this.tbWriterFile.Location = new System.Drawing.Point(96, 104);
			this.tbWriterFile.Name = "tbWriterFile";
			this.tbWriterFile.ReadOnly = true;
			this.tbWriterFile.Size = new System.Drawing.Size(312, 20);
			this.tbWriterFile.TabIndex = 25;
			this.tbWriterFile.Text = "Writer File directory/filename shown at runtime";
			//
			// btnExampleFiles
			//
			this.btnExampleFiles.Location = new System.Drawing.Point(416, 144);
			this.btnExampleFiles.Name = "btnExampleFiles";
			this.btnExampleFiles.Size = new System.Drawing.Size(64, 24);
			this.btnExampleFiles.TabIndex = 23;
			this.btnExampleFiles.Text = "Chang&e";
			this.btnExampleFiles.Click += new System.EventHandler(this.btnExampleFiles_Click);
			//
			// tbExampleFiles
			//
			this.tbExampleFiles.Location = new System.Drawing.Point(96, 144);
			this.tbExampleFiles.Name = "tbExampleFiles";
			this.tbExampleFiles.ReadOnly = true;
			this.tbExampleFiles.Size = new System.Drawing.Size(312, 20);
			this.tbExampleFiles.TabIndex = 22;
			this.tbExampleFiles.Text = "Example Files directory shown at runtime";
			//
			// lblExampleFiles
			//
			this.lblExampleFiles.Location = new System.Drawing.Point(8, 136);
			this.lblExampleFiles.Name = "lblExampleFiles";
			this.lblExampleFiles.Size = new System.Drawing.Size(80, 32);
			this.lblExampleFiles.TabIndex = 21;
			this.lblExampleFiles.Text = "Example Files Directory:";
			//
			// lblWriterFile
			//
			this.lblWriterFile.Location = new System.Drawing.Point(8, 104);
			this.lblWriterFile.Name = "lblWriterFile";
			this.lblWriterFile.Size = new System.Drawing.Size(64, 16);
			this.lblWriterFile.TabIndex = 24;
			this.lblWriterFile.Text = "Writer File:";
			//
			// DlgLanguageProperties
			//
			this.AcceptButton = this.btnOK;
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.CancelButton = this.btnCancel;
			this.ClientSize = new System.Drawing.Size(496, 375);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.groupBox1,
																		  this.btnOK,
																		  this.btnCancel,
																		  this.tbFieldCode,
																		  this.lblFieldCode,
																		  this.btnFont,
																		  this.lblFontName,
																		  this.lblThreeLetters,
																		  this.tbLanguage,
																		  this.tbAbbreviation,
																		  this.lblAbbreviation,
																		  this.lblLanguage});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.HelpButton = true;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "DlgLanguageProperties";
			this.Text = "Language Properties";
			this.groupBox1.ResumeLayout(false);
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
		void InitHelp()
		{
			const string strLanguageHelp = "This is the name of the language.";
			helpProvider.SetHelpString(lblLanguage, strLanguageHelp);
			helpProvider.SetHelpString(tbLanguage, strLanguageHelp);
			toolTip.SetToolTip(lblLanguage, strLanguageHelp);
			toolTip.SetToolTip(tbLanguage, strLanguageHelp);
			const string strAbbreviationHelp = "This is the abbreviation of the language.\n" +
					  "If you are using CarlaStudio, we recommend you use the same abbreviation as you did for it.\n" +
					  "If possible, we recommend you use the Ethnologue code.";
			helpProvider.SetHelpString(lblAbbreviation, strAbbreviationHelp);
			helpProvider.SetHelpString(lblThreeLetters, strAbbreviationHelp);
			helpProvider.SetHelpString(tbAbbreviation, strAbbreviationHelp);
			toolTip.SetToolTip(lblAbbreviation, strAbbreviationHelp);
			toolTip.SetToolTip(this.lblThreeLetters, strAbbreviationHelp);
			toolTip.SetToolTip(tbAbbreviation, strAbbreviationHelp);
			const string strFontHelp = "This is the name of the font you want for your language examples.";
			helpProvider.SetHelpString(lblFontName, strFontHelp);
			toolTip.SetToolTip(lblFontName, strFontHelp);
			const string strChangeFontHelp = "Click this to change the font information.";
			helpProvider.SetHelpString(btnFont, strChangeFontHelp);
			toolTip.SetToolTip(btnFont, strChangeFontHelp);
			const string strFieldCodeHelp = "This is the Standard Format code that will be used for all of your examples in the example files.";
			helpProvider.SetHelpString(lblFieldCode, strFieldCodeHelp);
			helpProvider.SetHelpString(tbFieldCode, strFieldCodeHelp);
			toolTip.SetToolTip(lblFieldCode, strFieldCodeHelp);
			toolTip.SetToolTip(tbFieldCode, strFieldCodeHelp);
			const string strAnswerFileHelp = "This file contains the answers to all the questions\n" +
					  "contained in the Starter Kit.  While you probably will never need to edit it manually,\n" +
					  "you should put it someplace where it will be easy to backup.";
			helpProvider.SetHelpString(lblAnswerFile, strAnswerFileHelp);
			helpProvider.SetHelpString(tbAnswerFile, strAnswerFileHelp);
			toolTip.SetToolTip(lblAnswerFile, strAnswerFileHelp);
			toolTip.SetToolTip(tbAnswerFile, strAnswerFileHelp);
			const string strChangeAnswerFileHelp = "Click this to set or change the location and name of the Answer file.";
			helpProvider.SetHelpString(btnAnswerFile, strChangeAnswerFileHelp);
			toolTip.SetToolTip(btnAnswerFile, strChangeAnswerFileHelp);
			const string strGrammarFileHelp = "This file contains the generated PC-PATR grammar file.\n" +
					  "Put it where you will have easy access to it.\n" +
					  "If you are using CarlaStudio, we recommend you put it in the \"XXX Control Files\" directory.";
			helpProvider.SetHelpString(lblGrammarFile, strGrammarFileHelp);
			helpProvider.SetHelpString(tbGrammarFile, strGrammarFileHelp);
			toolTip.SetToolTip(lblGrammarFile, strGrammarFileHelp);
			toolTip.SetToolTip(tbGrammarFile, strGrammarFileHelp);
			const string strWriterFileHelp = "This file contains the generated XLingPap grammar write-up.\n" +
					  "Put it where you will have easy access to it, since you will want to edit it.";
			helpProvider.SetHelpString(lblWriterFile, strWriterFileHelp);
			helpProvider.SetHelpString(tbWriterFile, strWriterFileHelp);
			toolTip.SetToolTip(lblWriterFile, strWriterFileHelp);
			toolTip.SetToolTip(tbWriterFile, strWriterFileHelp);
			const string strExampleFilesHelp = "This directory is where the generated example files will go.\n" +
					  "Put it where you will have easy access to it.\n" +
					  "If you are using CarlaStudio, we recommend you put it where your other text files are.";
			helpProvider.SetHelpString(lblExampleFiles, strExampleFilesHelp);
			helpProvider.SetHelpString(tbExampleFiles, strExampleFilesHelp);
			toolTip.SetToolTip(lblExampleFiles, strExampleFilesHelp);
			toolTip.SetToolTip(tbExampleFiles, strExampleFilesHelp);
		}

		private void btnAnswerFile_Click(object sender, System.EventArgs e)
		{
			doSaveFileDialog(ref strAnswerFile, "Answer File", "PAWS Starter Kit (*.paw)|*.paw|" +
				"All Files (*.*)|*.*", ".paw");
			tbAnswerFile.Text = AnswerFile;
			if (GrammarFile == null)
			{
				GrammarFile = Path.Combine(Path.GetDirectoryName(AnswerFile),
					Path.GetFileNameWithoutExtension(AnswerFile) + ".grm");
			}
			if (WriterFile == null)
			{
				WriterFile = Path.Combine(Path.GetDirectoryName(AnswerFile),
					Path.GetFileNameWithoutExtension(AnswerFile) + ".xml");
			}
			if (ExampleFiles == null)
			{
				ExampleFiles = Path.GetDirectoryName(AnswerFile);
			}
		}

		private void btnGrammarFile_Click(object sender, System.EventArgs e)
		{
			doSaveFileDialog(ref strGrammarFile, "Grammar File", "PAWS Grammar File (*.grm)|*.grm|" +
				"All Files (*.*)|*.*", ".grm");
			tbGrammarFile.Text = GrammarFile;
		}

		private void btnWriterFile_Click(object sender, System.EventArgs e)
		{
			doSaveFileDialog(ref strWriterFile, "Writer File", "PAWS Writer file (*.xml)|*.xml|" +
				"All Files (*.*)|*.*", ".xml");
			tbWriterFile.Text = WriterFile;
		}

		private void btnExampleFiles_Click(object sender, System.EventArgs e)
		{
			DirectoryBrowser dirBrowser = new DirectoryBrowser();
			if (dirBrowser.ShowDialog("Example File Path") == DialogResult.OK)
			{
				ExampleFiles = dirBrowser.DirectoryPath;
			}
		}
		private void doSaveFileDialog(ref string strFileName, string strTitle, string strFilter, string strExtension)
		{
			SaveFileDialog saveDlg = new SaveFileDialog();
			saveDlg.AddExtension = true;
			saveDlg.Title = strTitle;
			saveDlg.Filter = strFilter;
			// following needed, otherwise it always returns "Cancel"
			saveDlg.OverwritePrompt = false;
			if ((strFileName != null) && (strFileName != ""))
			{
				saveDlg.InitialDirectory = Path.GetDirectoryName(strFileName);
				saveDlg.FileName = Path.GetFileNameWithoutExtension(strFileName);
			}
			if (saveDlg.ShowDialog() == DialogResult.OK)
			{
				if (Path.GetExtension(saveDlg.FileName) == "")
					saveDlg.FileName += strExtension;
				strFileName = saveDlg.FileName;
			}
		}

		private void btnOK_Click(object sender, System.EventArgs e)
		{
			string strMessage = "";
			if (Abbreviation == "")
				strMessage = "You must enter a Language Abbreviation.\n";
			if ((AnswerFile == null) || (AnswerFile == ""))
				strMessage += getMissingFileMessage("Answer");
			if ((GrammarFile == null) || (GrammarFile == ""))
				strMessage += getMissingFileMessage("Grammar");
			if ((WriterFile == null) || (WriterFile == ""))
				strMessage += getMissingFileMessage("Writer");
			if ((ExampleFiles == null) || (ExampleFiles == ""))
				strMessage += "You must enter a directory for the example files.";
			if (strMessage == "")
				DialogResult = DialogResult.OK;
			else
				MessageBox.Show(strMessage, "Required Information Missing!",
					MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
		}
		private string getMissingFileMessage(string strFile)
		{
			return "You must enter a " + strFile + " file name.\n";
		}
	}
}
