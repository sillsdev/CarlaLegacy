#include "stdafx.h"

FILE* wrappedfopen(const char* filename, const char* mode)
{
	return fopen(filename, mode);
}

void wrappedfclose(FILE* f)
{
	fclose(f);
}

void wrappedfree(void* mem)
{
	free(mem);
}