# Comment like in a normal Makefile

bin_PROGRAMS = hello_c

# All files should be added so that make dist take them in the tarball
# We do a non-recursive make so add the path to each file too
hello_c_SOURCES = src/main.h \
                  src/main.c

# Flags needed for ALL targets in the Makefile
# C preprocessor
AM_CPPFLAGS = 
# C compiler
AM_CFLAGS = -Wall -Wextra -Werror -pedantic
