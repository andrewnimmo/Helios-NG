.ds PX \s-1POSIX\s+1 .ds UX \s-1UNIX\s+1 .ds AN \s-1ANSI\s+1
.TH GAWK 1 "May 28 1991" "Free Software Foundation" "Utility
Commands"  .SH  NAME gawk \- pattern scanning and processing
language .SH SYNOPSIS .B gawk [ .B \-W .I gawk-options  ]  [
.BI  \-F\^  fs  ]  [  .B  \-v  .IR  var  =  val  ] .B \-f .I
program-file [ .B \-\^\- ] file .\^.\^. .br .B gawk [ .B \-W
.I  gawk-options ] [ .BI \-F\^ fs ] [ .B \-v .IR var = val ]
[ .B \-\^\- ] .I program-text file .\^.\^.  .SH  DESCRIPTION
.I  Gawk  is  the  GNU  Project's  implementation of the AWK
programming language. It conforms to the definition  of  the
language  in the \*(PX 1003.2 Command Language And Utilities
Standard (draft 11). This version in turn is  based  on  the
description  in .IR "The AWK Programming Language" , by Aho,
Kernighan, and  Weinberger,  with  the  additional  features
defined in the System V Release 4 version of \*(UX .IR awk .
.I Gawk also provides some GNU-specific extensions. .PP  The
command  line consists of options to .I gawk itself, the AWK
program text (if not supplied via the .B  \-f  option),  and
values  to  be  made  available  in  the .B ARGC and .B ARGV
pre-defined AWK variables. .SH OPTIONS .PP .I  Gawk  accepts
the  following  options,  which  should  be available on any
implementation of the AWK language. .TP .BI \-F fs Use .I fs
for  the  input  field  separator  (the  value  of the .B FS
predefined  variable).  .TP  \fB\-v\fI  var\fR\^=\^\fIval\fR
Assign  the value .IR val , to the variable .IR var , before
execution of the program begins. Such  variable  values  are
available  to  the .B BEGIN block of an AWK program. .TP .BI
\-f " program-file" Read the AWK  program  source  from  the
file  .IR  program-file  , instead of from the first command
line argument. Multiple .B \-f options may be used.  .TP  .B
\-\^\-  Signal  the  end of options. This is useful to allow
further arguments to the AWK program itself to start with  a
``\-''.  This  is  mainly  for consistency with the argument
parsing convention used by most other  \*(PX  programs.  .PP
Following the \*(PX standard, .IR gawk -specific options are
supplied via arguments to the .B \-W option. Multiple .B \-W
options  may  be  supplied,  or  multiple  arguments  may be
supplied together  if  they  are  separated  by  commas,  or
enclosed  in  quotes  and  separated by white space. Case is
ignored in arguments to the .B \-W option. .PP  The  .B  \-W
option     accepts     the    following    arguments:    .TP
\w'\fBcopyright\fR'u+1n .B compat Run  in  .I  compatibility
mode.  In compatibility mode, .I gawk behaves identically to
\*(UX .IR awk ; none  of  the  GNU-specific  extensions  are
recognized. .TP .PD 0 .B copyleft .TP .PD .B copyright Print
the short version of the GNU copyright  information  message
on  the  error  output.  .TP  .B lint Provide warnings about
constructs that are dubious or  non-portable  to  other  AWK
implementations. .TP .B posix This turns on .I compatibility
mode, with the following additional  restrictions:  .RS  .TP
\w'\(bu'u+1n   \(bu   .B   \ex   escape  sequences  are  not
recognized. .TP \(bu The synonym .B func for the keyword  .B
function is not recognized. .TP \(bu The operators .B ** and
.B **= cannot be used in place of .B ^ and .BR ^= . .RE  .TP
.B  version  Print  version  information for this particular
copy of .I gawk on the error output. This is  useful  mainly
for knowing if the current copy of .I gawk on your system is
up to date  with  respect  to  whatever  the  Free  Software
Foundation  is  distributing.  .PP  Any  other  options  are
flagged as illegal,  but  are  otherwise  ignored.  .SH  AWK
PROGRAM  EXECUTION .PP An AWK program consists of a sequence
of   pattern-action   statements   and   optional   function
definitions. .RS .PP \fIpattern\fB { \fIaction statements\fB
}\fR  .br  \fBfunction  \fIname\fB(\fIparameter  list\fB)  {
\fIstatements\fB  }\fR  .RE  .PP  .I  Gawk  first  reads the
program source from the .IR program-file (s)  if  specified,
or  from  the first non-option argument on the command line.
The .B \-f option may be used multiple times on the  command
line.  .I  Gawk will read the program text as if all the .IR
program-file s  had  been  concatenated  together.  This  is
useful  for  building  libraries  of  AWK functions, without
having to include them in each new AWK
