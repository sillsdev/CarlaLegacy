# Local additions to Autoconf macros.

## ----------------------------- ##
## Check for the "void" keyword. ##
## ----------------------------- ##

AC_DEFUN(opAC_C_VOID, [
AC_MSG_CHECKING([for void keyword])
AC_CACHE_VAL(ac_cv_c_void, [
AC_TRY_COMPILE([
void foo(x) int x; { ++x; }  void *nothing(x) char *x; { return x+1; }],
[char *p; void *v; foo(123); p = nothing("test"); v = nothing(p);],
ac_cv_c_void=yes, ac_cv_c_void=no)])dnl
AC_MSG_RESULT($ac_cv_c_void)
if test $ac_cv_c_void = yes; then
  AC_DEFINE(HAVE_VOID)
fi
])

## ------------------------------ ##
## Check for function prototypes. ##
## ------------------------------ ##

AC_DEFUN(opAC_C_PROTOTYPES, [
AC_MSG_CHECKING([for function prototypes])
AC_CACHE_VAL(ac_cv_prog_cc_proto, [
AC_TRY_COMPILE([
int test (int i, double x);
struct s1 {int (*f) (int a);};  struct s2 {int (*f) (double a);};],,
ac_cv_prog_cc_proto=yes, ac_cv_prog_cc_proto=no)])dnl
AC_MSG_RESULT($ac_cv_prog_cc_proto)
if test "$ac_cv_prog_cc_proto" = yes; then
  AC_DEFINE(HAVE_PROTOTYPES)
fi
])


## --------------------------------------------- ##
## If GNU C, define CFLAGS to maximize warnings. ##
## --------------------------------------------- ##

AC_DEFUN(opAC_C_WARNINGS, [
AC_REQUIRE([AC_PROG_CC])dnl
AC_MSG_CHECKING([for warning and ANSI flags])
if test "$ac_cv_prog_gcc" != yes; then
	AC_MSG_RESULT(only normal warnings)
	ANSIFLAGS=""
else
	# we don't want -pedantic on Mac OS X, where it gets ridiculous
	AC_CHECK_HEADER(AvailabilityMacros.h, OSX=yes, OSX=)
	CFLAGS="${CFLAGS} -Wall"
	if test "$OSX" = yes; then
		AC_MSG_RESULT([-Wall -ansi])
		ANSIFLAGS="-ansi"
	else
		AC_MSG_RESULT([-Wall -ansi -pedantic])
		ANSIFLAGS="-ansi -pedantic"
	fi
fi
])

## ------------------------------------------- ##
## check for copy without changing file times. ##
## ------------------------------------------- ##

AC_DEFUN(opAC_PROG_COPY,
[AC_CHECK_PROGS(COPYPROG, 'cp -p' cp)])

## ------------------------------------------- ##
## check for byacc before 'bison -y'.          ##
## ------------------------------------------- ##

AC_DEFUN(opAC_PROG_YACC,
[AC_CHECK_PROGS(YACC, byacc 'bison -y', yacc)])

## -------------------------------------------------------------------- ##
## check whether gettimeofday allows NULL pointer argument for timezone ##
## -------------------------------------------------------------------- ##

AC_DEFUN(opAC_STRUCT_TIMEZONE,
[AC_CACHE_CHECK(whether gettimeofday accepts NULL for timezone argument,
ac_cv_gettimeofday_accepts_null,
[AC_TRY_RUN([#include <sys/time.h>
int main(int argc, char ** argv)
{
struct timeval tv;
return gettimeofday(&tv, 0);
}], ac_cv_gettimeofday_accepts_null=yes, ac_cv_gettimeofday_accepts_null=no,
 ac_cv_gettimeofday_accepts_null=no)])
if test "$ac_cv_gettimeofday_accepts_null" = yes; then
  AC_DEFINE(GETTIMEOFDAY_ALLOWS_NULL_TZ)
fi
])
