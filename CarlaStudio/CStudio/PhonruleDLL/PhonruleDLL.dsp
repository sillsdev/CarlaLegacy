# Microsoft Developer Studio Project File - Name="PhonruleDLL" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=PhonruleDLL - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "PhonruleDLL.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "PhonruleDLL.mak" CFG="PhonruleDLL - Win32 Debug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "PhonruleDLL - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "PhonruleDLL - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "PhonruleDLL - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\common code" /I "..\cstudioapp\source" /D "CSTUDIODLL" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_AFXEXT" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 CStudioProcessorLib.lib /nologo /subsystem:windows /dll /machine:I386 /out:"../CStudioApp/Release/PhonruleCS.dll" /libpath:"..\CStudioProcessorLib\Release"

!ELSEIF  "$(CFG)" == "PhonruleDLL - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\common code" /I "..\cstudioapp\source" /D "CSTUDIODLL" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_AFXEXT" /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 CStudioProcessorLib.lib /nologo /subsystem:windows /dll /debug /machine:I386 /out:"../CStudioApp/Debug/PhonruleCS.dll" /pdbtype:sept /libpath:"..\CStudioProcessorLib\Debug"

!ENDIF

# Begin Target

# Name "PhonruleDLL - Win32 Release"
# Name "PhonruleDLL - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\CStudioApp\source\cstudioAssert.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgPhonrule.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\Loadent.c
# End Source File
# Begin Source File

SOURCE=.\source\myallo.c
# End Source File
# Begin Source File

SOURCE=.\source\phnarule.c
# End Source File
# Begin Source File

SOURCE=.\source\phnlrule.c
# End Source File
# Begin Source File

SOURCE=.\source\phonrule.c
# End Source File
# Begin Source File

SOURCE=.\source\PhonruleDLL.cpp
# End Source File
# Begin Source File

SOURCE=.\PhonruleDLL.def
# End Source File
# Begin Source File

SOURCE=.\PhonruleDLL.rc
# End Source File
# Begin Source File

SOURCE=.\source\PhonruleProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\CStudioApp\source\CWProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgPhonrule.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\DlgProgress.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\LogWindow.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ModelFilesSet.h
# End Source File
# Begin Source File

SOURCE=.\source\myallo.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\PathDescriptor.h
# End Source File
# Begin Source File

SOURCE=.\source\PhonruleProcess.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ProcessOutput.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\SFMFile.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\PhonruleDLL.rc2
# End Source File
# End Group
# Begin Source File

SOURCE=..\CStudioApp\source\processoutput.cpp
# End Source File
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
