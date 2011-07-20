using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace SIL.Utils
{
	/// <summary>
	/// Allows querying for installed linux packages.
	/// </summary>
	public static class LinuxPackageUtils
	{
		internal enum DpkgListFields : int { Status = 0, Name, Version, Description }

		/// <summary>
		/// Find installed packages in the system.
		/// </summary>
		/// <param name="search">
		/// Search string to search for packages. for example "mono*"
		/// </param>
		/// <returns>
		/// Returns a collection of KeyValuePair's (Name, Version)
		/// </returns>
		public static IEnumerable<System.Collections.Generic.KeyValuePair<string, string>> FindInstalledPackages(string search)
		{
			Process process = new Process();
			process.StartInfo.FileName = "dpkg";
			process.StartInfo.Arguments = String.Format("-l '{0}'", search);
			process.StartInfo.UseShellExecute = false;
			process.StartInfo.RedirectStandardOutput = true;
			try
			{
				process.Start();
			}
			catch
			{
				yield break;
			}

			process.WaitForExit();
			string output = process.StandardOutput.ReadToEnd();
			var dpkgListedPackages = output.Split(new string[] {System.Environment.NewLine}, StringSplitOptions.RemoveEmptyEntries);

			// ii means installed packages with no errors or pending changes.
			const string installedNoErrorState = "ii";

			// Foreach installed package.
			foreach(var s in dpkgListedPackages.Where(x => x.StartsWith(installedNoErrorState)))
			{
				string[] entries = s.Split(new string[] {"  "}, StringSplitOptions.RemoveEmptyEntries);
				yield return new KeyValuePair<string, string> ( entries[(int)DpkgListFields.Name], entries[(int)DpkgListFields.Version]);
			}

		}
	}
}
