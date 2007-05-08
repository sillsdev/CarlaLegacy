using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;                    // for File
using System.Diagnostics;           // for Process
using System.Xml;                   // for XmlDocument
using System.Xml.XPath;             // for XPathNavigator
using System.Xml.Xsl;                   // for XSLT stuff (for sorting the AIKB)

namespace ExamplesFromANA
{
	public partial class DisplayForm : Form
	{
		internal const string cstrCaption = "Examples from CarlaStudio ANA files";

		protected const int nMaxRecentFiles = 15;
		protected const string cstrPOS = "Part of Speech";
		protected const string cstrMorphname = "Morphname";

		public char[] caSplitAmbsChars = new char[] { '%' };
		public char[] caSplitChars = new char[] { ' ', '<', '>' };
		public char[] caSplitAllChars = new char[] { ' ', '<', '>', '%' };

		protected Dictionary<string, List<TextExample>> m_mapTextExamples = new Dictionary<string, List<TextExample>>();
		protected Dictionary<string, string> m_mapTokensToType = new Dictionary<string, string>();

		public DisplayForm()
		{
			InitializeComponent();
		}

		private void openCarlaStudioProjectToolStripMenuItem_Click(object sender, EventArgs e)
		{
			OpenFileDialog dlgProj = new OpenFileDialog();
			dlgProj.DefaultExt = "csl";
			dlgProj.Filter = "CarlaStudio Language Files (*.csl)|*.csl|All files (*.*)|*.*";

			if (dlgProj.ShowDialog() == DialogResult.OK)
			{
				LoadCsLanguageFile(dlgProj.FileName);
			}
		}

		public void LoadCsLanguageFile(string strLanguageFile)
		{
			string strLanguageFileContents = File.ReadAllText(strLanguageFile);
			int nIndex = strLanguageFileContents.IndexOf("TextDisplayInfoX");
			nIndex = strLanguageFileContents.IndexOf('\t', nIndex);
			int nEndIndex = strLanguageFileContents.IndexOf('\t', nIndex + 1);
			string strFontName = strLanguageFileContents.Substring(nIndex + 1, nEndIndex - nIndex - 1);

			nIndex = nEndIndex + 1; // strLanguageFileContents.IndexOf('\t', nEndIndex + 1);
			nEndIndex = strLanguageFileContents.IndexOf('\t', nIndex + 1);
			string strFontSize = strLanguageFileContents.Substring(nIndex + 1, nEndIndex - nIndex - 1);
			int nSize = 12;
			try
			{
				nSize = Convert.ToInt32(strFontSize);
			}
			catch {}

			m_fontExamples = new Font(strFontName, nSize);

			// add this filename to the list of recently used files
			if (Properties.Settings.Default.RecentProjects.Contains(strLanguageFile))
				Properties.Settings.Default.RecentProjects.Remove(strLanguageFile);
			else if (Properties.Settings.Default.RecentProjects.Count > nMaxRecentFiles)
				Properties.Settings.Default.RecentProjects.RemoveAt(nMaxRecentFiles);

			Properties.Settings.Default.RecentProjects.Insert(0, strLanguageFile);
			Properties.Settings.Default.LastProject = strLanguageFile;
			/*
			nIndex = strLanguageFile.LastIndexOf('\\');
			string strIntxFile = strLanguageFile.Substring(0, nIndex + 1) + Path.GetFileNameWithoutExtension(strLanguageFile) + "intx.ctl";
			string strIntxFileContents = File.ReadAllText(strIntxFile);

			nIndex = strIntxFileContents.IndexOf("\n\\incl ") + 7;
			nEndIndex = strIntxFileContents.IndexOf("\n", nIndex);
			string strSfmCodes = strIntxFileContents.Substring(nIndex, nEndIndex - nIndex - 1);
			string[] astrSfmCodes = strSfmCodes.Split(new char[] { ' ' });
			*/
			Properties.Settings.Default.Save();
		}

		private void openToolStripMenuItem_Click(object sender, EventArgs e)
		{
			if (openFileDialog.ShowDialog() == DialogResult.OK)
			{
				if ((listBoxTokens.Items.Count > 0)
					&&  MessageBox.Show("Do you want to concatenate these with the previously opened documents?", cstrCaption, MessageBoxButtons.YesNo) == DialogResult.No)
				{
					Reset();
				}

				foreach (string strFilename in openFileDialog.FileNames)
					if (!Program.FileNames.Contains(strFilename))
						Program.FileNames.Add(strFilename);

				Program.myTimer.Start();
			}
		}

		protected void Reset()
		{
			m_rtbLastClicked = null;
			m_mapTextExamples.Clear();
			m_mapTokensToType.Clear();
			Program.FileNames = new List<string>();
			listBoxTokens.Items.Clear();
			flowLayoutPanelExamples.SuspendLayout();
			flowLayoutPanelExamples.Controls.Clear();
			flowLayoutPanelExamples.ResumeLayout(true);
		}

		public void OpenAnaDocuments(List<string> astrFilenames)
		{
			// in case it was already open and the user clicks the "Open SFM document" again.
			bool bDoItAgain = false;
			do
			{
				try
				{
					LoadAnaDocuments(astrFilenames);
					AddFilenameToTitle(astrFilenames);
				}
				catch (RemoveFileException ex)
				{
					astrFilenames.Remove(ex.Filename);
					if (astrFilenames.Count > 0)
						bDoItAgain = true;
				}
			}
			while (bDoItAgain);
		}

		protected void AddFilenameToTitle(List<string> FileNames)
		{
			System.Diagnostics.Debug.Assert(FileNames.Count > 0);
			string strTitleName = "<various>";  // assume multiple files

			// if there's only one, then add it to the recently used files
			if (Program.IsOnlyOneDoc)
			{
				// if there's only one, then use that in the frame title
				string strFilename = FileNames[0];
				strTitleName = Path.GetFileName(strFilename);

				// add this filename to the list of recently used files
				if (Properties.Settings.Default.RecentFiles.Contains(strFilename))
					Properties.Settings.Default.RecentFiles.Remove(strFilename);
				else if (Properties.Settings.Default.RecentFiles.Count > nMaxRecentFiles)
					Properties.Settings.Default.RecentFiles.RemoveAt(nMaxRecentFiles);

				Properties.Settings.Default.RecentFiles.Insert(0, strFilename);
				Properties.Settings.Default.Save();
			}

			this.Text = String.Format("{0} -- {1}", cstrCaption, strTitleName);
		}

		protected void LoadAnaDocuments(List<string> astrFilenames)
		{
			List<string> astrXMLFiles = new List<string>();
			foreach (string strFilename in astrFilenames)
			{
				if (File.Exists(strFilename))
					ConvertAnaToXml(strFilename, astrXMLFiles);
				else
				{
					throw new RemoveFileException(strFilename);
				}
			}

			listBoxTokens.Items.Clear();

			if (m_mapTextExamples.Count == 0)
				return;

			foreach (string strToken in m_mapTextExamples.Keys)
			{
				listBoxTokens.Items.Add(strToken);
			}

			SaveFileDialog dlg = new SaveFileDialog();
			dlg.DefaultExt = "xml";
			dlg.FileName = "AnaCorpus1.xml";
			dlg.Filter = "CarlaStudio ANA File Corpus (*.xml)|*.xml|All files (*.*)|*.*";
			dlg.Title = "Save corpus? (to avoid rebuilding it next time)?";
			if ((dlg.ShowDialog() == DialogResult.OK) && !String.IsNullOrEmpty(dlg.FileName))
			{
				astrXMLFiles.Insert(0, dlg.FileName);
				backgroundWorker.RunWorkerAsync(astrXMLFiles);
			}
		}

		private void backgroundWorker_DoWork(object sender, DoWorkEventArgs e)
		{
			List<string> astrXMLFiles = e.Argument as List<string>;
			System.Diagnostics.Debug.Assert(astrXMLFiles.Count > 1);

			string strOutputFilename = astrXMLFiles[0];
			astrXMLFiles.RemoveAt(0);
			string strFirstXMLFilename = astrXMLFiles[0];
			astrXMLFiles.RemoveAt(0);
			try
			{

				if (astrXMLFiles.Count > 0)
				{
					foreach (string strXmlFilename in astrXMLFiles)
					{
						MergeXMLFiles(strFirstXMLFilename, strXmlFilename);
					}
				}

				File.Copy(strFirstXMLFilename, strOutputFilename, true);
			}
			catch (Exception ex)
			{
				string strError = String.Format("Unable to write the XML file:{0}{0}'{1}'{0}{0}cause: {2}",
					Environment.NewLine, strOutputFilename, ex.Message);

				if (ex.InnerException != null)
					strError += String.Format("{0}{0}cause: {1}", Environment.NewLine, ex.InnerException.Message);

				MessageBox.Show(strError, cstrCaption);

				if (Properties.Settings.Default.RecentXMLCorpuses.Contains(strOutputFilename))
					Properties.Settings.Default.RecentXMLCorpuses.Remove(strOutputFilename);
				return;
			}

			UpdateRecentCorpusMenu(strOutputFilename);
		}

		protected void UpdateRecentCorpusMenu(string strXMLCorpusFilename)
		{
			// add this filename to the list of recently used files
			if (Properties.Settings.Default.RecentXMLCorpuses.Contains(strXMLCorpusFilename))
				Properties.Settings.Default.RecentXMLCorpuses.Remove(strXMLCorpusFilename);
			else if (Properties.Settings.Default.RecentXMLCorpuses.Count > nMaxRecentFiles)
				Properties.Settings.Default.RecentXMLCorpuses.RemoveAt(nMaxRecentFiles);

			Properties.Settings.Default.RecentXMLCorpuses.Insert(0, strXMLCorpusFilename);
			Properties.Settings.Default.Save();
		}

		protected void MergeXMLFiles(string strFirstXMLFilename, string strXmlFilenameToMerge)
		{
			string strXSLTInputFile = String.Format(Properties.Resources.XSLTMergeInput,
				strFirstXMLFilename, strXmlFilenameToMerge);

			MemoryStream streamXSLTInput = new MemoryStream(Encoding.UTF8.GetBytes(strXSLTInputFile));
			XmlDocument doc = new XmlDocument();
			doc.Load(streamXSLTInput);

			// Load the XSLT and create the transform processor
			XslCompiledTransform xslt = new XslCompiledTransform();
			MemoryStream streamXSLT = new MemoryStream(Encoding.UTF8.GetBytes(Properties.Resources.merge));
			XmlReader xslReader = XmlReader.Create(streamXSLT);
			XsltSettings xsltSettings = new XsltSettings(true, false);
			xslt.Load(xslReader, xsltSettings, null);

			// create an XML writer for the output of the transformation
			StringBuilder strBuilder = new StringBuilder();
			XmlWriterSettings settings = new XmlWriterSettings();
			settings.ConformanceLevel = ConformanceLevel.Fragment;
			XmlWriter writer = XmlWriter.Create(strBuilder, settings);

			// Execute the transform and put the output in the stream created
			xslt.Transform(doc.DocumentElement, writer);

			// update the original document's DocElement's Inner XML with this new transformed version
			string strNewXML = strBuilder.ToString();

			XmlDocument docOutput = new XmlDocument();
			docOutput.LoadXml(strNewXML);
			// doc.InnerXml = Properties.Resources.XmlFileHeader + strNewXML;

			// create a Text XML writer to write it out with indentation, etc, so we can do diffs
			XmlTextWriter twriter = new XmlTextWriter(strFirstXMLFilename, Encoding.UTF8);
			twriter.Formatting = Formatting.Indented;

			// save the data in the temporary output file
			docOutput.Save(twriter);
			twriter.Close();    // so that later deleting won't get bogged down.
		}

		protected void ConvertAnaToXml(string strFilename, List<string> astrXMLFiles)
		{
			// first create a temporary file which we can manipulate
			string strAnaFileContents = File.ReadAllText(strFilename);

			string strTbxAnaFilename = Path.GetTempFileName();

			File.WriteAllText(strTbxAnaFilename, strAnaFileContents);

			string strSilCommon = Environment.GetFolderPath(Environment.SpecialFolder.CommonProgramFiles) + @"\SIL";
#if DontUseCC
			// CleanSfmOfRedundantNLs.exe {0}\{1} {2}
			string strCallCcCmdLineArgs = String.Format("\"{0}\\{1}\" \"{2}\"",
				strSilCommon,
				@"MapsTables\Ana2TbxDb.cct",
				strTbxAnaFilename);

			LaunchProgram("CleanSfmOfRedundantNLs.exe", strCallCcCmdLineArgs);
#else
			string strTbxAnaFilenameOut = Path.GetTempFileName();
			// Ccw32.exe -t D:\Progra~1\common~1\SIL\MapsTa~2\Ana2Tb~1.cct -o Tmrk16.ana mrk16.ana
			string strCallCcCmdLineArgs = String.Format("-b -q -n -t \"{0}\\{1}\" -o \"{2}\" \"{3}\"",
				strSilCommon,
				@"MapsTables\Ana2TbxDb.cct",
				strTbxAnaFilenameOut,
				strTbxAnaFilename);

			if (!LaunchProgram("Ccw32.exe", strCallCcCmdLineArgs))
				return;

			strTbxAnaFilename = strTbxAnaFilenameOut;
#endif
			// next call sh2xml:
			// "D:\Program Files\common files\SIL\parl.exe" "D:\Program Files\common files\SIL\shutils.par" sh2xml -s L:\Pahari\Toolbox c:\temp\temp.ana c:\temp\temp.ana.xml
			string strExePath = System.Reflection.Assembly.GetExecutingAssembly().GetModules()[0].FullyQualifiedName;
			int nIndex = strExePath.LastIndexOf('\\');
			strExePath = strExePath.Substring(0, nIndex);

			System.Diagnostics.Debug.Assert(!String.IsNullOrEmpty(Properties.Settings.Default.ParlFolder));

			string strCallSh2XmlCmdLineArgs = String.Format("\"{0}\\shutils.par\" sh2xml -s \"{1}\" \"{2}\" \"{2}.xml\"",
				Properties.Settings.Default.ParlFolder,
				strExePath,
				strTbxAnaFilename);

			if (!LaunchProgram(Properties.Settings.Default.ParlFolder + @"\parl.exe", strCallSh2XmlCmdLineArgs))
				return;

			// keep track of this one's name so we can potentially merge them into a single "corpus" file
			astrXMLFiles.Add(strTbxAnaFilename + ".xml");

			LoadXmlFile(strTbxAnaFilename + ".xml");
		}

		protected void LoadXmlFile(string strTbxAnaXmlFilename)
		{
			string strAnaXmlFileContents = null;
			try
			{
				strAnaXmlFileContents = File.ReadAllText(strTbxAnaXmlFilename);
			}
			catch (Exception ex)
			{
				string strError = String.Format("Unable to read the XML file:{0}{0}'{1}'{0}{0}cause: {2}",
					Environment.NewLine, strTbxAnaXmlFilename, ex.Message);

				if (ex.InnerException != null)
					strError += String.Format("{0}{0}cause: {1}", Environment.NewLine, ex.InnerException.Message);

				MessageBox.Show(strError, cstrCaption);
				return;
			}

#if !UseDataSet
			XmlDocument doc = new XmlDocument();
			try
			{
				doc.LoadXml(strAnaXmlFileContents);
				XPathNavigator navigator = doc.CreateNavigator();
				XPathNodeIterator nodeTextExamples = navigator.Select("/shoebox/t");
				XPathExpression xpeTextExampleValue = navigator.Compile("@value");
				XPathExpression xpeWords = navigator.Compile("w");
				XPathExpression xpeAnalysis = navigator.Compile("a");
				XPathExpression xpeCategory = navigator.Compile("cat");

				while (nodeTextExamples.MoveNext())
				{
					string strTextExampleValue = GetExpressionValue(nodeTextExamples, xpeTextExampleValue);
					string strTextExampleXML = nodeTextExamples.Current.OuterXml;
					TextExample te = new TextExample(strTextExampleValue, strTextExampleXML);

					XPathNodeIterator nodeWords = nodeTextExamples.Current.Select(xpeWords);
					while (nodeWords.MoveNext())
					{
						string strWordValue = GetExpressionValue(nodeWords, xpeTextExampleValue);
						string strAnalysis = GetExpressionValue(nodeWords, xpeAnalysis);
						string strCategory = GetExpressionValue(nodeWords, xpeCategory);
						string strWordXML = nodeWords.Current.OuterXml;

						WordExample we = new WordExample(strWordValue, strAnalysis, strCategory, strWordXML);
						te.Add(we);

						// probably expand this, but for now, get an indexing mechanism to these examples
						// split the analysis content to get the list of morphenames
						int nIndex = 0;
						if (strAnalysis[0] == '%')
						{
							nIndex = strAnalysis.IndexOf('%', 2);
							System.Diagnostics.Debug.Assert(nIndex != -1);
							strAnalysis = strAnalysis.Substring(nIndex + 1);
						}

						string[] astrAmbiguities = strAnalysis.Split(caSplitAmbsChars, StringSplitOptions.RemoveEmptyEntries);
						foreach (string strAmbiguity in astrAmbiguities)
						{
							string strType = cstrPOS;
							string[] astrMorphnames = strAmbiguity.Split(caSplitChars, StringSplitOptions.RemoveEmptyEntries);
							foreach (string strMorphname in astrMorphnames)
							{
								// save the type of the token in one map (so we can trigger tooltips on the full list
								m_mapTokensToType[strMorphname] = strType;
								strType = cstrMorphname;

								// put the list of TextExamples into another map keyed on the token (but it may
								//  already exist)
								AddMapToTeList(strMorphname, te);
							}
						}
					}
				}
			}
			catch (Exception ex)
			{
				string strError = String.Format("Unable to Serialize the XML file:{0}{0}'{1}'{0}{0}cause: {2}",
					Environment.NewLine, strTbxAnaXmlFilename, ex.Message);

				if (ex.InnerException != null)
					strError += String.Format("{0}{0}cause: {1}", Environment.NewLine, ex.InnerException.Message);

				strError += String.Format("{0}{0}It looks like it contains something unexpected...{0}send the file '{1}' to bob_eaton@sall.com along with this error message",
					Environment.NewLine, strTbxAnaXmlFilename);

				MessageBox.Show(strError, cstrCaption);
				return;
			}
#else
			if (strAnaXmlFileContents.IndexOf("xmlns=\"http://www.sil.org/computing/schemas/AnaTextExamples.xsd\"") == -1)
			{
				strAnaXmlFileContents = strAnaXmlFileContents.Replace(
					"shoebox type=\"CarlaStudioANA\"",
					"shoebox type=\"CarlaStudioANA\" xmlns=\"http://www.sil.org/computing/schemas/AnaTextExamples.xsd\"");
			}

			MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(strAnaXmlFileContents));
			AnaTextExamplesXML xmlFile = new AnaTextExamplesXML();
			try
			{
				xmlFile.ReadXml(ms);
			}
			catch (Exception ex)
			{
				string strError = String.Format("Unable to Serialize the XML file:{0}{0}'{1}'{0}{0}cause: {2}",
					Environment.NewLine, strTbxAnaXmlFilename, ex.Message);

				if (ex.InnerException != null)
					strError += String.Format("{0}{0}cause: {1}", Environment.NewLine, ex.InnerException.Message);

				strError += String.Format("{0}{0}It looks like it contains something unexpected...{0}send the file '{1}' to bob_eaton@sall.com along with this error message",
					Environment.NewLine, strTbxAnaXmlFilename);

				MessageBox.Show(strError, cstrCaption);
				return;
			}
			/*
			AnaTextExamplesXML.shoeboxRow aSbxRow = null;
			if (xmlFileCorpus != null)
			{
				System.Diagnostics.Debug.Assert(xmlFileCorpus.shoebox.Count > 0);
				aSbxRow = xmlFileCorpus.shoebox[0];
			}
			*/
			foreach (AnaTextExamplesXML.tRow aTRow in xmlFile.t)
			{
				/*
				if (xmlFileCorpus != null)
					xmlFileCorpus.t.AddtRow(aTRow.value, aSbxRow);
				*/
				TextExample te = new TextExample(aTRow.value, aTRow.value);
				foreach (AnaTextExamplesXML.wRow aWRow in aTRow.GetwRows())
				{
					/*
					if (xmlFileCorpus != null)
						xmlFileCorpus.w.AddwRow(aWRow.value, aWRow.a, aWRow.d, aWRow.cat, aWRow.u,
							((aWRow.IspNull()) ? null : aWRow.p),
							((aWRow.IsnNull()) ? null : aWRow.n),
							((aWRow.IsfNull()) ? null : aWRow.f), aTRow);
					*/
					string strAnalysis = aWRow.a;
					WordExample we = new WordExample(aWRow.value, strAnalysis, aWRow.cat);
					te.Add(we);

					// probably expand this, but for now, get an indexing mechanism to these examples
					// split the analysis content to get the list of morphenames
					int nIndex = 0;
					if (strAnalysis[0] == '%')
					{
						nIndex = strAnalysis.IndexOf('%', 2);
						System.Diagnostics.Debug.Assert(nIndex != -1);
						strAnalysis = strAnalysis.Substring(nIndex + 1);
					}

					string[] astrAmbiguities = strAnalysis.Split(caSplitAmbsChars, StringSplitOptions.RemoveEmptyEntries);
					foreach (string strAmbiguity in astrAmbiguities)
					{
						string strType = cstrPOS;
						string[] astrMorphnames = strAmbiguity.Split(caSplitChars, StringSplitOptions.RemoveEmptyEntries);
						foreach (string strMorphname in astrMorphnames)
						{
							// save the type of the token in one map (so we can trigger tooltips on the full list
							m_mapTokensToType[strMorphname] = strType;
							strType = cstrMorphname;

							// put the list of TextExamples into another map keyed on the token (but it may
							//  already exist)
							AddMapToTeList(strMorphname, te);
						}
					}
				}
			}
#endif
		}

		protected string GetExpressionValue(XPathNodeIterator xpIterator, XPathExpression xpe)
		{
			string str = null;
			XPathNodeIterator xpIteratorName = xpIterator.Current.Select(xpe);
			if (xpIteratorName.MoveNext())
				str = xpIteratorName.Current.Value;
			return str;
		}

		protected void AddMapToTeList(string strMorphname, TextExample te)
		{
			List<TextExample> teList = null;
			if (!m_mapTextExamples.TryGetValue(strMorphname, out teList))
				teList = new List<TextExample>();

			if (!teList.Contains(te))
				teList.Add(te);
			else
				return;

			m_mapTextExamples[strMorphname] = teList;
		}

		internal static bool LaunchProgram(string strProgram, string strArguments)
		{
			try
			{
				Process myProcess = new Process();

				myProcess.StartInfo.FileName = strProgram;
				myProcess.StartInfo.Arguments = strArguments;
				myProcess.Start();
				myProcess.WaitForExit();
			}
			catch (Exception ex)
			{
				string strError = String.Format("Unable to run the command line:{0}{0}'{1} {2}'{0}{0}cause: {3}",
					Environment.NewLine, strProgram, strArguments, ex.Message);

				if (ex.InnerException != null)
					strError += String.Format("{0}{0}cause: {1}", Environment.NewLine, ex.InnerException.Message);

				MessageBox.Show(strError, cstrCaption);
				return false;
			}
			return true;
		}

		private void fileToolStripMenuItem_DropDownOpening(object sender, EventArgs e)
		{
			this.recentProjectsToolStripMenuItem.DropDownItems.Clear();
			foreach (string strRecentProject in Properties.Settings.Default.RecentProjects)
				recentProjectsToolStripMenuItem.DropDownItems.Add(strRecentProject, null, recentProjectsToolStripMenuItem_Click);

			recentProjectsToolStripMenuItem.Enabled = (recentProjectsToolStripMenuItem.DropDownItems.Count > 0);

			this.recentFilesToolStripMenuItem.DropDownItems.Clear();
			this.recentXMLCorpusesToolStripMenuItem.DropDownItems.Clear();

			if (m_fontExamples != null)
			{
				openXMLCorpusToolStripMenuItem.Enabled = openToolStripMenuItem.Enabled = closeAllToolStripMenuItem.Enabled = true;
				foreach (string strRecentFile in Properties.Settings.Default.RecentFiles)
					recentFilesToolStripMenuItem.DropDownItems.Add(strRecentFile, null, recentFilesToolStripMenuItem_Click);

				foreach (string strRecentXMLCorpuses in Properties.Settings.Default.RecentXMLCorpuses)
					recentXMLCorpusesToolStripMenuItem.DropDownItems.Add(strRecentXMLCorpuses, null, recentXMLCorpusesToolStripMenuItem_Click);
			}
			else
			{
				openXMLCorpusToolStripMenuItem.Enabled = openToolStripMenuItem.Enabled = closeAllToolStripMenuItem.Enabled = false;
			}

			recentFilesToolStripMenuItem.Enabled = (recentFilesToolStripMenuItem.DropDownItems.Count > 0);
			recentXMLCorpusesToolStripMenuItem.Enabled = (recentXMLCorpusesToolStripMenuItem.DropDownItems.Count > 0);
		}

		void recentFilesToolStripMenuItem_Click(object sender, EventArgs e)
		{
			ToolStripDropDownItem aRecentFile = (ToolStripDropDownItem)sender;
			try
			{
				Program.FileNames.Clear();
				Program.FileNames.Add(aRecentFile.Text);
				LoadAnaDocuments(Program.FileNames);
				AddFilenameToTitle(Program.FileNames);
			}
			catch (Exception ex)
			{
				// probably means the file doesn't exist anymore, so remove it from the recent used list
				Properties.Settings.Default.RecentFiles.Remove(aRecentFile.Text);
				Properties.Settings.Default.Save();
				MessageBox.Show(ex.Message, cstrCaption);
			}
		}

		void recentProjectsToolStripMenuItem_Click(object sender, EventArgs e)
		{
			ToolStripDropDownItem aRecentProjectFile = (ToolStripDropDownItem)sender;
			try
			{
				Reset();
				LoadCsLanguageFile(aRecentProjectFile.Text);
			}
			catch (Exception ex)
			{
				// probably means the file doesn't exist anymore, so remove it from the recent used list
				Properties.Settings.Default.RecentProjects.Remove(aRecentProjectFile.Text);
				Properties.Settings.Default.Save();
				MessageBox.Show(ex.Message, cstrCaption);
			}
		}

		void recentXMLCorpusesToolStripMenuItem_Click(object sender, EventArgs e)
		{
			ToolStripDropDownItem aRecentXMLFile = (ToolStripDropDownItem)sender;
			try
			{
				Reset();
				LoadXmlFile(aRecentXMLFile.Text);

				listBoxTokens.Items.Clear();
				foreach (string strToken in m_mapTextExamples.Keys)
				{
					listBoxTokens.Items.Add(strToken);
				}
			}
			catch (Exception ex)
			{
				// probably means the file doesn't exist anymore, so remove it from the recent used list
				Properties.Settings.Default.RecentXMLCorpuses.Remove(aRecentXMLFile.Text);
				Properties.Settings.Default.Save();
				MessageBox.Show(ex.Message, cstrCaption);
			}
		}

		private void exitToolStripMenuItem_Click(object sender, EventArgs e)
		{
			this.Close();
		}

		private void listBoxTokens_SelectedIndexChanged(object sender, EventArgs e)
		{
			m_rtbLastClicked = null;    // so we don't try to use an already dismissed RTF box
			if (listBoxTokens.SelectedItems.Count == 0)
				return;

			flowLayoutPanelExamples.SuspendLayout();
			flowLayoutPanelExamples.Controls.Clear();

			if (listBoxTokens.SelectedItems.Count > 1)
			{
				List<string> astrTokens = new List<string>();
				foreach (string strToken in listBoxTokens.SelectedItems)
					astrTokens.Add(strToken);

				ListExamples(astrTokens);
			}
			else
			{
				ListExamples((string)listBoxTokens.SelectedItem);
			}

			flowLayoutPanelExamples.ResumeLayout(true);
		}

		protected void ListExamples(List<string> astrTokens)
		{
			System.Diagnostics.Debug.Assert(astrTokens.Count > 1);
			string strToken = astrTokens[0];
			astrTokens.RemoveAt(0);

			List<TextExample> teListOne = m_mapTextExamples[strToken], teList = new List<TextExample>();

			foreach (TextExample te in teListOne)
			{
				// have to see if this text example is also in all of the lists of the other morphemes
				bool bIn = true;
				foreach (string strTokenOther in astrTokens)
				{
					List<TextExample> teListOther = m_mapTextExamples[strTokenOther];
					if (!teListOther.Contains(te))
					{
						bIn = false;
						break;
					}
				}
				if (bIn)
					teList.Add(te);
			}

			// put it back in for the highlighting-in-red processing
			astrTokens.Add(strToken);

			foreach (TextExample te in teList)
			{
				// we have to find all the text examples that h
				RichTextBox rtb = InitializeRTB(te);
				flowLayoutPanelExamples.Controls.Add(rtb);
				flowLayoutPanelExamples.SetFlowBreak(rtb, true);

				foreach (WordExample we in te)
				{
					foreach (string strMorphToken in astrTokens)
					{
						if (we.Analysis.IndexOf(strMorphToken) != -1)
						{
							int nIndex = 0;
							string[] astrMorphTokens = we.Analysis.Split(caSplitAllChars, StringSplitOptions.RemoveEmptyEntries);
							foreach (string strTargetToken in astrMorphTokens)
							{
								if (strTargetToken == strMorphToken)
								{
									nIndex = rtb.Find(we.Word, nIndex, RichTextBoxFinds.WholeWord);
									if (nIndex != -1)
									{
										rtb.SelectionColor = Color.Red;
									}
								}
							}
						}
					}
				}
			}
		}

		protected void ListExamples(string strToken)
		{
			List<TextExample> teList = m_mapTextExamples[strToken];

			foreach (TextExample te in teList)
			{
				RichTextBox rtb = InitializeRTB(te);
				flowLayoutPanelExamples.Controls.Add(rtb);
				flowLayoutPanelExamples.SetFlowBreak(rtb, true);

				foreach (WordExample we in te)
				{
					if (we.Analysis.IndexOf(strToken) != -1)
					{
						int nIndex = 0;
						string[] astrTokens = we.Analysis.Split(caSplitAllChars, StringSplitOptions.RemoveEmptyEntries);
						foreach (string strTargetToken in astrTokens)
						{
							if (strTargetToken == strToken)
							{
								nIndex = rtb.Find(we.Word, nIndex, RichTextBoxFinds.WholeWord);
								if (nIndex != -1)
								{
									rtb.SelectionColor = Color.Red;
								}
							}
						}
					}
				}
			}
		}

		protected System.Drawing.Graphics m_g = null;
		protected Font m_fontExamples = null;
		protected int m_nPadFactor = 6, m_nIndentFactor = 20;
		protected Padding m_paddingRTF = new Padding(0);

		protected RichTextBox InitializeRTB(TextExample te)
		{
			RichTextBox rtb = new RichTextBox();
			rtb.Multiline = false;
			rtb.Text = te.Text;
			rtb.ReadOnly = true;
			rtb.AutoWordSelection = true;
			rtb.BorderStyle = BorderStyle.FixedSingle;
			rtb.Font = m_fontExamples;
			rtb.WordWrap = false;

			if (m_g == null)
				m_g = Graphics.FromHwnd(this.Handle);

			Size sz = TextRenderer.MeasureText(m_g, te.Text, m_fontExamples);
			sz.Height += m_nPadFactor;
			sz.Width += m_nIndentFactor;

			rtb.Size = sz;
			rtb.Margin = m_paddingRTF;
			rtb.SelectionIndent = m_nIndentFactor;

			rtb.Tag = te;
			rtb.MouseUp += new MouseEventHandler(rtb_MouseUp);
			return rtb;
		}

		protected string GetToolTip(RichTextBox rtb)
		{
			string str = rtb.SelectedText;
			TextExample te = (TextExample)rtb.Tag;
			string[] astrSelectedWords = str.Split(caSplitChars, StringSplitOptions.RemoveEmptyEntries);
			string strToolTip = Environment.NewLine;
			int nIndex = 0;
			foreach (string strSelectedWord in astrSelectedWords)
			{
				nIndex--;   // back up one so our pre-increment starts at the next word
				while (++nIndex < te.Count)
				{
					WordExample we = te[nIndex];
					if (we.Word == strSelectedWord)
					{
						strToolTip += we.InnerXml + Environment.NewLine + Environment.NewLine;
						break;
					}
				}
			}

			return strToolTip;
		}

		protected RichTextBox m_rtbLastClicked = null;

		void rtb_MouseUp(object sender, MouseEventArgs e)
		{
			m_rtbLastClicked = (RichTextBox)sender;
			if (e.Button == MouseButtons.Right)
			{
				string strToolTip = GetToolTip(m_rtbLastClicked);
				toolTip.SetToolTip(m_rtbLastClicked, strToolTip);
			}
		}

		private void closeAllToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Reset();
		}

		protected Point m_ptLastMove = new Point(0, 0);

		protected int LastPointClicked
		{
			get { return listBoxTokens.IndexFromPoint(m_ptLastMove); }
		}

		private void listBoxTokens_MouseMove(object sender, MouseEventArgs e)
		{
			m_ptLastMove = new Point(e.X, e.Y);
			int nIndex = LastPointClicked;
			if (nIndex != -1)
			{
				string strKey = (string)listBoxTokens.Items[nIndex];
				toolTip.SetToolTip(listBoxTokens, m_mapTokensToType[strKey]);
			}
		}

		private void viewReadmeToolStripMenuItem_Click(object sender, EventArgs e)
		{
			string strRtfPath = System.Reflection.Assembly.GetExecutingAssembly().GetModules()[0].FullyQualifiedName;
			int nIndex = strRtfPath.LastIndexOf('\\');
			strRtfPath = strRtfPath.Substring(0, nIndex + 1) + "Display Examples from CarlaStudio.rtf";
			LaunchProgram(strRtfPath, null);
		}

		private void openXMLCorpusToolStripMenuItem_Click(object sender, EventArgs e)
		{
			OpenFileDialog dlg = new OpenFileDialog();
			dlg.DefaultExt = "xml";
			dlg.Filter = "CarlaStudio ANA File Corpus (*.xml)|*.xml|All files (*.*)|*.*";
			dlg.Multiselect = false;
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				if ((listBoxTokens.Items.Count > 0)
					&& MessageBox.Show("Do you want to concatenate these with the previously opened documents?", cstrCaption, MessageBoxButtons.YesNo) == DialogResult.No)
				{
					Reset();
				}

				LoadXmlFile(dlg.FileName);

				listBoxTokens.Items.Clear();
				foreach (string strToken in m_mapTextExamples.Keys)
				{
					listBoxTokens.Items.Add(strToken);
				}

				UpdateRecentCorpusMenu(dlg.FileName);
			}
		}

		private void DisplayForm_FormClosing(object sender, FormClosingEventArgs e)
		{
			if (backgroundWorker.IsBusy)
			{
				MessageBox.Show("Busy saving the corpus... try again later.", cstrCaption);
				e.Cancel = true;
			}
		}

		private void editToolStripMenuItem_DropDownOpening(object sender, EventArgs e)
		{
			analysisOfSelectedWordToolStripMenuItem.Enabled = (m_rtbLastClicked != null);
		}

		private void analysisOfSelectedWordToolStripMenuItem_Click(object sender, EventArgs e)
		{
			if (m_rtbLastClicked != null)
			{
				string strToolTip = GetToolTip(m_rtbLastClicked);
				DisplayXMLForm dlg = new DisplayXMLForm(strToolTip);
				dlg.ShowDialog();
			}
		}
	}
}