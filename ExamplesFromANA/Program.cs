using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.IO;

namespace ExamplesFromANA
{
	static class Program
	{
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main()
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);

			if (Properties.Settings.Default.RecentFiles == null)
				Properties.Settings.Default.RecentFiles = new System.Collections.Specialized.StringCollection();

			if (Properties.Settings.Default.RecentProjects == null)
				Properties.Settings.Default.RecentProjects = new System.Collections.Specialized.StringCollection();

			if (Properties.Settings.Default.RecentXMLCorpuses == null)
				Properties.Settings.Default.RecentXMLCorpuses = new System.Collections.Specialized.StringCollection();

			if (    String.IsNullOrEmpty(Properties.Settings.Default.ParlFolder)
				||  !File.Exists(String.Format("{0}\\{1}", Properties.Settings.Default.ParlFolder, "Parl.exe")))
			{
				string strDefPath = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + @"\SIL\ShUtils";
				if (File.Exists(strDefPath + @"\Parl.exe"))
				{
					Properties.Settings.Default.ParlFolder = strDefPath;
					Properties.Settings.Default.Save();
				}
				else
				{
					FolderBrowserDialog dlg = new FolderBrowserDialog();
					dlg.Description = "Browse for the folder where 'shutils' are installed";
					if (dlg.ShowDialog() == DialogResult.OK)
					{
						strDefPath = dlg.SelectedPath;
						if (strDefPath[strDefPath.Length - 1] == '\\')
							strDefPath = strDefPath.Substring(0, strDefPath.Length - 1);

						if (File.Exists(strDefPath + @"\Parl.exe"))
						{
							Properties.Settings.Default.ParlFolder = strDefPath;
							Properties.Settings.Default.Save();
						}
						else
						{
							MessageBox.Show(String.Format("Parl.exe was not found in '{0}'! '{1}' Can't run with 'shutils', so we're quiting",
								strDefPath, DisplayForm.cstrCaption));
							return;
						}
					}
				}
			}

			myTimer.Tick += new EventHandler(TimerEventProcessor);
			myTimer.Interval = 500;    // half a second

			if (!String.IsNullOrEmpty(Properties.Settings.Default.LastProject))
				myTimer.Start();

			m_aForm = new DisplayForm();
			Application.Run(m_aForm);
		}

		public static DisplayForm m_aForm = null;
		public static List<string> FileNames = new List<string>();
		public static System.Windows.Forms.Timer myTimer = new System.Windows.Forms.Timer();
		public static string CurrentProject = null;

		private static void TimerEventProcessor(Object myObject, EventArgs myEventArgs)
		{
			myTimer.Stop();
			if (!String.IsNullOrEmpty(Properties.Settings.Default.LastProject))
				m_aForm.LoadCsLanguageFile(Properties.Settings.Default.LastProject);

			if ((FileNames != null) && (FileNames.Count > 0))
				m_aForm.OpenAnaDocuments(FileNames);
		}

		public static bool IsOnlyOneDoc
		{
			get { return (FileNames.Count == 1); }
		}

		public static void LoadCsProject(string strProjectFile)
		{
			CurrentProject = strProjectFile;
		}
	}
}