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
// File: Cabchab.cs
// Responsibility:
// Last reviewed:
//
// <remarks>
// </remarks>
// --------------------------------------------------------------------------------------------
using System;

namespace SIL.Cabhab
{
	/// <summary>
	/// Summary description for Cabhab.
	/// </summary>
	public class Cabhab
	{
		/// -----------------------------------------------------------------------------------
		/// <summary>
		/// Application entry point. If Cabhab isn't already running,
		/// an instance of the app is created.
		/// </summary>
		/// <param name="rgArgs">Command-line arguments</param>
		/// <returns>0</returns>
		/// -----------------------------------------------------------------------------------
		[STAThread]
		public static int Main(string[] rgArgs)
		{
			return CabhabApp.Main(rgArgs);
		}
	}

	/// <summary>
	/// This class serves to make otherwise runtime dependent assemblies compile time dependent,
	/// which will make the installer easier to work with.
	/// </summary>
	internal class DoNothing
	{
		DoNothing()
		{
			// Ensures CabhabDll is related to this assembly.
			SIL.Cabhab.ImageHolder ih = null;
			if (ih == null)
				ih = null;
		}
	}
}
