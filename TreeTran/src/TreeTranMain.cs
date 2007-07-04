//**************************************************************************
// File: "TreeTran\TreeTranMain.cs".
//
// This file defines the TreeTranMain class, which implements the main entry
// point for the TreeTran.exe program.
//
// History:
//     2006-Jul-12 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.Windows.Forms;
//**************************************************************************
// Note that "Esperanto Notation" is used throughout this project:
//
// The following abbreviations are used at the beginning of local variable
// names, and are preceeded by an m in private class-member variable names:
// b = boolean, i = integer, n = real number, s = string, o = object.
//**************************************************************************
namespace TreeTran
{
	//**********************************************************************
	/// <summary>
	/// Implements the main entry point for the TreeTran.exe program.
	/// </summary>
	public class TreeTranMain
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The constructor is private because this class only implements
		/// static methods.
		/// </summary>
		private TreeTranMain()
		{
			Debug.Fail("This class only implements static methods.");
		}
		#endregion
		//******************************************************************
		#region [Static Main() Method]
		//******************************************************************
		/// <summary>
		/// This is the main entry point for the TreeTran.exe program.
		/// </summary>
		[STAThread]
		private static void Main(string[] oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				//**********************************************************
				// Use the command-line arguments to initialize the
				// RuleFileName, ParseFileName and OutputFileName
				// properties.

				RuleFileName = null;
				ParseFileName = null;
				OutputFileName = null;

				int iIndex = oArgs.GetLowerBound(0);
				if (iIndex <= oArgs.GetUpperBound(0))
				{
					RuleFileName = oArgs[iIndex];
				}
				++iIndex;
				if (iIndex <= oArgs.GetUpperBound(0))
				{
					ParseFileName = oArgs[iIndex];
				}
				++iIndex;
				if (iIndex <= oArgs.GetUpperBound(0))
				{
					OutputFileName = oArgs[iIndex];
				}
				++iIndex;
				if (iIndex <= oArgs.GetUpperBound(0))
				{
					string sMessage = "Too many command-line parameters."
						+ Environment.NewLine + Environment.NewLine
						+ "Usage: TreeTran.exe [ rules.xml [ parses.xml "
						+ "[ output.xml ] ] ]";
					throw new Exception(sMessage);
				}

				//**********************************************************
				// Start the message loop and show the MDI-parent form.

				Application.Run(TreeTranForm.Instance);
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [Static RuleFileName Property]
		//******************************************************************
		/// <summary>
		/// The RuleFileName property value.
		/// </summary>
		private static string msRuleFileName = null;
		//******************************************************************
		/// <summary>
		/// Gets or sets the name of the rule file. This is initialized to
		/// the value of the first command-line argument, or to null if the
		/// command-line argument is not given.
		/// </summary>
		public static string RuleFileName
		{
			set
			{
				msRuleFileName = value;
			}
			get
			{
				return msRuleFileName;
			}
		}
		#endregion
		//******************************************************************
		#region [Static ParseFileName Property]
		//******************************************************************
		/// <summary>
		/// The ParseFileName property value.
		/// </summary>
		private static string msParseFileName = "";
		//******************************************************************
		/// <summary>
		/// Gets or sets the name of the parse input file. This is
		/// initialized to the value of the second command-line argument, or
		/// to null if the command-line argument is not given.
		/// </summary>
		public static string ParseFileName
		{
			set
			{
				msParseFileName = value;
			}
			get
			{
				return msParseFileName;
			}
		}
		#endregion
		//******************************************************************
		#region [Static OutputFileName Property]
		//******************************************************************
		/// <summary>
		/// The OutputFileName property value.
		/// </summary>
		private static string msOutputFileName = "";
		//******************************************************************
		/// <summary>
		/// Gets or sets the name of the parse output file. This is
		/// initialized to the value of the third command-line argument, or
		/// to null if the command-line argument is not given.
		/// </summary>
		public static string OutputFileName
		{
			set
			{
				msOutputFileName = value;
			}
			get
			{
				return msOutputFileName;
			}
		}
		#endregion
		//******************************************************************

		// ERROR HANDLING

		//******************************************************************
		#region [Static ShowException() and LogException() Methods]
		//******************************************************************
		/// <summary>
		/// Shows the user the message from the given exception object.
		/// </summary>
		private static void ShowException(Exception oException)
		{
			try
			{
				LogException(oException);
				MessageBox.Show(oException.Message,"Error");
			}
			catch
			{
				Debug.Fail("ShowException() failed.");
			}
		}
		//******************************************************************
		/// <summary>
		/// Logs the message from the given exception object.
		/// </summary>
		private static void LogException(Exception oException)
		{
			try
			{
				Debug.WriteLine("Error: " + oException.Message);
				Debug.WriteLine(oException.StackTrace);
			}
			catch
			{
				Debug.Fail("LogException() failed.");
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
