AC_PREREQ([2.68])

AC_INIT([hello_c], [1.0], [])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([foreign dist-bzip2 subdir-objects 1.11])
AC_CONFIG_FILES([Makefile])
AM_SILENT_RULES([yes])

dnl AC_PROG_CC_C11 is the future...
AC_PROG_CC

dnl Taken from http://stackoverflow.com/a/28558338
AX_CHECK_COMPILE_FLAG([-std=c11], [
    CFLAGS+=" -std=c11"
], [
   echo "C compiler cannot compile C11 code."
   exit -1
])

PKG_CHECK_MODULES([CPPUTEST], [cpputest])

AC_OUTPUT

