#include "gemm.h"
using namespace std;
using namespace sc_core;

void gemm(int M, int N, int K,
        INTYPE *A, int lda,
        INTYPE *B, int ldb,
        OUTTYPE *C, int ldc)
{    
    for (int i = 0; i < M; ++i) {
        for (int k = 0; k < K; ++k) {
            OUTTYPE A_PART = A[i * lda + k];
            for (int j = 0; j < N; ++j) {
                C[i*ldc + j] += (A_PART*B[k*ldb + j]);// >> SHAMT;
            }
        }
    }

}

