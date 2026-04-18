 0 VALUE HeaderLength
 0 VALUE PadChecksum
 0 VALUE CheckSum

: FVH, ( attr -- )

   CODE-SIZE ,			\ FvLength
  '_' C, 'F' C, 'V' C, 'H' C,	\ Signature
  	 W,			\ Attributes
   4 W,				\ ALIGNMENT_16
  0x48	W,			\ HeaderLength
  HERE TO CheckSum
  0 W, 				\ CheckSum 
  0x0000 W,			\ ExtHeaderOffset
  0x00 C,	\ Reserved
  0x02 C,	\ Revision
  NumBlocks L,
  LengthBlock L,
  0 ,					\ End
;

: ExtHeaderOffset  CheckSum  2+ ;

: FFSYS2: ( <FvName> )
  HERE TO FvImage
  0 , 0 , 

\ gEfiFirmwareFileSystem2Guid
  [,GUID>] 8c8ce578-8a3d-4f1c-9935-896185c32dd3
 
 EFI_READ_DISABLED_CAP
 EFI_READ_ENABLED_CAP	OR
 EFI_READ_STATUS	OR
 EFI_WRITE_DISABLED_CAP	OR
 EFI_WRITE_ENABLED_CAP	OR
 EFI_WRITE_STATUS	OR
 EFI_LOCK_CAP		OR
 EFI_LOCK_STATUS	OR
 EFI_STICKY_WRITE	OR
 EFI_MEMORY_MAPPED	OR
 EFI_ERASE_POLARITY	OR
 EFI_READ_LOCK_CAP	OR
 EFI_READ_LOCK_STATUS	OR
 FVH,

FFS_PAD:
  HERE FvImage - ExtHeaderOffset W!
  ,GUID> \ FvName
  $14 L,
PPS;
  PPS_H FvImage WSUM NEGATE  CheckSum W!
;

