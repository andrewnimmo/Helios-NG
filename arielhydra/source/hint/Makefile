all:	hhost erase

IDIR = ${VC40DSP}/include
LDIR = ${VC40DSP}/lib
CFLAGS = -I${IDIR}

%: %.c ${LDIR}/libvc40.a
	cc -o $* -I${IDIR} -L${LDIR} $*.c -lvc40

