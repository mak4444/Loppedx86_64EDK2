
 0 VALUE PPS_H
 0 VALUE EFI_IMG
 0 VALUE FvImage

#define EFI_FILE_HEADER_CONSTRUCTION  0x01
#define EFI_FILE_HEADER_VALID         0x02
#define EFI_FILE_DATA_VALID           0x04
#define EFI_FILE_MARKED_FOR_UPDATE    0x08
#define EFI_FILE_DELETED              0x10
#define EFI_FILE_HEADER_INVALID       0x20

#define EFI_FV_FILETYPE_ALL                    0x00
#define EFI_FV_FILETYPE_RAW                    0x01
#define EFI_FV_FILETYPE_FREEFORM               0x02
#define EFI_FV_FILETYPE_SECURITY_CORE          0x03
#define EFI_FV_FILETYPE_PEI_CORE               0x04
#define EFI_FV_FILETYPE_DXE_CORE               0x05
#define EFI_FV_FILETYPE_PEIM                   0x06
#define EFI_FV_FILETYPE_DRIVER                 0x07
#define EFI_FV_FILETYPE_COMBINED_PEIM_DRIVER   0x08
#define EFI_FV_FILETYPE_APPLICATION            0x09
#define EFI_FV_FILETYPE_MM                     0x0A
#define EFI_FV_FILETYPE_SMM                    EFI_FV_FILETYPE_MM
#define EFI_FV_FILETYPE_FIRMWARE_VOLUME_IMAGE  0x0B
#define EFI_FV_FILETYPE_COMBINED_MM_DXE        0x0C
#define EFI_FV_FILETYPE_COMBINED_SMM_DXE       EFI_FV_FILETYPE_COMBINED_MM_DXE
#define EFI_FV_FILETYPE_MM_CORE                0x0D
#define EFI_FV_FILETYPE_SMM_CORE               EFI_FV_FILETYPE_MM_CORE
#define EFI_FV_FILETYPE_MM_STANDALONE          0x0E
#define EFI_FV_FILETYPE_MM_CORE_STANDALONE     0x0F
#define EFI_FV_FILETYPE_OEM_MIN                0xc0
#define EFI_FV_FILETYPE_OEM_MAX                0xdf
#define EFI_FV_FILETYPE_DEBUG_MIN              0xe0
#define EFI_FV_FILETYPE_DEBUG_MAX              0xef
#define EFI_FV_FILETYPE_FFS_MIN                0xf0
#define EFI_FV_FILETYPE_FFS_MAX                0xff
#define EFI_FV_FILETYPE_FFS_PAD                0xf0

 0
 0x10 FIELD ->Name
  2   FIELD ->IntegrityCheck
  1   FIELD ->Type
  1   FIELD ->Attributes
  3   FIELD ->Size
  1   FIELD ->State
 CONSTANT EFI_FFS_FILE_HEADER

0
 8   FIELD SEC->Name       \ 0
 4   FIELD ->VirtualSize   \ 8
 4   FIELD ->VirtualAddress \ 12
 4   FIELD ->SizeOfRawData  \ 16
 4   FIELD ->PointerToRawData \ 20
 4   FIELD ->PointerToRelocations \ 24
 4   FIELD ->PointerToLinenumbers \ 28
 2   FIELD ->NumberOfRelocations  \ 32
 2   FIELD ->NumberOfLinenumbers  \ 34
 4   FIELD ->Characteristics      \ 36
 CONSTANT EFI_IMAGE_SECTION_HEADER

\- << : << LSHIFT ;
\- U>= : U>= U< 0= ;

 'c' 8 << 
 'o' OR 8 <<
 'l' OR 8 <<
 'e' OR 8 <<
 'r' OR 8 <<
 '.' OR CONSTANT '.reloc'

\- LCOUNT : LCOUNT  ( ladr -- ladr+4 n ) 4 + DUP 4 - L@ ;

0 VALUE VA_CHUNK
0 VALUE END_VA_CHUNKS

: PE_RELOC
 EFI_BASE_ADDRESS  FILE,ADR +
 FILE,ADR $b0 + L!
 EFI_IMG EFI_IMAGE_FILE_HEADER +
 EFI_IMG ->SizeOfOptionalHeader W@ +
 EFI_IMG ->NumberOfSections W@ 1- EFI_IMAGE_SECTION_HEADER * +
 DUP @ '.reloc' <> IF DROP BREAK
 DUP  ->VirtualAddress L@
 SWAP ->VirtualSize L@
 OVER +  FILE,ADR + TO END_VA_CHUNKS

 FILE,ADR +

 BEGIN

  LCOUNT TO VA_CHUNK 
  LCOUNT 2/ 4 - 0
 DO WCOUNT DUP
  $F000 AND  $A000 =
	IF DUP $FFF AND VA_CHUNK + FILE,ADR + 
		EFI_BASE_ADDRESS FILE,ADR FvImage - +
		SWAP +!
	THEN
	DROP
 LOOP
 DUP END_VA_CHUNKS U>=
 UNTIL
 DROP
;

: }>  HERE OVER - SWAP OR! ;

: <{RAW HERE	$19000000 L, ;	\ EFI_SECTION_RAW
: <{DPX HERE	$13000000 L, ;	\ EFI_SECTION_DXE_DEPEX
: <{DPX_PEI HERE $1B000000 L, ;	\ EFI_SECTION_PEI_DEPEX

: L_EFI> ( <name> )
 HERE $10000000 L, \ EFI_SECTION_PE32
 PARSE-NAME FILE, }>
 FILE,ADR $80 + ->FileHeader TO EFI_IMG ;

: EFI> ( <name> ) L_EFI> PE_RELOC ;

: INTERFACE>  ( <name> -- )
 HERE $15000000 L, \ EFI_SECTION_USER_INTERFACE
 PARSE-NAME U$, 0 W, }> ;

: VERSION>  ( c <name> -- )
 HERE $14000000 L, \ EFI_SECTION_VERSION
  0 W, PARSE-NAME U$, 0 W, }> ;

 EFI_FILE_HEADER_CONSTRUCTION
 EFI_FILE_HEADER_VALID OR
 EFI_FILE_DATA_VALID OR
 INVERT CONSTANT Ffs_State

: PPS_HEADER:
 HERE TO PPS_H
 ,GUID>

 0 c, \ checksum
 $AA	C,  \ FFS_FIXED_CHECKSUM
 EFI_FV_FILETYPE_DRIVER	C,
 0	C, \ Attributes
 0 w, 0 c, \ Size
 Ffs_State  C,
; 

: PPS_APPLICATION: PPS_HEADER: EFI_FV_FILETYPE_APPLICATION PPS_H ->Type C! ;
: PPS_PEIM: PPS_HEADER:
 EFI_FV_FILETYPE_PEIM	PPS_H ->Type C!
 EFI_WRITE_ENABLED_CAP	PPS_H ->Attributes C!
;

: FFS_PAD:
  HERE TO PPS_H
  -1 , -1 ,
  0 C,
  $AA C, \ FFS_FIXED_CHECKSUM
  $F0 C, \ EFI_FV_FILETYPE_FFS_PAD
  $0 C,  \ Attributes
  0 W, 0 C, \ PadFileSize
  Ffs_State  C,
;

: PPS;
 HERE PPS_H - PPS_H ->Size OR!
 PPS_H ->State PPS_H BSUM $AA - NEGATE PPS_H ->IntegrityCheck C!
 HERE 7 + -8 AND DP M!
;

