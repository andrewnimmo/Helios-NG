/*
 * C compiler file mcdep.h
 * Copyright (C) Acorn Computers Ltd., 1988.
 */

/*
 * RCS $Revision: 1.1 $ Codemist 5
 * Checkin $Date: 1995/05/19 11:38:17 $
 * Revising $Author: nickc $
 */

/*
 * (Interface for target-dependent part of local code generation).
 */

#ifndef _mcdep_h
#define _mcdep_h 1

#include <nlist.h>

#ifndef _globals_LOADED
  #error include "mcdep.h" out of place
  /* We need globals.h loaded first (host/options/target/defaults).     */
#endif
#ifndef _cgdefs_LOADED
#  include "cgdefs.h"
#endif
#ifndef _jopcode_LOADED
#  include "jopcode.h"
#endif

/***************************************************************************/
/*                Interface to the target code generator                   */
/***************************************************************************/

#ifdef TARGET_HAS_FP_LITERALS
#  ifndef fpliteral
  extern bool fpliteral(FloatCon *val, J_OPCODE op);
  /* Returns true if the argument value can be represented as a literal operand
   * in the expansion of the argument operation (passing this allows for the
   * possibility of changing the operation, eg ADD to SUB, to allow use of a
   * literal).
   */
#  endif
#endif

#ifndef immed_cmp
   extern bool immed_cmp(int32 n);
   /* False if this integer is to be a candidate to be held in a register through
    * loop optimisation.
    */
#endif

#ifdef TARGET_INLINES_MONADS
extern int32 target_inlinable(Binder *b, int32 nargs);
#endif

#ifndef alterscc
extern bool alterscc(Icode *ip);
#endif

extern RealRegister local_base(Binder *b);
/* Returns the base register to be used in accessing the object b (must be
 * local).
 */

extern int32 local_address(Binder *b);
/* Returns the offset from local_base(b) to be used in accessing object b.
 */

extern void setlabel(LabelNumber *l);
/* Sets the argument label at the current code position.
 * Although the idea of setlabel is target independent, it is in the mc-dep
 * interface because it back-patches code.
 * In the long term it should be in codebuf.c and call a target dependent
 * backpatch routine.
 */

extern void branch_round_literals(LabelNumber *m);

extern void show_instruction(J_OPCODE op, VRegInt r1, VRegInt r2, VRegInt m);

extern void localcg_reinit(void);       /* under threat (use J_ENTER)   */
extern void localcg_tidy(void);         /* ditto (use J_ENDPROC)        */

/***************************************************************************/
/*                Interface to the object code formatter                   */
/***************************************************************************/

extern void obj_codewrite(Symstr *name);

extern void obj_init(void);

#ifdef TARGET_IS_HELIOS                 /* of more general use?              */
extern void obj_makestubs(void);        /* AM: suggests split obj's into two */
#endif

extern void obj_header(void);

extern void obj_trailer(void);

extern void obj_common_start(Symstr *name);

extern void obj_common_end(void);

#ifdef TARGET_HAS_AOUT
extern void obj_stabentry(struct nlist *p);
#endif

#ifdef TARGET_IS_HELIOS      /* in flux */
extern int  suppress_module;
extern bool in_stubs;
extern bool is_function(Symstr *name);
extern void request_stub(Symstr *name);
#ifdef TARGET_IS_C40
extern void load_static_data_ptr(RealRegister r, bool iscode, Symstr * symbol );
#else
extern void load_static_data_ptr(RealRegister r, bool iscode );
#endif
#endif

#ifndef NO_ASSEMBLER_OUTPUT
/***************************************************************************/
/*                Interface to the assembly code generator                 */
/***************************************************************************/

extern void asm_header(void);
extern void asm_trailer(void);
extern void display_assembly_code(Symstr *);

#endif

/***************************************************************************/
/*                Interface to the debug table generator                   */
/***************************************************************************/

#define DBG_LINE 1           /* line info -- reduces peepholing     */
#define DBG_PROC 2           /* top level info -- no change to code */
#define DBG_VAR  4           /* local var info -- no leaf procs     */
#define DBG_ANY  (DBG_LINE|DBG_PROC|DBG_VAR)

#ifdef TARGET_HAS_DEBUGGER

/* Language independent type number, to be passed to dbg_tableindex */
#define DT_QINT      1
#define DT_HINT      2
#define DT_INT       3
#define DT_LINT      4
#define DT_UQINT     5
#define DT_UHINT     6
#define DT_UINT      7
#define DT_ULINT     8
#define DT_FLOAT     9
#define DT_DOUBLE   10
#define DT_EXTENDED 11
#define DT_COMPLEX  12
#define DT_LCOMPLEX 13
#define DT_QBOOL    14
#define DT_HBOOL    15
#define DT_BOOL     16
#define DT_LBOOL    17
#define DT_CHAR     18
#define DT_UCHAR    19
#define DT_MAX      19

  extern char dbg_name[4];
  extern int usrdbgmask;
#  define usrdbg(DBG_WHAT) (usrdbgmask & (DBG_WHAT))
  extern int32 dbg_tablesize(void);
  extern int32 dbg_tableindex(int32 dt_number);
  extern void *dbg_notefileline(FileLine fl);
  extern void dbg_addcodep(void *debaddr, int32 codeaddr);
  extern bool dbg_scope(BindListList *, BindListList *);

#ifdef TARGET_HAS_BSS
#    define DS_EXT 1  /* bits in stgclass argument of dbg_topvar */
#    define DS_BSS 2
#    define DS_CODE 4
#    define DS_REG 8
    extern void dbg_topvar(Symstr *name, int32 addr, TypeExpr *t, int stgclass,
                           FileLine fl);
#else
    extern void dbg_topvar(Symstr *name, int32 addr, TypeExpr *t, bool ext,
                           FileLine fl);
#endif
  extern void dbg_type(Symstr *name, TypeExpr *t);
  extern void dbg_proc(Symstr *name, TypeExpr *t, bool ext, FileLine fl);
#ifdef TARGET_IS_C40
  extern void dbg_locvar(Binder *name, FileLine fl, bool Narrow);
#else
  extern void dbg_locvar(Binder *name, FileLine fl);
#endif
  extern void dbg_locvar1(Binder *name);   /* used by F77 front-end */
  extern void dbg_commblock(Binder *name, SynBindList *members, FileLine fl);
  extern void dbg_enterproc(void);
  extern void dbg_bodyproc(void);
  extern void dbg_return(int32 addr);
  extern void dbg_xendproc(FileLine fl);
  extern void dbg_init(void);
#else
#  define usrdbg(DBG_WHAT)               0
#  define dbg_tablesize()                0
#  define dbg_tableindex(a)              0
#  define dbg_notefileline(a)            0
#  define dbg_init()
#  define dbg_scope(a,b)                 0
#  define dbg_addcodep(debaddr,codeaddr)
#  define dbg_enterproc()
#  define dbg_bodyproc()
#  define dbg_return(a)
#  define dbg_xendproc(a)
#  define dbg_type(a,b)
#  define dbg_proc(a,b,c,d)
#  define dbg_topvar(a,b,c,d,e)
#ifdef TARGET_IS_C40
#  define dbg_locvar(a,b,c)
#else
#  define dbg_locvar(a,b)
#endif
#  define dbg_locvar1(a)
#  define dbg_commblock(a, b, c)
#endif

/***************************************************************************/
/*                Target-dependent argument processing                     */
/***************************************************************************/

typedef enum { KW_NONE, KW_OK, KW_MISSINGARG, KW_BADARG } KW_Status;

extern KW_Status mcdep_keyword(const char *key, int *argp, char **argv);

extern bool mcdep_config_option(char name, char tail[]);

extern void config_init(void);

extern void mcdep_init(void);

#ifdef TARGET_IS_ACW
extern void mcdep_init2(void);
#endif

#ifdef TARGET_IS_HELIOS
extern void 	IOdebug( const char * format, ... );
/* extern void	debug( const char *, ... ); - conflicts with a debug type in cg.h */
extern char *	file_name( FILE * f );
#endif

#endif

/* end of mcdep.h */
