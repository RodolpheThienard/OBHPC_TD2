#include <assert.h>
#include <stdio.h>
#include <cblas.h>


#include "../dotprod/tools.h"
#include "../dgemm/kernels.h"
#include "../dotprod/kernels.h"
#include "../reduc/kernels.h"

void reset_c(f64 *a, u64 N)
{
    for (int i = 0; i < N; i++) {
        a[i] = 0.0;
    }
}

int main()
{
    // Matrices A & B + N
    int N = 4;
    int n = 2;
    f64 A[4] = {1.0, 2.0, 1.0, 3.0};
    f64 B[4] = {1.0, 2.0, 2.0, 1.0};
    f64 C[4] = {0.0, 0.0, 0.0, 0.0};

    f64 A8[8] = {1.0, 2.0, 1.0, 3.0, 1.0, 2.0, 1.0, 3.0};
    f64 B8[8] = {1.0, 2.0, 2.0, 1.0, 1.0, 2.0, 1.0, 3.0};
    f64 C8[8] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    
    // DGEMM TEST
    dgemm_ijk(A, B, C, n);
    assert(5.0 == C[0] && 4.0 == C[1] && 7.0 == C[2] && 5.0 == C[3]);
    reset_c(C, N);

    dgemm_ikj(A, B, C, n);
    assert(5.0 == C[0] && 4.0 == C[1] && 7.0 == C[2] && 5.0 == C[3]);
    reset_c(C, N);

    dgemm_iex(A, B, C, n);
    assert(5.0 == C[0] && 4.0 == C[1] && 7.0 == C[2] && 5.0 == C[3]);
    reset_c(C, N);

    dgemm_cblas(A, B, C, n);
    assert(5.0 == C[0] && 4.0 == C[1] && 7.0 == C[2] && 5.0 == C[3]);
    reset_c(C, N);


    // DOTPROD TEST
    assert( 10.0 == dotprod_base(A, B, N));
    assert( 10.0 == dotprod_cblas(A, B, N));
    assert( 10.0 == dotprod_asm(A, B, N));
    assert( 25.0 == dotprod_unroll8(A8, B8, 8));
    
    // REDUC TEST
    assert( 6.0 == reduc_base(B, N));
    assert( 6.0 == reduc_cblas(B, N));
    assert( 6.0 == reduc_asm(B, N));
    // assert( 6.0 == reduc_avx(B, N));
    assert( 13.0 == reduc_unroll8(B8, N));

    printf("TESTS OK ! \n");
    return 0;
}