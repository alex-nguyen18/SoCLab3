#include <inttypes.h>

#define INTYPE int16_t
#define OUTTYPE int32_t
#define arr_sz 512*512

//void gemm(int M, int N, int K,
//	INTYPE *A, int lda,
//        INTYPE *B, int ldb,
//        OUTTYPE *C, int ldc);
void gemm(const int M, const int N, const int K,
const INTYPE A[], const int lda,
const INTYPE B[], const int ldb,
OUTTYPE C[], const int ldc);

