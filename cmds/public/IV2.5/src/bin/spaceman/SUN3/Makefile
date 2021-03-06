# Makefile generated by imake - do not edit!
# $XConsortium: imake.c,v 1.41 89/02/21 11:42:35 jim Exp $
#
# The cpp used on this machine replaces all newlines and multiple tabs and
# spaces in a macro expansion with a single space.  Imake tries to compensate
# for this, but is not always successful.
#

#
# "IVImake.tmpl" - generic imake template customized for InterViews
#
# You may change platform-specific parameters in the appropriate .cf
# configuration files.  You may set site-wide parameters in the file
# IVsite.def.  You may need a full rebuild if you change any parameters.
#

# architecture:  SUN3

# platform:  $XConsortium: sun.cf,v 1.7 89/03/02 13:28:18 jim Exp $
# operating system:   SunOS 3.5

#
# Generic make variables
#

            SHELL = /bin/sh

              TOP = ../../../../.

               AR = ar cq
  BOOTSTRAPCFLAGS =
  BOOTSTRAPCPUCMD = /bin/sh $(SCRIPTSRC)/cpu.sh $(IVCONFIGSRC)
  BOOTSTRAPMACROS = BOOTSTRAPCFLAGS='$(BOOTSTRAPCFLAGS)' DESTDIR='$(DESTDIR)' \
			EXTRA_CFLAGS='$(EXTRA_CFLAGS)'
               CC = cc
         COMPRESS = compress
              CPP = /lib/cpp $(STD_CPP_DEFINES)
    PREPROCESSCMD = cc -E $(STD_CPP_DEFINES)
           DEPEND = makedepend
         GENCLASS = genclass
            IMAKE = imake
          INSTALL = install
               LD = ld
             LINT = lint
      LINTLIBFLAG = -C
         LINTOPTS = -axz
               LN = ln -s
             MAKE = make X=$X
        MKDIRHIER = /bin/sh $(SCRIPTSRC)/mkdirhier.sh
               MV = mv
               CP = cp
           RANLIB = ranlib
  RANLIBINSTFLAGS =
               RM = rm -f
             TAGS = ctags
            TROFF = ptroff
  STD_CPP_DEFINES =
      STD_DEFINES =
 EXTRA_LOAD_FLAGS =
  EXTRA_LIBRARIES =

     INSTBINFLAGS = -m 0755
     INSTUIDFLAGS = -m 4755
     INSTLIBFLAGS = -m 0664
     INSTINCFLAGS = -m 0444
     INSTMANFLAGS = -m 0444
     INSTDATFLAGS = -m 0444
    INSTKMEMFLAGS = -m 4755

      CDEBUGFLAGS = -O -g
           CFLAGS = $(CDEBUGFLAGS) $(EXTRA_CFLAGS) \
			$(INCLUDES) $(STD_DEFINES) $(DEFINES)
        LINTFLAGS = $(LINTOPTS) $(INCLUDES) $(STD_DEFINES) $(DEFINES) -DLINT
          LDFLAGS = $(CDEBUGFLAGS) $(SYS_LIBRARIES) $(EXTRA_LIBRARIES)

        MACROFILE = sun.cf
        IMAKE_CMD = $(IMAKE) $(IMAKEOPTS) $(EXTRA_IMAKEOPTS)
           RM_CMD = $(RM) .emacs_* *.CKP *.ln *.BAK *.bak *.a *.o *..c ,* *~ \
			a.out core errs tags TAGS make.log make.out

#
# Project.tmpl - project-specific configuration file
#

          DESTDIR =

        USRLIBDIR = $(DESTDIR)/usr/local/lib
           BINDIR = $(DESTDIR)/usr/local/X11/bin
      LOCALBINDIR = $(DESTDIR)/usr/local/bin/
          INCROOT = $(DESTDIR)/usr/local/include

           INCDIR = $(INCROOT)/InterViews
     TEMPLATESDIR = $(INCDIR)/Templates
           LIBDIR = $(DESTDIR)/usr/local/lib/X11
        CONFIGDIR = $(LIBDIR)/config
      IVCONFIGDIR = $(CONFIGDIR)/InterViews
          MANPATH = $(DESTDIR)/usr/man
    MANSOURCEPATH = $(MANPATH)/man
           MANDIR = $(MANSOURCEPATH)n
        LIBMANDIR = $(MANSOURCEPATH)n

        CONFIGSRC = $(TOP)/config
      IVCONFIGSRC = $(CONFIGSRC)/InterViews
            IVSRC = $(TOP)/src
       INCLUDESRC = $(IVSRC)/InterViews
     TEMPLATESSRC = $(INCLUDESRC)/Templates
           BINSRC = $(IVSRC)/bin
         IMAKESRC = $(BINSRC)/imake
        SCRIPTSRC = $(BINSRC)/scripts
 LIBINTERVIEWSSRC = $(IVSRC)/libInterViews
    LIBGRAPHICSRC = $(IVSRC)/libgraphic
       LIBTEXTSRC = $(IVSRC)/libtext
           MANSRC = $(TOP)/man

        IMAKETMPL = "IVImake.tmpl"

        IMAKEOPTS = -T $(IMAKETMPL) -I$(IVCONFIGSRC) -I$(CONFIGSRC)

               CC = g++
               LD = g++
     DEPENDCFLAGS = $(CFLAGS) -I/usr/include/CC
     INSTPGMFLAGS = -s
     AFTERINSTALL = $(RM)

         INCLUDES = -I$(SRC) -I$(GEN) -I$(IVSRC) -I$(INCLUDESRC)/Std
        TEMPLATES = $(TEMPLATESSRC)

    LIBINTERVIEWS = $(LIBINTERVIEWSSRC)/$M/libInterViews$X.a
       LIBGRAPHIC = $(LIBGRAPHICSRC)/$M/libgraphic.a
          LIBTEXT = $(LIBTEXTSRC)/$M/libtext.a

             AOUT = a.out
              SRC = ..
              GEN = ../Generated
                M = SUN3
                X = X11

#
# spaceman - allegro object space manager
#

BINDIR		= $(LOCALBINDIR)
LOCAL_LIBRARIES	= $(LIBINTERVIEWS)

SRCS		= $(SRC)/*.c
OBJS		= \
	client.o \
	client_stub.o \
	manager.o

 PROGRAM = spaceman

all:: $(AOUT)

$(AOUT): $(OBJS) $(LOCAL_LIBRARIES)
	@echo "linking $@"
	-@if [ ! -w $@ ]; then $(RM) $@; else exit 0; fi
	$(CC) -o $@ $(OBJS) $(LOCAL_LIBRARIES) $(LDFLAGS) $(EXTRA_LOAD_FLAGS)

install:: $(AOUT)
	$(INSTALL) -c $(INSTPGMFLAGS) $(INSTALLFLAGS) $(AOUT) $(BINDIR)/$(PROGRAM)
	$(AFTERINSTALL) $(AOUT)

depend:: $(SRCS)
	$(DEPEND) -s "# DO NOT DELETE" -- $(DEPENDCFLAGS) -- $(SRCS)

clean::
	$(RM) $(AOUT)

client.o: $(SRC)/client.c
	@echo "compiling $(SRC)/client.c"
	$(RM) $@
	$(CC) -c  $(CFLAGS) $(SRC)/client.c

client_stub.o: $(SRC)/client_stub.c
	@echo "compiling $(SRC)/client_stub.c"
	$(RM) $@
	$(CC) -c  $(CFLAGS) $(SRC)/client_stub.c

manager.o: $(SRC)/manager.c
	@echo "compiling $(SRC)/manager.c"
	$(RM) $@
	$(CC) -c  $(CFLAGS) $(SRC)/manager.c

#
# Common rules for all Makefiles from "IVImake.tmpl" - do not edit.
#

clean::
	$(RM_CMD) \#*

Makefile::
	-@if [ -f Makefile ]; then \
	$(RM) Makefile.bak; \
	$(MV) Makefile Makefile.bak; \
	else exit 0; fi
	$(IMAKE_CMD) -DTOPDIR=$(TOP) -DInMachineDepSubdir -f $(SRC)/Imakefile

install::
Makefiles::

#
# dependencies generated by makedepend
#

# DO NOT DELETE

client.o: ../client.h ../../../.././src/InterViews/stub.h
client.o: ../../../.././src/InterViews/defs.h
client.o: ../../../.././src/InterViews/tag.h ../client_stub.h ../manager.h
client.o: ../../../.././src/InterViews/space.h
client.o: ../../../.././src/InterViews/catalog.h
client.o: ../../../.././src/InterViews/tagtable.h
client.o: ../../../.././src/InterViews/Std/stdio.h //usr/include/stdio.h
client.o: ../../../.././src/InterViews/Std/string.h
client_stub.o: ../client.h ../../../.././src/InterViews/stub.h
client_stub.o: ../../../.././src/InterViews/defs.h
client_stub.o: ../../../.././src/InterViews/tag.h ../client_stub.h
client_stub.o: ../../../.././src/InterViews/connection.h
client_stub.o: ../../../.././src/InterViews/spaceman.h
client_stub.o: ../../../.././src/InterViews/deputy.h
client_stub.o: ../../../.././src/InterViews/Std/stdio.h //usr/include/stdio.h
client_stub.o: ../../../.././src/InterViews/Std/string.h
manager.o: ../client.h ../../../.././src/InterViews/stub.h
manager.o: ../../../.././src/InterViews/defs.h
manager.o: ../../../.././src/InterViews/tag.h ../client_stub.h ../manager.h
manager.o: ../../../.././src/InterViews/space.h
manager.o: ../../../.././src/InterViews/spaceman.h
manager.o: ../../../.././src/InterViews/deputy.h
manager.o: ../../../.././src/InterViews/connection.h
manager.o: ../../../.././src/InterViews/catalog.h
manager.o: ../../../.././src/InterViews/tagtable.h
manager.o: ../../../.././src/InterViews/Std/os/fs.h
manager.o: ../../../.././src/InterViews/Std/stdio.h //usr/include/stdio.h
manager.o: ../../../.././src/InterViews/Std/stdlib.h
manager.o: ../../../.././src/InterViews/Std/string.h /usr/include/sys/file.h
manager.o: /usr/include/sys/fcntl.h
