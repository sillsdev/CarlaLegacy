#include <assert.h>
#include <windows.h>
#include "CSRemoteRegistry.h"
#include <stdio.h>
#include <io.h>

const UINT     wm_CSPublishParams = RegisterWindowMessage( "CSPublishParams" );
	const UINT     wm_InterlinearizeDoc = RegisterWindowMessage( "InterlinearizeDoc" );
	const UINT     wm_ProcessingDone = RegisterWindowMessage( "DoneProcessingDoc" );
	const UINT     wm_CarlaStudioPing = RegisterWindowMessage( "CarlaStudioPing" );


static LPCTSTR getExt(LPCTSTR lpszPath)
{
	static char ext[_MAX_EXT];

	char dir[_MAX_DIR];
	char fname[_MAX_FNAME];
	char drive[_MAX_DRIVE];

	ext[0] = '\0';
	if(lpszPath && *lpszPath)
	{	// TO DO: How to check for a valid-looking path?
		_splitpath( lpszPath, drive, dir, fname, ext );
	}

	return ext;
}


int reportParamError()
{
	printf("Error in arguments;  csremote (-i INPUTPATH) (-d (-t TEXTMARKER) (-a xxx yyy zzz) (-b) )\n\
-i InputPath. This is the file to process.  If this is omitted, CarlaStudio will process \
the document open in CarlaStudio\n\
-o OutputPath.  If this is omitted, CarlaStudio will place the output file in the same directory as the input.\n\
-d means remove de-interlinearize the file before parsing it.  Assumed if the file as extension 'itx' or -a option is given.\n\
-t TEXTMARKER Use this when the line containing text is different than the Intergen \
settings in CarlaStudio.\n\
-a xxx yyy zzz ... Analysis fields xxx, yyy, zzz. These will be stripped before text is \
parsed.  Use  this option when the analysis fields in the interlinear text are \
different from those specified in the Intergen settings in CarlaStudio.\n\
-b means batchFile mode, where, when de-interlinearizing, \
the file is not replaced but instead the path to the output file is written to \
C:\\windows\\temp\\csrmtprm.bat\
-n MAXBackups Use this to set the number of backups to keep (default is 5)");
	return 1;
}

enum {kErrorNoCarlaStudio = 50};

LONG sendMessage(UINT wmMessage, UINT nWParam)
{
	// not used const UINT     wm_ProcessFrontMostDoc = RegisterWindowMessage( "ProcessFrontmostDoc" );

	// force the system to create us a msg queue

	MSG m;
	PeekMessage(&m, NULL, WM_USER, WM_USER, PM_NOREMOVE);

	// Make sure CarlaStudio is Running
	PostMessage(HWND_BROADCAST, wm_CarlaStudioPing,
		NULL, GetCurrentThreadId());

	#define SECONDS_TO_WAIT_B4_MSG 10
	Sleep(100); // wait a tenth
	if(!PeekMessage(&m, NULL, wm_CarlaStudioPing, wm_CarlaStudioPing,  PM_REMOVE))
	{
		printf("Looking for running CarlaStudio application...(up to %d seconds)\n", SECONDS_TO_WAIT_B4_MSG);
		for(int i=0; i< SECONDS_TO_WAIT_B4_MSG; i++)
		{
			if(PeekMessage(&m, NULL, wm_CarlaStudioPing, wm_CarlaStudioPing,  PM_REMOVE))
				break;
			Sleep(1000);
		}
		if(i >= SECONDS_TO_WAIT_B4_MSG)
		{
			printf("CarlaStudio not responding.  Is it running?\n");
			return kErrorNoCarlaStudio;
		}
	}

	printf("CarlaStudio is working...\n");
	// send the message with our flags in the wparam, our thread id in the lparam
	PostMessage(HWND_BROADCAST, wmMessage,
		nWParam, GetCurrentThreadId());

	// wait for a response

	while(! GetMessage(&m, NULL, wm_ProcessingDone, wm_ProcessingDone) )
	{
		if(!WaitMessage())
			assert(FALSE);
	}

	return m.lParam; // using lParam as the error code
}

int main( int argc, char *argv[ ], char *envp[ ] )
{

	assert(wm_InterlinearizeDoc);
	assert(wm_ProcessingDone);
	assert(wm_CarlaStudioPing);
	assert(wm_CSPublishParams);

	long res;
	BOOL bDoDeinterlinearize = FALSE;
	BOOL bBatchFileMode = FALSE;	// does less in this mode but reports more, so that a batch file can have more control
	char *lpszInPath=NULL;
	int nMaxBaks = 5;

// Handle request to publish parameters to the registry
	if(argc > 1 && 0==strcmp(argv[1],"-publishParams"))
	{
		long lErrorCode = sendMessage(wm_CSPublishParams, 0);
		return lErrorCode;
	}

	// jdh 9/7/99 in case -o isn't specified, leave make the param blank
	res = addParamToRegistry("OutPath", "");
	if(res)
		return 20+res;

	// Handle other requests (interlineariz)
	for(int i=1; i< argc; i++)
	{
		if(0 == strcmp(argv[i],"-i"))
		{
			if(argc-1 <= i)
				return reportParamError();
			++i;
			lpszInPath = argv[i];
			res = addParamToRegistry("InPath", lpszInPath);
			if(res)
				return 20+res;

		}
		// BEGIN jdh 9/7/99 add output specification ability
		else if(0 == strcmp(argv[i],"-o"))
		{
			if(argc-1 <= i)
				return reportParamError();
			++i;
			res = addParamToRegistry("OutPath", argv[i]); // here it's the requested output path.  After processing, this reg param will hold the actual output path
			if(res)
				return 20+res;

		}
		// END jdh 9/7/99

		else if(0 == strcmp(argv[i],"-d"))	// deinterlinearize first
		{
			bDoDeinterlinearize = TRUE;
		}
		else if(0 == strcmp(argv[i],"-t"))	// text marker
		{
			if(argc-1 <= i)
				return reportParamError();
			++i;
			res = addParamToRegistry("TextMarker", argv[i]);
			if(res)
				return 20+res;
		}
		else if(0 == strcmp(argv[i],"-b"))	// batch file mode
		{
			bBatchFileMode = TRUE;
		}
		else if(0 == strcmp(argv[i],"-n"))	// text marker
		{
			if(argc-1 <= i)
				return reportParamError();
			++i;
			nMaxBaks = atoi(argv[i]);
			if(nMaxBaks < 0)
				nMaxBaks = 0;
		}
		else if(0 == strcmp(argv[i],"-a"))	// analysis fields
		{
			bDoDeinterlinearize = TRUE; // if they forget the -d, we still know what they want if they give the -a
			if(argc-1 <= i)	// better not be the last item in the param list
				return reportParamError();

			++i;	// skip over the -a
			char lpszAnalysisMarkers[_MAX_PATH];
			lpszAnalysisMarkers[0] = '\0';

			// collect all the fields following the -a
			while(i<argc && argv[i] && argv[i][0] != '-')
			{
				if(lpszAnalysisMarkers[0])	// insert a space, except at the beginning
					strcat(lpszAnalysisMarkers, " ");
				strcat(lpszAnalysisMarkers, argv[i++]);
			}
			--i; // the for loop will increment it back

			res = addParamToRegistry("AnalysisMarkers", lpszAnalysisMarkers);
			if(res)
				return 20+res;
		}
		else return reportParamError();
	}

	if(!bDoDeinterlinearize && 0==strcmp(getExt(lpszInPath), ".itx"))
		bDoDeinterlinearize = TRUE;


	//--------------------------------------------------------
	// SEND THE MESSAGE
	long lErrorCode = sendMessage(wm_InterlinearizeDoc, bDoDeinterlinearize?1:0);


	//--------------------------------------------------------
	// WORK WITH THE OUTPUTS

	// pass back the output path

	if(lErrorCode)
	{
		printf("csremote: CarlaStudio returned error %ld\n", lErrorCode);
		return lErrorCode;
	}

	char lpszActualOutputPath[_MAX_PATH+1];
	res = getStringParamFromRegistry("OutPath", lpszActualOutputPath, _MAX_PATH);
	if(res)
	{
		printf("No OutPath Found.\n");
		return 20+res;
	}

	if(bBatchFileMode)
	{
		if(lErrorCode)	// there was an error, so we have no output file
			remove("C:\\windows\\temp\\csrmtprm.bat");
		else
		{
			FILE* f=	fopen("C:\\windows\\temp\\csrmtprm.bat", "w");
			fprintf(f, "Set CSOutPath=%s\n", lpszActualOutputPath);
		}
	}
	else if(!lErrorCode && bDoDeinterlinearize && lpszInPath)
	{
		char lpszBakPath[_MAX_PATH+1];
		//sprintf(lpszBakPath, "%s.bak", lpszInPath); // leave the old extension, but add .bak
		int nMaxNumber = nMaxBaks + 1;// plus one because we always delete one of the files
							// if nMaxBaks is 3, then we go to 4 but delete file 1, leaving three around at any one time

		for(int i=1; i <= nMaxNumber; i++)
		{
			sprintf(lpszBakPath, "%s.%d.bak", lpszInPath, i);
			if(-1==_access(lpszBakPath, 00)) // if not found
				break;
		}
		if(i > nMaxNumber) // all numbers used up
			i = 1;

		// remove the next highest, so we can use that slot next time
		// that way, after, say, 1,2,3,4, we'll use 1 and delete 2, so next
		// time we'll use 2 and delete 3, etc.
		char lpszRemoveBakPath[_MAX_PATH+1];
		sprintf(lpszRemoveBakPath, "%s.%d.bak", lpszInPath, (i%nMaxNumber)+1);
		remove(lpszRemoveBakPath);

		// delete any old backup using this name
		remove(lpszBakPath);
		// change the name of the intput to that of the backup
		rename(lpszInPath, lpszBakPath);
		// change the name of the output to that of the input
		//rename(lpszActualOutputPath, lpszInPath);
		CopyFile(lpszActualOutputPath, lpszInPath, TRUE); // fail if exists

	}
	return int(lErrorCode);
}