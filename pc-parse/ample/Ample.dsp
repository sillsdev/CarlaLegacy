# Microsoft Developer Studio Project File - Name="ample" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=ample - Win32 Profile
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "Ample.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "Ample.mak" CFG="ample - Win32 Profile"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "ample - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "ample - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "ample - Win32 Profile" (based on "Win32 (x86) Console Application")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ample - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /O2 /I ".." /I "..\cportlib" /I "..\opaclib" /I "../include" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /D "WIN32" /YX /FD /c
# SUBTRACT CPP /u
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 cportlib.lib opaclib.lib amplelib.lib oldnames.lib /nologo /subsystem:console /machine:I386 /out:"Release/ample32.exe" /libpath:"..\lib\Release"

!ELSEIF  "$(CFG)" == "ample - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ample___"
# PROP BASE Intermediate_Dir "ample___"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /Gm /GX /ZI /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "../include" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /D "_DEBUG" /D "WIN32" /YX /FD /c
# SUBTRACT CPP /u
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 cportlib.lib opaclib.lib amplelib.lib oldnames.lib /nologo /subsystem:console /debug /machine:I386 /out:"Debug/ample32.exe" /pdbtype:sept /libpath:"..\lib\Debug"

!ELSEIF  "$(CFG)" == "ample - Win32 Profile"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "ample___Win32_Profile"
# PROP BASE Intermediate_Dir "ample___Win32_Profile"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Profile"
# PROP Intermediate_Dir "Profile"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /Za /W3 /Gm /GX /ZI /Od /I ".." /I "..\cportlib" /I "..\opaclib" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /YX /FD /c
# SUBTRACT BASE CPP /u
# ADD CPP /nologo /Za /W3 /Gm /GX /ZI /Od /I ".." /I "..\cportlib" /I "..\opaclib" /I "../include" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "HAVE_CONFIG_H" /D "WIN32" /YX /FD /c
# SUBTRACT CPP /u
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 cportlib.lib opaclib.lib amplelib.lib oldnames.lib /nologo /subsystem:console /debug /machine:I386 /out:"Debug/ample32.exe" /pdbtype:sept /libpath:"..\lib\Debug"
# ADD LINK32 cportlib.lib opaclib.lib amplelib.lib oldnames.lib /nologo /subsystem:console /profile /debug /machine:I386 /out:"Profile/ample32.exe" /libpath:"..\lib\Profile"

!ENDIF

# Begin Target

# Name "ample - Win32 Release"
# Name "ample - Win32 Debug"
# Name "ample - Win32 Profile"
# Begin Source File

SOURCE=.\ample.c
# End Source File
# Begin Source File

SOURCE=.\ample.rc
# End Source File
# End Target
# End Project
