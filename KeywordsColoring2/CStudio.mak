# Microsoft Developer Studio Generated NMAKE File, Based on CStudio.dsp
!IF "$(CFG)" == ""
CFG=CStudio - Win32 Debug
!MESSAGE No configuration specified. Defaulting to CStudio - Win32 Debug.
!ENDIF

!IF "$(CFG)" != "CStudio - Win32 Release" && "$(CFG)" != "CStudio - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "CStudio - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\CStudio.exe" "$(OUTDIR)\CStudioCOM.tlb"


CLEAN :
	-@erase "$(INTDIR)\AmpleDLLProcess.obj"
	-@erase "$(INTDIR)\AmpleDLLWrapper.obj"
	-@erase "$(INTDIR)\AmpleProcess.obj"
	-@erase "$(INTDIR)\AmpleResult.obj"
	-@erase "$(INTDIR)\ANACount.obj"
	-@erase "$(INTDIR)\BatchProcess.obj"
	-@erase "$(INTDIR)\CarlaLanguage.obj"
	-@erase "$(INTDIR)\CarlaStudioApp.obj"
	-@erase "$(INTDIR)\CCProcess.obj"
	-@erase "$(INTDIR)\Class.obj"
	-@erase "$(INTDIR)\codetable.obj"
	-@erase "$(INTDIR)\colorbtn.obj"
	-@erase "$(INTDIR)\Conversion.obj"
	-@erase "$(INTDIR)\CreditStatic.obj"
	-@erase "$(INTDIR)\CStudio.res"
	-@erase "$(INTDIR)\cstudioAssert.obj"
	-@erase "$(INTDIR)\CStudioCOM.tlb"
	-@erase "$(INTDIR)\CStudioMainFrm.obj"
	-@erase "$(INTDIR)\CWAnalysisModel.obj"
	-@erase "$(INTDIR)\CWAtomicTypes.obj"
	-@erase "$(INTDIR)\CWCarlaMenu.obj"
	-@erase "$(INTDIR)\CWFormView.obj"
	-@erase "$(INTDIR)\CWFunctionalInterface.obj"
	-@erase "$(INTDIR)\CWHeadingView.obj"
	-@erase "$(INTDIR)\CWInterface.obj"
	-@erase "$(INTDIR)\CWList.obj"
	-@erase "$(INTDIR)\CWListCtrl.obj"
	-@erase "$(INTDIR)\CWListView.obj"
	-@erase "$(INTDIR)\CWModel.obj"
	-@erase "$(INTDIR)\cwprocess.obj"
	-@erase "$(INTDIR)\CWTabBar.obj"
	-@erase "$(INTDIR)\CWTopic.obj"
	-@erase "$(INTDIR)\cwtopictreeview.obj"
	-@erase "$(INTDIR)\CWTopicView.obj"
	-@erase "$(INTDIR)\DirDialog.obj"
	-@erase "$(INTDIR)\DlgBatchProcess.obj"
	-@erase "$(INTDIR)\DlgCCProcess.obj"
	-@erase "$(INTDIR)\DlgChooseProcessor.obj"
	-@erase "$(INTDIR)\DlgEditAmpleDLLProcess.obj"
	-@erase "$(INTDIR)\DlgEditAmpleProcess.obj"
	-@erase "$(INTDIR)\DlgEditIntergenProcess.obj"
	-@erase "$(INTDIR)\DlgEditPrintANA.obj"
	-@erase "$(INTDIR)\DlgEditRegSoundChange.obj"
	-@erase "$(INTDIR)\DlgEditSentransDisambig.obj"
	-@erase "$(INTDIR)\DlgEditSentransProcess.obj"
	-@erase "$(INTDIR)\DlgEditSentransTransfer.obj"
	-@erase "$(INTDIR)\DlgEditStampFlag.obj"
	-@erase "$(INTDIR)\DlgEditStampLexChange.obj"
	-@erase "$(INTDIR)\DlgEditStampProcess.obj"
	-@erase "$(INTDIR)\DlgEditStampTransfer.obj"
	-@erase "$(INTDIR)\DlgEditTestColor.obj"
	-@erase "$(INTDIR)\DlgEditToneGenProcess.obj"
	-@erase "$(INTDIR)\DlgEditToneParseProcess.obj"
	-@erase "$(INTDIR)\DlgEditToneTracing.obj"
	-@erase "$(INTDIR)\DlgEnvConstrainedRule.obj"
	-@erase "$(INTDIR)\DlgEnvironments.obj"
	-@erase "$(INTDIR)\DlgFind.obj"
	-@erase "$(INTDIR)\DlgManualParseChoice.obj"
	-@erase "$(INTDIR)\DlgNewLanguage.obj"
	-@erase "$(INTDIR)\DlgPhonruleRule.obj"
	-@erase "$(INTDIR)\DlgProcessSequence.obj"
	-@erase "$(INTDIR)\dlgprogress.obj"
	-@erase "$(INTDIR)\dlgprojectopenorcreate.obj"
	-@erase "$(INTDIR)\DlgSentransDirective.obj"
	-@erase "$(INTDIR)\DlgTipDay.obj"
	-@erase "$(INTDIR)\EditListCtrl.obj"
	-@erase "$(INTDIR)\EnvironConstrainedRuleLists.obj"
	-@erase "$(INTDIR)\EnvironmentListCtrl.obj"
	-@erase "$(INTDIR)\FileListCtrl.obj"
	-@erase "$(INTDIR)\FlatButton.obj"
	-@erase "$(INTDIR)\FormButton.obj"
	-@erase "$(INTDIR)\GuruHeaderCtrl.obj"
	-@erase "$(INTDIR)\GuruSplash.obj"
	-@erase "$(INTDIR)\Hook.obj"
	-@erase "$(INTDIR)\InPlaceEdit.obj"
	-@erase "$(INTDIR)\InputDoc.obj"
	-@erase "$(INTDIR)\inputDocTabBar.obj"
	-@erase "$(INTDIR)\inputDocView.obj"
	-@erase "$(INTDIR)\IntergenMarkersCtrl.obj"
	-@erase "$(INTDIR)\intergenProcess.obj"
	-@erase "$(INTDIR)\itemeditdialogs.obj"
	-@erase "$(INTDIR)\LangModelsDoc.obj"
	-@erase "$(INTDIR)\ListComment.obj"
	-@erase "$(INTDIR)\ListTestData.obj"
	-@erase "$(INTDIR)\logwindow.obj"
	-@erase "$(INTDIR)\Monad.obj"
	-@erase "$(INTDIR)\nullwindow.obj"
	-@erase "$(INTDIR)\PageAffixes.obj"
	-@erase "$(INTDIR)\PageAnaProcessing.obj"
	-@erase "$(INTDIR)\PageCategoryProp.obj"
	-@erase "$(INTDIR)\pagecatfinalmodifytests.obj"
	-@erase "$(INTDIR)\PageDictAffixes.obj"
	-@erase "$(INTDIR)\PageDictMethod.obj"
	-@erase "$(INTDIR)\PageDisclaimer.obj"
	-@erase "$(INTDIR)\PageFinalCatTest.obj"
	-@erase "$(INTDIR)\PageInputDocPanels.obj"
	-@erase "$(INTDIR)\PageLocations.obj"
	-@erase "$(INTDIR)\PageRootUnifiedDict.obj"
	-@erase "$(INTDIR)\PageSrcTextProcessing.obj"
	-@erase "$(INTDIR)\ParseCSImpl.obj"
	-@erase "$(INTDIR)\PathCtrl.obj"
	-@erase "$(INTDIR)\PhonruleModel.obj"
	-@erase "$(INTDIR)\PhraseParser.obj"
	-@erase "$(INTDIR)\PrefsInputDoc.obj"
	-@erase "$(INTDIR)\PrintANA.obj"
	-@erase "$(INTDIR)\processingPrefs.obj"
	-@erase "$(INTDIR)\processoutput.obj"
	-@erase "$(INTDIR)\ProcessSequence.obj"
	-@erase "$(INTDIR)\ProjectDoc.obj"
	-@erase "$(INTDIR)\projectImportCode.obj"
	-@erase "$(INTDIR)\QuickParseDoc.obj"
	-@erase "$(INTDIR)\QuickParseView.obj"
	-@erase "$(INTDIR)\remoteHandlers.obj"
	-@erase "$(INTDIR)\RemoveLanguage.obj"
	-@erase "$(INTDIR)\SafeStream.obj"
	-@erase "$(INTDIR)\SDFEdit.obj"
	-@erase "$(INTDIR)\SDialog.obj"
	-@erase "$(INTDIR)\SEdit.obj"
	-@erase "$(INTDIR)\SentransModel.obj"
	-@erase "$(INTDIR)\SentransProcess.obj"
	-@erase "$(INTDIR)\SheetLangProperties.obj"
	-@erase "$(INTDIR)\SheetModifyTests.obj"
	-@erase "$(INTDIR)\SimpleProgressBar.obj"
	-@erase "$(INTDIR)\Splitter.obj"
	-@erase "$(INTDIR)\StampModel.obj"
	-@erase "$(INTDIR)\StampProcess.obj"
	-@erase "$(INTDIR)\StaticFilespec.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\TabbedTreeChild.obj"
	-@erase "$(INTDIR)\TabbedTreeDoc.obj"
	-@erase "$(INTDIR)\TestEdit.obj"
	-@erase "$(INTDIR)\TestEditModel.obj"
	-@erase "$(INTDIR)\TextDisplayInfo.obj"
	-@erase "$(INTDIR)\ToneGen.obj"
	-@erase "$(INTDIR)\ToneParse.obj"
	-@erase "$(INTDIR)\TransferModelSet.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\WizBaseClasses.obj"
	-@erase "$(INTDIR)\WizCMenuPage.obj"
	-@erase "$(INTDIR)\wizLangProps.obj"
	-@erase "$(INTDIR)\WizNewFromCarla.obj"
	-@erase "$(INTDIR)\WizNewFromFiles.obj"
	-@erase "$(INTDIR)\WizNewFromScratch.obj"
	-@erase "$(INTDIR)\wizProjectPage.obj"
	-@erase "$(OUTDIR)\CStudio.exe"
	-@erase "$(OUTDIR)\CStudio.ilk"

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c
MTL_PROJ=/nologo /D "NDEBUG" /win32
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CStudio.res" /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CStudio.bsc"
BSC32_SBRS= \

LINK32=link.exe
LINK32_FLAGS=CStudioProcessorLib.lib CSUtils.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\CStudio.pdb" /machine:I386 /nodefaultlib:"mfc42d.lib" /out:"$(OUTDIR)\CStudio.exe" /libpath:"..\CarlaStudio\CStudio\CS Utility DLL\Release" /libpath:"..\CStudioProcessorLib\Release"
LINK32_OBJS= \
	"$(INTDIR)\AmpleDLLProcess.obj" \
	"$(INTDIR)\AmpleDLLWrapper.obj" \
	"$(INTDIR)\AmpleProcess.obj" \
	"$(INTDIR)\AmpleResult.obj" \
	"$(INTDIR)\ANACount.obj" \
	"$(INTDIR)\BatchProcess.obj" \
	"$(INTDIR)\CarlaLanguage.obj" \
	"$(INTDIR)\CarlaStudioApp.obj" \
	"$(INTDIR)\CCProcess.obj" \
	"$(INTDIR)\Class.obj" \
	"$(INTDIR)\codetable.obj" \
	"$(INTDIR)\colorbtn.obj" \
	"$(INTDIR)\Conversion.obj" \
	"$(INTDIR)\CreditStatic.obj" \
	"$(INTDIR)\cstudioAssert.obj" \
	"$(INTDIR)\CStudioMainFrm.obj" \
	"$(INTDIR)\CWAnalysisModel.obj" \
	"$(INTDIR)\CWAtomicTypes.obj" \
	"$(INTDIR)\CWCarlaMenu.obj" \
	"$(INTDIR)\CWFormView.obj" \
	"$(INTDIR)\CWFunctionalInterface.obj" \
	"$(INTDIR)\CWHeadingView.obj" \
	"$(INTDIR)\CWInterface.obj" \
	"$(INTDIR)\CWList.obj" \
	"$(INTDIR)\CWListCtrl.obj" \
	"$(INTDIR)\CWListView.obj" \
	"$(INTDIR)\CWModel.obj" \
	"$(INTDIR)\cwprocess.obj" \
	"$(INTDIR)\CWTabBar.obj" \
	"$(INTDIR)\CWTopic.obj" \
	"$(INTDIR)\cwtopictreeview.obj" \
	"$(INTDIR)\CWTopicView.obj" \
	"$(INTDIR)\DirDialog.obj" \
	"$(INTDIR)\DlgBatchProcess.obj" \
	"$(INTDIR)\DlgCCProcess.obj" \
	"$(INTDIR)\DlgChooseProcessor.obj" \
	"$(INTDIR)\DlgEditAmpleDLLProcess.obj" \
	"$(INTDIR)\DlgEditAmpleProcess.obj" \
	"$(INTDIR)\DlgEditIntergenProcess.obj" \
	"$(INTDIR)\DlgEditPrintANA.obj" \
	"$(INTDIR)\DlgEditRegSoundChange.obj" \
	"$(INTDIR)\DlgEditSentransDisambig.obj" \
	"$(INTDIR)\DlgEditSentransProcess.obj" \
	"$(INTDIR)\DlgEditSentransTransfer.obj" \
	"$(INTDIR)\DlgEditStampFlag.obj" \
	"$(INTDIR)\DlgEditStampLexChange.obj" \
	"$(INTDIR)\DlgEditStampProcess.obj" \
	"$(INTDIR)\DlgEditStampTransfer.obj" \
	"$(INTDIR)\DlgEditTestColor.obj" \
	"$(INTDIR)\DlgEditToneGenProcess.obj" \
	"$(INTDIR)\DlgEditToneParseProcess.obj" \
	"$(INTDIR)\DlgEditToneTracing.obj" \
	"$(INTDIR)\DlgEnvConstrainedRule.obj" \
	"$(INTDIR)\DlgEnvironments.obj" \
	"$(INTDIR)\DlgFind.obj" \
	"$(INTDIR)\DlgManualParseChoice.obj" \
	"$(INTDIR)\DlgNewLanguage.obj" \
	"$(INTDIR)\DlgPhonruleRule.obj" \
	"$(INTDIR)\DlgProcessSequence.obj" \
	"$(INTDIR)\dlgprogress.obj" \
	"$(INTDIR)\dlgprojectopenorcreate.obj" \
	"$(INTDIR)\DlgSentransDirective.obj" \
	"$(INTDIR)\DlgTipDay.obj" \
	"$(INTDIR)\EditListCtrl.obj" \
	"$(INTDIR)\EnvironConstrainedRuleLists.obj" \
	"$(INTDIR)\EnvironmentListCtrl.obj" \
	"$(INTDIR)\FileListCtrl.obj" \
	"$(INTDIR)\FlatButton.obj" \
	"$(INTDIR)\FormButton.obj" \
	"$(INTDIR)\GuruHeaderCtrl.obj" \
	"$(INTDIR)\GuruSplash.obj" \
	"$(INTDIR)\Hook.obj" \
	"$(INTDIR)\InPlaceEdit.obj" \
	"$(INTDIR)\InputDoc.obj" \
	"$(INTDIR)\inputDocTabBar.obj" \
	"$(INTDIR)\inputDocView.obj" \
	"$(INTDIR)\IntergenMarkersCtrl.obj" \
	"$(INTDIR)\intergenProcess.obj" \
	"$(INTDIR)\itemeditdialogs.obj" \
	"$(INTDIR)\LangModelsDoc.obj" \
	"$(INTDIR)\ListComment.obj" \
	"$(INTDIR)\ListTestData.obj" \
	"$(INTDIR)\logwindow.obj" \
	"$(INTDIR)\Monad.obj" \
	"$(INTDIR)\nullwindow.obj" \
	"$(INTDIR)\PageAffixes.obj" \
	"$(INTDIR)\PageAnaProcessing.obj" \
	"$(INTDIR)\PageCategoryProp.obj" \
	"$(INTDIR)\pagecatfinalmodifytests.obj" \
	"$(INTDIR)\PageDictAffixes.obj" \
	"$(INTDIR)\PageDictMethod.obj" \
	"$(INTDIR)\PageDisclaimer.obj" \
	"$(INTDIR)\PageFinalCatTest.obj" \
	"$(INTDIR)\PageInputDocPanels.obj" \
	"$(INTDIR)\PageLocations.obj" \
	"$(INTDIR)\PageRootUnifiedDict.obj" \
	"$(INTDIR)\PageSrcTextProcessing.obj" \
	"$(INTDIR)\ParseCSImpl.obj" \
	"$(INTDIR)\PathCtrl.obj" \
	"$(INTDIR)\PhonruleModel.obj" \
	"$(INTDIR)\PhraseParser.obj" \
	"$(INTDIR)\PrefsInputDoc.obj" \
	"$(INTDIR)\PrintANA.obj" \
	"$(INTDIR)\processingPrefs.obj" \
	"$(INTDIR)\ProcessSequence.obj" \
	"$(INTDIR)\ProjectDoc.obj" \
	"$(INTDIR)\projectImportCode.obj" \
	"$(INTDIR)\QuickParseDoc.obj" \
	"$(INTDIR)\QuickParseView.obj" \
	"$(INTDIR)\remoteHandlers.obj" \
	"$(INTDIR)\RemoveLanguage.obj" \
	"$(INTDIR)\SafeStream.obj" \
	"$(INTDIR)\SDFEdit.obj" \
	"$(INTDIR)\SDialog.obj" \
	"$(INTDIR)\SEdit.obj" \
	"$(INTDIR)\SentransModel.obj" \
	"$(INTDIR)\SentransProcess.obj" \
	"$(INTDIR)\SheetLangProperties.obj" \
	"$(INTDIR)\SheetModifyTests.obj" \
	"$(INTDIR)\SimpleProgressBar.obj" \
	"$(INTDIR)\Splitter.obj" \
	"$(INTDIR)\StampModel.obj" \
	"$(INTDIR)\StampProcess.obj" \
	"$(INTDIR)\StaticFilespec.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\TabbedTreeChild.obj" \
	"$(INTDIR)\TabbedTreeDoc.obj" \
	"$(INTDIR)\TestEdit.obj" \
	"$(INTDIR)\TestEditModel.obj" \
	"$(INTDIR)\TextDisplayInfo.obj" \
	"$(INTDIR)\ToneGen.obj" \
	"$(INTDIR)\ToneParse.obj" \
	"$(INTDIR)\TransferModelSet.obj" \
	"$(INTDIR)\WizBaseClasses.obj" \
	"$(INTDIR)\WizCMenuPage.obj" \
	"$(INTDIR)\wizLangProps.obj" \
	"$(INTDIR)\WizNewFromCarla.obj" \
	"$(INTDIR)\WizNewFromFiles.obj" \
	"$(INTDIR)\WizNewFromScratch.obj" \
	"$(INTDIR)\wizProjectPage.obj" \
	"$(INTDIR)\processoutput.obj" \
	"$(INTDIR)\CStudio.res" \
	".\Cc32.lib"

"$(OUTDIR)\CStudio.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetDir=.\Release
SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\CStudio.exe" "$(OUTDIR)\CStudioCOM.tlb"
   copy .\Release\cstudiocom.tlb .\Release\cstudio.tlb
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\CStudio.exe" "$(OUTDIR)\CStudioCOM.tlb"


CLEAN :
	-@erase "$(INTDIR)\AmpleDLLProcess.obj"
	-@erase "$(INTDIR)\AmpleDLLWrapper.obj"
	-@erase "$(INTDIR)\AmpleProcess.obj"
	-@erase "$(INTDIR)\AmpleResult.obj"
	-@erase "$(INTDIR)\ANACount.obj"
	-@erase "$(INTDIR)\BatchProcess.obj"
	-@erase "$(INTDIR)\CarlaLanguage.obj"
	-@erase "$(INTDIR)\CarlaStudioApp.obj"
	-@erase "$(INTDIR)\CCProcess.obj"
	-@erase "$(INTDIR)\Class.obj"
	-@erase "$(INTDIR)\codetable.obj"
	-@erase "$(INTDIR)\colorbtn.obj"
	-@erase "$(INTDIR)\Conversion.obj"
	-@erase "$(INTDIR)\CreditStatic.obj"
	-@erase "$(INTDIR)\CStudio.res"
	-@erase "$(INTDIR)\cstudioAssert.obj"
	-@erase "$(INTDIR)\CStudioCOM.tlb"
	-@erase "$(INTDIR)\CStudioMainFrm.obj"
	-@erase "$(INTDIR)\CWAnalysisModel.obj"
	-@erase "$(INTDIR)\CWAtomicTypes.obj"
	-@erase "$(INTDIR)\CWCarlaMenu.obj"
	-@erase "$(INTDIR)\CWFormView.obj"
	-@erase "$(INTDIR)\CWFunctionalInterface.obj"
	-@erase "$(INTDIR)\CWHeadingView.obj"
	-@erase "$(INTDIR)\CWInterface.obj"
	-@erase "$(INTDIR)\CWList.obj"
	-@erase "$(INTDIR)\CWListCtrl.obj"
	-@erase "$(INTDIR)\CWListView.obj"
	-@erase "$(INTDIR)\CWModel.obj"
	-@erase "$(INTDIR)\cwprocess.obj"
	-@erase "$(INTDIR)\CWTabBar.obj"
	-@erase "$(INTDIR)\CWTopic.obj"
	-@erase "$(INTDIR)\cwtopictreeview.obj"
	-@erase "$(INTDIR)\CWTopicView.obj"
	-@erase "$(INTDIR)\DirDialog.obj"
	-@erase "$(INTDIR)\DlgBatchProcess.obj"
	-@erase "$(INTDIR)\DlgCCProcess.obj"
	-@erase "$(INTDIR)\DlgChooseProcessor.obj"
	-@erase "$(INTDIR)\DlgEditAmpleDLLProcess.obj"
	-@erase "$(INTDIR)\DlgEditAmpleProcess.obj"
	-@erase "$(INTDIR)\DlgEditIntergenProcess.obj"
	-@erase "$(INTDIR)\DlgEditPrintANA.obj"
	-@erase "$(INTDIR)\DlgEditRegSoundChange.obj"
	-@erase "$(INTDIR)\DlgEditSentransDisambig.obj"
	-@erase "$(INTDIR)\DlgEditSentransProcess.obj"
	-@erase "$(INTDIR)\DlgEditSentransTransfer.obj"
	-@erase "$(INTDIR)\DlgEditStampFlag.obj"
	-@erase "$(INTDIR)\DlgEditStampLexChange.obj"
	-@erase "$(INTDIR)\DlgEditStampProcess.obj"
	-@erase "$(INTDIR)\DlgEditStampTransfer.obj"
	-@erase "$(INTDIR)\DlgEditTestColor.obj"
	-@erase "$(INTDIR)\DlgEditToneGenProcess.obj"
	-@erase "$(INTDIR)\DlgEditToneParseProcess.obj"
	-@erase "$(INTDIR)\DlgEditToneTracing.obj"
	-@erase "$(INTDIR)\DlgEnvConstrainedRule.obj"
	-@erase "$(INTDIR)\DlgEnvironments.obj"
	-@erase "$(INTDIR)\DlgFind.obj"
	-@erase "$(INTDIR)\DlgManualParseChoice.obj"
	-@erase "$(INTDIR)\DlgNewLanguage.obj"
	-@erase "$(INTDIR)\DlgPhonruleRule.obj"
	-@erase "$(INTDIR)\DlgProcessSequence.obj"
	-@erase "$(INTDIR)\dlgprogress.obj"
	-@erase "$(INTDIR)\dlgprojectopenorcreate.obj"
	-@erase "$(INTDIR)\DlgSentransDirective.obj"
	-@erase "$(INTDIR)\DlgTipDay.obj"
	-@erase "$(INTDIR)\EditListCtrl.obj"
	-@erase "$(INTDIR)\EnvironConstrainedRuleLists.obj"
	-@erase "$(INTDIR)\EnvironmentListCtrl.obj"
	-@erase "$(INTDIR)\FileListCtrl.obj"
	-@erase "$(INTDIR)\FlatButton.obj"
	-@erase "$(INTDIR)\FormButton.obj"
	-@erase "$(INTDIR)\GuruHeaderCtrl.obj"
	-@erase "$(INTDIR)\GuruSplash.obj"
	-@erase "$(INTDIR)\Hook.obj"
	-@erase "$(INTDIR)\InPlaceEdit.obj"
	-@erase "$(INTDIR)\InputDoc.obj"
	-@erase "$(INTDIR)\inputDocTabBar.obj"
	-@erase "$(INTDIR)\inputDocView.obj"
	-@erase "$(INTDIR)\IntergenMarkersCtrl.obj"
	-@erase "$(INTDIR)\intergenProcess.obj"
	-@erase "$(INTDIR)\itemeditdialogs.obj"
	-@erase "$(INTDIR)\LangModelsDoc.obj"
	-@erase "$(INTDIR)\ListComment.obj"
	-@erase "$(INTDIR)\ListTestData.obj"
	-@erase "$(INTDIR)\logwindow.obj"
	-@erase "$(INTDIR)\Monad.obj"
	-@erase "$(INTDIR)\nullwindow.obj"
	-@erase "$(INTDIR)\PageAffixes.obj"
	-@erase "$(INTDIR)\PageAnaProcessing.obj"
	-@erase "$(INTDIR)\PageCategoryProp.obj"
	-@erase "$(INTDIR)\pagecatfinalmodifytests.obj"
	-@erase "$(INTDIR)\PageDictAffixes.obj"
	-@erase "$(INTDIR)\PageDictMethod.obj"
	-@erase "$(INTDIR)\PageDisclaimer.obj"
	-@erase "$(INTDIR)\PageFinalCatTest.obj"
	-@erase "$(INTDIR)\PageInputDocPanels.obj"
	-@erase "$(INTDIR)\PageLocations.obj"
	-@erase "$(INTDIR)\PageRootUnifiedDict.obj"
	-@erase "$(INTDIR)\PageSrcTextProcessing.obj"
	-@erase "$(INTDIR)\ParseCSImpl.obj"
	-@erase "$(INTDIR)\PathCtrl.obj"
	-@erase "$(INTDIR)\PhonruleModel.obj"
	-@erase "$(INTDIR)\PhraseParser.obj"
	-@erase "$(INTDIR)\PrefsInputDoc.obj"
	-@erase "$(INTDIR)\PrintANA.obj"
	-@erase "$(INTDIR)\processingPrefs.obj"
	-@erase "$(INTDIR)\processoutput.obj"
	-@erase "$(INTDIR)\ProcessSequence.obj"
	-@erase "$(INTDIR)\ProjectDoc.obj"
	-@erase "$(INTDIR)\projectImportCode.obj"
	-@erase "$(INTDIR)\QuickParseDoc.obj"
	-@erase "$(INTDIR)\QuickParseView.obj"
	-@erase "$(INTDIR)\remoteHandlers.obj"
	-@erase "$(INTDIR)\RemoveLanguage.obj"
	-@erase "$(INTDIR)\SafeStream.obj"
	-@erase "$(INTDIR)\SDFEdit.obj"
	-@erase "$(INTDIR)\SDialog.obj"
	-@erase "$(INTDIR)\SEdit.obj"
	-@erase "$(INTDIR)\SentransModel.obj"
	-@erase "$(INTDIR)\SentransProcess.obj"
	-@erase "$(INTDIR)\SheetLangProperties.obj"
	-@erase "$(INTDIR)\SheetModifyTests.obj"
	-@erase "$(INTDIR)\SimpleProgressBar.obj"
	-@erase "$(INTDIR)\Splitter.obj"
	-@erase "$(INTDIR)\StampModel.obj"
	-@erase "$(INTDIR)\StampProcess.obj"
	-@erase "$(INTDIR)\StaticFilespec.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\TabbedTreeChild.obj"
	-@erase "$(INTDIR)\TabbedTreeDoc.obj"
	-@erase "$(INTDIR)\TestEdit.obj"
	-@erase "$(INTDIR)\TestEditModel.obj"
	-@erase "$(INTDIR)\TextDisplayInfo.obj"
	-@erase "$(INTDIR)\ToneGen.obj"
	-@erase "$(INTDIR)\ToneParse.obj"
	-@erase "$(INTDIR)\TransferModelSet.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\WizBaseClasses.obj"
	-@erase "$(INTDIR)\WizCMenuPage.obj"
	-@erase "$(INTDIR)\wizLangProps.obj"
	-@erase "$(INTDIR)\WizNewFromCarla.obj"
	-@erase "$(INTDIR)\WizNewFromFiles.obj"
	-@erase "$(INTDIR)\WizNewFromScratch.obj"
	-@erase "$(INTDIR)\wizProjectPage.obj"
	-@erase "$(OUTDIR)\CStudio.exe"
	-@erase "$(OUTDIR)\CStudio.ilk"
	-@erase "$(OUTDIR)\CStudio.pdb"

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c
MTL_PROJ=/nologo /D "_DEBUG" /win32
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CStudio.res" /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CStudio.bsc"
BSC32_SBRS= \

LINK32=link.exe
LINK32_FLAGS=CStudioProcessorLib.lib CSUtils.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\CStudio.pdb" /debug /machine:I386 /out:"$(OUTDIR)\CStudio.exe" /pdbtype:sept /libpath:"..\CarlaStudio\CStudio\CS Utility DLL\Debug" /libpath:"..\CarlaStudio\CStudio\CStudioProcessorLib\Debug"
LINK32_OBJS= \
	"$(INTDIR)\AmpleDLLProcess.obj" \
	"$(INTDIR)\AmpleDLLWrapper.obj" \
	"$(INTDIR)\AmpleProcess.obj" \
	"$(INTDIR)\AmpleResult.obj" \
	"$(INTDIR)\ANACount.obj" \
	"$(INTDIR)\BatchProcess.obj" \
	"$(INTDIR)\CarlaLanguage.obj" \
	"$(INTDIR)\CarlaStudioApp.obj" \
	"$(INTDIR)\CCProcess.obj" \
	"$(INTDIR)\Class.obj" \
	"$(INTDIR)\codetable.obj" \
	"$(INTDIR)\colorbtn.obj" \
	"$(INTDIR)\Conversion.obj" \
	"$(INTDIR)\CreditStatic.obj" \
	"$(INTDIR)\cstudioAssert.obj" \
	"$(INTDIR)\CStudioMainFrm.obj" \
	"$(INTDIR)\CWAnalysisModel.obj" \
	"$(INTDIR)\CWAtomicTypes.obj" \
	"$(INTDIR)\CWCarlaMenu.obj" \
	"$(INTDIR)\CWFormView.obj" \
	"$(INTDIR)\CWFunctionalInterface.obj" \
	"$(INTDIR)\CWHeadingView.obj" \
	"$(INTDIR)\CWInterface.obj" \
	"$(INTDIR)\CWList.obj" \
	"$(INTDIR)\CWListCtrl.obj" \
	"$(INTDIR)\CWListView.obj" \
	"$(INTDIR)\CWModel.obj" \
	"$(INTDIR)\cwprocess.obj" \
	"$(INTDIR)\CWTabBar.obj" \
	"$(INTDIR)\CWTopic.obj" \
	"$(INTDIR)\cwtopictreeview.obj" \
	"$(INTDIR)\CWTopicView.obj" \
	"$(INTDIR)\DirDialog.obj" \
	"$(INTDIR)\DlgBatchProcess.obj" \
	"$(INTDIR)\DlgCCProcess.obj" \
	"$(INTDIR)\DlgChooseProcessor.obj" \
	"$(INTDIR)\DlgEditAmpleDLLProcess.obj" \
	"$(INTDIR)\DlgEditAmpleProcess.obj" \
	"$(INTDIR)\DlgEditIntergenProcess.obj" \
	"$(INTDIR)\DlgEditPrintANA.obj" \
	"$(INTDIR)\DlgEditRegSoundChange.obj" \
	"$(INTDIR)\DlgEditSentransDisambig.obj" \
	"$(INTDIR)\DlgEditSentransProcess.obj" \
	"$(INTDIR)\DlgEditSentransTransfer.obj" \
	"$(INTDIR)\DlgEditStampFlag.obj" \
	"$(INTDIR)\DlgEditStampLexChange.obj" \
	"$(INTDIR)\DlgEditStampProcess.obj" \
	"$(INTDIR)\DlgEditStampTransfer.obj" \
	"$(INTDIR)\DlgEditTestColor.obj" \
	"$(INTDIR)\DlgEditToneGenProcess.obj" \
	"$(INTDIR)\DlgEditToneParseProcess.obj" \
	"$(INTDIR)\DlgEditToneTracing.obj" \
	"$(INTDIR)\DlgEnvConstrainedRule.obj" \
	"$(INTDIR)\DlgEnvironments.obj" \
	"$(INTDIR)\DlgFind.obj" \
	"$(INTDIR)\DlgManualParseChoice.obj" \
	"$(INTDIR)\DlgNewLanguage.obj" \
	"$(INTDIR)\DlgPhonruleRule.obj" \
	"$(INTDIR)\DlgProcessSequence.obj" \
	"$(INTDIR)\dlgprogress.obj" \
	"$(INTDIR)\dlgprojectopenorcreate.obj" \
	"$(INTDIR)\DlgSentransDirective.obj" \
	"$(INTDIR)\DlgTipDay.obj" \
	"$(INTDIR)\EditListCtrl.obj" \
	"$(INTDIR)\EnvironConstrainedRuleLists.obj" \
	"$(INTDIR)\EnvironmentListCtrl.obj" \
	"$(INTDIR)\FileListCtrl.obj" \
	"$(INTDIR)\FlatButton.obj" \
	"$(INTDIR)\FormButton.obj" \
	"$(INTDIR)\GuruHeaderCtrl.obj" \
	"$(INTDIR)\GuruSplash.obj" \
	"$(INTDIR)\Hook.obj" \
	"$(INTDIR)\InPlaceEdit.obj" \
	"$(INTDIR)\InputDoc.obj" \
	"$(INTDIR)\inputDocTabBar.obj" \
	"$(INTDIR)\inputDocView.obj" \
	"$(INTDIR)\IntergenMarkersCtrl.obj" \
	"$(INTDIR)\intergenProcess.obj" \
	"$(INTDIR)\itemeditdialogs.obj" \
	"$(INTDIR)\LangModelsDoc.obj" \
	"$(INTDIR)\ListComment.obj" \
	"$(INTDIR)\ListTestData.obj" \
	"$(INTDIR)\logwindow.obj" \
	"$(INTDIR)\Monad.obj" \
	"$(INTDIR)\nullwindow.obj" \
	"$(INTDIR)\PageAffixes.obj" \
	"$(INTDIR)\PageAnaProcessing.obj" \
	"$(INTDIR)\PageCategoryProp.obj" \
	"$(INTDIR)\pagecatfinalmodifytests.obj" \
	"$(INTDIR)\PageDictAffixes.obj" \
	"$(INTDIR)\PageDictMethod.obj" \
	"$(INTDIR)\PageDisclaimer.obj" \
	"$(INTDIR)\PageFinalCatTest.obj" \
	"$(INTDIR)\PageInputDocPanels.obj" \
	"$(INTDIR)\PageLocations.obj" \
	"$(INTDIR)\PageRootUnifiedDict.obj" \
	"$(INTDIR)\PageSrcTextProcessing.obj" \
	"$(INTDIR)\ParseCSImpl.obj" \
	"$(INTDIR)\PathCtrl.obj" \
	"$(INTDIR)\PhonruleModel.obj" \
	"$(INTDIR)\PhraseParser.obj" \
	"$(INTDIR)\PrefsInputDoc.obj" \
	"$(INTDIR)\PrintANA.obj" \
	"$(INTDIR)\processingPrefs.obj" \
	"$(INTDIR)\ProcessSequence.obj" \
	"$(INTDIR)\ProjectDoc.obj" \
	"$(INTDIR)\projectImportCode.obj" \
	"$(INTDIR)\QuickParseDoc.obj" \
	"$(INTDIR)\QuickParseView.obj" \
	"$(INTDIR)\remoteHandlers.obj" \
	"$(INTDIR)\RemoveLanguage.obj" \
	"$(INTDIR)\SafeStream.obj" \
	"$(INTDIR)\SDFEdit.obj" \
	"$(INTDIR)\SDialog.obj" \
	"$(INTDIR)\SEdit.obj" \
	"$(INTDIR)\SentransModel.obj" \
	"$(INTDIR)\SentransProcess.obj" \
	"$(INTDIR)\SheetLangProperties.obj" \
	"$(INTDIR)\SheetModifyTests.obj" \
	"$(INTDIR)\SimpleProgressBar.obj" \
	"$(INTDIR)\Splitter.obj" \
	"$(INTDIR)\StampModel.obj" \
	"$(INTDIR)\StampProcess.obj" \
	"$(INTDIR)\StaticFilespec.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\TabbedTreeChild.obj" \
	"$(INTDIR)\TabbedTreeDoc.obj" \
	"$(INTDIR)\TestEdit.obj" \
	"$(INTDIR)\TestEditModel.obj" \
	"$(INTDIR)\TextDisplayInfo.obj" \
	"$(INTDIR)\ToneGen.obj" \
	"$(INTDIR)\ToneParse.obj" \
	"$(INTDIR)\TransferModelSet.obj" \
	"$(INTDIR)\WizBaseClasses.obj" \
	"$(INTDIR)\WizCMenuPage.obj" \
	"$(INTDIR)\wizLangProps.obj" \
	"$(INTDIR)\WizNewFromCarla.obj" \
	"$(INTDIR)\WizNewFromFiles.obj" \
	"$(INTDIR)\WizNewFromScratch.obj" \
	"$(INTDIR)\wizProjectPage.obj" \
	"$(INTDIR)\processoutput.obj" \
	"$(INTDIR)\CStudio.res" \
	".\Cc32.lib"

"$(OUTDIR)\CStudio.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetDir=.\Debug
SOURCE="$(InputPath)"
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\CStudio.exe" "$(OUTDIR)\CStudioCOM.tlb"
   copy .\Debug\cstudiocom.tlb .\Debug\cstudio.tlb
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ENDIF

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $<
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CStudio.dep")
!INCLUDE "CStudio.dep"
!ELSE
!MESSAGE Warning: cannot find "CStudio.dep"
!ENDIF
!ENDIF


!IF "$(CFG)" == "CStudio - Win32 Release" || "$(CFG)" == "CStudio - Win32 Debug"
SOURCE=.\source\AmpleDLLProcess.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\AmpleDLLProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\AmpleDLLProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\AmpleDLLWrapper.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\AmpleDLLWrapper.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\AmpleDLLWrapper.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\AmpleProcess.cpp

"$(INTDIR)\AmpleProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\AmpleResult.cpp

"$(INTDIR)\AmpleResult.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\ANACount.cpp

"$(INTDIR)\ANACount.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\BatchProcess.cpp

"$(INTDIR)\BatchProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CarlaLanguage.cpp

"$(INTDIR)\CarlaLanguage.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CarlaStudioApp.cpp

"$(INTDIR)\CarlaStudioApp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CCProcess.cpp

"$(INTDIR)\CCProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\Class.cpp

"$(INTDIR)\Class.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\codetable.cpp

"$(INTDIR)\codetable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\colorbtn.cpp

"$(INTDIR)\colorbtn.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\Conversion.cpp

"$(INTDIR)\Conversion.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\CreditStatic.cpp"

"$(INTDIR)\CreditStatic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\CStudio.rc

"$(INTDIR)\CStudio.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\source\cstudioAssert.cpp

"$(INTDIR)\cstudioAssert.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CStudioCOM.idl

!IF  "$(CFG)" == "CStudio - Win32 Release"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\CStudioCOM.tlb" /win32

"$(INTDIR)\CStudioCOM.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\CStudioCOM.tlb" /win32

"$(INTDIR)\CStudioCOM.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\CStudioMainFrm.cpp

"$(INTDIR)\CStudioMainFrm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWAnalysisModel.cpp

"$(INTDIR)\CWAnalysisModel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWAtomicTypes.cpp

"$(INTDIR)\CWAtomicTypes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWCarlaMenu.cpp

"$(INTDIR)\CWCarlaMenu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWFormView.cpp

"$(INTDIR)\CWFormView.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWFunctionalInterface.cpp

"$(INTDIR)\CWFunctionalInterface.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWHeadingView.cpp

"$(INTDIR)\CWHeadingView.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWInterface.cpp

"$(INTDIR)\CWInterface.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWList.cpp

"$(INTDIR)\CWList.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWListCtrl.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\CWListCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\CWListCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\CWListView.cpp

"$(INTDIR)\CWListView.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWModel.cpp

"$(INTDIR)\CWModel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\cwprocess.cpp

"$(INTDIR)\cwprocess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWTabBar.cpp

"$(INTDIR)\CWTabBar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWTopic.cpp

"$(INTDIR)\CWTopic.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\cwtopictreeview.cpp

"$(INTDIR)\cwtopictreeview.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\CWTopicView.cpp

"$(INTDIR)\CWTopicView.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\DirDialog.cpp"

"$(INTDIR)\DirDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgBatchProcess.cpp

"$(INTDIR)\DlgBatchProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgCCProcess.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgCCProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgCCProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgChooseProcessor.cpp

"$(INTDIR)\DlgChooseProcessor.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditAmpleDLLProcess.cpp

"$(INTDIR)\DlgEditAmpleDLLProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditAmpleProcess.cpp

"$(INTDIR)\DlgEditAmpleProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditIntergenProcess.cpp

"$(INTDIR)\DlgEditIntergenProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditPrintANA.cpp

"$(INTDIR)\DlgEditPrintANA.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditRegSoundChange.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditRegSoundChange.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditRegSoundChange.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditSentransDisambig.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditSentransDisambig.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditSentransDisambig.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditSentransProcess.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditSentransProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditSentransProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditSentransTransfer.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditSentransTransfer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditSentransTransfer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditStampFlag.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampFlag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampFlag.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditStampLexChange.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampLexChange.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampLexChange.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditStampProcess.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditStampTransfer.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampTransfer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditStampTransfer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEditTestColor.cpp

"$(INTDIR)\DlgEditTestColor.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditToneGenProcess.cpp

"$(INTDIR)\DlgEditToneGenProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditToneParseProcess.cpp

"$(INTDIR)\DlgEditToneParseProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgEditToneTracing.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditToneTracing.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEditToneTracing.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEnvConstrainedRule.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEnvConstrainedRule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEnvConstrainedRule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgEnvironments.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEnvironments.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgEnvironments.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgFind.cpp

"$(INTDIR)\DlgFind.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgManualParseChoice.cpp

"$(INTDIR)\DlgManualParseChoice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgNewLanguage.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgNewLanguage.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgNewLanguage.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgPhonruleRule.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgPhonruleRule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\DlgPhonruleRule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\DlgProcessSequence.cpp

"$(INTDIR)\DlgProcessSequence.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\dlgprogress.cpp

"$(INTDIR)\dlgprogress.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\dlgprojectopenorcreate.cpp

"$(INTDIR)\dlgprojectopenorcreate.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgSentransDirective.cpp

"$(INTDIR)\DlgSentransDirective.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\DlgTipDay.cpp

"$(INTDIR)\DlgTipDay.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\EditListCtrl.cpp"

"$(INTDIR)\EditListCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\EnvironConstrainedRuleLists.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\EnvironConstrainedRuleLists.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\EnvironConstrainedRuleLists.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\EnvironmentListCtrl.cpp

"$(INTDIR)\EnvironmentListCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\FileListCtrl.cpp"

"$(INTDIR)\FileListCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\FlatButton.cpp"

"$(INTDIR)\FlatButton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\FormButton.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\FormButton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\FormButton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE="..\CarlaStudio\common code\GuruHeaderCtrl.cpp"

"$(INTDIR)\GuruHeaderCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\GuruSplash.cpp"

"$(INTDIR)\GuruSplash.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\Hook.cpp

"$(INTDIR)\Hook.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\InPlaceEdit.cpp"

"$(INTDIR)\InPlaceEdit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\InputDoc.cpp

"$(INTDIR)\InputDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\inputDocTabBar.cpp

"$(INTDIR)\inputDocTabBar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\inputDocView.cpp

"$(INTDIR)\inputDocView.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\IntergenMarkersCtrl.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\IntergenMarkersCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\IntergenMarkersCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\intergenProcess.cpp

"$(INTDIR)\intergenProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\itemeditdialogs.cpp

"$(INTDIR)\itemeditdialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\LangModelsDoc.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\LangModelsDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\LangModelsDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\ListComment.cpp

"$(INTDIR)\ListComment.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\ListTestData.cpp

"$(INTDIR)\ListTestData.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\logwindow.cpp

"$(INTDIR)\logwindow.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\Monad.cpp

"$(INTDIR)\Monad.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\nullwindow.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\nullwindow.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\nullwindow.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageAffixes.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageAffixes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageAffixes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageAnaProcessing.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageAnaProcessing.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageAnaProcessing.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageCategoryProp.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageCategoryProp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageCategoryProp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\pagecatfinalmodifytests.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\pagecatfinalmodifytests.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\pagecatfinalmodifytests.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageDictAffixes.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageDictAffixes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageDictAffixes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageDictMethod.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageDictMethod.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageDictMethod.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageDisclaimer.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageDisclaimer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageDisclaimer.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageFinalCatTest.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageFinalCatTest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageFinalCatTest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageInputDocPanels.cpp

"$(INTDIR)\PageInputDocPanels.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\PageLocations.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageLocations.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageLocations.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageRootUnifiedDict.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageRootUnifiedDict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\PageRootUnifiedDict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\PageSrcTextProcessing.cpp

"$(INTDIR)\PageSrcTextProcessing.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\ParseCSImpl.cpp

"$(INTDIR)\ParseCSImpl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\PathCtrl.cpp"

"$(INTDIR)\PathCtrl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\PhonruleModel.cpp

"$(INTDIR)\PhonruleModel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\PhraseParser.cpp

"$(INTDIR)\PhraseParser.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\PrefsInputDoc.cpp

"$(INTDIR)\PrefsInputDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\PrintANA.cpp

"$(INTDIR)\PrintANA.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\processingPrefs.cpp

"$(INTDIR)\processingPrefs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\ProcessSequence.cpp

"$(INTDIR)\ProcessSequence.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\ProjectDoc.cpp

"$(INTDIR)\ProjectDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\projectImportCode.cpp

"$(INTDIR)\projectImportCode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\QuickParseDoc.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\QuickParseDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\QuickParseDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\QuickParseView.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\QuickParseView.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\QuickParseView.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\remoteHandlers.cpp

"$(INTDIR)\remoteHandlers.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\RemoveLanguage.cpp

"$(INTDIR)\RemoveLanguage.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\SafeStream.cpp

"$(INTDIR)\SafeStream.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\SDFEdit.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\SDFEdit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\SDFEdit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\SDialog.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\SDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\SDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\SEdit.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\SEdit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\SEdit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\SentransModel.cpp

"$(INTDIR)\SentransModel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\SentransProcess.cpp

"$(INTDIR)\SentransProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\SheetLangProperties.cpp

"$(INTDIR)\SheetLangProperties.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\SheetModifyTests.cpp

"$(INTDIR)\SheetModifyTests.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\SimpleProgressBar.cpp"

"$(INTDIR)\SimpleProgressBar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\Splitter.cpp

"$(INTDIR)\Splitter.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\StampModel.cpp

"$(INTDIR)\StampModel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\StampProcess.cpp

"$(INTDIR)\StampProcess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE="..\CarlaStudio\common code\StaticFilespec.cpp"

"$(INTDIR)\StaticFilespec.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\StdAfx.cpp

"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\TabbedTreeChild.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\TabbedTreeChild.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\TabbedTreeChild.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\TabbedTreeDoc.cpp

"$(INTDIR)\TabbedTreeDoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\TestEdit.cpp

"$(INTDIR)\TestEdit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\TestEditModel.cpp

"$(INTDIR)\TestEditModel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\TextDisplayInfo.cpp

"$(INTDIR)\TextDisplayInfo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\ToneGen.cpp

"$(INTDIR)\ToneGen.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\ToneParse.cpp

"$(INTDIR)\ToneParse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\TransferModelSet.cpp

"$(INTDIR)\TransferModelSet.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\WizBaseClasses.cpp

"$(INTDIR)\WizBaseClasses.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\WizCMenuPage.cpp

"$(INTDIR)\WizCMenuPage.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\wizLangProps.cpp

"$(INTDIR)\wizLangProps.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\WizNewFromCarla.cpp

"$(INTDIR)\WizNewFromCarla.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\WizNewFromFiles.cpp

"$(INTDIR)\WizNewFromFiles.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\WizNewFromScratch.cpp

!IF  "$(CFG)" == "CStudio - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\WizNewFromScratch.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CStudio - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\CarlaStudio\common code" /I "..\carlastudio\cstudio\cs utility dll" /I "..\..\..\pc-parse\TonePGLib" /I ".." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\CStudio.pch" /YX"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c

"$(INTDIR)\WizNewFromScratch.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF

SOURCE=.\source\wizProjectPage.cpp

"$(INTDIR)\wizProjectPage.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\source\processoutput.cpp

"$(INTDIR)\processoutput.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF
