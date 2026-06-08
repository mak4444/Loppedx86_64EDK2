
CREATE EFI_SHELL_PARAMETERS_PROTOCOL_GUID  0x752f3136 L, 0x4e16 W, 0x4fdc W, 0xa2 C, 0x2a C, 0xe5 C, 0xf4 C, 0x68 C, 0x12 C, 0xf4 C, 0xca C,

CREATE SHELL_PARAM 0 ,

  SHELL_PARAM
  EFI_SHELL_PARAMETERS_PROTOCOL_GUID
  IMAGEHANDLE
  BOOTSERV HandleProtocol @ 3XSYS ?DUP
[IF]
   .( ST_SHELL_PARAM=) H. CR \EOF
[THEN]

STRUCTURES{
 0
  *FIELD SH_Argv

  \ The number of elements in the Argv array.

  4FIELD SH_Argc

  \ The file handle for the standard input for this executable. This may be different
  \ from the ConInHandle in EFI_SYSTEM_TABLE.

  *FIELD SH_StdIn

  \ The file handle for the standard output for this executable. This may be different
  \ from the ConOutHandle in EFI_SYSTEM_TABLE.

  *FIELD SH_StdOut

  \ The file handle for the standard error output for this executable. This may be
  \ different from the StdErrHandle in EFI_SYSTEM_TABLE.

  *FIELD SH_StdErr
 CONSTANT /EFI_SHELL_PARAMETERS_PROTOCOL

}STRUCTURES

CREATE COMMAND_LINE $101 ALLOT

: OPTIONS_DO (  -- )
 SHELL_PARAM @ ?DUP 0= IF BREAK
 DUP	SH_Argc @ 2 U<  IF DROP BREAK
	SH_Argv @ CELL+ @ DUP 22 DUMP
 COMMAND_LINE 0! 
 BEGIN WCOUNT DUP 
 WHILE COMMAND_LINE $C+!
 REPEAT 2DROP
 COMMAND_LINE COUNT EVALUATE
;
