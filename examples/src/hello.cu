#include <stdio.h>
#include <mpi.h>
#include <cuda_runtime.h>

int main(int argc, char **argv) {
    int rank, size;
    int deviceCount;
    char hostname[MPI_MAX_PROCESSOR_NAME];
    int name_len;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Get_processor_name(hostname, &name_len);

    cudaError_t err = cudaGetDeviceCount(&deviceCount);
    if (err != cudaSuccess || deviceCount == 0) {
        fprintf(stderr,"No CUDA devices found or error occurred: %s\n", cudaGetErrorString(err));
        MPI_Finalize();
        return 1;
    }

    int deviceId = rank % deviceCount;
    cudaSetDevice(deviceId);

    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, deviceId);

    printf("Hello from rank %d of %d on host %s, GPU %d (%s)\n", rank, size, hostname, deviceId, prop.name);

    MPI_Finalize();
    return 0;
}
