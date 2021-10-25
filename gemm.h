#include <systemc>
#include <inttypes.h>

#define INTYPE int16_t
#define OUTTYPE int32_t

void gemm(int M, int N, int K,
	INTYPE *A, int lda,
        INTYPE *B, int ldb,
        OUTTYPE *C, int ldc);

