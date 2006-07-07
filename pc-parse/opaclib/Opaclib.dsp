# Microsoft Developer Studio Project File - Name="opaclib" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=opaclib - Win32 Profile
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "Opaclib.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "Opaclib.mak" CFG="opaclib - Win32 Profile"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "opaclib - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "opaclib - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "opaclib - Win32 Profile" (based on "Win32 (x86) Static Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "opaclib - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\lib\Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /O2 /I ".." /I "..\cportlib" /I "../include" /D "NDEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "opaclib - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\lib\Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "../include" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "_DEBUG" /D "WIN32" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "opaclib - Win32 Profile"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "opaclib___Win32_Profile"
# PROP BASE Intermediate_Dir "opaclib___Win32_Profile"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\lib\Profile"
# PROP Intermediate_Dir "Profile"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /YX /FD /c
# ADD CPP /nologo /Za /W3 /GX /Z7 /Od /I ".." /I "..\cportlib" /I "../include" /D "_DEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "WIN32" /YX /FD /c
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

# Name "opaclib - Win32 Release"
# Name "opaclib - Win32 Debug"
# Name "opaclib - Win32 Profile"
# Begin Source File

SOURCE=.\add_sl.c
# End Source File
# Begin Source File

SOURCE=.\adjfname.c
# End Source File
# Begin Source File

SOURCE=.\allocmem.c
# End Source File
# Begin Source File

SOURCE=.\ambprog.c
# End Source File
# Begin Source File

SOURCE=.\appnd_sl.c
# End Source File
# Begin Source File

SOURCE=.\cat_sl.c
# End Source File
# Begin Source File

SOURCE=.\change.c
# End Source File
# Begin Source File

SOURCE=.\copy_sl.c
# End Source File
# Begin Source File

SOURCE=.\dtbin.c
# End Source File
# Begin Source File

SOURCE=.\dtbout.c
# End Source File
# Begin Source File

SOURCE=.\dynstr.c
# End Source File
# Begin Source File

SOURCE=.\equal_sl.c
# End Source File
# Begin Source File

SOURCE=.\equiv_sl.c
# End Source File
# Begin Source File

SOURCE=.\erasecha.c
# End Source File
# Begin Source File

SOURCE=.\errcheck.c
# End Source File
# Begin Source File

SOURCE=.\free_ct.c
# End Source File
# Begin Source File

SOURCE=.\free_sl.c
# End Source File
# Begin Source File

SOURCE=.\free_wt.c
# End Source File
# Begin Source File

SOURCE=.\fulldisk.c
# End Source File
# Begin Source File

SOURCE=.\isolatew.c
# End Source File
# Begin Source File

SOURCE=.\loadintx.c
# End Source File
# Begin Source File

SOURCE=.\loadoutx.c
# End Source File
# Begin Source File

SOURCE=.\matchbeg.c
# End Source File
# Begin Source File

SOURCE=.\matchend.c
# End Source File
# Begin Source File

SOURCE=.\membr_sl.c
# End Source File
# Begin Source File

SOURCE=.\merge_sl.c
# End Source File
# Begin Source File

SOURCE=.\myctype.c
# End Source File
# Begin Source File

SOURCE=.\numbrmsg.c
# End Source File
# Begin Source File

SOURCE=.\promptus.c
# End Source File
# Begin Source File

SOURCE=.\PumpMessages.c
# End Source File
# Begin Source File

SOURCE=.\readfiel.c
# End Source File
# Begin Source File

SOURCE=.\readline.c
# End Source File
# Begin Source File

SOURCE=.\record.c
# End Source File
# Begin Source File

SOURCE=.\resetxtc.c
# End Source File
# Begin Source File

SOURCE=.\rmstr_sl.c
# End Source File
# Begin Source File

SOURCE=.\rpterror.c
# End Source File
# Begin Source File

SOURCE=.\rptmessg.c
# End Source File
# Begin Source File

SOURCE=.\rptprgrs.c
# End Source File
# Begin Source File

SOURCE=.\safeexit.c
# End Source File
# Begin Source File

SOURCE=.\senttemp.c
# End Source File
# Begin Source File

SOURCE=.\size_sl.c
# End Source File
# Begin Source File

SOURCE=.\sqz_sl.c
# End Source File
# Begin Source File

SOURCE=.\strcla.c
# End Source File
# Begin Source File

SOURCE=.\textin.c
# End Source File
# Begin Source File

SOURCE=.\textout.c
# End Source File
# Begin Source File

SOURCE=.\tokenize.c
# End Source File
# Begin Source File

SOURCE=.\trie.c
# End Source File
# Begin Source File

SOURCE=.\trimspac.c
# End Source File
# Begin Source File

SOURCE=.\ufopen.c
# End Source File
# Begin Source File

SOURCE=.\unlst_sl.c
# End Source File
# Begin Source File

SOURCE=.\updat_sl.c
# End Source File
# Begin Source File

SOURCE=.\wordanal.c
# End Source File
# Begin Source File

SOURCE=.\write_ct.c
# End Source File
# Begin Source File

SOURCE=.\write_sl.c
# End Source File
# End Target
# End Project
