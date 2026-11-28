#!/bin/sh
export PATH="/c/work/os/Loppedx86_64EDK2/winbuild/bin:/clang64/bin:/mingw64/bin:/usr/bin"
cd /c/work/os/Loppedx86_64EDK2
echo "--- SecMain.efi location ---"
ls -la OVMF/UefiCpuPkg/SecCore/*/SecMain.efi 2>/dev/null || find OVMF/UefiCpuPkg/SecCore -name "*.efi" -exec ls -la {} \;
echo "--- efiboot.iso build ---"
rm -f efiboot.iso
make efiboot.iso
echo "--- ISO verify ---"
ls -la efiboot.iso
mdir -i efiboot.iso ::EFI/BOOT || true
echo "=== ISO_OK ==="
