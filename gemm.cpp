#include "gemm.h"

void gemm(const int M, const int N, const int K, const INTYPE A[512*512], const int lda, const INTYPE B[512*512], const int ldb, OUTTYPE C[512*512], const int ldc)
{
	#pragma HLS stream variable=A
	#pragma HLS stream variable=B
    loopm: for (int i = 0; i < M; ++i) {
		//#pragma HLS unroll factor=4
    	#pragma HLS dataflow
        loopk: for (int k = 0; k < K; ++k) {
			#pragma HLS unroll factor=4
            OUTTYPE A_PART = A[i * lda + k];
            loopn: for (int j = 0; j < N; ++j) {
				#pragma HLS pipeline
				#pragma HLS unroll factor=8
                C[i*ldc + j] += (A_PART*B[k*ldb + j]);// >> SHAMT;
				#pragma HLS latency min=1 max=1
            }
        }
    }
}

