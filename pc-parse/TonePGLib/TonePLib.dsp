# Microsoft Developer Studio Project File - Name="TonePLib" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=TonePLib - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "TonePLib.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "TonePLib.mak" CFG="TonePLib - Win32 Debug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "TonePLib - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "TonePLib - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "TonePLib - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release-P"
# PROP BASE Intermediate_Dir "Release-P"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release-P"
# PROP Intermediate_Dir "Release-P"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I "." /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\ample" /I "../include" /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /D "HAVE_CONFIG_H" /D "TONEPARS" /D "HAVE_ITOA" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"..\lib\Release\TonePLib.lib"

!ELSEIF  "$(CFG)" == "TonePLib - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug-P"
# PROP BASE Intermediate_Dir "Debug-P"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug-P"
# PROP Intermediate_Dir "Debug-P"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I "." /I ".." /I "..\cportlib" /I "..\opaclib" /I "..\ample" /I "../include" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "_DEBUG" /D "WIN32" /D "TONEPARS" /YX /FD /GZ /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"..\lib\Debug\TonePLib.lib"

!ENDIF

# Begin Target

# Name "TonePLib - Win32 Release"
# Name "TonePLib - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Domain.c
# End Source File
# Begin Source File

SOURCE=..\stamp\dtbio.c
# End Source File
# Begin Source File

SOURCE=..\stamp\envchk.c
# End Source File
# Begin Source File

SOURCE=..\stamp\lexchg.c
# End Source File
# Begin Source File

SOURCE=.\loadseg.c
# End Source File
# Begin Source File

SOURCE=..\stamp\menvck.c
# End Source File
# Begin Source File

SOURCE=.\Moras.c
# End Source File
# Begin Source File

SOURCE=.\Pword.c
# End Source File
# Begin Source File

SOURCE=.\Segparse.c
# End Source File
# Begin Source File

SOURCE=.\Syllable.c
# End Source File
# Begin Source File

SOURCE=..\stamp\synrsc.c
# End Source File
# Begin Source File

SOURCE=..\stamp\synth.c
# End Source File
# Begin Source File

SOURCE=..\stamp\syntst.c
# End Source File
# Begin Source File

SOURCE=..\stamp\sytest_l.c
# End Source File
# Begin Source File

SOURCE=..\stamp\sytest_y.c
# End Source File
# Begin Source File

SOURCE=.\Tbu.c
# End Source File
# Begin Source File

SOURCE=..\stamp\tmatch.c
# End Source File
# Begin Source File

SOURCE=.\tone.c
# End Source File
# Begin Source File

SOURCE=.\toneanal.c
# End Source File
# Begin Source File

SOURCE=..\stamp\transfer.c
# End Source File
# Begin Source File

SOURCE=..\stamp\treplace.c
# End Source File
# Begin Source File

SOURCE=.\Trule_ls.c
# End Source File
# Begin Source File

SOURCE=.\trule_yg.c
# End Source File
# Begin Source File

SOURCE=..\stamp\trules.c
# End Source File
# Begin Source File

SOURCE=..\stamp\tsdict.c
# End Source File
# Begin Source File

SOURCE=..\stamp\tsinit.c
# End Source File
# Begin Source File

SOURCE=..\stamp\tsutil.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\Domain.h
# End Source File
# Begin Source File

SOURCE=..\stamp\stamp.h
# End Source File
# Begin Source File

SOURCE=..\stamp\sytest_y.h
# End Source File
# Begin Source File

SOURCE=.\sytest_y.h
# End Source File
# Begin Source File

SOURCE=.\Tone.h
# End Source File
# Begin Source File

SOURCE=.\Tonepars.h
# End Source File
# Begin Source File

SOURCE=.\trule.h
# End Source File
# Begin Source File

SOURCE=.\Trule_ls.h
# End Source File
# Begin Source File

SOURCE=.\Trule_yg.h
# End Source File
# End Group
# End Target
# End Project
