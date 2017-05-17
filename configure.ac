AC_PREREQ([2.69])

AC_INIT([hello_c], [1.0.0], [])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([foreign dist-bzip2 subdir-objects 1.14])
AC_CONFIG_FILES([Makefile])
AM_SILENT_RULES([yes])

dnl AC_PROG_CC_C11 is the future...
AC_PROG_CC

dnl Configuration header
dnl Sanity test: check if the input template file exists in the current source tree
AC_CONFIG_SRCDIR([config.h.in])
dnl Autoheader will generate config.h.in at "autoreconf -i" time
dnl -DHAVE_CONFIG_H automatically added to the C compiler command line
AC_CONFIG_HEADERS([config.h])
dnl configure will generate the final config.h from config.h.in

dnl Taken from http://stackoverflow.com/a/28558338
AX_CHECK_COMPILE_FLAG([-std=c11], [
    CFLAGS+=" -std=c11"
], [
   echo "C compiler cannot compile C11 code."
   exit -1
])

AC_OUTPUT
