#include <assert.h>
#include <stdio.h>
#include <cblas.h>


#include "dotprod/tools.h"
#include "dgemm/kernels.h"
#include "dotprod/kernels.h"
#include "reduc/kernels.h"


int main()
{
    // Matrices A & B + N
    int N = 4;
    int n = 2;
    f64 A[4] = {1.0, 2.0, 1.0, 3.0};
    f64 B[4] = {1.0, 2.0, 2.0, 1.0};
    f64 C[4] = {0.0, 0.0, 0.0, 0.0};

    // DGEMM TEST
    dgemm_ijk(A, B, C, n);
    assert(5.0 == C[0]);
    assert(4.0 == C[1]);
    assert(7.0 == C[2]);
    assert(5.0 == C[3]);

    // DOTPROD TEST
    assert( 10.0 == dotprod_base(A, B, N));
    assert( 10.0 == dotprod_cblas(A, B, N));
    assert( 10.0 == dotprod_unroll8(A, B, N));

    // REDUC TEST
    assert( 6.0 == reduc_base(B, N));

    printf("TESTS OK ! \n");
    return 0;
}