# Microsoft Developer Studio Project File - Name="CStudio" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=CStudio - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "CStudio.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "CStudio.mak" CFG="CStudio - Win32 Debug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "CStudio - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "CStudio - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/CStudio", MNAAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "CStudio - Win32 Release"

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
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\common code" /I "..\..\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 CStudioProcessorLib.lib CSUtils.lib /nologo /subsystem:windows /incremental:yes /machine:I386 /nodefaultlib:"mfc42d.lib" /libpath:"..\CS Utility DLL\Release" /libpath:"..\CStudioProcessorLib\Release"
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
TargetDir=.\Release
SOURCE="$(InputPath)"
PostBuild_Cmds=copy $(TargetDir)\cstudiocom.tlb $(TargetDir)\cstudio.tlb
# End Special Build Tool

!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

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
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\common code" /I "..\..\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fr /YX"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 CStudioProcessorLib.lib CSUtils.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept /libpath:"..\CS Utility DLL\Debug" /libpath:"..\CStudioProcessorLib\Debug"
# Begin Special Build Tool
TargetDir=.\Debug
SOURCE="$(InputPath)"
PostBuild_Cmds=copy $(TargetDir)\cstudiocom.tlb $(TargetDir)\cstudio.tlb
# End Special Build Tool

!ENDIF

# Begin Target

# Name "CStudio - Win32 Release"
# Name "CStudio - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\source\AmpleDLLProcess.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

# ADD CPP /Od

!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

!ENDIF

# End Source File
# Begin Source File

SOURCE=.\source\AmpleDLLWrapper.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

# ADD CPP /Od

!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

!ENDIF

# End Source File
# Begin Source File

SOURCE=.\source\AmpleProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\AmpleResult.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ANACount.cpp
# End Source File
# Begin Source File

SOURCE=.\source\BatchProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CarlaLanguage.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CarlaStudioApp.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CCProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\Class.cpp
# End Source File
# Begin Source File

SOURCE=.\source\codetable.cpp
# End Source File
# Begin Source File

SOURCE=.\source\Conversion.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\CreditStatic.cpp"
# End Source File
# Begin Source File

SOURCE=..\CSRemote\csRemoteRegistry.cpp
# End Source File
# Begin Source File

SOURCE=.\CStudio.rc
# End Source File
# Begin Source File

SOURCE=.\source\cstudioAssert.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CStudioCOM.idl
# End Source File
# Begin Source File

SOURCE=.\source\CStudioMainFrm.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWAnalysisModel.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWAtomicTypes.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWCarlaMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWFormView.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWFunctionalInterface.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWHeadingView.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWInterface.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWList.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWListCtrl.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\CWListView.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWModel.cpp
# End Source File
# Begin Source File

SOURCE=.\source\cwprocess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWTabBar.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWTopic.cpp
# End Source File
# Begin Source File

SOURCE=.\source\cwtopictreeview.cpp
# End Source File
# Begin Source File

SOURCE=.\source\CWTopicView.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\DirDialog.cpp"
# End Source File
# Begin Source File

SOURCE=.\source\DlgBatchProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgCCProcess.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgChooseProcessor.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditAmpleDLLProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditAmpleProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditIntergenProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditPrintANA.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditRegSoundChange.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditSentransDisambig.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditSentransProcess.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditSentransTransfer.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampFlag.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampLexChange.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampProcess.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampTransfer.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditToneGenProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditToneParseProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditToneTracing.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEnvConstrainedRule.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgEnvironments.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgFind.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgManualParseChoice.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgNewLanguage.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgPhonruleRule.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\DlgProcessSequence.cpp
# End Source File
# Begin Source File

SOURCE=.\source\dlgprogress.cpp
# End Source File
# Begin Source File

SOURCE=.\source\dlgprojectopenorcreate.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgSentransDirective.cpp
# End Source File
# Begin Source File

SOURCE=.\source\DlgTipDay.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\EditListCtrl.cpp"
# End Source File
# Begin Source File

SOURCE=.\source\EnvironConstrainedRuleLists.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

# ADD CPP /YX

!ENDIF

# End Source File
# Begin Source File

SOURCE=.\source\EnvironmentListCtrl.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\FileListCtrl.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\common code\FlatButton.cpp"
# End Source File
# Begin Source File

SOURCE=.\source\FormButton.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE="..\..\common code\GuruHeaderCtrl.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\common code\GuruSplash.cpp"
# End Source File
# Begin Source File

SOURCE=.\source\Hook.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\InPlaceEdit.cpp"
# End Source File
# Begin Source File

SOURCE=.\source\InputDoc.cpp
# End Source File
# Begin Source File

SOURCE=.\source\inputDocTabBar.cpp
# End Source File
# Begin Source File

SOURCE=.\source\inputDocView.cpp
# End Source File
# Begin Source File

SOURCE=.\source\IntergenMarkersCtrl.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\intergenProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\itemeditdialogs.cpp
# End Source File
# Begin Source File

SOURCE=.\source\LangModelsDoc.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\ListComment.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ListTestData.cpp
# End Source File
# Begin Source File

SOURCE=.\source\logwindow.cpp
# End Source File
# Begin Source File

SOURCE=.\source\Monad.cpp
# End Source File
# Begin Source File

SOURCE=.\source\nullwindow.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageAffixes.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageAnaProcessing.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageCategoryProp.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\pagecatfinalmodifytests.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageDictAffixes.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageDictMethod.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageDisclaimer.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageFinalCatTest.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageInputDocPanels.cpp
# End Source File
# Begin Source File

SOURCE=.\source\PageLocations.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageRootUnifiedDict.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\PageSrcTextProcessing.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ParseCSImpl.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\PathCtrl.cpp"
# End Source File
# Begin Source File

SOURCE=.\source\PhonruleModel.cpp
# End Source File
# Begin Source File

SOURCE=.\source\PhraseParser.cpp
# End Source File
# Begin Source File

SOURCE=.\source\PrefsInputDoc.cpp
# End Source File
# Begin Source File

SOURCE=.\source\PrintANA.cpp
# End Source File
# Begin Source File

SOURCE=.\source\processingPrefs.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ProcessSequence.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ProjectDoc.cpp
# End Source File
# Begin Source File

SOURCE=.\source\projectImportCode.cpp
# End Source File
# Begin Source File

SOURCE=.\source\QuickParseDoc.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\QuickParseView.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\remoteHandlers.cpp
# End Source File
# Begin Source File

SOURCE=.\source\RemoveLanguage.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ResizingUtils.cpp
# End Source File
# Begin Source File

SOURCE=.\source\SafeStream.cpp
# End Source File
# Begin Source File

SOURCE=.\source\SDFEdit.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\SDialog.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\SEdit.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\SentransModel.cpp
# End Source File
# Begin Source File

SOURCE=.\source\SentransProcess.cpp
# End Source File
# Begin Source File

SOURCE=.\source\SheetLangProperties.cpp
# End Source File
# Begin Source File

SOURCE=.\source\SheetModifyTests.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\SimpleProgressBar.cpp"
# End Source File
# Begin Source File

SOURCE=..\CSRemote\simpleRegKey.cpp
# End Source File
# Begin Source File

SOURCE=.\source\Splitter.cpp
# End Source File
# Begin Source File

SOURCE=.\source\StampModel.cpp
# End Source File
# Begin Source File

SOURCE=.\source\StampProcess.cpp
# End Source File
# Begin Source File

SOURCE="..\..\common code\StaticFilespec.cpp"
# End Source File
# Begin Source File

SOURCE=.\source\StdAfx.cpp
# End Source File
# Begin Source File

SOURCE=.\source\TabbedTreeChild.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\TabbedTreeDoc.cpp
# End Source File
# Begin Source File

SOURCE=.\source\TextDisplayInfo.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ToneGen.cpp
# End Source File
# Begin Source File

SOURCE=.\source\ToneParse.cpp
# End Source File
# Begin Source File

SOURCE=.\source\TransferModelSet.cpp
# End Source File
# Begin Source File

SOURCE=.\source\WizBaseClasses.cpp
# End Source File
# Begin Source File

SOURCE=.\source\WizCMenuPage.cpp
# End Source File
# Begin Source File

SOURCE=.\source\wizLangProps.cpp
# End Source File
# Begin Source File

SOURCE=.\source\WizNewFromCarla.cpp
# End Source File
# Begin Source File

SOURCE=.\source\WizNewFromFiles.cpp
# End Source File
# Begin Source File

SOURCE=.\source\WizNewFromScratch.cpp
# ADD CPP /I ".."
# End Source File
# Begin Source File

SOURCE=.\source\wizProjectPage.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\source\AmpleDLLProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\AmpleDLLWrapper.h
# End Source File
# Begin Source File

SOURCE=.\source\AmpleResult.h
# End Source File
# Begin Source File

SOURCE=.\source\AnalysisProcesses.h
# End Source File
# Begin Source File

SOURCE=.\source\BatchProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\CarlaLanguage.h
# End Source File
# Begin Source File

SOURCE=.\source\CarlaStudioApp.h
# End Source File
# Begin Source File

SOURCE=.\source\CCProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\cleanitx.h
# End Source File
# Begin Source File

SOURCE=.\source\CodeTable.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\CreditStatic.h"
# End Source File
# Begin Source File

SOURCE=..\CSRemote\csRemoteRegistry.h
# End Source File
# Begin Source File

SOURCE=.\source\CStudioAssert.h
# End Source File
# Begin Source File

SOURCE=.\source\CStudioMainFrm.h
# End Source File
# Begin Source File

SOURCE=.\source\CWAmpleModels.h
# End Source File
# Begin Source File

SOURCE=.\source\CWAtomicTypes.h
# End Source File
# Begin Source File

SOURCE=.\source\CWFormView.h
# End Source File
# Begin Source File

SOURCE=.\source\CWHeadingView.h
# End Source File
# Begin Source File

SOURCE=.\source\CWInterface.h
# End Source File
# Begin Source File

SOURCE=.\source\CWList.h
# End Source File
# Begin Source File

SOURCE=.\source\CWListCtrl.h
# End Source File
# Begin Source File

SOURCE=.\source\CWListView.h
# End Source File
# Begin Source File

SOURCE=.\source\CWModel.h
# End Source File
# Begin Source File

SOURCE=.\source\CWTabBar.h
# End Source File
# Begin Source File

SOURCE=.\source\CWTopic.h
# End Source File
# Begin Source File

SOURCE=.\source\CWTopicTreeView.h
# End Source File
# Begin Source File

SOURCE=.\source\CWTopicView.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\DirDialog.h"
# End Source File
# Begin Source File

SOURCE=.\source\DlgBatchProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgCCProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgChooseProcessor.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditAmpleDLLProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditAmpleProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditIntergenProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditPrintANA.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditRegSoundChange.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditSentransDisambig.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditSentransProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditSentransTransfer.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampFlag.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampLexChange.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditStampTransfer.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditToneGenProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEditToneParseProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\dlgedittonetracing.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEnvConstrainedRule.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgEnvironments.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgFind.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgManualParseChoice.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgNewLanguage.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgPhonruleRule.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgProcessSequence.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgProgress.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgProjectOpenOrCreate.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgSentransDirective.h
# End Source File
# Begin Source File

SOURCE=.\source\DlgTipDay.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\EditListCtrl.h"
# End Source File
# Begin Source File

SOURCE=.\source\EnvironmentListCtrl.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\filelist.h"
# End Source File
# Begin Source File

SOURCE="..\..\common code\FileListCtrl.h"
# End Source File
# Begin Source File

SOURCE="..\..\common code\flatbutton.h"
# End Source File
# Begin Source File

SOURCE=.\source\FormButton.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\GuruHeaderctrl.h"
# End Source File
# Begin Source File

SOURCE="..\..\common code\GuruSplash.h"
# End Source File
# Begin Source File

SOURCE=.\source\Hook.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\InPlaceEdit.h"
# End Source File
# Begin Source File

SOURCE=.\source\InputDoc.h
# End Source File
# Begin Source File

SOURCE=.\source\inputDocTabBar.h
# End Source File
# Begin Source File

SOURCE=.\source\inputDocView.h
# End Source File
# Begin Source File

SOURCE=.\source\IntergenMarkersCtrl.h
# End Source File
# Begin Source File

SOURCE=.\source\itemeditdialogs.h
# End Source File
# Begin Source File

SOURCE=.\source\LangModelsDoc.h
# End Source File
# Begin Source File

SOURCE=.\source\ListComment.h
# End Source File
# Begin Source File

SOURCE=.\source\ListTestData.h
# End Source File
# Begin Source File

SOURCE=.\source\LogWindow.h
# End Source File
# Begin Source File

SOURCE=.\source\ModelFilesSet.h
# End Source File
# Begin Source File

SOURCE=.\source\Monad.h
# End Source File
# Begin Source File

SOURCE=.\source\nullwindow.h
# End Source File
# Begin Source File

SOURCE=.\source\PageAffixes.h
# End Source File
# Begin Source File

SOURCE=.\source\PageAnaProcessing.h
# End Source File
# Begin Source File

SOURCE=.\source\PageCategoryProp.h
# End Source File
# Begin Source File

SOURCE=.\source\pagecatfinalmodifytests.h
# End Source File
# Begin Source File

SOURCE=.\source\PageDictAffixes.h
# End Source File
# Begin Source File

SOURCE=.\source\PageDictMethod.h
# End Source File
# Begin Source File

SOURCE=.\source\PageDicts.h
# End Source File
# Begin Source File

SOURCE=.\source\PageDisclaimer.h
# End Source File
# Begin Source File

SOURCE=.\source\PageFinalCatTest.h
# End Source File
# Begin Source File

SOURCE=.\source\PageInputDocPanels.h
# End Source File
# Begin Source File

SOURCE=.\source\PageLocations.h
# End Source File
# Begin Source File

SOURCE=.\source\PageRootUnifiedDict.h
# End Source File
# Begin Source File

SOURCE=.\source\PageSrcTextProcessing.h
# End Source File
# Begin Source File

SOURCE=.\source\ParseCSImpl.h
# End Source File
# Begin Source File

SOURCE=.\source\ParseStream.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\PathCtrl.h"
# End Source File
# Begin Source File

SOURCE="..\..\common code\PathDescriptor.h"
# End Source File
# Begin Source File

SOURCE=.\source\PhonruleModel.h
# End Source File
# Begin Source File

SOURCE=.\source\PhraseParser.h
# End Source File
# Begin Source File

SOURCE=.\source\PrefsInputDoc.h
# End Source File
# Begin Source File

SOURCE=.\source\PrintANA.h
# End Source File
# Begin Source File

SOURCE=.\source\processingPrefs.h
# End Source File
# Begin Source File

SOURCE=.\source\ProcessOutput.h
# End Source File
# Begin Source File

SOURCE=.\source\ProcessSequence.h
# End Source File
# Begin Source File

SOURCE=.\source\ProcessStatus.h
# End Source File
# Begin Source File

SOURCE=.\source\ProjectDoc.h
# End Source File
# Begin Source File

SOURCE=.\source\QuickParseDoc.h
# End Source File
# Begin Source File

SOURCE=.\source\QuickParseView.h
# End Source File
# Begin Source File

SOURCE=.\source\remoteHandlers.h
# End Source File
# Begin Source File

SOURCE=.\ResizingUtils.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\source\SafeStream.h
# End Source File
# Begin Source File

SOURCE=.\source\SDFEdit.h
# End Source File
# Begin Source File

SOURCE=.\source\SDialog.h
# End Source File
# Begin Source File

SOURCE=.\source\SEdit.h
# End Source File
# Begin Source File

SOURCE=.\source\SentransModel.h
# End Source File
# Begin Source File

SOURCE=.\source\SentransProcess.h
# End Source File
# Begin Source File

SOURCE=.\source\SFMFile.h
# End Source File
# Begin Source File

SOURCE=.\source\SheetLangProperties.h
# End Source File
# Begin Source File

SOURCE=.\source\SheetModifyTests.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\SimpleProgressBar.h"
# End Source File
# Begin Source File

SOURCE=..\CSRemote\simpleRegKey.h
# End Source File
# Begin Source File

SOURCE=.\source\Splitter.h
# End Source File
# Begin Source File

SOURCE=.\source\StampModel.h
# End Source File
# Begin Source File

SOURCE=.\source\StampProcess.h
# End Source File
# Begin Source File

SOURCE="..\..\common code\StaticFilespec.h"
# End Source File
# Begin Source File

SOURCE=.\source\StdAfx.h
# End Source File
# Begin Source File

SOURCE=.\source\TabbedTreeChild.h
# End Source File
# Begin Source File

SOURCE=.\source\TabbedTreeDoc.h
# End Source File
# Begin Source File

SOURCE=.\source\TextDisplayInfo.h
# End Source File
# Begin Source File

SOURCE=.\source\ToneGen.h
# End Source File
# Begin Source File

SOURCE=.\source\ToneParse.h
# End Source File
# Begin Source File

SOURCE=.\source\TransferModelSet.h
# End Source File
# Begin Source File

SOURCE=.\source\WizBaseClasses.h
# End Source File
# Begin Source File

SOURCE=.\source\WizCMenuPage.h
# End Source File
# Begin Source File

SOURCE=.\source\wizLangProps.h
# End Source File
# Begin Source File

SOURCE=.\source\WizNewFromCarla.h
# End Source File
# Begin Source File

SOURCE=.\source\WizNewFromFiles.h
# End Source File
# Begin Source File

SOURCE=.\source\WizNewFromScratch.h
# End Source File
# Begin Source File

SOURCE=.\source\wizProjectPage.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\addFile.bmp
# End Source File
# Begin Source File

SOURCE=.\res\bitmap1.bmp
# End Source File
# Begin Source File

SOURCE=.\res\choosefo.bmp
# End Source File
# Begin Source File

SOURCE=.\res\commentl.ico
# End Source File
# Begin Source File

SOURCE=.\res\construc.ico
# End Source File
# Begin Source File

SOURCE=.\res\Construction.bmp
# End Source File
# Begin Source File

SOURCE=.\res\cslang.ico
# End Source File
# Begin Source File

SOURCE=.\res\CSphon.ico
# End Source File
# Begin Source File

SOURCE=.\res\CSSentrans.ico
# End Source File
# Begin Source File

SOURCE=.\res\CStudio.ico
# End Source File
# Begin Source File

SOURCE=.\res\CStudio.rc2
# End Source File
# Begin Source File

SOURCE=.\res\CStudioDoc.ico
# End Source File
# Begin Source File

SOURCE=.\res\cursor2.cur
# End Source File
# Begin Source File

SOURCE=.\source\CWProcess.h
# End Source File
# Begin Source File

SOURCE=.\res\delete.bmp
# End Source File
# Begin Source File

SOURCE=.\res\disabEnv.ico
# End Source File
# Begin Source File

SOURCE=.\res\disabled.ico
# End Source File
# Begin Source File

SOURCE=.\res\editable.bmp
# End Source File
# Begin Source File

SOURCE=.\res\editable.ico
# End Source File
# Begin Source File

SOURCE=.\res\enablede.ico
# End Source File
# Begin Source File

SOURCE=.\res\enabledl.ico
# End Source File
# Begin Source File

SOURCE=.\res\enablEnv.ico
# End Source File
# Begin Source File

SOURCE=.\res\environm.bmp
# End Source File
# Begin Source File

SOURCE=.\res\error.bmp
# End Source File
# Begin Source File

SOURCE=.\res\error.ico
# End Source File
# Begin Source File

SOURCE=.\res\genericl.ico
# End Source File
# Begin Source File

SOURCE=.\res\ico00001.ico
# End Source File
# Begin Source File

SOURCE=.\res\ico00002.ico
# End Source File
# Begin Source File

SOURCE=.\res\ico00003.ico
# End Source File
# Begin Source File

SOURCE=.\res\icon1.ico
# End Source File
# Begin Source File

SOURCE=.\res\idr_cstu.ico
# End Source File
# Begin Source File

SOURCE=.\res\idr_quic.ico
# End Source File
# Begin Source File

SOURCE=.\res\idr_src.ico
# End Source File
# Begin Source File

SOURCE=.\res\litebulb.bmp
# End Source File
# Begin Source File

SOURCE=.\res\mainfram.bmp
# End Source File
# Begin Source File

SOURCE=.\res\MorphEnviron.ico
# End Source File
# Begin Source File

SOURCE=.\res\notsymbl.ico
# End Source File
# Begin Source File

SOURCE=.\res\projDoc.ico
# End Source File
# Begin Source File

SOURCE=.\res\quickpar.bmp
# End Source File
# Begin Source File

SOURCE=.\res\senRulesOff.ico
# End Source File
# Begin Source File

SOURCE=.\res\senRulesOn.ico
# End Source File
# Begin Source File

SOURCE=.\res\sentransBegin.ico
# End Source File
# Begin Source File

SOURCE=.\res\sentransEnd.ico
# End Source File
# Begin Source File

SOURCE=.\res\sentransLimit.ico
# End Source File
# Begin Source File

SOURCE=.\res\sfmarker.ico
# End Source File
# Begin Source File

SOURCE=.\res\SplashScreen.bmp
# End Source File
# Begin Source File

SOURCE=.\res\stampflag.ico
# End Source File
# Begin Source File

SOURCE=.\res\stringEnv.ico
# End Source File
# Begin Source File

SOURCE=.\res\testdata.ico
# End Source File
# Begin Source File

SOURCE=.\res\Toolbar.bmp
# End Source File
# Begin Source File

SOURCE=.\res\xSymbol.ico
# End Source File
# End Group
# Begin Group "Help Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\hlp\AfxCore.rtf
# End Source File
# Begin Source File

SOURCE=.\hlp\AfxPrint.rtf
# End Source File
# Begin Source File

SOURCE=.\hlp\AppExit.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\Bullet.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\CStudio.cnt
# End Source File
# Begin Source File

SOURCE=.\hlp\CurArw2.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\CurArw4.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\CurHelp.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\EditCopy.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\EditCut.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\EditPast.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\EditUndo.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\FileNew.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\FileOpen.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\FilePrnt.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\FileSave.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\HlpSBar.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\HlpTBar.bmp
# End Source File
# Begin Source File

SOURCE=.\MakeHelp.bat
# End Source File
# Begin Source File

SOURCE=.\hlp\RecFirst.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\RecLast.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\RecNext.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\RecPrev.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\Scmax.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\ScMenu.bmp
# End Source File
# Begin Source File

SOURCE=.\hlp\Scmin.bmp
# End Source File
# End Group
# Begin Source File

SOURCE=".\documents\CM Process.vsd"
# End Source File
# Begin Source File

SOURCE=.\Connector.rgs
# End Source File
# Begin Source File

SOURCE=".\Cstudio To Do.doc"
# End Source File
# Begin Source File

SOURCE=.\CStudio.reg
# End Source File
# Begin Source File

SOURCE=.\CStudio.rgs
# End Source File
# Begin Source File

SOURCE=.\del.txt
# End Source File
# Begin Source File

SOURCE=.\Hook.rgs
# End Source File
# Begin Source File

SOURCE=.\source\Hook.rgs
# End Source File
# Begin Source File

SOURCE=.\ParseCS.rgs
# End Source File
# Begin Source File

SOURCE=.\source\processoutput.cpp
# End Source File
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# Begin Source File

SOURCE=.\Cc32.lib
# End Source File
# End Target
# End Project
# Section CStudio : {5F4DF280-531B-11CF-91F6-C2863C385E30}
# 	2:5:Class:CMSFlexGrid
# 	2:10:HeaderFile:msflexgrid.h
# 	2:8:ImplFile:msflexgrid.cpp
# End Section
# Section CStudio : {BDD1F051-858B-11D1-B16A-00C0F0283628}
# 	2:5:Class:CColumnHeader
# 	2:10:HeaderFile:columnheader.h
# 	2:8:ImplFile:columnheader.cpp
# End Section
# Section CStudio : {BEF6E003-A874-101A-8BBA-00AA00300CAB}
# 	2:5:Class:COleFont
# 	2:10:HeaderFile:font.h
# 	2:8:ImplFile:font.cpp
# End Section
# Section CStudio : {6262D3A0-531B-11CF-91F6-C2863C385E30}
# 	2:21:DefaultSinkHeaderFile:msflexgrid.h
# 	2:16:DefaultSinkClass:CMSFlexGrid
# End Section
# Section CStudio : {BDD1F04C-858B-11D1-B16A-00C0F0283628}
# 	2:5:Class:CListItems
# 	2:10:HeaderFile:listitems.h
# 	2:8:ImplFile:listitems.cpp
# End Section
# Section CStudio : {BDD1F055-858B-11D1-B16A-00C0F0283628}
# 	2:5:Class:CListSubItem
# 	2:10:HeaderFile:listsubitem.h
# 	2:8:ImplFile:listsubitem.cpp
# End Section
# Section CStudio : {7BF80981-BF32-101A-8BBB-00AA00300CAB}
# 	2:5:Class:CPicture
# 	2:10:HeaderFile:picture.h
# 	2:8:ImplFile:picture.cpp
# End Section
# Section CStudio : {BDD1F050-858B-11D1-B16A-00C0F0283628}
# 	2:5:Class:CColumnHeaders
# 	2:10:HeaderFile:columnheaders.h
# 	2:8:ImplFile:columnheaders.cpp
# End Section
# Section CStudio : {BDD1F049-858B-11D1-B16A-00C0F0283628}
# 	2:5:Class:CListView1
# 	2:10:HeaderFile:listview.h
# 	2:8:ImplFile:listview.cpp
# End Section
# Section CStudio : {BDD1F04B-858B-11D1-B16A-00C0F0283628}
# 	2:21:DefaultSinkHeaderFile:listview.h
# 	2:16:DefaultSinkClass:CListView1
# End Section
# Section CStudio : {BDD1F053-858B-11D1-B16A-00C0F0283628}
# 	2:5:Class:CListSubItems
# 	2:10:HeaderFile:listsubitems.h
# 	2:8:ImplFile:listsubitems.cpp
# End Section
# Section CStudio : {00000000-0000-0000-0000-000000000000}
# 	1:17:CG_IDS_DIDYOUKNOW:119
# 	1:22:CG_IDS_TIPOFTHEDAYMENU:118
# 	1:18:CG_IDS_TIPOFTHEDAY:117
# 	1:22:CG_IDS_TIPOFTHEDAYHELP:122
# 	1:19:CG_IDP_FILE_CORRUPT:121
# 	1:7:IDD_TIP:116
# 	1:13:IDB_LIGHTBULB:115
# 	1:18:CG_IDS_FILE_ABSENT:120
# 	2:17:CG_IDS_DIDYOUKNOW:CG_IDS_DIDYOUKNOW
# 	2:7:CTipDlg:CDlgTipDay
# 	2:22:CG_IDS_TIPOFTHEDAYMENU:CG_IDS_TIPOFTHEDAYMENU
# 	2:18:CG_IDS_TIPOFTHEDAY:CG_IDS_TIPOFTHEDAY
# 	2:12:CTIP_Written:OK
# 	2:22:CG_IDS_TIPOFTHEDAYHELP:CG_IDS_TIPOFTHEDAYHELP
# 	2:2:BH:
# 	2:19:CG_IDP_FILE_CORRUPT:CG_IDP_FILE_CORRUPT
# 	2:7:IDD_TIP:IDD_TIP
# 	2:8:TipDlg.h:source/TipDay.h
# 	2:13:IDB_LIGHTBULB:IDB_LIGHTBULB
# 	2:18:CG_IDS_FILE_ABSENT:CG_IDS_FILE_ABSENT
# 	2:10:TipDlg.cpp:source/TipDay.cpp
# End Section
# Section CStudio : {9F6AA700-D188-11CD-AD48-00AA003C9CB6}
# 	2:5:Class:CRowCursor
# 	2:10:HeaderFile:rowcursor.h
# 	2:8:ImplFile:rowcursor.cpp
# End Section
# Section CStudio : {BDD1F04E-858B-11D1-B16A-00C0F0283628}
# 	2:5:Class:CListItem
# 	2:10:HeaderFile:listitem.h
# 	2:8:ImplFile:listitem.cpp
# End Section
