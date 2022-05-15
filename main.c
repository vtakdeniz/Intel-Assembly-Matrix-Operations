#include<stdio.h>
#include<stdlib.h>


void add(int **matrix1, int **matrix2, int **result, int size);
int sum(int **matrix1, int size);

int** readMatrix(char* fileName, int* size) {
    FILE* file = fopen(fileName, "r");
    if (file == NULL) {
        printf("Error opening file %s\n", fileName);
        exit(1);
    }
    fscanf(file, "%d", size);
    int** matrix = (int**)malloc(sizeof(int*) * (*size));
    for (int i = 0; i < *size; i++) {
        matrix[i] = (int*)malloc(sizeof(int) * (*size));
        for (int j = 0; j < *size; j++) {
            fscanf(file, "%d", &matrix[i][j]);
        }
    }
    fclose(file);
    return matrix;
}

void printMatrix(int** matrix, int size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

void printResult(int sumOfArray){
    printf("\nSum of all elements in matrix1.txt : %d\n\n", sumOfArray);
}

int main(int argc, char* argv[]){

    if (argc != 3) {
        printf("Usage: %s <input_file1> <input_file2>\n", argv[0]);
        exit(1);
    }

    int size1, size2;
    int** matrix1 = readMatrix(argv[1], &size1);
    int** matrix2 = readMatrix(argv[2], &size2);

    if (size1 != size2) {
        printf("Error: matrices are not of the same size\n");
        exit(1);
    }

    printf("\nChoose which function to use:\n");
    printf("1. Add\n");
    printf("2. Sum\n");
    int choice;
    int ** result = (int**)malloc(sizeof(int*) * size1);
    for (int i = 0; i < size1; i++) {
        result[i] = (int*)malloc(sizeof(int) * size1);
    }
    scanf("%d", &choice);
    switch (choice) {
        case 1:
            printf("\nResult:\n\n");
            add(matrix1, matrix2, result, size1);
            printMatrix(result, size1);
            break;
        case 2:
            printResult(sum(matrix1, size1));
            break;
        default:
            printf("Error: invalid choice\n");
            exit(1);
    }
}