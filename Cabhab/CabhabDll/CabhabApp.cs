// --------------------------------------------------------------------------------------------
#region // Copyright (c) 2003, SIL International. All Rights Reserved.
// <copyright from='2003' to='2007' company='SIL International'>
//		Copyright (c) 2007, SIL International. All Rights Reserved.
//
//		Distributable under the terms of either the Common Public License or the
//		GNU Lesser General Public License, as specified in the LICENSING.txt file.
// </copyright>
#endregion
//
// File: CabhabApp.cs
// Responsibility:
// Last reviewed:
//
// <remarks>
// </remarks>
// --------------------------------------------------------------------------------------------
using System;
using System.Drawing;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;
using System.Security.Permissions;
using System.Reflection;
using System.Xml;
using Reflector.UserInterface;
using SIL.Utils;
using XCore;
//using Microsoft.Win32;

namespace SIL.Cabhab
{
	/// <summary>
	/// Summary description for CabhabApp.
	/// </summary>
	[PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
	public class CabhabApp : XWindow
	{
		string m_sConfigurationFile;
		string m_sConfigurationFileFullPath;

		public string ConfigurationFileFullPath
		{
			get { return m_sConfigurationFileFullPath; }
			set { m_sConfigurationFileFullPath = value; }
		}

		public string ConfigurationFile
		{
			get { return m_sConfigurationFile; }
		}

		string m_sAnswerFile;
		StatusBar m_statusBar = null;
		Control m_toolbar = null;
		HtmlViewer m_viewer;
		/// -----------------------------------------------------------------------------------
		/// <summary>
		/// Initializes a new instance of the <see cref="CabhabApp"/> class.
		/// </summary>
		/// -----------------------------------------------------------------------------------
		public CabhabApp()
		{
			m_sConfigurationFile = ConfigurationPath;
		}
		/// <summary>
		/// Initializes a new instance of the <see cref="CabhabApp"/> class
		/// </summary>
		/// <param name="sConfigurationFile">full path of configuration file</param>
		public CabhabApp(string sConfigurationFile)
		{
			m_sConfigurationFile = sConfigurationFile;
		}

		void OnChangeShowToolbar(object sender, EventArgs e)
		{
			if (m_toolbar != null)
			{
				m_toolbar.Visible = m_mediator.PropertyTable.GetBoolProperty("ShowToolbar", true);
			}
		}
		/// <summary>
		///
		/// </summary>
		/// <returns></returns>
		[STAThread]
		public Form NewMainWindow(bool fTesting)
		{
			try
			{
				ImageHolder holder = new ImageHolder();
				// TODO: may want to add following to xml at some point or put it in configuration Path using Cabhab.ico as name
				// We are putting the configuration files in the common app directory
				string sAppData = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
				string sCabhabDirectory = Path.Combine(sAppData, Path.Combine("SIL", "Cabhab"));
				string sConfigPath = Path.Combine(sCabhabDirectory, "Configurations");
				string sConfig = Path.Combine(sConfigPath, ConfigurationFile);
				ConfigurationFileFullPath = sConfig;
				string sConfigSettings = Path.Combine(sCabhabDirectory, "ConfigurationSettings");
				if (!Directory.Exists(sConfigSettings))
				{
					Directory.CreateDirectory(sConfigSettings);
				}
				Mediator.PropertyTable.UserSettingDirectory = sConfigSettings;
				//MessageBox.Show("Before LoadUi().  sConfig = " + sConfig);
				LoadUI(sConfig); //Argument("x"));
				//MessageBox.Show("Before getting icon file");
				string sIconFile = Mediator.PropertyTable.GetStringProperty("CabhabAppIcon", null);
				//MessageBox.Show("Before changing icon: sIconFile = " + sIconFile);
				sIconFile = Path.Combine(sConfigPath, sIconFile);
				//MessageBox.Show("Before setting icon: sIconFile = " + sIconFile);
				Icon = new System.Drawing.Icon(sIconFile);
				if (!fTesting)
				{
					//m_mainSplitterContainer.Panel1Collapsed = true;
					GetToolAndStatusBars();
					m_viewer = (HtmlViewer) Mediator.PropertyTable.GetValue("currentContentControlObject");
					m_viewer.ChangeShowToolbar += new EventHandler(OnChangeShowToolbar);
					m_viewer.ChangeShowStatusBar += new EventHandler(OnChangeShowStatusBar);
					Language m_lang = m_viewer.m_lang;
					m_lang.ChangeLanguageName += new EventHandler(OnChangeLanguageName);
					string sLangName = (m_lang != null) ? sLangName = m_lang.Name : "";
					Mediator.PropertyTable.SetProperty("DocumentName", sLangName);
					UpdateCaptionBar();
					if (m_sAnswerFile != null && File.Exists(m_sAnswerFile))
					{
						m_lang.LoadAnswerFile(m_sAnswerFile);
						m_lang.LanguageNameChanged();
					}
					Show();
				}
				return this;
			}
			catch(Exception e)
			{
				MessageBox.Show("Exception caught: message =" + e.Message);
				MessageBox.Show("Inner exception = " + e.InnerException);
				return this;
			}
		}
		public void ReLoadMenuBarContents()
		{
#if Failed
			Assembly adaptorAssembly = GetAdapterAssembly();
						//add the menubar
			Control menubar;
#endif
			// reload information from the configuration file; its contents have probably changed
			XmlDocument configuration = XWindow.LoadConfigurationWithIncludes(ConfigurationFileFullPath);
			m_windowConfigurationNode = configuration.SelectSingleNode("window");



			CommandBar commandBar = (MenuAdapter as IUIMenuAdapter).GetMenuBar();
			CommandBarItemCollection currentMenuItems = commandBar.Items;
			int iCurrentMenuItem = 0;

			XmlNode menubar = configuration.SelectSingleNode("//menubar");
			foreach (XmlNode node in menubar)
			{
				if (node.LocalName == "menu")
				{
					RenameMenuItems(configuration, node, currentMenuItems[iCurrentMenuItem]);
					iCurrentMenuItem++;
				}
			}

#if Failed
			m_menusChoiceGroupCollection = MakeMajorUIPortion(
				adaptorAssembly,
				m_windowConfigurationNode,
				"menubar",
				"XCore.MenuAdapter",
				out menubar,
				out m_menuBarAdapter);

			if (menubar != null && menubar.Parent != null)
			{
				System.Windows.Forms.Control parent = menubar.Parent;
				if (parent.AccessibleName == null)
					parent.AccessibleName = "ParentOf" + menubar.AccessibleName;
			}
			this.Menu = (m_menuBarAdapter as IUIMenuAdapter).GetMainMenu();
#endif


		}
		private void RenameMenuItems(XmlDocument configuration, XmlNode menuNode, CommandBarItem menuItem)
		{
			string sLabel = XmlUtils.GetManditoryAttributeValue(menuNode, "label");
			SetMenuItem(sLabel, menuItem);
#if CanRecursivelySearhMenus
			XmlNodeList subNodes = menuNode.ChildNodes;
			int iMenuItem = 0;
			foreach (XmlNode node in subNodes)
			{
				string sName = node.LocalName;
				if (sName == "menu")
				{
					//RenameMenuItems(configuration, node, menuItem..MenuItems[iMenuItem]);
				}
				else if (sName == "item")
				{
					string sCommand = XmlUtils.GetOptionalAttributeValue(node, "command");
					if (!string.IsNullOrEmpty(sCommand))
					{
						XmlNode command = configuration.SelectSingleNode("//command[@id='" + sCommand + "']");
						if (command != null)
						{
							string sCommandLabel = XmlUtils.GetManditoryAttributeValue(command, "label");
					//		MenuItem mi = menuItem.MenuItems[iMenuItem];
					//		SetMenuItem(sCommandLabel, mi);
						}
					}
				}
				iMenuItem++;
			}
#endif
		}

		private void SetMenuItem(string sLabel, CommandBarItem menuItem)
		{
			if (!string.IsNullOrEmpty(sLabel))
				menuItem.Text = sLabel.Replace("_", "&"); ;
		}

		void OnChangeLanguageName(object sender, EventArgs e)
		{
			if (sender != null && Mediator != null)
			{
				string sLangName = ((Language) sender).Name;
				Mediator.PropertyTable.SetProperty("DocumentName", sLangName);
				UpdateCaptionBar();
			}
		}

		void OnChangeShowStatusBar(object sender, EventArgs e)
		{
			if (m_statusBar != null)
			{
				m_statusBar.Visible = m_mediator.PropertyTable.GetBoolProperty("ShowStatusBar", true);
			}
		}

		private void GetToolAndStatusBars()
		{
			Control[] ctrls = Controls.Find("StatusBar", true);
			if (ctrls.Length > 0)
				m_statusBar = (StatusBar)ctrls[0];
			ctrls = Controls.Find("CommandBarManager", true);
			if (ctrls.Length > 0)
			{
				var ctrl = ctrls[0] as CommandBarManager;
				if (ctrl != null)
				{
					var bars = ctrl.CommandBars;
					if (bars.Count == 2)
					{
						var toolbar = bars[1];
						if (toolbar != null)
							m_toolbar = toolbar;
					}
				}

			}
		}
		protected override void XWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
			if (m_viewer != null)
			{
				m_viewer.OnExitApplication(null);
			}
			base.XWindow_Closing(sender, e);
		}
#if HaveWin32Setup
		/// -----------------------------------------------------------------------------------
		/// <summary>
		/// Application entry point. If LexTextApp isn't already running,
		/// an instance of the app is created.
		/// </summary>
		/// <param name="rgArgs">Command-line arguments</param>
		/// <returns>0</returns>
		/// -----------------------------------------------------------------------------------
		[STAThread]
		public static int Main(string[] rgArgs)
		{
			// Create a semaphore to keep more than one instance of the application
			// from running at the same time.  If the semaphore is signalled, then
			// this instance can run.
			Win32.SecurityAttributes sa = new Win32.SecurityAttributes();
			IntPtr semaphore = Win32.CreateSemaphore(ref sa, 1, 1,
				Process.GetCurrentProcess().MainModule.ModuleName);
			switch (Win32.WaitForSingleObject(semaphore, 0))
			{
				case Win32.WAIT_OBJECT_0:
					// Using the 'using' gizmo will call Dispose on app,
					// which in turn will call Dispose for all FdoCache objects,
					// which will release all of the COM objects it connects to.
					using (LexTextApp application = new LexTextApp(rgArgs))
					{
						SIL.Utils.ErrorReporter.EmailAddress = "FlexErrors@sil.org";
						application.Run();
					}
					int previousCount;
					Win32.ReleaseSemaphore(semaphore, 1, out previousCount);
					break;

				case Win32.WAIT_TIMEOUT:
					// If the semaphore wait times out then another instance is running.
					// Try to get a handle to its window and activate it.  Then terminate
					// this process.
					try
					{
						IntPtr hWndMain = ExistingProcess.MainWindowHandle;
						if (hWndMain != (IntPtr)0)
							Win32.SetForegroundWindow(hWndMain);
					}
					catch
					{
						// The other instance does not have a window handle.  It is either in
						// the process of starting up or shutting down.
					}
					break;
			}

			return 0;
		}
#else
		/// -----------------------------------------------------------------------------------
		/// <summary>
		/// Application entry point.
		/// </summary>
		/// <param name="rgArgs">Command-line arguments</param>
		/// <returns>0</returns>
		/// -----------------------------------------------------------------------------------
		[STAThread]
		public static int Main(string[] rgArgs)
		{
			Cursor.Current = Cursors.AppStarting;
			CabhabApp app;
			if (rgArgs.Length == 0)
				app = new CabhabApp();
			else
			{
				// currently assuming a command line syntax of:
				//     -x  configfile answerfile
				// or
				//     -x  configfile
				// or
				//     answerfile
				if (rgArgs[0] == "-x" && rgArgs.Length >= 2)
				{
					app = new CabhabApp(rgArgs[1]);
					if (rgArgs.Length >= 3)
						app.SetAnswerFile(rgArgs[2]);
				}
				else
				{
					// assume is case of being launched from explorer
					app = new CabhabApp();
					app.SetAnswerFile(rgArgs[0]);
				}
			}
			Application.Run(app.NewMainWindow(false));

			return 0;
		}
#endif
		private void SetAnswerFile(string sAnswerFile)
		{
			m_sAnswerFile = sAnswerFile;
		}
		public static string ConfigurationPath
		{
			get
			{
				string asmPathname = Assembly.GetExecutingAssembly().CodeBase;
				asmPathname = asmPathname.Replace(@"file:///","");
				string asmPath = asmPathname.Substring(0, asmPathname.LastIndexOf("/"));
				return System.IO.Path.Combine(asmPath, @"../../Configurations/PAWS/paws.xml");
			}
		}
		#region Construction and Initializing

		#endregion // Construction and Initializing
	}
}
