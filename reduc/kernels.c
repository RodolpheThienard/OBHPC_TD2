//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"
#include <smmintrin.h>
#include <xmmintrin.h>

//Baseline - naive implementation
f64 reduc_base(f64 *restrict a, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i];

  return d;
}

f64 reduc_cblas(f64 *restrict a, u64 n)
{
  return cblas_dasum(n, a, 1);
}

f64 reduc_unroll8(f64 *restrict a, u64 n)
{
  double d = 0.0;

  for (u64 i = 0; i < n; i += 8)
  {
    d += a[i];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
    d += a[i + 4];
    d += a[i + 5];
    d += a[i + 6];
    d += a[i + 7];
  }

  return d;
}

f64 reduc_asm(f64 *restrict a, u64 n)
{
  double d = 0.0;

  __asm__ volatile(
    "xor %%rcx, %%rcx;\n"

    "loop:;\n"
    "movsd (%[a], %%rcx), %%xmm1;\n"
    "addsd %%xmm1, %[d];\n"
    "add $8, %%rcx;\n"
    "cmp %%rcx, %[n];\n"
    "jg loop;\n"
    
    :
    [d]"+v"(d)
    :
    [a]"r"(a),
    [n]"r"(n*8)
    :
    "cc", "memory", "rcx", "xmm1"
  );

  return d;
}
