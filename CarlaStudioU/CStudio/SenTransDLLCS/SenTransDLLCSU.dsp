# Microsoft Developer Studio Project File - Name="SenTransDLLCSU" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=SenTransDLLCSU - Win32 UDebug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "SenTransDLLCSU.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "SenTransDLLCSU.mak" CFG="SenTransDLLCSU - Win32 UDebug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "SenTransDLLCSU - Win32 UDebug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "SenTransDLLCSU - Win32 URelease" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "SenTransDLLCSU - Win32 UDebug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "UDebug"
# PROP BASE Intermediate_Dir "UDebug"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "UDebug"
# PROP Intermediate_Dir "UDebug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I ".\source" /I "..\..\common code" /I "..\cstudioapp\source" /I "..\..\..\SenTransDLLWork\SenTransCOM" /D "CSTUDIODLL" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_AFXEXT" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I ".\source" /I "..\..\common code" /I "..\cstudioapp\source" /I "..\..\..\SenTransDLLWork\SenTransCOM" /D "CSTUDIODLL" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_AFXEXT" /D "_UNICODE" /FR /Fp"./UDebug/SenTransDLLCSU.pch" /Yu"stdafx.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo"UDebug/SenTransDLLCSU.res" /d "_DEBUG" /d "_AFXDLL" /d "_UNICODE"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 CStudioProcessorLib.lib /nologo /subsystem:windows /dll /debug /machine:I386 /out:"../CStudioApp/Debug//SenTransDLLCS.dll" /pdbtype:sept /libpath:"..\CStudioProcessorLib\Debug"
# ADD LINK32 CStudioProcessorLibU.lib CSUtilsU.lib /nologo /subsystem:windows /dll /debug /machine:I386 /out:"../CStudioApp/UDebug/SenTransDLLCSU.dll" /pdbtype:sept /libpath:"..\CStudioProcessorLib\UDebug" /libpath:"..\CS Utility DLL\UDebug"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "SenTransDLLCSU - Win32 URelease"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "URelease"
# PROP BASE Intermediate_Dir "URelease"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "URelease"
# PROP Intermediate_Dir "URelease"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I ".\source" /I "..\..\common code" /I "..\cstudioapp\source" /I "..\..\..\SenTransDLLWork\SenTransCOM" /D "CSTUDIODLL" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_AFXEXT" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /Zi /O2 /I ".\source" /I "..\..\common code" /I "..\cstudioapp\source" /I "..\..\..\SenTransDLLWork\SenTransCOM" /D "CSTUDIODLL" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_AFXEXT" /D "_UNICODE" /FR /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /fo"URelease/SenTransDLLCSU.res" /d "NDEBUG" /d "_AFXDLL" /d "_UNICODE"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 CStudioProcessorLib.lib /nologo /subsystem:windows /dll /machine:I386 /out:"../CStudioApp/Release/SenTransDLLCS.dll" /libpath:"..\CStudioProcessorLib\Release"
# ADD LINK32 CStudioProcessorLibU.lib CSUtilsU.lib /nologo /subsystem:windows /dll /incremental:yes /debug /machine:I386 /out:"../CStudioApp/URelease/SenTransDLLCSU.dll" /libpath:"..\CStudioProcessorLib\URelease" /libpath:"..\CS Utility DLL\URelease"
# SUBTRACT LINK32 /pdb:none

!ENDIF

# Begin Target

# Name "SenTransDLLCSU - Win32 UDebug"
# Name "SenTransDLLCSU - Win32 URelease"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\CStudioApp\source\cstudioAssert.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditSentransDllProcess.cpp
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ProcessOutput.cpp
# End Source File
# Begin Source File

SOURCE=.\SenTransDLLCS.cpp
# End Source File
# Begin Source File

SOURCE=.\SenTransDLLCS.rc
# End Source File
# Begin Source File

SOURCE=.\SenTransDLLCSU.def
# End Source File
# Begin Source File

SOURCE=.\source\SentransDLLProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\source\DlgEditSentransDllProcess.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\source\SenTransDLLProcess.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\SenTransDLLCS.rc2
# End Source File
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
