# Microsoft Developer Studio Project File - Name="xample" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=xample - Win32 Profile
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "Xample.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "Xample.mak" CFG="xample - Win32 Profile"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "xample - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "xample - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "xample - Win32 Profile" (based on "Win32 (x86) Console Application")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "xample - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release-x"
# PROP Intermediate_Dir "Release-x"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /O2 /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pcpatr" /I "..\pckimmo" /I "../include" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 patrlib.lib cmdlib.lib cportlib.lib opaclib.lib oldnames.lib /nologo /subsystem:console /machine:I386 /out:"Release-x/xample32.exe" /libpath:"..\lib\Release"

!ELSEIF  "$(CFG)" == "xample - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "xample__"
# PROP BASE Intermediate_Dir "xample__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug-x"
# PROP Intermediate_Dir "Debug-x"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /Gm /GX /ZI /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pcpatr" /I "..\pckimmo" /I "../include" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /D "_DEBUG" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 patrlib.lib cmdlib.lib cportlib.lib opaclib.lib oldnames.lib /nologo /subsystem:console /debug /machine:I386 /out:"Debug-x/Xample32.exe" /libpath:"..\lib\Debug"
# SUBTRACT LINK32 /profile

!ELSEIF  "$(CFG)" == "xample - Win32 Profile"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "xample___Win32_Profile"
# PROP BASE Intermediate_Dir "xample___Win32_Profile"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Profile-x"
# PROP Intermediate_Dir "Profile-x"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /Za /W3 /Gm /GX /ZI /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pcpatr" /I "..\pckimmo" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /YX /FD /c
# ADD CPP /nologo /Za /W3 /Gm /GX /ZI /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\pcpatr" /I "..\pckimmo" /I "../include" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /D "EXPERIMENTAL" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 patrlib.lib cportlib.lib opaclib.lib oldnames.lib /nologo /subsystem:console /profile /debug /machine:I386 /libpath:"..\lib\Debug"
# ADD LINK32 patrlib.lib cmdlib.lib cportlib.lib opaclib.lib oldnames.lib /nologo /subsystem:console /profile /debug /machine:I386 /libpath:"..\lib\Profile"

!ENDIF

# Begin Target

# Name "xample - Win32 Release"
# Name "xample - Win32 Debug"
# Name "xample - Win32 Profile"
# Begin Source File

SOURCE=.\ample.c
# End Source File
# Begin Source File

SOURCE=.\ample.h
# End Source File
# Begin Source File

SOURCE=.\ampledef.h
# End Source File
# Begin Source File

SOURCE=.\anal.c
# End Source File
# Begin Source File

SOURCE=.\analda.c
# End Source File
# Begin Source File

SOURCE=.\anccpar.c
# End Source File
# Begin Source File

SOURCE=.\atest.c
# End Source File
# Begin Source File

SOURCE=.\atest.h
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

SOURCE=.\select.c
# End Source File
# Begin Source File

SOURCE=.\setsd.c
# End Source File
# Begin Source File

SOURCE=.\spreds.c
# End Source File
# Begin Source File

SOURCE=.\stample.h
# End Source File
# Begin Source File

SOURCE=.\validch.c
# End Source File
# Begin Source File

SOURCE=.\version.c
# End Source File
# Begin Source File

SOURCE=.\version.h
# End Source File
# Begin Source File

SOURCE=.\writests.c
# End Source File
# End Target
# End Project
