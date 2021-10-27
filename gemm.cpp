#include "gemm.h"

void gemm(int M, int N, int K, INTYPE A[512*512], int lda, INTYPE B[512*512], int ldb, OUTTYPE C[512*512], int ldc)
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

