
\- OR!	:  OR! ( N ADDR -- )	DUP @ ROT OR	SWAP ! ;
\- AND!	: AND! ( N ADDR -- )	DUP @ ROT AND	SWAP ! ;

\- >>	: >> RSHIFT ;

: L+!  ( N ADDR -- )	DUP L@ ROT + SWAP L! ;
\- BOUNDS : BOUNDS OVER + SWAP ;
\- ?THROW : ?THROW SWAP IF THROW THEN DROP ;
\- ?PAIRS : ?PAIRS	( x1 x1 -- )  XOR -22 ?THROW ;

0 VALUE MSTR_IMG

: CMOVE ( c-addr1 c-addr2 u --- )
\ Copy u bytes starting at c-addr1 to c-addr2, proceeding in ascending
\ order.

   DUP IF  >R
   BEGIN
    OVER C@ SWAP DUP >R C!
    R> 1+ SWAP 1+ SWAP
    R>  1- DUP  >R 0=
   UNTIL
   R>
   THEN
   2DROP DROP
;

: cmove>	\ addr1 addr2 len --
  dup if
    tuck over + 1-			\ -- addr1 len addr2 addr2+len-1
    2swap + -rot			\ -- addr1+len addr2 addr2+len-1
    do  1- dup c@ i  c!  -1 +loop
    drop  exit
  THEN
  2drop drop
;
[then]

: move		\ addr1 addr2 u --
  -rot 2dup u<
  if  rot cmove>  else  rot cmove  THEN
;

: M_CMOVE ( c-addr1 c-addr2 u --- )
\ Copy u bytes starting at c-addr1 to c-addr2, proceeding in ascending
\ order.

   DUP IF  >R
   BEGIN
    OVER 
 MC@
 SWAP DUP >R
 C!
 R> 1+ SWAP 1+ SWAP
    R>  1- DUP  >R 0=
   UNTIL
   R>
   THEN
   2DROP DROP
;

[IFNDEF] #HEADER
: #HEADER ( cfa -- )
  HERE >R
  DP M! HEADER
 R> DP M! ;
[THEN]

[IFNDEF] ALIGN-NOP
: ALIGN-NOP ( n -- )
\ выровнять HERE на n и заполнить NOP
  HERE DUP ROT 2DUP
  MOD DUP IF - + ELSE 2DROP THEN
  OVER - DUP ALLOT 0x90 FILL
;
[THEN]

: XOR!	DUP @ ROT XOR SWAP ! ;

0 VALUE LAST_GUID
: ,GUID>
  HERE TO LAST_GUID
  BASE M@ HEX
  >IN M@
  PARSE-NAME DROP 8  NUMBER? 0= THROW DROP L,
  >IN M! '-' PARSE 2DROP
 '-' PARSE NUMBER? 0= THROW DROP W,
 '-' PARSE NUMBER? 0= THROW DROP W,
 '-' PARSE NUMBER? 0= THROW DROP DUP 8 >> C, C,
  PARSE-NAME NUMBER? 0= THROW DROP
 DUP 8 >> DUP 8 >> DUP 8 >> DUP 8 >> DUP 8 >>
 C, C,	C, C,	C, C, 

  BASE M!
;

: [,GUID>]
  HERE ,GUID> 
 DUP DP M!
  2@
 LIT, POSTPONE ,  LIT,  POSTPONE ,
; IMMEDIATE

: U$, 0 DO DUP MC@ W, 1+ LOOP DROP ;

: WSUM ( a1 a2  -- )
 0 -ROT DO I W@ + 2 +LOOP ;

: BSUM ( a1 a2  -- )
 0 -ROT DO I C@ + LOOP ;

MODULE: TC

: ><DP DP M@ T-DP M@
       DP M! T-DP M! ;

: IALLOT ALLOT ;

: TCONSTANT ( n -- ) ><DP CONSTANT   ><DP ;

: CONSTANT HERE THERE? IF TCONSTANT BREAK CONSTANT ;

0 VALUE 'DO-CONST

: #define  HERE THERE? IF ><DP #define ><DP BREAK #define ;

: MCREATE CREATE  ;

: CREATE
   HERE  \ $7 + $7 ANDC DUP DP M!
\  TCONSTANT ;
  CONSTANT ;

EXPORT

1 [IF]

' <PRE> >BODY M@  ' NOOP  TO <PRE> \ 

[DEFINED] DBG_COUNT [IF] DBG_COUNT M@  DBG_COUNT 0! [THEN]

[DEFINED] DBG_COUNT   [IF]  DBG_COUNT ! [THEN]

TO <PRE>

: T-STOP
  PREVIOUS DEFINITIONS
  HERE THERE?    IF ><DP THEN
;

: T-GO
[DEFINED] DBG_STOP [IF]  DBG_STOP [THEN]
  ALSO TC DEFINITIONS
  HERE THERE? 0= IF ><DP THEN
;

: THERE?A  IMAGE-BEGIN   U< ;
: THERE?B  'FSTART - $880000  U< ;

: TTH  ['] THERE?B TO THERE? ;

: SEG: ( len seg -- )
  HERE $14 + OVER >SEG_DT
  HERE TCONSTANT , DUP , IALLOT
\  HERE CONSTANT , DUP , IALLOT
  0 L,
 ; 

: SEG_SET
 M@ DP M!
;

0 VALUE T-STDOUT

: #TSAVE ( adr <filename> -- )
 CR ." TSAVE="
 PARSE-NAME W/O CREATE-FILE THROW  TO T-STDOUT
\ T> HERE DUP H. T-STDOUT WRITE-FILE ." WRITE-FILE=" H.
 T> HERE T> OVER - DUP H. T-STDOUT WRITE-FILE DROP
 T-STDOUT CLOSE-FILE DROP
;

: TSAVE ( <filename> -- ) 0 #TSAVE ;

0 VALUE FILE,ADR

[IFDEF] FILE-SIZE
: FILE, ( addr len -- )
   R/W OPEN-FILE THROW >R
   R@  FILE-SIZE THROW D>S
   HERE DUP TO FILE,ADR OVER R@ READ-FILE THROW
   IALLOT
    R> CLOSE-FILE THROW
;
[ELSE]
: FILE, ( addr len -- )
\ CR ." FILE,="
   R/W OPEN-FILE THROW >R
   HERE TO FILE,ADR
   BEGIN \ ." -"	
	HERE T> $1000 R@ READ-FILE THROW
	DUP IALLOT 0=
   UNTIL

    R> CLOSE-FILE THROW
;

[THEN]

;MODULE

: [T] ALSO TC ; IMMEDIATE

