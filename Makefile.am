bin_PROGRAMS = pspdod
pspdod_SOURCES = pspdod.cpp

# set the include path found by configure
AM_CPPFLAGS =  $(LIBSDL_CFLAGS) $(all_includes)

# the library search path.
pspdod_LDFLAGS = $(all_libraries) $(LIBSDL_RPATH)
pspdod_LDADD = $(LIBSDL_LIBS)
