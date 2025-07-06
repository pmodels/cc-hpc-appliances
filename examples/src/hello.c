#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    MPI_Init(&argc, &argv);

    int rank, size;
    char processor_name[MPI_MAX_PROCESSOR_NAME];
    int name_len;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Get_processor_name(processor_name, &name_len);

    printf("Hello from rank %d of %d running on %s\n", rank, size, processor_name);

    MPI_Finalize();
    return EXIT_SUCCESS;
}
