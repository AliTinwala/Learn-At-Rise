#include<stdio.h>
int main()
{
    int a = 20;
    int *ptr = &a;
    int **b = &ptr;

    printf("Address of a: %u\n",&a);
    printf("Address of ptr: %u\n",&ptr);
    printf("Value of a using ptr: %u\n",*ptr);
    
    printf("Value of a using pointer p: %u\n",**b);
}


