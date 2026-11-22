/** @file
  Standalone SHA-384 (FIPS 180-4) implementation.

Copyright (c) 2026, RUFP. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include <Base.h>
#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include "Sha384.h"

#define SHA384_DIGEST_SIZE   48
#define SHA384_BLOCK_SIZE    128

#define RORq(x, n)  (((x) >> (n)) | ((x) << (64 - (n))))

typedef struct {
  UINT64    Length;
  UINT64    State[8];
  UINTN     Curlen;
  UINT8     Buf[SHA384_BLOCK_SIZE];
} SHA384_CTX;

STATIC CONST UINT64  mSha384K[80] = {
  0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
  0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
  0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
  0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
  0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL,
  0xc19bf174cf692694ULL, 0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL,
  0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL, 0x2de92c6f592b0275ULL,
  0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
  0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL,
  0xbf597fc7beef0ee4ULL, 0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL,
  0x06ca6351e003826fULL, 0x142929670a0e6e70ULL, 0x27b70a8546d22ffcULL,
  0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
  0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL,
  0x92722c851482353bULL, 0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL,
  0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL, 0xd192e819d6ef5218ULL,
  0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
  0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL,
  0x34b0bcb5e19b48a8ULL, 0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL,
  0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL, 0x748f82ee5defb2fcULL,
  0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
  0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL,
  0xc67178f2e372532bULL, 0xca273eceea26619cULL, 0xd186b8c721c0c207ULL,
  0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL, 0x06f067aa72176fbaULL,
  0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
  0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
  0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
  0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL
};

STATIC CONST UINT64  mSha384InitState[8] = {
  0xcbbb9d5dc1059ed8ULL, 0x629a292a367cd507ULL, 0x9159015a3070dd17ULL,
  0x152fecd8f70e5939ULL, 0x67332667ffc00b31ULL, 0x8eb44a8768581511ULL,
  0xdb0c2e0d64f98fa7ULL, 0x47b5481dbefa4fa4ULL
};

STATIC
VOID
Sha384Compress (
  IN OUT UINT64       *State,
  IN     CONST UINT8  *Blocks,
  IN     UINTN        BlockCount
  )
{
  UINT64  W[80];
  UINT64  A, B, C, D, E, F, G, H;
  UINT64  T1, T2;
  UINTN   Index, Offset;

  for (Offset = 0; Offset < BlockCount; Offset++, Blocks += SHA384_BLOCK_SIZE) {
    for (Index = 0; Index < 16; Index++) {
      W[Index] =
        LShiftU64 ((UINT64)Blocks[Index * 8 + 0], 56) |
        LShiftU64 ((UINT64)Blocks[Index * 8 + 1], 48) |
        LShiftU64 ((UINT64)Blocks[Index * 8 + 2], 40) |
        LShiftU64 ((UINT64)Blocks[Index * 8 + 3], 32) |
        LShiftU64 ((UINT64)Blocks[Index * 8 + 4], 24) |
        LShiftU64 ((UINT64)Blocks[Index * 8 + 5], 16) |
        LShiftU64 ((UINT64)Blocks[Index * 8 + 6],  8) |
        (UINT64)Blocks[Index * 8 + 7];
    }

    for (Index = 16; Index < 80; Index++) {
      UINT64  W0 = W[Index - 15];
      UINT64  W1 = W[Index - 2];
      UINT64  S0 = RORq (W0, 1) ^ RORq (W0, 8) ^ (W0 >> 7);
      UINT64  S1 = RORq (W1, 19) ^ RORq (W1, 61) ^ (W1 >> 6);
      W[Index] = W[Index - 16] + S0 + W[Index - 7] + S1;
    }

    A = State[0];
    B = State[1];
    C = State[2];
    D = State[3];
    E = State[4];
    F = State[5];
    G = State[6];
    H = State[7];

    for (Index = 0; Index < 80; Index++) {
      UINT64  S1 = RORq (E, 14) ^ RORq (E, 18) ^ RORq (E, 41);
      UINT64  CH = (E & F) ^ (~E & G);
      UINT64  S0 = RORq (A, 28) ^ RORq (A, 34) ^ RORq (A, 39);
      UINT64  MAJ = (A & B) ^ (A & C) ^ (B & C);
      T1 = H + S1 + CH + mSha384K[Index] + W[Index];
      T2 = S0 + MAJ;
      H = G;
      G = F;
      F = E;
      E = D + T1;
      D = C;
      C = B;
      B = A;
      A = T1 + T2;
    }

    State[0] += A;
    State[1] += B;
    State[2] += C;
    State[3] += D;
    State[4] += E;
    State[5] += F;
    State[6] += G;
    State[7] += H;
  }
}

STATIC
VOID
Sha384Init (
  OUT SHA384_CTX  *Ctx
  )
{
  Ctx->Length = 0;
  Ctx->Curlen = 0;
  CopyMem (Ctx->State, mSha384InitState, sizeof (mSha384InitState));
}

STATIC
VOID
Sha384Update (
  IN OUT SHA384_CTX  *Ctx,
  IN     CONST VOID  *Data,
  IN     UINTN       DataSize
  )
{
  CONST UINT8  *Ptr = (CONST UINT8 *)Data;

  while (DataSize > 0) {
    if ((Ctx->Curlen == 0) && (DataSize >= SHA384_BLOCK_SIZE)) {
      Sha384Compress (Ctx->State, Ptr, 1);
      Ctx->Length += SHA384_BLOCK_SIZE * 8;
      Ptr         += SHA384_BLOCK_SIZE;
      DataSize    -= SHA384_BLOCK_SIZE;
    } else {
      UINTN  Chunk = DataSize;
      if (Chunk > (SHA384_BLOCK_SIZE - Ctx->Curlen)) {
        Chunk = SHA384_BLOCK_SIZE - Ctx->Curlen;
      }

      CopyMem (Ctx->Buf + Ctx->Curlen, Ptr, Chunk);
      Ctx->Curlen += Chunk;
      Ptr         += Chunk;
      DataSize    -= Chunk;
      Ctx->Length += Chunk * 8;

      if (Ctx->Curlen == SHA384_BLOCK_SIZE) {
        Sha384Compress (Ctx->State, Ctx->Buf, 1);
        Ctx->Curlen = 0;
      }
    }
  }
}

STATIC
VOID
Sha384Final (
  IN OUT SHA384_CTX  *Ctx,
  OUT    UINT8       *HashValue
  )
{
  UINT64  LengthBits;
  UINTN   Index;

  LengthBits = SwapBytes64 (Ctx->Length);

  if (Ctx->Curlen < 112) {
    SetMem (Ctx->Buf + Ctx->Curlen, SHA384_BLOCK_SIZE - Ctx->Curlen, 0);
    Ctx->Buf[Ctx->Curlen] = 0x80;
    CopyMem (Ctx->Buf + 120, &LengthBits, 8);
    Sha384Compress (Ctx->State, Ctx->Buf, 1);
  } else {
    SetMem (Ctx->Buf + Ctx->Curlen, SHA384_BLOCK_SIZE - Ctx->Curlen, 0);
    Ctx->Buf[Ctx->Curlen] = 0x80;
    Sha384Compress (Ctx->State, Ctx->Buf, 1);
    SetMem (Ctx->Buf, SHA384_BLOCK_SIZE, 0);
    CopyMem (Ctx->Buf + 120, &LengthBits, 8);
    Sha384Compress (Ctx->State, Ctx->Buf, 1);
  }

  for (Index = 0; Index < 6; Index++) {
    UINT64  Word = SwapBytes64 (Ctx->State[Index]);
    CopyMem (HashValue + Index * 8, &Word, 8);
  }
}

BOOLEAN
EFIAPI
Sha384HashAll (
  IN   CONST VOID  *Data,
  IN   UINTN       DataSize,
  OUT  UINT8       *HashValue
  )
{
  SHA384_CTX  Ctx;

  if (HashValue == NULL) {
    return FALSE;
  }

  if ((Data == NULL) && (DataSize != 0)) {
    return FALSE;
  }

  Sha384Init (&Ctx);
  Sha384Update (&Ctx, Data, DataSize);
  Sha384Final (&Ctx, HashValue);
  return TRUE;
}
