FFS_PAD:  -1 ,  -1 ,  -1 ,  -1 ,  -1 , PPS;

PPS_PEIM: 9B3ADA4F-AE56-4c24-8DEA-F03B7558AE50

<{RAW
  ,GUID> 3c7d193c-682c-4c14-a68f-552dea4f437e \ gPcdDataBaseSignatureGuid
  7 L,		\ DATABASE_VERSION
  $108 L,	\ DbTotalLength - UninitDataBaseSize
  0 L,		\ SystemSkuId
  0 L,		\
  $108 L,	\ UninitDataBaseSize
  $78 L,	\ LocalTokenNumberTableOffset
  $84 L,	\ LocalTokenNumberTableOffset
  $6C L,	\ ExMapTableOffset
  $E8 L,	\ GuidTableOffset
  $FC L,	\ StringTableOffset
  $FE L,	\ SizeTableOffset
  $50 L,	\ SkuIdTableOffset
  $0 L,		\ DbPcdNameOffset
  $19 W,	\ LocalTokenCount
  3  W,		\ ExTokenCount
  1 W,		\ GuidTableCount
  $DA C,  $DA C,
  $DA C,  $DA C,
  $DA C,  $DA C,

  1 L,
  0 , 0 ,
  8 L,
  $40 L,
  5  W,  3  W,  $17 L,
  4  W,  3  W,  $18 L,
  6  W,  3  W,  $19 L,

  $17c  W,  $110  W,
  $108  W,  $800  W,
  $110  W,  $800  W,
  $118  W,  $800  W,
  $120  W,  $800  W,

  $17D  W,  $110  W,
  $128  W,  $800  W,
  $130  W,  $800  W,
  $170  W,  $400  W,
  $174  W,  $400  W,
  $068  W,  $400  W,
  $138  W,  $800  W,

  $17e  W,  $110  W,
  $178  W,  $200  W,
  $140  W,  $800  W,
  $148  W,  $800  W,
  $150  W,  $800  W,
  $158  W,  $800  W,
  $160  W,  $800  W,
  $060  W,  $800  W,

  $17f  W,  $110  W,
  $102  W,  $200  W,
  $0f8  W, $1000  W,
  $17a  W,  $200  W,
  $168  W,  $800  W,

  ,GUID> A1AFF049-FDEB-442A-B320-13AB4CB72BBC \ EfiMdeModulePkgTokenSpaceGuid
  0 L,
  0 W,
  1 W,
  1 W,
  8 W,
  $DA C,  $DA C,
  $DA C,  $DA C,
}>

<{DPX_PEI
  $2 C,
  ,GUID> 01F34D25-4DE2-23AD-3FF3-36353FF323F1 \ EfiPeiPcdPpiGuid
  8 c,
}>

  0 w,

<{RAW 0 , 0 , 0 L, }>

 EFI> OVMF/MdeModulePkg/Universal/PCD/Pei/ff/PcdPeim.efi

 INTERFACE>	PcdPeim
 VERSION>	4.0

PPS;
