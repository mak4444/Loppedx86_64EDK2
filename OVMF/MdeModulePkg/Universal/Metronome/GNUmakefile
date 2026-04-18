
CC_FLAGS = -g -Os -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds \
 -include AutoGen.h -fno-common -fstack-protector -ffunction-sections -fdata-sections \
 -DSTRING_ARRAY_NAME=$(BASE_NAME)Strings -mstack-protector-guard=global -m64 \
 "-DEFIAPI=__attribute__((ms_abi))" -maccumulate-outgoing-args -mno-red-zone -Wno-address \
 -mcmodel=small -fpie -fno-asynchronous-unwind-tables -Wno-address -fno-omit-frame-pointer \
 -flto -DUSING_LTO -Wno-unused-but-set-variable -Wno-unused-const-variable \
 -DMDEPKG_NDEBUG -mno-mmx -mno-sse -D DISABLE_NEW_DEPRECATED_INTERFACES -D TDX_GUEST_SUPPORTED

DEPS_FLAGS = -MMD -MF $@.deps
MODULE_DIR = OVMF/MdeModulePkg/Universal/Metronome

INC =  \
 -I$(MODULE_DIR) \
 -I$(MODULE_DIR)/Metronome \
 -IOVMF/edk2/MdePkg -IOVMF/MdePkg/Include \
 -IOVMF/MdePkg/Include/X64 \


RM = rm -f

WORKSPACE=$(shell pwd)

all: $(eval export PATH = $(PATH):$(WORKSPACE)/BaseTools:$(WORKSPACE)/../edk2:.) $(MODULE_DIR)/Metronome/Metronome.efi

$(MODULE_DIR)/Metronome/Metronome.efi: ./$(MODULE_DIR)/Metronome/Metronome.dll
	GenFw -e DXE_DRIVER -o $@ $< --zero

./$(MODULE_DIR)/Metronome/Metronome.dll: $(MODULE_DIR)/Metronome/Metronome.lib
	gcc -o $@ \
 -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=0x40 -Wl,--entry,_ModuleEntryPoint \
 -u _ModuleEntryPoint \
 -Wl,-Map,$(MODULE_DIR)/Metronome/Metronome.map,--whole-archive \
 -Wl,-melf_x86_64,--oformat=elf64-x86-64,-pie -flto -Os \
 -Wl,--start-group,@$(MODULE_DIR)/Metronome/static_library_files.lst,--end-group \
 $(CC_FLAGS) \
 -Wl,--defsym=PECOFF_HEADER_SIZE=0x228 \
 -Wl,--script=BaseTools/Scripts/GccBase.lds -Wno-error
	objcopy --strip-unneeded -R .eh_frame $@
 
$(MODULE_DIR)/Metronome/Metronome.lib: \
 $(MODULE_DIR)/Metronome/Metronome.obj \
 $(MODULE_DIR)/Metronome/AutoGen.obj
	gcc-ar cr $@ @$(MODULE_DIR)/Metronome/object_files.lst

$(MODULE_DIR)/Metronome/Metronome.obj: $(MODULE_DIR)/Metronome.c
	gcc $(DEPS_FLAGS) $(CC_FLAGS) -c -o $@ $(INC) $<

$(MODULE_DIR)/Metronome/AutoGen.obj: $(MODULE_DIR)/Metronome/AutoGen.c
	gcc $(DEPS_FLAGS) $(CC_FLAGS) -c -o $@ $(INC) $< 

clean:
	$(RM) $(MODULE_DIR)/Metronome/Metronome.*
	$(RM) $(MODULE_DIR)/Metronome/*.obj
	$(RM) $(MODULE_DIR)/Metronome/*.deps
