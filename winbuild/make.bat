@echo off
rem Windows build helper for Loppedx86_64EDK2 (requires MSYS2 in C:\msys64)
rem Usage: winbuild\make.bat [target]
rem Targets: all (default), clean, run, forthos, efiboot.iso
set "TARGET=%~1"
if "%TARGET%"=="" set "TARGET=all"
set "MAKE_TARGET=%TARGET%"
"C:\msys64\usr\bin\bash.exe" -lc /c/work/os/Loppedx86_64EDK2/winbuild/run_make.sh
