
extern hello
extern LibImageHandle
extern gST
extern Volume
extern gHiiDatabase

%define SVIEWLINK 0
%define DEFLAST 0

%define LSHIFT lessless
%define RSHIFT greatgreat
%define _1add CHARadd
%define INVERT NOT
%define _0save OFF
%define PERFORM loadEXECUTE
%define DROP DgreatS


%macro F_BUILD 4 ; Name CName FLine Flags
	dq	%2
	dd	%4,%3
	dq	DEFLAST	; Link einfügen  Insert Link
	%strlen namelen %1
%%nfa: db namelen	; Länge des Namensfeldes berechnen  Calculate length of name field
	db %1	; Namen anfügen  Insert name string

	%undef DEFLAST
	%define DEFLAST %%nfa

%endmacro

%macro CONSTANT_W 4 ; Name Value FLine Flags
	F_BUILD %1,%%cfa,%3,%4
%%cfa:	call	DOCONSTANT
	dq	%2
%endmacro

%macro VIEW_S 1 ; x   
%%VIEW:
	dq	SVIEWLINK,0
        %undef SVIEWLINK
        %define SVIEWLINK %%VIEW
%endmacro

%macro S_VIEW_PATH 1 \ Path
%%VIEW:
	dq	SVIEWLINK,-1
        %strlen namelen %1
	db namelen
	db %1
        %undef SVIEWLINK
        %define SVIEWLINK %%VIEW
%endmacro


%include "disk_nmt/ForthSrc/global.inc"

DEFAULT REL
SECTION .data

ALIGN 8
fimg:
%include "src_PRIMITIVES.i"
%include "src_VARS.i"
%include "src_HPROC.i"
%include "macroopt.i"
%include "NUMB_PARSE_IO.i"
%include "LITERAL.i"
%include "src_FIND_INTERP.i"
%include "INCLUDE.i"
%include "fstart.i"

IMGLIT:
	dq	.8
	dq	0	; flags FLine
	dq	0	; Link einfügen  Insert Link
        %define DEFLAST IMGLIT.9
.9:	db .8 - .7     ; Länge des Namensfeldes berechnen  Calculate length of name field
.7:	db "IMGLIT"    ; Namen anfügen  Insert name string
.8:	call	DOCONSTANT
	dq	IMGLIT

CONSTANT_W "&SYSTAB",gST,0,0
CONSTANT_W "&VOLUME",Volume,0,0
CONSTANT_W "&IMAGEHANDLE",LibImageHandle,0,0
CONSTANT_W "&HIIDATABASE",gHiiDatabase,0,0

%include "GHEADERS.i"

;CONSTANT_W "LASTSCANCODE", LastScanCode, 0, 0

ORIGVIEWLINK:
	call	DOCONSTANT
	dq	SVIEWLINK

FORTH_ORIG:
	call	DOCONSTANT
	dq	DEFLAST

FORTHsubWORDLIST:
	call	DOCREATE
.1:	dq	DEFLAST
.2:	dq	0	; link
	dq	.0
.0:	db	5
	db	"FORTH"   
VOCsubLIST:
	call	DOCREATE
	dq	FORTHsubWORDLIST.2

CONTEXT_SIZE: 
	call	DOCONSTANT
	dq	CONTEXT.1 - CONTEXT.0

CONTEXT:
	call DOCREATE
.0:	dq FORTHsubWORDLIST + 5 
	dq	15 DUP 0
.1:      dq	0

CURRENT:
; This variable holds the address of the word list to which new definitions are added.
	call DOCREATE
	dq FORTHsubWORDLIST + 5 

global fmaini
fmaini:
	call	DOCREATE
global fmain
fmain:
	push rbp
	mov  ecx, 0x100000
	mov  rdi, rcx
	call AllocatePool
	lea  rbp, [rax+0x100000-64]
	call FSTART
	mov  rcx, 0x234567
	mov  rdi, rax
	call hello
	pop  rbp
	ret


