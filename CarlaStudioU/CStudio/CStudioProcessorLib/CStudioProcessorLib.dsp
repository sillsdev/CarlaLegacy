# Microsoft Developer Studio Project File - Name="CStudioProcessorLib" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=CStudioProcessorLib - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "CStudioProcessorLib.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "CStudioProcessorLib.mak" CFG="CStudioProcessorLib - Win32 Debug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "CStudioProcessorLib - Win32 UDebug" (based on "Win32 (x86) Static Library")
!MESSAGE "CStudioProcessorLib - Win32 URelease" (based on "Win32 (x86) Static Library")
!MESSAGE "CStudioProcessorLib - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "CStudioProcessorLib - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "CStudioProcessorLib - Win32 UDebug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "UDebug"
# PROP BASE Intermediate_Dir "UDebug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "UDebug"
# PROP Intermediate_Dir "UDebug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Z7 /Od /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /FR /Fp"UDebug/CStudioProcessorLibU.pch" /Yu"stdafx.h" /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409 /d "_UNICODE"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o"UDebug/CStudioProcessorLibU.bsc"
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"UDebug\CStudioProcessorLibU.lib"

!ELSEIF  "$(CFG)" == "CStudioProcessorLib - Win32 URelease"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "URelease"
# PROP BASE Intermediate_Dir "URelease"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "URelease"
# PROP Intermediate_Dir "URelease"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /Zi /O2 /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /FR /Yu"stdafx.h" /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409 /d "_UNICODE"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o"URelease/CStudioProcessorLibU.bsc"
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"URelease\CStudioProcessorLibU.lib"

!ELSEIF  "$(CFG)" == "CStudioProcessorLib - Win32 Release"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CStudioProcessorLib___Win32_Release"
# PROP BASE Intermediate_Dir "CStudioProcessorLib___Win32_Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /Zi /O2 /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /FR /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /Zi /O2 /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FR /Yu"stdafx.h" /FD /c
# ADD BASE RSC /l 0x409 /d "_UNICODE"
# ADD RSC /l 0x409 /d "_MBCS"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o"URelease/CStudioProcessorLibU.bsc"
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:"URelease\CStudioProcessorLibU.lib"
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "CStudioProcessorLib - Win32 Debug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "CStudioProcessorLib___Win32_Debug"
# PROP BASE Intermediate_Dir "CStudioProcessorLib___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_UNICODE" /FR /Fp"UDebug/CStudioProcessorLibU.pch" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MDd /W3 /GX /Zi /Od /I "..\cstudioapp\source" /I "..\..\common code" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FR /Yu"stdafx.h" /FD /c
# ADD BASE RSC /l 0x409 /d "_UNICODE"
# ADD RSC /l 0x409 /d "_MBCS"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo /o"UDebug/CStudioProcessorLibU.bsc"
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:"UDebug\CStudioProcessorLibU.lib"
# ADD LIB32 /nologo

!ENDIF

# Begin Target

# Name "CStudioProcessorLib - Win32 UDebug"
# Name "CStudioProcessorLib - Win32 URelease"
# Name "CStudioProcessorLib - Win32 Release"
# Name "CStudioProcessorLib - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "*.cpp"
# Begin Source File

SOURCE=..\CStudioApp\source\CWProcess.cpp
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\DlgProgress.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\filelist.cpp"
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\logwindow.cpp
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\modelfilesset.cpp
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ParseStream.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\PathDescriptor.cpp"
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ProcessStatus.cpp
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\SFMFile.cpp
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "*.h"
# Begin Source File

SOURCE=..\CStudioApp\source\CWProcess.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\DlgProgress.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\FileListCtrl.h"
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\LogWindow.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ModelFilesSet.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ParseStream.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\PathDescriptor.h"
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\ProcessStatus.h
# End Source File
# Begin Source File

SOURCE=..\CStudioApp\source\SFMFile.h
# End Source File
# End Group
# End Target
# End Project
