Meta_x86_64/SRC/dsrc.f 

ALSO TC DEFINITIONS

 0x900000 VALUE EFI_BASE_ADDRESS


OVMF/PeImage.4th
OVMF/GenPPS.4th
0xE8 VALUE  NumBlocks
0x10000 VALUE LengthBlock
OVMF/GenFv.4th

4 ALIGN-BYTES !

 0x9000 ALLOCATE  THROW DUP  YDP0 ! YDP !

   1 TO YDP_FL


NumBlocks LengthBlock * TO CODE-SIZE

HERE T-DP !
CODE-SIZE $10000 + ALLOCATE THROW  TO MSTR_IMG  MSTR_IMG DP M!

CODE-SIZE	0	SEG: .forth

 ' THERE?A TO THERE?

.forth	SEG_SET

  HERE CODE-SIZE $FF FILL 
 
 FFSYS2: 7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1 \ FvName

 FLOAD OVMF/MdeModulePkg/Core/Dxe/DxeMain.4th
 FLOAD OVMF/MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.4th
 FLOAD OVMF/MdeModulePkg/Universal/PCD/Dxe/Pcd.4th
 FLOAD OVMF/MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.4th
 FLOAD OVMF/MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.4th
 FLOAD OVMF/UefiCpuPkg/CpuIo2Dxe/CpuIo2Dxe.4th
 FLOAD OVMF/UefiCpuPkg/CpuDxe/CpuDxe.4th 
 FLOAD OVMF/OvmfPkg/LocalApicTimerDxe/LocalApicTimerDxe.4th
 FLOAD OVMF/MdeModulePkg/Bus/Pci/PciHostBridgeDxe/PciHostBridgeDxe.4th
 FLOAD OVMF/MdeModulePkg/Bus/Pci/PciBusDxe/PciBusDxe.4th
 FLOAD OVMF/MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.4th
 FLOAD OVMF/MdeModulePkg/Universal/Metronome/Metronome.4th
 FLOAD OVMF/PcAtChipsetPkg/PcatRealTimeClockRuntimeDxe/PcatRealTimeClockRuntimeDxe.4th
 FLOAD OVMF/MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.4th
 FLOAD OVMF/MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/MonotonicCounterRuntimeDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Console/TerminalDxe/TerminalDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/BdsDxe/BdsDxe.4th 
 FLOAD OVMF/MdeModulePkg/Application/UiApp/UiApp.4th 
 FLOAD OVMF/MdeModulePkg/Application/BootManagerMenuApp/BootManagerMenuApp.4th 
 FLOAD OVMF/MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.4th 
 FLOAD OVMF/MdeModulePkg/Bus/Pci/SataControllerDxe/SataControllerDxe.4th
 FLOAD OVMF/MdeModulePkg/Bus/Ata/AtaAtapiPassThru/AtaAtapiPassThru.4th 
 FLOAD OVMF/MdeModulePkg/Bus/Ata/AtaBusDxe/AtaBusDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/SetupBrowserDxe/SetupBrowserDxe.4th
 FLOAD OVMF/MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe.4th 
 FLOAD OVMF/OvmfPkg/SioBusDxe/SioBusDxe.4th 
 FLOAD OVMF/MdeModulePkg/Bus/Pci/PciSioSerialDxe/PciSioSerialDxe.4th 
 FLOAD OVMF/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KeyboardDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.4th 
 FLOAD OVMF/FatPkg/EnhancedFatDxe/Fat.4th
 FLOAD OVMF/OvmfPkg/QemuVideoDxe/QemuVideoDxe.4th
 FLOAD OVMF/OvmfPkg/PlatformDxe/Platform.4th
 FLOAD OVMF/OvmfPkg/IoMmuDxe/IoMmuDxe.4th
 FLOAD OVMF/OvmfPkg/EmuVariableFvbRuntimeDxe/Fvb.4th    
 FLOAD OVMF/MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.4th 
 FLOAD OVMF/MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.4th 

CODE-SIZE DP M!

TSAVE OVMF/DXEFV.Fv

FORTH

\EOF
