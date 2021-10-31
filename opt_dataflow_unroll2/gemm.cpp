#include "gemm.h"

void gemm(const int M, const int N, const int K, const INTYPE A[512*512], const int lda, const INTYPE B[512*512], const int ldb, OUTTYPE C[512*512], const int ldc)
{
    loopm: for (int i = 0; i < M; ++i) {
    	#pragma HLS dataflow
        loopk: for (int k = 0; k < K; ++k) {
            OUTTYPE A_PART = A[i * lda + k];
            loopn: for (int j = 0; j < N; ++j) {
				#pragma HLS unroll factor=2
                C[i*ldc + j] += (A_PART*B[k*ldb + j]);// >> SHAMT;
				#pragma HLS latency min=1 max=1
            }
        }
    }
}

