using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;


namespace LearnDLLTestApp
{

/*    // PInvokeTest.cs

	class PlatformInvokeTest
	{
		[DllImport("msvcrt.dll")]
		public static extern int puts(string c);
		[DllImport("msvcrt.dll")]
		internal static extern int _flushall();

		public static void Main()
		{
			puts("Test");
			_flushall();
		}
	}
	*/
	public partial class LearnDLLTestApp : Form
	{
		[DllImport("C:\\Documents and Settings\\roy\\My Documents\\Visual Studio 2005\\Projects\\LearnDLL\\debug\\LearnDLL.dll")]
		public static extern string exportPointOne();
		[DllImport("C:\\Documents and Settings\\roy\\My Documents\\Visual Studio 2005\\Projects\\LearnDLL\\debug\\LearnDLL.dll")]
		public static extern string exportPointTwo();
		[DllImport("C:\\Documents and Settings\\roy\\My Documents\\Visual Studio 2005\\Projects\\LearnDLL\\debug\\LearnDLL.dll")]
		public static extern string exportPointThree();


		public LearnDLLTestApp()
		{
			InitializeComponent();
		}

		private void ExportButtonOne_Click(object sender, EventArgs e)
		{
		   MessageBox.Show(exportPointOne(), "LearnDLL",
				MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

		  //  msgbox(exportPointOne(), vbOKOnly, "LearnDLL");
		}

		private void ExportButtonTwo_Click(object sender, EventArgs e)
		{
		   MessageBox.Show(exportPointTwo(), "LearnDLL",
				MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

		  //  msgbox(exportPointTwo(), vbOKOnly, "LearnDLL");
		}

		private void ExportButtonThree_Click(object sender, EventArgs e)
		{
			MessageBox.Show(exportPointThree(), "LearnDLL",
				MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

		  //  msgbox(exportPointThree(), vbOKOnly, "LearnDLL");
		}

		private void Exit_Click(object sender, EventArgs e)
		{
			Application.Exit();
		}
	}
}