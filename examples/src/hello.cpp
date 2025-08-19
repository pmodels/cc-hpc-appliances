#include <stdio.h>
#include <mpi.h>
#include <hip/hip_runtime.h>

int main(int argc, char **argv) {
    int rank, size;
    int deviceCount;
    char hostname[MPI_MAX_PROCESSOR_NAME];
    int name_len;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Get_processor_name(hostname, &name_len);

    hipError_t err = hipGetDeviceCount(&deviceCount);
    if (err != hipSuccess || deviceCount == 0) {
        fprintf(stderr, "No HIP devices found or error occurred: %s\n", hipGetErrorString(err));
        MPI_Finalize();
        return 1;
    }

    int deviceId = rank % deviceCount;
    err = hipSetDevice(deviceId);
    if (err != hipSuccess) {
        fprintf(stderr, "Failed to set device %d: %s\n", deviceId, hipGetErrorString(err));
        MPI_Finalize();
        return 1;
    }

    hipDeviceProp_t prop;
    err = hipGetDeviceProperties(&prop, deviceId);
    if (err != hipSuccess) {
        fprintf(stderr, "Failed to get device properties for device %d: %s\n", deviceId, hipGetErrorString(err));
        MPI_Finalize();
        return 1;
    }

    printf("Hello from rank %d of %d on host %s, GPU %d (%s)\n",
           rank, size, hostname, deviceId, prop.name);

    MPI_Finalize();
    return 0;
}
