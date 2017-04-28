# Comment like in a normal Makefile

bin_PROGRAMS = hello_c

# All files should be added so that make dist take them in the tarball
# We do a non-recursive make so add the path to each file too
hello_c_SOURCES = src/main.h \
                       src/main.c

# Flags that are needed for ALL targets in the Makefile:

# Flags for the C preprocessor
AM_CPPFLAGS = 
# Flags for the C compiler
AM_CFLAGS = -Wall -Wextra -Werror -pedantic

