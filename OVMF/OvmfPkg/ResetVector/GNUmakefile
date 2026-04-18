
MODULE_NAME = ResetVector
BASE_NAME = $(MODULE_NAME)

MODULE_DIR = OVMF/OvmfPkg/ResetVector

RM = rm -f

WORKSPACE=$(shell pwd)


all: $(eval export PATH = $(PATH):$(WORKSPACE)/BaseTools:$(WORKSPACE)/../edk2:.) $(MODULE_DIR)/ff/$(MODULE_NAME).bin

$(MODULE_DIR)/ff/$(MODULE_NAME).bin: $(MODULE_DIR)/ff/$(MODULE_NAME).iii
	nasm -l $(MODULE_DIR)/ff/$(MODULE_NAME).lst \
 -f bin  -I$(MODULE_DIR) -IOVMF/UefiCpuPkg/ResetVector/Vtf0/ -o $@ $<

clean:
	$(RM) $(MODULE_DIR)/ff/*.bin
