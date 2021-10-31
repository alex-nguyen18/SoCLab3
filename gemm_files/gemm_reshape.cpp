#include "gemm.h"

void gemm(const int M, const int N, const int K, const INTYPE A[512*512], const int lda, const INTYPE B[512*512], const int ldb, OUTTYPE C[512*512], const int ldc)
{
    INTYPE A1[512*512];
    INTYPE B1[512*512];
	loopc: for (int c=0; c<512*512; c++) {
		#pragma HLS pipeline
    	A1[c]=A[c];
    	B1[c]=B[c];
    }
	#pragma HLS array_reshape variable=A1 cyclic factor=8 dim=1
	#pragma HLS array_reshape variable=B1 cyclic factor=8 dim=1
	loopm: for (int i = 0; i < M; ++i) {
        loopk: for (int k = 0; k < K; ++k) {
            OUTTYPE A_PART = A1[i * lda + k];
            loopn: for (int j = 0; j < N; ++j) {
                C[i*ldc + j] += (A_PART*B1[k*ldb + j]);// >> SHAMT;
            }
        }
    }
}

