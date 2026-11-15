#!/bin/sh
export PATH="/c/work/os/Loppedx86_64EDK2/winbuild/bin:/clang64/bin:/mingw64/bin:/usr/bin"
cd /c/work/os/Loppedx86_64EDK2
make "${MAKE_TARGET:-all}"
echo "MAKE_EXIT=$?"
