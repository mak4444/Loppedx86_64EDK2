/** @file
  Standalone SHA-384 wrapper, replaces BaseCryptLib for TDX measurement.

Copyright (c) 2026, RUFP. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef SHA384_H_
#define SHA384_H_

#include <Base.h>

BOOLEAN
EFIAPI
Sha384HashAll (
  IN   CONST VOID  *Data,
  IN   UINTN       DataSize,
  OUT  UINT8       *HashValue
  );

#endif
