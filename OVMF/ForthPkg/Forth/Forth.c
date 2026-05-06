
#include <Uefi.h>
#include <Guid/MdeModuleHii.h>
#include <Library/UefiBootManagerLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiLib.h>
#include <Library/HiiLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/DebugLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DevicePathLib.h>
#include <Protocol/LoadedImage.h>
#include <Protocol/BootLogo.h>
#include <Protocol/LoadedImage.h>
#include <Library/FileHandleLib.h>

void fmain(void*);

EFI_FILE_HANDLE Volume;

void hello(UINT64 adr)
{
  Print(L"Hello from Forth!!!=%llx\n",adr);
  Print(L"Привет!\n");
}

 EFI_HANDLE LibImageHandle;

VOID
C_HALT( EFI_STATUS stat )
{//	Exit(stat, 0, NULL);

    gBS->Exit(LibImageHandle,stat, 0, NULL);

    // Uh oh, Exit() returned?!
    for (;;) { }

}

EFI_STATUS
GCCCloseFile(EFI_FILE_HANDLE FileHandle)
{ return FileHandle->Close(FileHandle);
}

UINT64 GCCFileSize(EFI_FILE_HANDLE FileHandle)
{
  UINT64 ret;
  EFI_FILE_INFO       *FileInfo;         /* file information structure */
  /* get the file's size */
  FileInfo = FileHandleGetInfo(FileHandle);
  ret = FileInfo->FileSize;
  FreePool(FileInfo);
  return ret;
}

EFI_STATUS
GCCSetPosition(EFI_FILE_HANDLE FileHandle, UINTN Offset )
{
   return FileHandle->SetPosition(FileHandle, Offset);
}

EFI_STATUS
GCCGetPosition(EFI_FILE_HANDLE FileHandle, UINTN * Offset )
{
   return FileHandle->GetPosition(FileHandle, Offset);
}

EFI_STATUS
GCCWriteFile(EFI_FILE_HANDLE FileHandle,UINT64 * WriteSize, VOID *Buffer )
{
 return FileHandle->Write(FileHandle, WriteSize, Buffer);
}

EFI_STATUS
GCCReadFile(EFI_FILE_HANDLE FileHandle,UINT64 * ReadSize, VOID *Buffer )
{
 return FileHandle->Read(FileHandle, ReadSize, Buffer);
}

EFI_STATUS
GCCOpenFile(EFI_FILE_HANDLE * FileHandle, CHAR16 *FileName, UINT64 flg )
{   
   return Volume->Open(Volume, FileHandle, FileName, flg , 0 );
}

EFI_SIMPLE_TEXT_OUTPUT_MODE *
GCCTEXT_OUTPUT_MODE()
{  return gST->ConOut->Mode;
}

EFI_STATUS 
GCCSCRSIZE(OUT UINTN *TempColumn, OUT UINTN *ScreenSize)
{
 return gST->ConOut->QueryMode(gST->ConOut, gST->ConOut->Mode->Mode, TempColumn, ScreenSize);
}

VOID
GCCSetXY(UINTN Row,UINTN  Column)
{
   gST->ConOut->SetCursorPosition(gST->ConOut, Column, Row);
}

VOID
GCCSetAttribute(UINTN color )
{	gST->ConOut->SetAttribute(gST->ConOut, color);
}

VOID
GCCOUTPUTRESET()
{
   gST->ConOut->Reset(gST->ConOut,0);
}

typedef struct {
    CHAR16                              UnicodeChar;
    UINT16                              ScanCode;
} EFI_INPUT_KEY_M;


EFI_INPUT_KEY_M
getkey ()
{
	EFI_INPUT_KEY_M efi_input_key_M;
	EFI_INPUT_KEY efi_input_key;
	UINTN index;
	gST->BootServices->WaitForEvent(1, &gST->ConIn->WaitForKey, &index);
	gST->ConIn->ReadKeyStroke(gST->ConIn, &efi_input_key);
	efi_input_key_M.UnicodeChar= efi_input_key.UnicodeChar;
	efi_input_key_M.ScanCode= efi_input_key.ScanCode;
	return efi_input_key_M;
}


UINT16  LastScanCode;

CHAR16
getch ()
{
	EFI_INPUT_KEY efi_input_key;
	UINTN index;
	gST->BootServices->WaitForEvent(1, &gST->ConIn->WaitForKey, &index);
	gST->ConIn->ReadKeyStroke(gST->ConIn, &efi_input_key);
	LastScanCode = efi_input_key.ScanCode;
	return efi_input_key.UnicodeChar;
}

EFI_STATUS
kbhit ()
{
	EFI_INPUT_KEY efi_input_key;
	return  gST->ConIn->ReadKeyStroke(gST->ConIn, &efi_input_key);
}


//void putch(char cc) { Print(L"c=%c",cc); }
VOID
Output (
    IN CHAR16   *Str
    )
{ gST->ConOut->OutputString(gST->ConOut,Str) ;
 }

VOID
putch (CHAR16 cc)
{ CHAR16 * pcc=L"*";
//   Output (pcc);
   *pcc= cc;
   Output (pcc);
}


EFI_FILE_HANDLE GetVolume(EFI_HANDLE image)
{
  EFI_LOADED_IMAGE *loaded_image = NULL;                  /* image interface */
  EFI_GUID lipGuid = EFI_LOADED_IMAGE_PROTOCOL_GUID;      /* image interface GUID */
  EFI_FILE_IO_INTERFACE *IOVolume;                        /* file system interface */
  EFI_GUID fsGuid = EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID; /* file system interface GUID */
  EFI_FILE_HANDLE Volume;                                 /* the volume's interface */
 
  /* get the loaded image protocol interface for our "image" */
  gBS->HandleProtocol(image, &lipGuid, (void **) &loaded_image);
  /* get the volume handle */
  gBS->HandleProtocol(loaded_image->DeviceHandle, &fsGuid, (VOID*)&IOVolume);
  IOVolume->OpenVolume(IOVolume, &Volume);
  return Volume;
}

/**
  Display the boot popup menu and allow user select boot item.

  @param   ImageHandle     The image handle.
  @param   SystemTable     The system table.

  @retval  EFI_SUCCESS          Boot from selected boot option, and return success from boot option

**/
EFI_STATUS
EFIAPI
BootManagerMenuEntry (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  )
{

    LibImageHandle = ImageHandle;
    Volume = GetVolume(ImageHandle);

  gBS->SetWatchdogTimer(0,0,0,NULL);

  gST->ConOut->EnableCursor(gST->ConOut, 1);

  fmain( AllocatePool (0x660000) );

  Print(L"hello!\n");
    for (;;) { }

  return EFI_SUCCESS;
}
