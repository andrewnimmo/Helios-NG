#-----------------------------------------------------------------------------
# Helios generic make system - GENERIC COMPONENT MAKEFILE -
#-----------------------------------------------------------------------------
# Helios generic component make rules for: buildrm demo
#
# File: /HSRC/demos/rmlib/buildrm/makefile
#
# These are the host/processor independent rules and variables for this
# component of Helios. It is included by the processor specific makefile
# That may add to some of its functionality. You should only alter this
# makefile by using "ifneq ($(HPROC),YYY)" clauses for a specific processor.
#
# SccsId: %W% %G%
# RcsId: $Id: makefile,v 1.3 1991/11/29 10:27:58 martyn Exp $
#		(C) Copyright 1990 Perihelion Software
#
# WARNING: assumes you are using GNUmake.
#-----------------------------------------------------------------------------

ifndef InProcMake
# This part of the makefile is run in the components generic source directory

# The variables HPROC, HHOST, HSRC, and HPROD should already be set by 
# your make script or environment, if not then get local defaults from
# $(HSRC)/makeinc/DFLT.mak. Note that the following pathname cannot use $(HSRC).
ifndef HPROC
include ../../makeinc/DFLT.mak
endif

.PHONY: notarget
notarget:
	@$(MAKE) -C $(HPROC)

.DEFAULT:
	@$(MAKE) -C $(HPROC) $@

else
#-----------------------------------------------------------------------------
# This part of the makefile is always run in a processor specific subdirectory.

# Manditory variables for a component:
# name of this dir relative to $(HSRC)
COMPONENT = demos/rmlib/buildrm

# Manditory includes
include $(HSRC)/makeinc/$(HHOST).mak	# Default host system variables
include $(HSRC)/makeinc/$(HPROC).mak	# Default processor rules and vars.

# Manditory phoney targets
.PHONY: default clean Xdefault Xclean
# "default"    - should make this component in its proc subdir
# "install"    - copy the new component to $(HPROD) production directory
# "installdef" - If component is a library, make .def file and install in LIB
# "clean"      - remove all intermediate and executable files from proc subdir
# Phoney targets prefixed by X are for adding processor specific targets.
#
# Processor specific sources are held in the processor specific subdir.,
# generic ones in the directory above it.
HVPATH := $(HSRC)/$(COMPONENT)

ifdef RSRC
HVPATH := $(RSRC)/$(COMPONENT)/$(HPROC):$(HSRC)/$(COMPONENT):$(RSRC)/$(COMPONENT)
endif

vpath %.h $(HVPATH)
vpath %.a $(HVPATH)
vpath %.c $(HVPATH)

#-----------------------------------------------------------------------------
# Generic component make rules and variables added below here

# Note all final generic targets here
TARGETS = buildrm

default : $(TARGETS) Xdefault

install	: installdef $(TARGETS) Xinstall
	-mkdir $(HPROD)/users/guest/examples/rmlib
	-mkdir $(HPROD)/users/guest/examples/rmlib/buildrm
	-rm -f $(HPROD)/users/guest/examples/rmlib/buildrm/*
	cp $(HSRC)/$(COMPONENT)/buildrm.c $(HPROD)/users/guest/examples/rmlib/buildrm
	cp $(HSRC)/$(COMPONENT)/readme $(HPROD)/users/guest/examples/rmlib/buildrm
	cp $(HSRC)/$(COMPONENT)/makefile.hel $(HPROD)/users/guest/examples/rmlib/buildrm/makefile
	$(TOUCH) install

installdef:	# If this is a library, enter all .def files here (to install)
	$(TOUCH) installdef

clean	: Xclean
	-$(RM)	$(OBJECTS) $(TARGETS) $(XOBJECTS) $(XTARGETS) mkout \
		core ../mkout install installdef Xinstall


#-----------------------------------------------------------------------------
# for archive, backup and cleaning purposes,
# note all generic SOURCE and OBJECT files:

# Note all sources
SOURCES		= $(SOURCES.c) $(SOURCES.a) \
		  $(HEADERS.c) $(HEADERS.m) \
		  $(SOURCES.odd)

#Full set of library object files
#OBJECTS		= $(SOURCES.c:.c=.p) $(SOURCES.a:.a=.p)
# Or if you are not a library:
OBJECTS	= $(SOURCES.c:.c=.o) $(SOURCES.a:.a=.o)

# C source files
SOURCES.c	=	buildrm.c

# AMPP source files
SOURCES.a	=

# C header files
HEADERS.c	=	

# AMPP macro files
HEADERS.m	=

# Any other source files
SOURCES.odd	= makefile makefile.hel readme


#-----------------------------------------------------------------------------
# Other generic component variables:

# Set any flags required
ifeq ($(HPROC),ARM)
  NCFLAGS := $(NCFLAGS)
else
  NCFLAGS := $(NCFLAGS)
endif

# Note any library def files to be linked with
LIBDEFS	:= -l$(LIB)/helios.lib -l$(LIB)/c.lib -l$(LIB)/RmLib.def

LINKFLAGS := $(LINKFLAGS)

#-----------------------------------------------------------------------------
# Generic targets and their dependencies:

buildrm: buildrm.c
	$(CC) -c $< -o buildrm.o
	$(LINK) $(LINKFLAGS) -o buildrm $(LIB)/c0.o buildrm.o $(LIBDEFS)

#-----------------------------------------------------------------------------
endif #InProcMake	# This line must be at EOF

