rem https://github.com/queso-fuego/UEFI-GPT-image-creator - ./bios64_app.bin ./bios64.bin
set PATH="C:\Program Files\qemu";%PATH%
qemu-system-x86_64 -bios OVMF.fd -hda fat:rw:disk_nmt -hdb fat:rw:Meta_x86_64

