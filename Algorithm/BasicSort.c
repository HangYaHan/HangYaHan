#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// #### 基础排序
// 1. **冒泡排序**
//    - **描述**: 比较相邻元素，如果顺序错误就把它们交换过来。重复此步骤，直到整个数组有序。
//    - **时间复杂度**: O(n^2)
//    - **特点**: 稳定的排序算法，代码实现简单。

// 2. **选择排序**
//    - **描述**: 在未排序序列中找到最小(大)元素，和起始位置的元素进行交换。
//    - **时间复杂度**: O(n^2)
//    - **特点**: 不稳定的排序算法。

// 3. **插入排序**
//    - **描述**: 将未排序数据插入到已排序序列的合适位置。
//    - **时间复杂度**: O(n^2)
//    - **特点**: 稳定的排序算法，适合部分有序的数据。

// 4. **计数排序**
//    - **描述**: 一种非比较排序算法，通过统计每个元素出现的次数来排序。
//    - **时间复杂度**: O(n+k)，其中k是数据的范围。
//    - **应用**: 适用于数据范围较小且整数数据的排序。

// 5. **接口调用（sort函数）**
//    - **描述**: 很多编程语言都提供了内置的排序函数，如C++以及 Python 中的sort函数。
//    - **特点**: 使用方便，效率较高，通常采用优化的排序算法。

// 6. **比较函数实现**
//    - **描述**: 在自定义排序中，需要实现比较函数来确定元素的顺序。
//    - **应用**: 实现升序、降序等不同的排序效果。

// 7. **结构体排序**
//    - **描述**: 当需要对结构体数组进行排序时，要根据结构体的某个或多个成员进行排序。
//    - **应用**: 通过自定义比较函数来实现结构体的排序。

// ========== 结构体定义 ==========
typedef struct
{
    int id;
    char name[20];
    double score;
} Student;

// ========== 函数声明 ==========

// 1. 冒泡排序
void bubbleSort(int arr[], int n);

// 2. 选择排序
void selectionSort(int arr[], int n);

// 3. 插入排序
void insertionSort(int arr[], int n);

// 4. 计数排序
void countingSort(int arr[], int n, int maxVal);

// 5. 使用qsort的包装函数
void qsortWrapper(int arr[], int n);

// 6. 比较函数实现
int compareAsc(const void *a, const void *b);  // 升序比较函数
int compareDesc(const void *a, const void *b); // 降序比较函数

// 7. 结构体排序
void sortStudentsById(Student students[], int n);        // 按ID排序
void sortStudentsByScore(Student students[], int n);     // 按成绩排序
int compareStudentById(const void *a, const void *b);    // 学生ID比较函数
int compareStudentByScore(const void *a, const void *b); // 学生成绩比较函数

// ========== 辅助函数声明 ==========
void printArray(int arr[], int n);
void printStudents(Student students[], int n);
void copyArray(int source[], int dest[], int n);

// ========== 算法实现区域（待你完成） ==========

// 1. 冒泡排序 - 请在这里实现
void bubbleSort(int arr[], int n)
{
    // TODO: 实现冒泡排序
    // 提示：嵌套循环，比较相邻元素并交换
    for (int i = 0; i < n - 1; i++)
    {
        for (int j = 0; j < n - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                // 交换 arr[j] 和 arr[j + 1]
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

// 2. 选择排序 - 请在这里实现
void selectionSort(int arr[], int n)
{
    // TODO: 实现选择排序
    // 提示：找到最小元素的索引，然后交换
    for (int i = 0; i < n - 1; i++)
    {
        int minIndex = i;
        for (int j = i + 1; j < n; j++)
        {
            if (arr[j] < arr[minIndex])
            {
                minIndex = j;
            }
        }
        // 交换 arr[i] 和 arr[minIndex]
        if (minIndex != i)
        {
            int temp = arr[i];
            arr[i] = arr[minIndex];
            arr[minIndex] = temp;
        }
    }
}

// 3. 插入排序 - 请在这里实现
void insertionSort(int arr[], int n)
{
    // TODO: 实现插入排序
    // 提示：将当前元素插入到已排序部分的正确位置
    for (int i = 1; i < n; i++)
    {
        int key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j] > key)
        {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

// 4. 计数排序 - 请在这里实现
void countingSort(int arr[], int n, int maxVal)
{
    // TODO: 实现计数排序
    // 提示：创建计数数组，统计每个元素出现次数
    int *count = (int *)calloc(maxVal + 1, sizeof(int));
    if (count == NULL)
    {
        fprintf(stderr, "Memory allocation failed\n");
        return;
    }
    for (int i = 0; i < n; i++)
    {
        count[arr[i]]++;
    }
    // 重新排列原始数组
    int index = 0;
    for (int i = 0; i <= maxVal; i++)
    {
        while (count[i] > 0)
        {
            arr[index++] = i;
            count[i]--;
        }
    }
    free(count);
}

// 5. qsort包装函数 - 请在这里实现
void qsortWrapper(int arr[], int n)
{
    // TODO: 调用标准库的qsort函数
    // 提示：qsort(arr, n, sizeof(int), compareAsc);
    qsort(arr, n, sizeof(int), compareAsc);
}

// 6. 比较函数实现 - 请在这里实现
int compareAsc(const void *a, const void *b)
{
    // TODO: 实现升序比较函数
    // 提示：返回 *(int*)a - *(int*)b
    return *(const int *)a - *(const int *)b;
}

int compareDesc(const void *a, const void *b)
{
    // TODO: 实现降序比较函数
    // 提示：返回 *(int*)b - *(int*)a
    return *(const int *)b - *(const int *)a;
}

// 7. 结构体排序 - 请在这里实现
void sortStudentsById(Student students[], int n)
{
    // TODO: 使用qsort对学生按ID排序
}

void sortStudentsByScore(Student students[], int n)
{
    // TODO: 使用qsort对学生按成绩排序
}

int compareStudentById(const void *a, const void *b)
{
    // TODO: 实现学生ID比较函数
}

int compareStudentByScore(const void *a, const void *b)
{
    // TODO: 实现学生成绩比较函数（降序排列）
}

// ========== 辅助函数实现 ==========
void printArray(int arr[], int n)
{
    printf("[");
    for (int i = 0; i < n; i++)
    {
        printf("%d", arr[i]);
        if (i < n - 1)
            printf(", ");
    }
    printf("]\n");
}

void printStudents(Student students[], int n)
{
    printf("Student Information:\n");
    printf("ID\tName\t\tScore\n");
    printf("----------------------------\n");
    for (int i = 0; i < n; i++)
    {
        printf("%d\t%-10s\t%.2f\n", students[i].id, students[i].name, students[i].score);
    }
    printf("\n");
}

void copyArray(int source[], int dest[], int n)
{
    for (int i = 0; i < n; i++)
    {
        dest[i] = source[i];
    }
}

// ========== Test Program ==========
int main()
{
    printf("========== Basic Sorting Algorithm Test Program ==========\n\n");

    // Test data
    int original[] = {64, 34, 25, 12, 22, 11, 90, 88, 76, 50};
    int n = sizeof(original) / sizeof(original[0]);
    int testArr[10];

    printf("Original array: ");
    printArray(original, n);
    printf("\n");

    // 1. Test bubble sort
    printf("1. Bubble Sort Test:\n");
    copyArray(original, testArr, n);
    printf("Before sorting: ");
    printArray(testArr, n);
    bubbleSort(testArr, n);
    printf("After sorting: ");
    printArray(testArr, n);
    printf("\n");

    // 2. Test selection sort
    printf("2. Selection Sort Test:\n");
    copyArray(original, testArr, n);
    printf("Before sorting: ");
    printArray(testArr, n);
    selectionSort(testArr, n);
    printf("After sorting: ");
    printArray(testArr, n);
    printf("\n");

    // 3. Test insertion sort
    printf("3. Insertion Sort Test:\n");
    copyArray(original, testArr, n);
    printf("Before sorting: ");
    printArray(testArr, n);
    insertionSort(testArr, n);
    printf("After sorting: ");
    printArray(testArr, n);
    printf("\n");

    // 4. Test counting sort
    printf("4. Counting Sort Test:\n");
    copyArray(original, testArr, n);
    printf("Before sorting: ");
    printArray(testArr, n);
    countingSort(testArr, n, 100); // Assume max value is 100
    printf("After sorting: ");
    printArray(testArr, n);
    printf("\n");

    // 5. Test qsort (ascending)
    printf("5. qsort Ascending Sort Test:\n");
    copyArray(original, testArr, n);
    printf("Before sorting: ");
    printArray(testArr, n);
    qsortWrapper(testArr, n);
    printf("After sorting: ");
    printArray(testArr, n);
    printf("\n");

    // 6. Test qsort (descending)
    printf("6. qsort Descending Sort Test:\n");
    copyArray(original, testArr, n);
    printf("Before sorting: ");
    printArray(testArr, n);
    qsort(testArr, n, sizeof(int), compareDesc);
    printf("After sorting: ");
    printArray(testArr, n);
    printf("\n");

    // 7. Test struct sorting
    printf("7. Struct Sorting Test:\n");
    Student students[] = {
        {1003, "Alice", 85.5},
        {1001, "Bob", 92.0},
        {1005, "Charlie", 78.5},
        {1002, "Diana", 88.0},
        {1004, "Eve", 95.5}};
    int studentCount = sizeof(students) / sizeof(students[0]);

    printf("Original student information:\n");
    printStudents(students, studentCount);

    printf("After sorting by ID:\n");
    sortStudentsById(students, studentCount);
    printStudents(students, studentCount);

    printf("After sorting by score (descending):\n");
    sortStudentsByScore(students, studentCount);
    printStudents(students, studentCount);

    printf("========== Test Complete ==========\n");
    return 0;
}