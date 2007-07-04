//**************************************************************************
// File: "TreeTran\AssemblyInfo.cs".
//
// This file defines the assembly attributes for the TreeTran.exe program.
//
// History:
//     2007-Feb-23 David Bullock: Code complete.
//**************************************************************************
using System.Reflection;
//**************************************************************************
// ASSEMBLY ATTRIBUTES
//
// AssemblyTitle = The name of this program.
//
// AssemblyDescription = Comments about this build of the program. These
//     comments are displayed (as Comments:) in the program's About box.
//
// AssemblyCompany = The name of the company that produced this program.
//
// AssemblyProduct = The product name this program is distributed with.
//
// AssemblyCopyright = Copyright notices that apply to this program. These
//     notices are displayed (as Copyright:) in the program's About box.
//
// AssemblyTrademark = Trademarks that apply to this program.

[assembly: AssemblyTitle("TreeTran")]
[assembly: AssemblyDescription("TreeTran.exe")]
[assembly: AssemblyCompany("SIL")]
[assembly: AssemblyProduct("TreeTran")]
[assembly: AssemblyCopyright("Copyright (c) SIL 2007")]
[assembly: AssemblyTrademark("")]

//**************************************************************************
// VERSION INFORMATION
//
// AssemblyVersion = The program's version number. This number is displayed
//     (as Version:) in the program's About box.
//
// Version information for an assembly consists of four values:
//
//     <Major Version>.<Minor Version>.<Build Number>.<Revision>
//
// You can specify all the values, or you can use a '*' to default the Build
// Number and Revision (for example: [assembly: AssemblyVersion("1.0.*")]),
// in which case the Build Number will be determined by the number of days
// since January 1, 2000, and the Revision will be determined by the number
// of seconds since midnight local time.

[assembly: AssemblyVersion("1.0.*")]

//**************************************************************************
// ASSEMBLY KEY
//
// In order to sign your assembly you must specify a key to use. Refer to
// the Microsoft .NET Framework documentation for more information on
// assembly signing.
//
// Use the attributes below to control which key is used for signing.
//
// Notes:
// A. If no key is specified, the assembly is not signed.
// B. KeyName refers to a key that has been installed in the Crypto Service
//     Provider (CSP) on your machine. KeyFile refers to a file which
//     contains a key.
// C. If the KeyFile and the KeyName values are both specified, the
//     following processing occurs: (1) If the KeyName can be found in the
//     CSP, that key is used. (2) If the KeyName does not exist and the
//     KeyFile does exist, the key in the KeyFile is installed into the CSP
//     and used.
// D. In order to create a KeyFile, you can use the sn.exe (Strong Name)
//     utility. When specifying the KeyFile, the location of the KeyFile
//     should be relative to the project output directory which is
//     %Project Directory%\obj\<configuration>.
// E. Delay Signing is an advanced option: see the Microsoft .NET Framework
//     documentation for more information on this.

[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile("")]
[assembly: AssemblyKeyName("")]

//**************************************************************************
