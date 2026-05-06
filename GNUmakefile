
RM = rm -f

WORKSPACE=$(shell pwd)

SEC4TH = \
 OVMF/OvmfPkg/Sec/SecMain.4th \
 OVMF/OvmfPkg/ResetVector/ResetVector.4th 

PEI4TH = \
 OVMF/MdeModulePkg/Core/Pei/Pdc.4th \
 OVMF/MdeModulePkg/Universal/PCD/Pei/Pdc.4th \
 OVMF/OvmfPkg/PlatformPei/PlatformPei.4th \
 OVMF/MdeModulePkg/Core/DxeIplPeim/DxeIpl.4th \

DEX4TH = \
 OVMF/MdeModulePkg/Core/Dxe/DxeMain.4th \
 OVMF/MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.4th \
 OVMF/MdeModulePkg/Universal/PCD/Dxe/Pcd.4th \
 OVMF/MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.4th \
 OVMF/MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.4th \
 OVMF/UefiCpuPkg/CpuIo2Dxe/CpuIo2Dxe.4th \
 OVMF/UefiCpuPkg/CpuDxe/CpuDxe.4th \
 OVMF/OvmfPkg/LocalApicTimerDxe/LocalApicTimerDxe.4th \
 OVMF/MdeModulePkg/Bus/Pci/PciHostBridgeDxe/PciHostBridgeDxe.4th \
 OVMF/MdeModulePkg/Bus/Pci/PciBusDxe/PciBusDxe.4th \
 OVMF/MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.4th \
 OVMF/MdeModulePkg/Universal/Metronome/Metronome.4th \
 OVMF/PcAtChipsetPkg/PcatRealTimeClockRuntimeDxe/PcatRealTimeClockRuntimeDxe.4th \
 OVMF/MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.4th \
 OVMF/MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/MonotonicCounterRuntimeDxe.4th \
 OVMF/MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.4th \
 OVMF/MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.4th \
 OVMF/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.4th \
 OVMF/MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.4th \
 OVMF/MdeModulePkg/Universal/Console/TerminalDxe/TerminalDxe.4th \
 OVMF/MdeModulePkg/Universal/BdsDxe/BdsDxe.4th \
 OVMF/MdeModulePkg/Application/UiApp/UiApp.4th \
 OVMF/MdeModulePkg/Application/BootManagerMenuApp/BootManagerMenuApp.4th \
 OVMF/MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.4th \
 OVMF/MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.4th \
 OVMF/MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.4th \
 OVMF/MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.4th \
 OVMF/MdeModulePkg/Bus/Pci/SataControllerDxe/SataControllerDxe.4th \
 OVMF/MdeModulePkg/Bus/Ata/AtaAtapiPassThru/AtaAtapiPassThru.4th \
 OVMF/MdeModulePkg/Bus/Ata/AtaBusDxe/AtaBusDxe.4th \
 OVMF/MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.4th \
 OVMF/MdeModulePkg/Universal/SetupBrowserDxe/SetupBrowserDxe.4th \
 OVMF/MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe.4th \
 OVMF/OvmfPkg/SioBusDxe/SioBusDxe.4th \
 OVMF/MdeModulePkg/Bus/Pci/PciSioSerialDxe/PciSioSerialDxe.4th \
 OVMF/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KeyboardDxe.4th \
 OVMF/MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.4th \
 OVMF/FatPkg/EnhancedFatDxe/Fat.4th \
 OVMF/OvmfPkg/QemuVideoDxe/QemuVideoDxe.4th \
 OVMF/OvmfPkg/PlatformDxe/Platform.4th \
 OVMF/OvmfPkg/IoMmuDxe/IoMmuDxe.4th \
 OVMF/OvmfPkg/EmuVariableFvbRuntimeDxe/Fvb.4th \
 OVMF/MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.4th \
 OVMF/MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.4th

all: $(eval export PATH = $(PATH):$(WORKSPACE)/OVMF/BaseTools/Source/C/bin:.) \
 BUILD_LIB BUILD_EFI OVMF_fd

OVMF_fd: OVMF/FVMAIN_COMPACT.BIN Meta_x86_64/MetaForth
	Meta_x86_64/MetaForth "FLOAD MLibs.4  FLOAD ovmf.4th BYE"

Meta_x86_64/MetaForth: Meta_x86_64/Mak64Forth.cpp 
	g++ -o $@ $< -Wreturn-type

OVMF/FVMAIN_COMPACT.BIN: OVMF/FVMAIN_COMPACT.guided.dummy
	cd OVMF/BaseTools/Source/C/LzmaCompress;make;cd ../../../../../
	LzmaCompress -e -o $@ $<

OVMF/FVMAIN_COMPACT.guided.dummy: OVMF/SECFV.Fv OVMF/PEIFV.Fv OVMF/DXEFV.Fv
	Meta_x86_64/MetaForth "FLOAD MLibs.4 FLOAD DUMMY.4TH BYE"

OVMF/PEIFV.Fv: Meta_x86_64/MetaForth $(PEI4TH)
	Meta_x86_64/MetaForth "FLOAD MLibs.4 FLOAD PEIFV.4th BYE"

OVMF/DXEFV.Fv: Meta_x86_64/MetaForth $(SEC4TH)
	Meta_x86_64/MetaForth "FLOAD MLibs.4 FLOAD DXEFV.4th BYE"

OVMF/SECFV.Fv: Meta_x86_64/MetaForth $(DXE4TH)
	Meta_x86_64/MetaForth "FLOAD MLibs.4 FLOAD SECFV.4th BYE"

GenFw: ../libs/libCommon.a
	cd OVMF/BaseTools/Source/C/GenFw;make;cd ../../../../../

../libs/libCommon.a:
	cd OVMF/BaseTools/Source/C/Common;make; cd ../../../../../

BUILD_EFI: GenFw
	make -f OVMF/MdeModulePkg/Core/Pei/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/PCD/Pei/GNUmakefile
	make -f OVMF/OvmfPkg/PlatformPei/GNUmakefile
	make -f OVMF/MdeModulePkg/Core/DxeIplPeim/GNUmakefile
	make -f OVMF/OvmfPkg/Sec/GNUmakefile 
	make -f OVMF/OvmfPkg/ResetVector/GNUmakefile 
	make -f OVMF/MdeModulePkg/Universal/WatchdogTimerDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Metronome/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/SecurityStubDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/GNUmakefile
	make -f OVMF/OvmfPkg/LocalApicTimerDxe/GNUmakefile 
	make -f OVMF/OvmfPkg/SioBusDxe/GNUmakefile 
	make -f OVMF/UefiCpuPkg/CpuIo2Dxe/GNUmakefile 
	make -f OVMF/MdeModulePkg/Bus/Pci/SataControllerDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Console/ConPlatformDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Disk/DiskIoDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/PCD/Dxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/FaultTolerantWriteDxe/GNUmakefile
	make -f OVMF/OvmfPkg/IoMmuDxe/GNUmakefile 
	make -f OVMF/MdeModulePkg/Universal/Acpi/S3SaveStateDxe/GNUmakefile
	make -f OVMF/OvmfPkg/QemuVideoDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/CapsuleRuntimeDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Bus/Ata/AtaBusDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Disk/PartitionDxe/GNUmakefile 
	make -f OVMF/MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Core/RuntimeDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/ResetSystemRuntimeDxe/GNUmakefile
	make -f OVMF/PcAtChipsetPkg/PcatRealTimeClockRuntimeDxe/GNUmakefile
	make -f OVMF/OvmfPkg/EmuVariableFvbRuntimeDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Bus/Pci/PciSioSerialDxe/GNUmakefile
	make -f OVMF/OvmfPkg/PlatformDxe/GNUmakefile
	make -f OVMF/UefiCpuPkg/CpuDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Core/Dxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Bus/Pci/PciHostBridgeDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Console/TerminalDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Console/ConSplitterDxe/GNUmakefile
	make -f OVMF/FatPkg/EnhancedFatDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Bus/Ata/AtaAtapiPassThru/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/DevicePathDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/Variable/RuntimeDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Bus/Pci/PciBusDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Application/UiApp/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/BdsDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Application/BootManagerMenuApp/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/DisplayEngineDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/SetupBrowserDxe/GNUmakefile
	make -f OVMF/MdeModulePkg/Universal/HiiDatabaseDxe/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseSynchronizationLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseDebugPrintErrorLevelLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiBootServicesTableLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiApplicationEntryPoint/GNUmakefile

BUILD_LIB:
	make -f OVMF/MdePkg/Library/RegisterFilterLibNull/GNUmakefile
	make -f OVMF/OvmfPkg/Library/AmdSvsmLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/CcExitLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/CcExitLib/CcExitLib/GNUmakefile
	make -f OVMF/MdePkg/Library/TdxLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/CcProbeLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptSevLib/GNUmakefile
	make -f OVMF/UefiCpuPkg/Library/BaseXApicX2ApicLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseIoLibIntrinsic/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseCpuLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseMemoryLibRepStr/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePrintLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PlatformDebugLibIoPort/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePciCf8Lib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePciLibCf8/GNUmakefile
	make -f OVMF/OvmfPkg/Library/AcpiTimerLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/AcpiTimerLib/BaseAcpiTimerLib/GNUmakefile
	make -f OVMF/CryptoPkg/Library/OpensslLib/GNUmakefile
	make -f OVMF/CryptoPkg/Library/BaseCryptLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseSynchronizationLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/DebugAgentLibNull/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseSafeIntLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePeCoffExtraActionLibNull/GNUmakefile
	make -f OVMF/PcAtChipsetPkg/Library/SerialIoLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePeCoffGetEntryPointLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseExtractGuidedSectionLib/GNUmakefile
	make -f OVMF/OvmfPkg/IntelTdx/TdxMeasurementLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/TdxMailboxLib/GNUmakefile
	make -f OVMF/UefiCpuPkg/Library/CpuExceptionHandlerLib/GNUmakefile
	make -f OVMF/UefiCpuPkg/Library/CpuPageTableLib/GNUmakefile
	make -f OVMF/MdePkg/Library/StackCheckLibNull/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/LzmaCustomDecompressLib/GNUmakefile
	make -f OVMF/OvmfPkg/IntelTdx/TdxHelperLib/GNUmakefile
	make -f OVMF/OvmfPkg/IntelTdx/TdxHelperLib/PeiTdxHelperLib/GNUmakefile
	make -f OVMF/MdePkg/Library/DxePcdLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseDebugPrintErrorLevelLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiBootServicesTableLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiMemoryAllocationLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiRuntimeServicesTableLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiDevicePathLibDevicePathProtocol/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiLib/GNUmakefile
	make -f OVMF/MdePkg/Library/DxeHobLib/GNUmakefile
	make -f OVMF/MdePkg/Library/DxeServicesLib/GNUmakefile
	make -f OVMF/MdePkg/Library/DxeServicesTableLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePerformanceLibNull/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseOrderedCollectionRedBlackTreeLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiFileHandleLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/CcProbeLib/DxeCcProbeLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PlatformDebugLibIoPort/PlatformDebugLibIoPort/GNUmakefile
	make -f OVMF/OvmfPkg/Library/QemuFwCfgLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/LoadLinuxLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/QemuFwCfgSimpleParserLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/SerializeVariablesLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PlatformBootManagerCommonLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/XenPlatformLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/Tcg2PhysicalPresenceLibNull/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PlatformBmPrintScLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/QemuBootOrderLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/X86QemuLoadImageLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/QemuFwCfgS3Lib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/NvVarsFileLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PlatformBootManagerLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiDriverEntryPoint/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/UefiHiiServicesLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/UefiSortLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/UefiHiiLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/VariablePolicyHelperLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/DxeReportStatusCodeLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/UefiBootManagerLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/BootLogoLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptSevLib/PeiMemEncryptSevLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptSevLib/DxeMemEncryptSevLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/QemuFwCfgLib/QemuFwCfgPeiLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/HardwareInfoLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/HardwareInfoLib/DxeHardwareInfoLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/QemuFwCfgS3Lib/PeiQemuFwCfgS3LibFwCfg/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PlatformInitLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/SmmRelocationLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiMemoryAllocationLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiPcdLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiServicesTablePointerLibIdt/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiServicesLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiHobLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseCacheMaintenanceLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiResourcePublicationLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeimEntryPoint/GNUmakefile
	make -f OVMF/CryptoPkg/Library/IntrinsicLib/GNUmakefile
	make -f OVMF/CryptoPkg/Library/BaseCryptLib/PeiCryptLib/GNUmakefile
	make -f OVMF/UefiCpuPkg/Library/MtrrLib/GNUmakefile 
	make -f OVMF/UefiCpuPkg/Library/CpuExceptionHandlerLib/PeiCpuExceptionHandlerLib/GNUmakefile
	make -f OVMF/UefiCpuPkg/Library/CpuExceptionHandlerLib/DxeCpuExceptionHandlerLib/GNUmakefile
	make -f OVMF/SecurityPkg/Library/PeiTpmMeasurementLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePcdLibNull/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiDevicePathLib/GNUmakefile
	make -f OVMF/MdePkg/Library/DxeCoreEntryPoint/GNUmakefile
	make -f OVMF/MdePkg/Library/DxeCoreHobLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePeCoffLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseUefiDecompressLib/GNUmakefile
	make -f OVMF/MdePkg/Library/DxeExtractGuidedSectionLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/DxeCoreMemoryAllocationLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/ImagePropertiesRecordLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/AcpiTimerLib/DxeAcpiTimerLib/GNUmakefile
	make -f OVMF/UefiCpuPkg/Library/MicrocodeLib/GNUmakefile 
	make -f OVMF/UefiCpuPkg/Library/MpInitLib/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiApplicationEntryPoint/GNUmakefile
	make -f OVMF/MdePkg/Library/UefiRuntimeLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/AuthVariableLibNull/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/VarCheckLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/BaseVariableFlashInfoLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/VariablePolicyLib/GNUmakefile
	make -f OVMF/SecurityPkg/Library/DxeTpmMeasurementLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiExtractGuidedSectionLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptTdxLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PciHostBridgeUtilityLib/GNUmakefile
	make -f OVMF/MdePkg/Library/BasePciSegmentLibPci/GNUmakefile
	make -f OVMF/OvmfPkg/Library/PciHostBridgeLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/DeviceManagerUiLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/OemHookStatusCodeLibNull/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/PeiReportStatusCodeLib/GNUmakefile
	make -f OVMF/MdePkg/Library/PeiCoreEntryPoint/GNUmakefile
	make -f OVMF/MdePkg/Library/BaseSmbusLibNull/GNUmakefile
	make -f OVMF/OvmfPkg/Library/LockBoxLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/PiDxeS3BootScriptLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/ResetSystemLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/RuntimeDxeReportStatusCodeLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/NestedInterruptTplLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/FrameBufferBltLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/DxeSecurityManagementLib/GNUmakefile
	make -f OVMF/OvmfPkg/Library/EmuVariableFvbLib/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/DxeCapsuleLibNull/GNUmakefile
	make -f OVMF/MdeModulePkg/Library/CustomizedDisplayLib/GNUmakefile

run:
	qemu-system-x86_64  -bios ./OVMF.fd \
 -serial stdio -enable-kvm \
 -hda fat:rw:./disk_nmt -hdb  fat:rw:./Meta_x86_64

forthos:
	make -f OVMF/ForthPkg/Forth/GNUmakefile
	cp OVMF/ForthPkg/Forth/ff/Forth.efi disk_nmt/EFI/BOOT/bootx64.efi

#	cp OVMF/ForthPkg/Forth/ff/Forth.efi disk_nmt/work/bootx64.efi


cccc:
	cd OVMF/BaseTools/Source/C/GenFw;make clean; cd ../../../../../

ww:
	cd OVMF/BaseTools/Source/C/GenFw;make; cd ../../../../../

clean:
	$(RM) -r OVMF/BaseTools/Source/C/bin
	$(RM) -r OVMF/BaseTools/Source/C/libs
	cd OVMF/BaseTools/Source/C/GenFw;make clean; cd ../../../../../
	cd OVMF/BaseTools/Source/C/LzmaCompress;make clean; cd ../../../../../
	cd OVMF/BaseTools/Source/C/Common;make clean; cd ../../../../../
	$(RM) Meta_x86_64/MetaForth
	$(RM) OVMF.fd
	$(RM) OVMF/SECFV.Fv
	$(RM) OVMF/PEIFV.Fv
	$(RM) OVMF/DXEFV.Fv
	$(RM) OVMF/FVMAIN_COMPACT.BIN
	$(RM) OVMF/FVMAIN_COMPACT.guided.dummy
	make -f OVMF/OvmfPkg/Sec/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Core/Pei/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/PCD/Pei/GNUmakefile clean
	make -f OVMF/OvmfPkg/PlatformPei/GNUmakefile clean
	make -f OVMF/OvmfPkg/Sec/GNUmakefile clean
	make -f OVMF/OvmfPkg/ResetVector/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/WatchdogTimerDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Metronome/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/SecurityStubDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/GNUmakefile clean
	make -f OVMF/OvmfPkg/LocalApicTimerDxe/GNUmakefile clean
	make -f OVMF/OvmfPkg/SioBusDxe/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/CpuIo2Dxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Bus/Pci/SataControllerDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Console/ConPlatformDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Disk/DiskIoDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/PCD/Dxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/FaultTolerantWriteDxe/GNUmakefile clean 
	make -f OVMF/OvmfPkg/IoMmuDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Acpi/S3SaveStateDxe/GNUmakefile clean
	make -f OVMF/OvmfPkg/QemuVideoDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/CapsuleRuntimeDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Bus/Ata/AtaBusDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Disk/PartitionDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Core/RuntimeDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/ResetSystemRuntimeDxe/GNUmakefile  clean
	make -f OVMF/PcAtChipsetPkg/PcatRealTimeClockRuntimeDxe/GNUmakefile  clean
	make -f OVMF/OvmfPkg/EmuVariableFvbRuntimeDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Bus/Pci/PciSioSerialDxe/GNUmakefile  clean
	make -f OVMF/OvmfPkg/PlatformDxe/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/CpuDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Core/Dxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Bus/Pci/PciHostBridgeDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Console/TerminalDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Console/ConSplitterDxe/GNUmakefile clean
	make -f OVMF/FatPkg/EnhancedFatDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Bus/Ata/AtaAtapiPassThru/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/DevicePathDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/Variable/RuntimeDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Bus/Pci/PciBusDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Application/UiApp/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/BdsDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Application/BootManagerMenuApp/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/DisplayEngineDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/SetupBrowserDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Universal/HiiDatabaseDxe/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Core/DxeIplPeim/GNUmakefile clean
	make -f OVMF/MdePkg/Library/RegisterFilterLibNull/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/AmdSvsmLib/GNUmakefile  clean
	make -f OVMF/OvmfPkg/Library/CcExitLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/CcExitLib/CcExitLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/TdxLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/CcProbeLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptSevLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/BaseXApicX2ApicLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseIoLibIntrinsic/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseCpuLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseMemoryLibRepStr/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePrintLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/PlatformDebugLibIoPort/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePciCf8Lib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePciLibCf8/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/AcpiTimerLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/AcpiTimerLib/BaseAcpiTimerLib/GNUmakefile clean
	make -f OVMF/CryptoPkg/Library/OpensslLib/GNUmakefile clean
	make -f OVMF/CryptoPkg/Library/BaseCryptLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseSynchronizationLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/DebugAgentLibNull/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseSafeIntLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePeCoffExtraActionLibNull/GNUmakefile clean
	make -f OVMF/PcAtChipsetPkg/Library/SerialIoLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePeCoffGetEntryPointLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseExtractGuidedSectionLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/IntelTdx/TdxMeasurementLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/TdxMailboxLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/CpuExceptionHandlerLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/CpuPageTableLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/StackCheckLibNull/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/LzmaCustomDecompressLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/IntelTdx/TdxHelperLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/IntelTdx/TdxHelperLib/PeiTdxHelperLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/DxePcdLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseDebugPrintErrorLevelLib/GNUmakefile  clean
	make -f OVMF/MdePkg/Library/UefiBootServicesTableLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiMemoryAllocationLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiRuntimeServicesTableLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiDevicePathLibDevicePathProtocol/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/DxeHobLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/DxeServicesLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/DxeServicesTableLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePerformanceLibNull/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseOrderedCollectionRedBlackTreeLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiFileHandleLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/CcProbeLib/DxeCcProbeLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/PlatformDebugLibIoPort/PlatformDebugLibIoPort/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/QemuFwCfgLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/LoadLinuxLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/QemuFwCfgSimpleParserLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/SerializeVariablesLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/PlatformBootManagerCommonLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/XenPlatformLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/Tcg2PhysicalPresenceLibNull/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/PlatformBmPrintScLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/QemuBootOrderLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/X86QemuLoadImageLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/QemuFwCfgS3Lib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/NvVarsFileLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/PlatformBootManagerLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiDriverEntryPoint/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/UefiHiiServicesLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/UefiSortLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/UefiHiiLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/VariablePolicyHelperLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/DxeReportStatusCodeLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/UefiBootManagerLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/BootLogoLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptSevLib/PeiMemEncryptSevLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptSevLib/DxeMemEncryptSevLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/QemuFwCfgLib/QemuFwCfgPeiLib/GNUmakefile  clean
	make -f OVMF/OvmfPkg/Library/HardwareInfoLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/QemuFwCfgS3Lib/PeiQemuFwCfgS3LibFwCfg/GNUmakefile clean 
	make -f OVMF/OvmfPkg/Library/PlatformInitLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/SmmRelocationLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiMemoryAllocationLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiPcdLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiServicesTablePointerLibIdt/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiServicesLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiHobLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseCacheMaintenanceLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiResourcePublicationLib/GNUmakefile  clean
	make -f OVMF/MdePkg/Library/PeimEntryPoint/GNUmakefile  clean
	make -f OVMF/CryptoPkg/Library/IntrinsicLib/GNUmakefile clean
	make -f OVMF/CryptoPkg/Library/BaseCryptLib/PeiCryptLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/MtrrLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/CpuExceptionHandlerLib/PeiCpuExceptionHandlerLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/CpuExceptionHandlerLib/DxeCpuExceptionHandlerLib/GNUmakefile clean
	make -f OVMF/SecurityPkg/Library/PeiTpmMeasurementLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePcdLibNull/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiDevicePathLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/DxeCoreEntryPoint/GNUmakefile clean
	make -f OVMF/MdePkg/Library/DxeCoreHobLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePeCoffLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseUefiDecompressLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/DxeExtractGuidedSectionLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/DxeCoreMemoryAllocationLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/ImagePropertiesRecordLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/AcpiTimerLib/DxeAcpiTimerLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/MicrocodeLib/GNUmakefile clean
	make -f OVMF/UefiCpuPkg/Library/MpInitLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiApplicationEntryPoint/GNUmakefile clean
	make -f OVMF/MdePkg/Library/UefiRuntimeLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/AuthVariableLibNull/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/VarCheckLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/BaseVariableFlashInfoLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/VariablePolicyLib/GNUmakefile clean
	make -f OVMF/SecurityPkg/Library/DxeTpmMeasurementLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiExtractGuidedSectionLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/BaseMemEncryptTdxLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/HardwareInfoLib/DxeHardwareInfoLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/PciHostBridgeUtilityLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BasePciSegmentLibPci/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/PciHostBridgeLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/DeviceManagerUiLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/OemHookStatusCodeLibNull/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/PeiReportStatusCodeLib/GNUmakefile clean
	make -f OVMF/MdePkg/Library/PeiCoreEntryPoint/GNUmakefile clean
	make -f OVMF/MdePkg/Library/BaseSmbusLibNull/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/LockBoxLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/PiDxeS3BootScriptLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/ResetSystemLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/RuntimeDxeReportStatusCodeLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/NestedInterruptTplLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/FrameBufferBltLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/DxeSecurityManagementLib/GNUmakefile clean
	make -f OVMF/OvmfPkg/Library/EmuVariableFvbLib/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/DxeCapsuleLibNull/GNUmakefile clean
	make -f OVMF/MdeModulePkg/Library/CustomizedDisplayLib/GNUmakefile clean
	make -f OVMF/ForthPkg/Forth/GNUmakefile clean

