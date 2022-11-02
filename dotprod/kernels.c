//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 dotprod_base(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i] * b[i];

  return d;
}

f64 dotprod_cblas(f64 *restrict a, f64 *restrict b, u64 n)
{
  return cblas_ddot(n, a, 1, b, 1);
}

// ATLAS ALGO
f64 dotprod_unroll8(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;
  double d2 = 0.0;
  double d3 = 0.0;
  double d4 = 0.0;
  double d5 = 0.0;
  double d6 = 0.0;
  double d7 = 0.0;
  double d8 = 0.0;
  
  for (u64 i = 0; i < n; i+=8) {
    d += a[i] * b[i];
    d2 += a[i+1] * b[i+1];
    d3 += a[i+2] * b[i+2];
    d4 += a[i+3] * b[i+3];
    d5 += a[i+4] * b[i+4];
    d6 += a[i+5] * b[i+5];
    d7 += a[i+6] * b[i+6];
    d8 += a[i+7] * b[i+7];
  }
  return d + d2 + d3 + d4 + d5 + d6 + d7 + d8;
}

f64 dotprod_asm(f64 *restrict a, f64 *restrict b, u64 n)
{
  f64 c = 0.0;
  __asm__ volatile(
      
      "xor %%rcx, %%rcx;\n"
      "loop:;\n"

      "movsd (%[_a], %%rcx), %%xmm1;\n"
      "movsd (%[_b], %%rcx), %%xmm2;\n"
      "mulsd %%xmm2, %%xmm1;\n"
      "addsd %%xmm1, %[_c];\n"

      "add $8, %%rcx;\n"
      "cmp %%rcx, %[_n];\n"
      "jg loop;\n"

    : // outputs
      [_c] "+v"(c)
    : // inputs
      [_a] "r"(a),
      [_b] "r"(b),
      [_n] "r"(n*8)
    : // Clobbers
      "cc", "memory", "xmm1", "xmm2", "rcx", "xmm3"
  );
  return c;
}
