#include <stdio.h>

/* Call by Value */
int sqr(int a)
{
    a = a*a;
    return a;
}

/* Call by reference */
int sqrp(int *a)
{
    *a = (*a) * (*a);
    return *a;
}
int main()
{
    /* Call by value */
    printf("---Call by value---\n");
    int num = 4;
    int a = sqr(num);
    printf("Value of num: %d\n",num);
    printf("Value of a: %d\n",a);

    /* Call by reference */
    printf("---Call by reference---\n");
    num = 9;
    a = sqrp(&num);
    printf("Value of num: %d\n",num);
    printf("Value of a: %d\n",a);
    return 0;
}