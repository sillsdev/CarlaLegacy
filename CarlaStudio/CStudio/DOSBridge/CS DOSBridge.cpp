// CS DOSBridge.cpp
//

#include "stdafx.h"
#import <csautomation.tlb> no_namespace
#include <iostream.h>
#include <io.h>
#include <stdio.h>
#include "csautomation_i.c"
#include <assert.h>

void runVBBridge(LPCTSTR lspzThisEXEName, LPCTSTR lpszInPath);
void performTask(ITaskPtr& qTask);
void printAndWait(LPCTSTR lpszMsg);

void printAndWait(LPCTSTR lpszMsg)
{
	cerr << lpszMsg << "\nPress Enter\n";
	char z[10];
	cin.getline(z, 2);
}

int main(int argc, char* argv[])
{
	try
	{
		if(argc<2)
		{
			printAndWait("Usage: csDosBridge <inputFilePath>");
			return(1);
		}

		LPCTSTR lpszInPath = argv[1];
		if(-1 == _access(lpszInPath, 0))
		{
			cerr << "The file " << lpszInPath << " was not found.\n";
			printAndWait("");
			return(1);
		}

		//HKEY k;
		//::OpenRegKey(HKCU, "Software\\VB and VBA Program Settings\csBridge\Settings");

		char lpszSettings[MAX_PATH];
		strcpy(lpszSettings, lpszInPath);
		strcat(lpszSettings, ".csb");

		if(-1 == _access(lpszSettings, 0)) // if settings for this file are not found
		{
			runVBBridge(argv[0], lpszInPath);
			return(0);
		}

		// we have the task file
		HRESULT hr;
		hr = ::CoInitialize(NULL);
		if(FAILED(hr))
		{
			printAndWait("Couldn't initialize COM. How can that be?\n");
			return 1;
		}

		ITaskPtr qTask;
		hr = qTask.CreateInstance(CLSID_TaskImpl);
		if(FAILED(hr))
		{
			printAndWait("Couldn't create a TaskImpl.  Try reinstalling CarlaStudio.\n");
			return 1;
		}

		IPersistStreamInitPtr qPersist(qTask);
		// we don't need to check return values because this smart ptr will throw exceptions

		hr = qPersist->InitNew();
		assert(!FAILED(hr));

		_bstr_t bstrSettingsPath(lpszSettings);
		hr = qTask->Load(bstrSettingsPath);
		if(FAILED(hr))
		{
			printAndWait("Couldn't load settings file. Running csBridge\n");
			runVBBridge(argv[0], lpszInPath);
			return 0;
		}

		performTask(qTask);
	}
	catch(_com_error e)
	{
		cerr << e.Description() << "\n";
	}
	return 0;
}

void runVBBridge(LPCTSTR lspzThisEXEName, LPCTSTR lpszInputPath)
{
	// the problem with this is how to keep this running until VBBridge is done
	// so that we can tell shoebox when we're finished
//	exit(1);


	// assume it's in the same director as us

	char szCmd[MAX_PATH];

	#ifdef _DEBUG
		sprintf(szCmd, "d:\\dev\\cstudio\\csbridge\\csBridge.exe %s", lpszInputPath);
	#else
		sprintf(szCmd, "csBridge.exe %s", lpszInputPath);
	#endif
	if( WinExec(szCmd, SW_SHOW) < 31)
	{
		cerr << "Couldn't run csBridge.exe.  It should be on the path or in the same directory as " << lspzThisEXEName << "\n";
		printAndWait("");
		exit(1);
	}

}

void performTask(ITaskPtr& qTask)
{
	// error will be thrown as _com_errors and caught by our caller.
	HRESULT hr = qTask->Perform();
}