//LearnDLL.h


#define DllExport	__declspec( dllexport )
#define DllImport   __declspec( dllimport )

#include "string.h"

extern "C" {
DllExport const char * exportPointOne(void);
DllExport const char * exportPointTwo(void);
DllExport const char * exportPointThree(void);
}

/*    // PInvokeTest.cs

	class PlatformInvokeTest
	{
		[DllImport("msvcrt.dll")]
		public static extern int puts(string c);
		[DllImport("msvcrt.dll")]
		internal static extern int _flushall();

		public static void Main()
		{
			puts("Test");
			_flushall();
		}
	}
	*/