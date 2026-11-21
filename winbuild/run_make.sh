#!/bin/sh
SELF="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SELF/.." && pwd)"
export PATH="$ROOT/winbuild/bin:/clang64/bin:/mingw64/bin:/usr/bin"
cd "$ROOT"
make "${MAKE_TARGET:-all}"
echo "MAKE_EXIT=$?"
