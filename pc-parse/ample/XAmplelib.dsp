# Microsoft Developer Studio Project File - Name="xamplelib" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=xamplelib - Win32 Profile
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "XAmplelib.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "XAmplelib.mak" CFG="xamplelib - Win32 Profile"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "xamplelib - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "xamplelib - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "xamplelib - Win32 Profile" (based on "Win32 (x86) Static Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "xamplelib - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\lib\Release"
# PROP Intermediate_Dir "Release-lib-x"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /O2 /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\include" /I "..\pcpatr" /D "NDEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "WIN32" /D "EXPERIMENTAL" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "xamplelib - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\lib\Debug"
# PROP Intermediate_Dir "Debug-lib-x"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\include" /I "..\pcpatr" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "_DEBUG" /D "WIN32" /D "EXPERIMENTAL" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "xamplelib - Win32 Profile"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "xamplelib___Win32_Profile"
# PROP BASE Intermediate_Dir "xamplelib___Win32_Profile"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\lib\Profile"
# PROP Intermediate_Dir "Profile-lib"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "..\opaclib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "../include" /D "_DEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF

# Begin Target

# Name "xamplelib - Win32 Release"
# Name "xamplelib - Win32 Debug"
# Name "xamplelib - Win32 Profile"
# Begin Source File

SOURCE=.\anal.c
# End Source File
# Begin Source File

SOURCE=.\analda.c
# End Source File
# Begin Source File

SOURCE=.\atest.c
# End Source File
# Begin Source File

SOURCE=.\categ.c
# End Source File
# Begin Source File

SOURCE=.\cmdutil.c
# End Source File
# Begin Source File

SOURCE=.\dynstr.c
# End Source File
# Begin Source File

SOURCE=.\envchk.c
# End Source File
# Begin Source File

SOURCE=.\envpar.c
# End Source File
# Begin Source File

SOURCE=.\loadcc.c
# End Source File
# Begin Source File

SOURCE=.\loadtb.c
# End Source File
# Begin Source File

SOURCE=.\mccpar.c
# End Source File
# Begin Source File

SOURCE=.\mktest.c
# End Source File
# Begin Source File

SOURCE=.\morcla.c
# End Source File
# Begin Source File

SOURCE=.\proper.c
# End Source File
# Begin Source File

SOURCE=.\puncla.c
# End Source File
# Begin Source File

SOURCE=.\putsd.c
# End Source File
# Begin Source File

SOURCE=.\select.c
# End Source File
# Begin Source File

SOURCE=.\setsd.c
# End Source File
# Begin Source File

SOURCE=.\spreds.c
# End Source File
# Begin Source File

SOURCE=.\validch.c
# End Source File
# Begin Source File

SOURCE=.\version.c
# End Source File
# Begin Source File

SOURCE=.\writests.c
# End Source File
# End Target
# End Project
