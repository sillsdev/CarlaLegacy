/* CMDTIME.C - functions to support timing of commands
 ***************************************************************************
 *
 * void startCmdTiming(void)
 * void stopCmdTiming(void)
 * void showCmdTiming(void)
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>

#include "cmd.h"

#ifdef HAVE_SYS_TIME_H
#ifdef TIME_WITH_SYS_TIME
#include <time.h>
#endif
#include <sys/time.h>
#else
#include <time.h>
#endif
#ifdef HAVE_SYS_TIMES_H
#include <sys/times.h>
#endif
#ifdef HAVE_SYS_RESOURCE_H
#include <sys/resource.h>
#endif
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#else
#endif

#ifdef _WINDOWS
#undef MSDOS
#endif

#ifdef applec
#include <Events.h>
#ifdef MPW_PERF
#include <Perf.h>
extern TP2PerfGlobals ThePGlobals;		/* performance globals */
#endif
#endif

#ifdef _MSC_VER
#include <sys/timeb.h>		/* for MSDOS timing functions */
#endif

#ifdef HAVE_GETTIMEOFDAY
extern int gettimeofday();
#else
#ifdef HAVE_TIMES
extern long times P((struct tms *buffer));
#endif
#endif
#ifdef HAVE_GETRUSAGE
extern int getrusage P((int who, struct rusage *rusage));
#endif
/*
 *  timing variables
 */
#ifdef MACINTOSH
static long start, finish;
#endif

#ifdef _MSC_VER
struct _timeb start, finish;
#endif

#ifdef HAVE_GETTIMEOFDAY
static struct timeval t_start, t_finish;

#else
#ifdef HAVE_TIMES
extern long time();
static long startup, finish;
static struct tms tms_start, tms_finish;
#endif
#endif
#ifdef HAVE_GETRUSAGE
static struct rusage r_start, r_finish;
#endif

#ifdef applec
#pragma segment S_cmdlib
#endif

/*****************************************************************************
 * NAME
 *    startCmdTiming
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Set the startup times for timing a computation.
 * RETURN VALUE
 *    none
 */
void startCmdTiming()
{
#ifdef _MSC_VER
_ftime( &start );
#endif

#ifdef HAVE_GETTIMEOFDAY
struct timezone timezone;
gettimeofday(&t_start, &timezone);
#else
#ifdef HAVE_TIMES
startup = time((long *)NULL);
times( &tms_start );
#endif
#endif
#ifdef HAVE_GETRUSAGE
getrusage(RUSAGE_SELF, &r_start);
#endif

#ifdef MACINTOSH
start = TickCount();
#endif
}

/*****************************************************************************
 * NAME
 *    stopCmdTiming
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Set the stopping times for timing a computation.
 * RETURN VALUE
 *    none
 */
void stopCmdTiming()
{
#ifdef _MSC_VER
_ftime( &finish );
#endif

#ifdef HAVE_GETTIMEOFDAY
struct timezone timezone;
gettimeofday(&t_finish, &timezone);
#else
#ifdef HAVE_TIMES
finish = time((long *)NULL);
times( &tms_finish );
#endif
#endif
#ifdef HAVE_GETRUSAGE
getrusage(RUSAGE_SELF, &r_finish);
#endif

#ifdef MACINTOSH
finish = TickCount();
#endif
}

/*****************************************************************************
 * NAME
 *    showCmdTiming
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Display the elapsed time for a computation.
 * RETURN VALUE
 *    none
 */
void showCmdTiming()
{
#ifdef _MSC_VER
long elapse_sec;
int elapse_frac;

elapse_frac = finish.millitm - start.millitm;
if (elapse_frac < 0)
	{
	elapse_frac += 1000;
	++start.time;
	}
elapse_frac = (elapse_frac + 5) / 10;
elapse_sec  = finish.time - start.time;
fprintf(stderr, "  Elapsed time = %ld.%02d seconds",
					elapse_sec, elapse_frac );
#endif

#ifdef HAVE_GETTIMEOFDAY
long temp, sec, frac;
/*
 * print the elapsed time, converting microseconds to rounded off hundredths
 */
temp = t_finish.tv_usec - t_start.tv_usec;	/* double precision subtract */
if (temp < 0L)
	temp += 1000000L, --sec;
sec  = t_finish.tv_sec - t_start.tv_sec;
frac = temp / 10000L;				/* round off to hundredths */
temp %= 10000L;
if (temp >= 5000L)
	++frac;
if (frac > 100)
	frac -= 100, ++sec;
fprintf(stderr, "  Elapsed time = %ld.%02ld seconds", sec, frac);
#else
#ifdef HAVE_TIMES
#ifndef CLK_TCK
/* clock always ticks in 60ths of a second according to times(2) for A/UX */
#define CLK_TCK 60
#endif
long elapse, delta, sec, frac;

if ((startup != -1L) && (finish != -1L))
	{
	elapse = finish - startup;
	delta = tms_finish.tms_utime - tms_start.tms_utime;
	delta += tms_finish.tms_stime - tms_start.tms_stime;
	if ((elapse * CLK_TCK) < delta)
	++elapse;
	fprintf(stderr, "  Elapsed time = %ld seconds", elapse);

	delta = tms_finish.tms_utime - tms_start.tms_utime;
	sec = delta / CLK_TCK;
	frac = (100 * (delta % CLK_TCK)) / CLK_TCK;
	fprintf(stderr, "  (CPU time = %ld.%02ldu", sec, frac);

	delta = tms_finish.tms_stime - tms_start.tms_stime;
	sec = delta / CLK_TCK;
	frac = (100 * (delta % CLK_TCK)) / CLK_TCK;
	fprintf(stderr, " + %ld.%02lds)", sec, frac);
	}
#endif
#endif
#ifdef HAVE_GETRUSAGE
/*
 *  follow the same algorithm for printing the user and system times
 */
temp = r_finish.ru_utime.tv_usec - r_start.ru_utime.tv_usec;
if (temp < 0L)					/* double precision subtract */
	temp += 1000000L, --sec;
sec  = r_finish.ru_utime.tv_sec - r_start.ru_utime.tv_sec;
frac = temp / 10000L;				/* round off to hundredths */
temp %= 10000L;
if (temp > 5000L)
	++frac;
if (frac > 100)
	frac -= 100, ++sec;
fprintf(stderr, "  (CPU time = %ld.%02ldu", sec, frac);

temp = r_finish.ru_stime.tv_usec - r_start.ru_stime.tv_usec;
if (temp < 0L)					/* double precision subtract */
	temp += 1000000L, --sec;
sec  = r_finish.ru_stime.tv_sec - r_start.ru_stime.tv_sec;
frac = temp / 10000L;				/* round off to hundredths */
temp %= 10000L;
if (temp > 5000L)
	++frac;
if (frac > 100)
	frac -= 100, ++sec;
fprintf(stderr, " + %ld.%02lds)", sec, frac);
#endif

#ifdef MACINTOSH
/* clock always ticks in 60ths of a second */
#define CLK_TCK 60
long elapse, sec, frac;

elapse = finish - start;
sec = elapse / CLK_TCK;
frac = (100 * (elapse % CLK_TCK)) / CLK_TCK;
fprintf(stderr, "  Elapsed time = %ld.%02ld seconds", sec, frac);
#endif

fprintf(stderr, "\n");
}
