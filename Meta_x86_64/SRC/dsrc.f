
 ~mak/lib/fpc.f 

 REQUIRE forth ~mak/lib/caseins.f
\+ CASE-INS  CASE-INS ON
\- IMAGE-BEGIN ' IMGLIT VALUE IMAGE-BEGIN

CREATE SEG_DT
  0 , 0 ,
 -1 ,  0 , -1 ,  0 , -1 ,  0 , -1 ,  0 , -1 , 0 , -1 ,  0 , -1 ,
 -1 ,  0 , -1 ,  0 , -1 ,  0 , -1 ,  0 , -1 , 0 , -1 ,  0 , -1 ,
HERE
  0 , -1 ,
CONSTANT SEG_DT_END


: T> ( tadr -- madr )
 SEG_DT
 BEGIN  CELL+ CELL+  2DUP @ U<
 UNTIL 
 CELL- @ +
;

: >SEG_DT ( madr tadr -- )
 SEG_DT
 BEGIN  CELL+ CELL+  2DUP @ U<
 UNTIL  \  madr tadr dtadr
 DUP
 DUP CELL+ CELL+ SEG_DT_END OVER - CMOVE>
 >R
 TUCK - SWAP
 R> 2!
;

WARNING OFF
Meta_x86_64/mhead0.f

REQUIRE TC_?LIMIT ~mak/lib/THERE/STAT.F

\- 4+ : 4+ 4 + ;

Meta_x86_64/mhead.f

 MEM_MODE
 
 Meta_x86_64/SRC/tc.f 
