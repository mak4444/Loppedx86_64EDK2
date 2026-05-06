
MODULE_NAME = Forth
MODULE_DIR = OVMF/ForthPkg/$(MODULE_NAME)
BASE_NAME = $(MODULE_NAME)

CC_FLAGS = -g -Os -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds \
 -include AutoGen.h -fno-common -fstack-protector -ffunction-sections -fdata-sections \
 -DSTRING_ARRAY_NAME=$(BASE_NAME)Strings -mstack-protector-guard=global -m64 \
 "-DEFIAPI=__attribute__((ms_abi))" -maccumulate-outgoing-args -mno-red-zone -Wno-address \
 -mcmodel=small -fpie -fno-asynchronous-unwind-tables -Wno-address -fno-omit-frame-pointer \
 -flto -DUSING_LTO -Wno-error=unused-variable -DMDEPKG_NDEBUG \
 -mno-mmx -mno-sse -D DISABLE_NEW_DEPRECATED_INTERFACES -D TDX_GUEST_SUPPORTED

DEPS_FLAGS = -MMD -MF $@.deps

INC = \
 -I$(MODULE_DIR) \
 -I$(MODULE_DIR)/ff \
 -IOVMF/OvmfPkg/Include \
 -IOVMF/MdePkg/Include \
 -IOVMF/UefiCpuPkg/Include \
 -IOVMF/MdePkg/Include/X64

IASMS = \
 $(MODULE_DIR)/src/src_PRIMITIVES.i \
 $(MODULE_DIR)/src/src_VARS.i \
 $(MODULE_DIR)/src/src_HPROC.i \
 $(MODULE_DIR)/src/macroopt.i \
 $(MODULE_DIR)/src/NUMB_PARSE_IO.i \
 $(MODULE_DIR)/src/LITERAL.i \
 $(MODULE_DIR)/src/src_FIND_INTERP.i \
 $(MODULE_DIR)/src/INCLUDE.i \
 $(MODULE_DIR)/src/fstart.i

RM = rm -f

WORKSPACE=$(shell pwd)

all: $(eval export PATH = $(PATH):$(WORKSPACE)/BaseTools:$(WORKSPACE)/.) $(MODULE_DIR)/ff/$(MODULE_NAME).efi

$(MODULE_DIR)/ff/$(MODULE_NAME).efi: $(MODULE_DIR)/ff/$(MODULE_NAME).dll
	GenFw -e UEFI_APPLICATION -o $@ $< --zero

$(MODULE_DIR)/ff/$(MODULE_NAME).dll: $(MODULE_DIR)/ff/$(MODULE_NAME).lib
	gcc -o $@ \
 -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x40 -Wl,--entry,_ModuleEntryPoint \
 -u _ModuleEntryPoint \
 -Wl,-Map,$(MODULE_DIR)/ff/$(MODULE_NAME).map,--whole-archive \
 -Wl,-melf_x86_64,--oformat=elf64-x86-64,-pie -flto -Os \
 -Wl,--start-group,@$(MODULE_DIR)/ff/static_library_files.lst,--end-group \
 $(CC_FLAGS) \
 -Wl,--defsym=PECOFF_HEADER_SIZE=0x228 \
 -Wl,--script=BaseTools/Scripts/GccBase.lds -Wno-error
	objcopy --strip-unneeded -R .eh_frame $@
 
$(MODULE_DIR)/ff/$(MODULE_NAME).lib: \
 $(MODULE_DIR)/ff/Forth.obj \
 $(MODULE_DIR)/ff/efi64_4th.obj \
 $(MODULE_DIR)/ff/AutoGen.obj
	rm -f $@
	gcc-ar cr $@ @$(MODULE_DIR)/ff/object_files.lst

$(MODULE_DIR)/ff/Forth.obj: $(MODULE_DIR)/Forth.c
	gcc $(DEPS_FLAGS) $(CC_FLAGS) -c -o $@ $(INC) \
 -IOVMF/MdeModulePkg \
 -IOVMF/MdeModulePkg/Include $< 

$(MODULE_DIR)/ff/AutoGen.obj: $(MODULE_DIR)/ff/AutoGen.c
	gcc $(DEPS_FLAGS) $(CC_FLAGS) -c -o $@ $(INC) $< 

$(MODULE_DIR)/ff/efi64_4th.obj: $(IASMS) $(MODULE_DIR)/efi64_4th.asm
	nasm  -I$(MODULE_DIR) -I$(MODULE_DIR)/src -f elf64 -o $@ \
 $(MODULE_DIR)/efi64_4th.asm # $<

$(MODULE_DIR)/src/%.i: disk_nmt/ForthSrc/%.4
	./Meta_x86_64/MetaForth "FLOAD MLibs.4  FLOAD  OVMF/ForthPkg/Forth/promram.4th BYE"

clean:
	$(RM) $(MODULE_DIR)/ff/$(MODULE_NAME).*
	$(RM) $(MODULE_DIR)/ff/*.obj
	$(RM) $(MODULE_DIR)/ff/*.deps
	$(RM) $(MODULE_DIR)/src/*.i

