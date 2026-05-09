\ https://github.com/Kostr/UEFI-Lessons/tree/master/UefiLessonsPkg/HIIAddRussianFont

\- }> : }>  HERE OVER - SWAP OR! ;
\- PLUCK : PLUCK 2 PICK ;

[IFNDEF] ,GUID>
: ,GUID>
\+ LAST_GUID  HERE TO LAST_GUID
  BASE @ HEX
  >IN @
  PARSE-NAME DROP 8  NUMBER? 0= THROW DROP L,
  >IN M! '-' PARSE 2DROP
 '-' PARSE NUMBER? 0= THROW DROP W,
 '-' PARSE NUMBER? 0= THROW DROP W,
 '-' PARSE NUMBER? 0= THROW DROP DUP 8 >> C, C,
  PARSE-NAME NUMBER? 0= THROW DROP
 DUP 8 >> DUP 8 >> DUP 8 >> DUP 8 >> DUP 8 >>
 C, C,	C, C,	C, C, 

  BASE !
;
[THEN]

HERE \ PackageList

,GUID>  9fe2f616-323c-45a7-a287-dfeff517cc66 \ gHIIAddRussianFontGuid

0 L, \ PackageLength

HERE  $07000000 L, \ EFI_HII_PACKAGE_SIMPLE_FONTS >> 24
$60 W, \ NumberOfNarrowGlyphs
1 W, \ NumberOfWideGlyphs

BASE @ HEX
400 W, 00 C, 60 C, 30 C, 00 C, fe C, 66 C, 62 C, 60 C, 68 C, 78 C, 68 C, 60 C, 60 C, 62 C, 66 C, fe C, 00 C, 00 C, 00 C, 00 C,
401 W, 00 C, 66 C, 66 C, 00 C, fe C, 66 C, 62 C, 60 C, 68 C, 78 C, 68 C, 60 C, 60 C, 62 C, 66 C, fe C, 00 C, 00 C, 00 C, 00 C,
402 W, 00 C, 00 C, 00 C, 00 C, fc C, 64 C, 60 C, 60 C, 6c C, 76 C, 66 C, 66 C, 66 C, 66 C, 66 C, e6 C, 0c C, 00 C, 00 C, 00 C,
403 W, 00 C, 0c C, 18 C, 00 C, fe C, 66 C, 62 C, 60 C, 60 C, 60 C, 60 C, 60 C, 60 C, 60 C, 60 C, f0 C, 00 C, 00 C, 00 C, 00 C,
404 W, 00 C, 00 C, 00 C, 00 C, 3c C, 66 C, c2 C, c0 C, c8 C, f8 C, c8 C, c0 C, c0 C, c2 C, 66 C, 3c C, 00 C, 00 C, 00 C, 00 C,
405 W, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, c6 C, c0 C, 60 C, 38 C, 0c C, 06 C, 06 C, c6 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
406 W, 00 C, 00 C, 00 C, 00 C, 3c C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 3c C, 00 C, 00 C, 00 C, 00 C,
407 W, 00 C, 66 C, 66 C, 00 C, 3c C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 3c C, 00 C, 00 C, 00 C, 00 C,
408 W, 00 C, 00 C, 00 C, 00 C, 0f C, 06 C, 06 C, 06 C, 06 C, 06 C, 06 C, 06 C, 06 C, c6 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
409 W, 00 C, 00 C, 00 C, 00 C, fc C, d8 C, d8 C, d8 C, d8 C, dc C, da C, da C, da C, da C, da C, dc C, 00 C, 00 C, 00 C, 00 C,
40a W, 00 C, 00 C, 00 C, 00 C, d8 C, d8 C, d8 C, d8 C, d8 C, fc C, da C, da C, da C, da C, da C, dc C, 00 C, 00 C, 00 C, 00 C,
40b W, 00 C, 00 C, 00 C, 00 C, fc C, 64 C, 60 C, 60 C, 60 C, 7c C, 66 C, 66 C, 66 C, 66 C, 66 C, e6 C, 00 C, 00 C, 00 C, 00 C,
40c W, 00 C, 0c C, 18 C, 00 C, e6 C, 66 C, 66 C, 6c C, 6c C, 78 C, 78 C, 6c C, 6c C, 66 C, 66 C, e6 C, 00 C, 00 C, 00 C, 00 C,
40d W, 00 C, 0c C, 18 C, 00 C, c6 C, c6 C, ce C, ce C, de C, de C, f6 C, f6 C, e6 C, e6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
40e W, 00 C, 6c C, 38 C, 00 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 7e C, 06 C, 06 C, 06 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
40f W, 00 C, 00 C, 00 C, 00 C, ee C, 6c C, 6c C, 6c C, 6c C, 6c C, 6c C, 6c C, 6c C, 6c C, 6c C, fe C, 10 C, 10 C, 00 C, 00 C,
410 W, 00 C, 00 C, 00 C, 00 C, 10 C, 38 C, 6c C, c6 C, c6 C, c6 C, fe C, c6 C, c6 C, c6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
411 W, 00 C, 00 C, 00 C, 00 C, fe C, 66 C, 62 C, 60 C, 60 C, 7c C, 66 C, 66 C, 66 C, 66 C, 66 C, fc C, 00 C, 00 C, 00 C, 00 C,
412 W, 00 C, 00 C, 00 C, 00 C, fc C, 66 C, 66 C, 66 C, 66 C, 7c C, 66 C, 66 C, 66 C, 66 C, 66 C, fc C, 00 C, 00 C, 00 C, 00 C,
413 W, 00 C, 00 C, 00 C, 00 C, fe C, 66 C, 62 C, 60 C, 60 C, 60 C, 60 C, 60 C, 60 C, 60 C, 60 C, f0 C, 00 C, 00 C, 00 C, 00 C,
414 W, 00 C, 00 C, 00 C, 00 C, 1e C, 36 C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, ff C, c3 C, 81 C, 00 C, 00 C,
415 W, 00 C, 00 C, 00 C, 00 C, fe C, 66 C, 62 C, 68 C, 68 C, 78 C, 68 C, 60 C, 60 C, 62 C, 66 C, fe C, 00 C, 00 C, 00 C, 00 C,
416 W, 00 C, 00 C, 00 C, 00 C, d6 C, d6 C, d6 C, d6 C, 7c C, 38 C, 38 C, 7c C, d6 C, d6 C, d6 C, d6 C, 00 C, 00 C, 00 C, 00 C,
417 W, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, 86 C, 06 C, 06 C, 3c C, 06 C, 06 C, 06 C, 86 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
418 W, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, ce C, ce C, de C, de C, f6 C, f6 C, e6 C, e6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
419 W, 00 C, 6c C, 38 C, 00 C, c6 C, c6 C, ce C, ce C, de C, de C, f6 C, f6 C, e6 C, e6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
41a W, 00 C, 00 C, 00 C, 00 C, e6 C, 66 C, 66 C, 6c C, 6c C, 78 C, 78 C, 6c C, 6c C, 66 C, 66 C, e6 C, 00 C, 00 C, 00 C, 00 C,
41b W, 00 C, 00 C, 00 C, 00 C, 1e C, 36 C, 36 C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, c6 C, 00 C, 00 C, 00 C, 00 C,
41c W, 00 C, 00 C, 00 C, 00 C, c6 C, ee C, fe C, fe C, d6 C, d6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
41d W, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, c6 C, c6 C, fe C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
41e W, 00 C, 00 C, 00 C, 00 C, 38 C, 6c C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 6c C, 38 C, 00 C, 00 C, 00 C, 00 C,
41f W, 00 C, 00 C, 00 C, 00 C, fe C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
420 W, 00 C, 00 C, 00 C, 00 C, fc C, 66 C, 66 C, 66 C, 66 C, 7c C, 60 C, 60 C, 60 C, 60 C, 60 C, f0 C, 00 C, 00 C, 00 C, 00 C,
421 W, 00 C, 00 C, 00 C, 00 C, 3c C, 66 C, c2 C, c0 C, c0 C, c0 C, c0 C, c0 C, c0 C, c2 C, 66 C, 3c C, 00 C, 00 C, 00 C, 00 C,
422 W, 00 C, 00 C, 00 C, 00 C, 7e C, 7e C, 5a C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 3c C, 00 C, 00 C, 00 C, 00 C,
423 W, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 7e C, 06 C, 06 C, 06 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
424 W, 00 C, 00 C, 00 C, 00 C, 38 C, 10 C, 7c C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, 7c C, 10 C, 38 C, 00 C, 00 C, 00 C, 00 C,
425 W, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, 6c C, 6c C, 38 C, 38 C, 6c C, 6c C, c6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
426 W, 00 C, 00 C, 00 C, 00 C, cc C, cc C, cc C, cc C, cc C, cc C, cc C, cc C, cc C, cc C, cc C, fe C, 06 C, 02 C, 00 C, 00 C,
427 W, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 7e C, 06 C, 06 C, 06 C, 06 C, 06 C, 00 C, 00 C, 00 C, 00 C,
428 W, 00 C, 00 C, 00 C, 00 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, fe C, 00 C, 00 C, 00 C, 00 C,
429 W, 00 C, 00 C, 00 C, 00 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, ff C, 03 C, 01 C, 00 C, 00 C,
42a W, 00 C, 00 C, 00 C, 00 C, f0 C, b0 C, b0 C, 30 C, 30 C, 3c C, 36 C, 36 C, 36 C, 36 C, 36 C, 7c C, 00 C, 00 C, 00 C, 00 C,
42b W, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, c6 C, c6 C, e6 C, d6 C, d6 C, d6 C, d6 C, d6 C, e6 C, 00 C, 00 C, 00 C, 00 C,
42c W, 00 C, 00 C, 00 C, 00 C, f0 C, 60 C, 60 C, 60 C, 60 C, 7c C, 66 C, 66 C, 66 C, 66 C, 66 C, fc C, 00 C, 00 C, 00 C, 00 C,
42d W, 00 C, 00 C, 00 C, 00 C, 78 C, cc C, 86 C, 06 C, 26 C, 3e C, 26 C, 06 C, 06 C, 86 C, cc C, 78 C, 00 C, 00 C, 00 C, 00 C,
42e W, 00 C, 00 C, 00 C, 00 C, cc C, d6 C, d6 C, d6 C, d6 C, f6 C, d6 C, d6 C, d6 C, d6 C, d6 C, cc C, 00 C, 00 C, 00 C, 00 C,
42f W, 00 C, 00 C, 00 C, 00 C, 7e C, cc C, cc C, cc C, cc C, 7c C, 6c C, 6c C, cc C, cc C, cc C, ce C, 00 C, 00 C, 00 C, 00 C,
430 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 78 C, 0c C, 0c C, 7c C, cc C, cc C, cc C, 76 C, 00 C, 00 C, 00 C, 00 C,
431 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 0c C, 78 C, c0 C, c0 C, fc C, c6 C, c6 C, c6 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
432 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, fc C, 66 C, 66 C, 7c C, 66 C, 66 C, 66 C, fc C, 00 C, 00 C, 00 C, 00 C,
433 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, fe C, 66 C, 62 C, 60 C, 60 C, 60 C, 60 C, f0 C, 00 C, 00 C, 00 C, 00 C,
434 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 3c C, 3c C, 6c C, 6c C, cc C, cc C, cc C, fe C, c6 C, 82 C, 00 C, 00 C,
435 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, c6 C, fe C, c0 C, c0 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
436 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, d6 C, d6 C, d6 C, 7c C, 7c C, d6 C, d6 C, d6 C, 00 C, 00 C, 00 C, 00 C,
437 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, 06 C, 1c C, 06 C, 06 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
438 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, ce C, de C, f6 C, e6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
439 W, 00 C, 00 C, 00 C, 00 C, 00 C, 6c C, 38 C, 00 C, c6 C, c6 C, ce C, de C, f6 C, e6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
43a W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, e6 C, 66 C, 6c C, 78 C, 78 C, 6c C, 66 C, e6 C, 00 C, 00 C, 00 C, 00 C,
43b W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 1e C, 36 C, 66 C, 66 C, 66 C, 66 C, 66 C, c6 C, 00 C, 00 C, 00 C, 00 C,
43c W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, c6 C, ee C, fe C, d6 C, d6 C, d6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
43d W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, fe C, c6 C, c6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
43e W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
43f W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, fe C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
440 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, dc C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, 7c C, 60 C, 60 C, f0 C, 00 C,
441 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, c0 C, c0 C, c0 C, c0 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
442 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7e C, 5a C, 18 C, 18 C, 18 C, 18 C, 18 C, 3c C, 00 C, 00 C, 00 C, 00 C,
443 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 7e C, 06 C, 06 C, 0c C, f8 C, 00 C,
444 W, 00 C, 00 C, 00 C, 00 C, 00 C, 10 C, 10 C, 10 C, 7c C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, 7c C, 10 C, 10 C, 10 C, 00 C,
445 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, 6c C, 38 C, 38 C, 6c C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
446 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, cc C, cc C, cc C, cc C, cc C, cc C, cc C, fe C, 06 C, 02 C, 00 C, 00 C,
447 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, c6 C, 7e C, 06 C, 06 C, 06 C, 00 C, 00 C, 00 C, 00 C,
448 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, fe C, 00 C, 00 C, 00 C, 00 C,
449 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, d6 C, ff C, 03 C, 01 C, 00 C, 00 C,
44a W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, f0 C, b0 C, 30 C, 3c C, 36 C, 36 C, 36 C, 7c C, 00 C, 00 C, 00 C, 00 C,
44b W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, c6 C, c6 C, c6 C, e6 C, d6 C, d6 C, d6 C, e6 C, 00 C, 00 C, 00 C, 00 C,
44c W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 78 C, 30 C, 30 C, 3c C, 36 C, 36 C, 36 C, 7c C, 00 C, 00 C, 00 C, 00 C,
44d W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, 06 C, 1e C, 06 C, 06 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
44e W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, cc C, d6 C, d6 C, f6 C, f6 C, d6 C, d6 C, cc C, 00 C, 00 C, 00 C, 00 C,
44f W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 3e C, 66 C, 66 C, 66 C, 3e C, 36 C, 66 C, e6 C, 00 C, 00 C, 00 C, 00 C,
450 W, 00 C, 00 C, 00 C, 00 C, 60 C, 30 C, 18 C, 00 C, 7c C, c6 C, c6 C, fe C, c0 C, c0 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
451 W, 00 C, 00 C, 00 C, 00 C, 00 C, cc C, cc C, 00 C, 7c C, c6 C, c6 C, fe C, c0 C, c0 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
452 W, 00 C, 00 C, 00 C, 00 C, 60 C, 60 C, f8 C, 60 C, 6c C, 76 C, 66 C, 66 C, 66 C, 66 C, 66 C, e6 C, 06 C, 06 C, 1c C, 00 C,
453 W, 00 C, 00 C, 00 C, 00 C, 0c C, 18 C, 30 C, 00 C, fe C, 66 C, 62 C, 60 C, 60 C, 60 C, 60 C, f0 C, 00 C, 00 C, 00 C, 00 C,
454 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, c0 C, f0 C, c0 C, c0 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
455 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 7c C, c6 C, 60 C, 38 C, 0c C, 06 C, c6 C, 7c C, 00 C, 00 C, 00 C, 00 C,
456 W, 00 C, 00 C, 00 C, 00 C, 18 C, 18 C, 00 C, 00 C, 38 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 3c C, 00 C, 00 C, 00 C, 00 C,
457 W, 00 C, 00 C, 00 C, 00 C, 00 C, 66 C, 66 C, 00 C, 38 C, 18 C, 18 C, 18 C, 18 C, 18 C, 18 C, 3c C, 00 C, 00 C, 00 C, 00 C,
458 W, 00 C, 00 C, 00 C, 00 C, 06 C, 06 C, 00 C, 00 C, 0e C, 06 C, 06 C, 06 C, 06 C, 06 C, 06 C, 06 C, 66 C, 66 C, 3c C, 00 C,
459 W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, fc C, d8 C, d8 C, dc C, da C, da C, da C, dc C, 00 C, 00 C, 00 C, 00 C,
45a W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, d8 C, d8 C, d8 C, fc C, da C, da C, da C, dc C, 00 C, 00 C, 00 C, 00 C,
45b W, 00 C, 00 C, 00 C, 00 C, 60 C, 60 C, f8 C, 60 C, 7c C, 66 C, 66 C, 66 C, 66 C, 66 C, 66 C, e6 C, 00 C, 00 C, 00 C, 00 C,
45c W, 00 C, 00 C, 00 C, 00 C, 0c C, 18 C, 30 C, 00 C, e6 C, 66 C, 6c C, 78 C, 78 C, 6c C, 66 C, e6 C, 00 C, 00 C, 00 C, 00 C,
45d W, 00 C, 00 C, 00 C, 00 C, 60 C, 30 C, 18 C, 00 C, c6 C, c6 C, ce C, de C, f6 C, e6 C, c6 C, c6 C, 00 C, 00 C, 00 C, 00 C,
45e W, 00 C, 00 C, 00 C, 00 C, 00 C, 6c C, 38 C, 00 C, c6 C, c6 C, c6 C, c6 C, c6 C, c6 C, 7e C, 06 C, 06 C, 0c C, f8 C, 00 C,
45f W, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, ee C, 6c C, 6c C, 6c C, 6c C, 6c C, 6c C, fe C, 10 C, 10 C, 00 C, 00 C,

BASE !

000 W, 00 C,
 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,
 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C, 00 C,
 00 C, 00 C, 00 C, 

 DUP CR .( SSS=) HERE OVER -  H. H.

 }>

$DF000004 L, \ (EFI_HII_PACKAGE_END >> 24) + 4
CR .( SSS=) HERE OVER - 2DUP H. H.
 OVER $10 + L!

 PAD \ Handle
 0   \ DriverHandle  OPTIONAL
 PLUCK \ PackageList
 &HIIDATABASE @
 DUP @ \ ->NewPackageList
 4XSYS THROW

\ נעיקופ
 DP !

