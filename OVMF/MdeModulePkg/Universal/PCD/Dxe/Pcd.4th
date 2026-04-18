
 PPS_HEADER: 80CF7257-87AB-47f9-A3FE-D50B76D89541

<{RAW
 ,GUID> 3C7D193C-682C-4C14-A68F-552DEA4F437E \ PcdDataBaseSignatureGuid
  7 L,		\ DATABASE_VERSION
  $e0 L,	\ DbTotalLength - UninitDataBaseSize
  0 L,		\ SystemSkuId
  0 L,		\
  $e0 L,	\ UninitDataBaseSize
  $4d L,	\ LocalTokenNumberTableOffset
  $78 L,	\ LocalTokenNumberTableOffset
  $70 L,	\ ExMapTableOffset
  $c8 L,	\ GuidTableOffset
  $d8 L,	\ StringTableOffset
  $d9 L,	\ SizeTableOffset
  $50 L,	\ SkuIdTableOffset
  $0 L,		\ DbPcdNameOffset
  $14 W,	\ LocalTokenCount
  0 W,		\ ExTokenCount
  1 W,		\ GuidTableCount
  $DA C,  $DA C,
  $DA C,  $DA C,
  $DA C,  $DA C,

  1 L,
  0 ,
 0 l,
 $500 l,
  
  $320 L,
  $500 L,
  $320 w, 0  W,  0 L,
  0  W,  0  W,
  $110 w, $400 w,
  $114 w, $400 w,
  $118 w, $400 w,
  $0e0 w, $800 w,
  $11c w, $400 w,
  $0e8 w, $800 w,
  $0f0 w, $800 w,
  $0f8 w, $800 w,
  $100 w, $800 w,
  $120 w, $400 w,
  $124 w, $400 w,
  $060 w, $400 w,
  $064 w, $400 w,
  $12b w, $110 w,
  $068 w, $400 w,
  $06c w, $400 w,
  $128 w, $200 w,
  $108 w, $800 w,
  $12c w, $110 w,
  $12a w, $100 w,
 0 , 0 , 0 l,
 0 c,
  $DA C,
  $DA C,  $DA C,
}>

<{DPX
 2 c,
 ,GUID> 0379BE4E-D706-437D-B037-EDB82FB772A4 \ EfiDevicePathUtilitiesProtocolGuid
 8 c,
}>

 0 w,
 EFI> OVMF/MdeModulePkg/Universal/PCD/Dxe/ff/PcdDxe.efi 

INTERFACE>	PcdDxe
0 w,
VERSION>	4.0

PPS;
