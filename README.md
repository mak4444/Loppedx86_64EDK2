
abridged https://github.com/tianocore/edk2

The Python has been replaced by Forth & make

```
sudo apt-get install uuid-dev libncurses5-dev
```

```
make
```

```
make run
```

It's enough for ForthOS

https://github.com/mak4444/gnu-efi-code-forth

https://github.com/mak4444/fasm-efi64-forth

building of a local ForthOS

```
make forthos
```

building for VirtualBox

```
make efiboot.iso
```
efiboot.iso - optical disc IDE

Building on Windows (native, via MSYS2 in C:\msys64)

One-time toolchain install (MSYS2 packages):

```
C:\msys64\usr\bin\pacman.exe -S --needed mingw-w64-clang-x86_64-x86_64-elf-toolchain mingw-w64-clang-x86_64-nasm mingw-w64-x86_64-mtools dosfstools gcc
```

Build (from a regular Windows console, from the project root):

```
winbuild\make.bat            (same as: make)
winbuild\make.bat run        (QEMU; WHPX accel if enabled, otherwise TCG)
winbuild\make.bat forthos
winbuild\make.bat efiboot.iso
```

How it works: winbuild\bin contains shims gcc/g++/gcc-ar which redirect EFI module builds to the x86_64-elf cross-GCC (ELF output, later converted to PE/COFF by GenFw) and host tool builds (BaseTools, MetaForth) to the MSYS2 gcc/g++.
