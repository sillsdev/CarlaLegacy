# Microsoft Developer Studio Project File - Name="patrlib" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=patrlib - Win32 Profile
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "Patrlib.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "Patrlib.mak" CFG="patrlib - Win32 Profile"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "patrlib - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "patrlib - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "patrlib - Win32 Profile" (based on "Win32 (x86) Static Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "patrlib - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\lib\Release"
# PROP Intermediate_Dir "Release-lib"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /O2 /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pckimmo" /I "..\ample" /I "..\cmdlib" /I "../include" /D "NDEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "patrlib - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\lib\Debug"
# PROP Intermediate_Dir "Debug-lib"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pckimmo" /I "..\ample" /I "..\cmdlib" /I "../include" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /D "_DEBUG" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "patrlib - Win32 Profile"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "patrlib___Win32_Profile"
# PROP BASE Intermediate_Dir "patrlib___Win32_Profile"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\lib\Profile"
# PROP Intermediate_Dir "Profile-lib"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pckimmo" /I "..\ample" /I "..\cmdlib" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pckimmo" /I "..\ample" /I "..\cmdlib" /I "../include" /D "_DEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /D "WIN32" /YX /FD /c
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

# Name "patrlib - Win32 Release"
# Name "patrlib - Win32 Debug"
# Name "patrlib - Win32 Profile"
# Begin Source File

SOURCE=.\amplpatr.c
# End Source File
# Begin Source File

SOURCE=.\constrai.c
# End Source File
# Begin Source File

SOURCE=.\copyfeat.c
# End Source File
# Begin Source File

SOURCE=.\cvtkp2wa.c
# End Source File
# Begin Source File

SOURCE=.\disphead.c
# End Source File
# Begin Source File

SOURCE=.\grammar.c
# End Source File
# Begin Source File

SOURCE=.\lcparse.c
# End Source File
# Begin Source File

SOURCE=.\parsepwk.c
# End Source File
# Begin Source File

SOURCE=.\patalloc.c
# End Source File
# Begin Source File

SOURCE=.\patrampl.c
# End Source File
# Begin Source File

SOURCE=.\patrdata.c
# End Source File
# Begin Source File

SOURCE=.\patrfunc.c
# End Source File
# Begin Source File

SOURCE=.\patrkimm.c
# End Source File
# Begin Source File

SOURCE=.\patrlexi.c
# End Source File
# Begin Source File

SOURCE=.\patrstrg.c
# End Source File
# Begin Source File

SOURCE=.\priunion.c
# End Source File
# Begin Source File

SOURCE=.\subsume.c
# End Source File
# Begin Source File

SOURCE=.\unify.c
# End Source File
# Begin Source File

SOURCE=.\userpatr.c
# End Source File
# Begin Source File

SOURCE=.\wrtstyle.c
# End Source File
# End Target
# End Project
