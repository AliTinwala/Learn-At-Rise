#include<stdio.h>

int MyFunction(int a,int b)
{
    return (a+b);
}

int main()
{
    int c = MyFunction(10,20);
    printf("Addition: %d",c);

    return 0;
}

