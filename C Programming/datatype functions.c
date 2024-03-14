// Online C compiler to run C program online
#include <stdio.h>
#include <string.h>

void VoidFunc()
{
    printf("Void Function\n");
}
int IntFunc()
{
    return 10+20;
}
float FloatFunc()
{
    return 10*20.00;
}
double DoubleFunc()
{
    return 10*30.00;
}
char CharFunc()
{
    return 'A';
}
char* StringFunc()
{
    static char a[] = "ALI";
    return a;
}

int main() {
    // Write C code here
    printf("%d\n",IntFunc());
    printf("%f\n",FloatFunc());
    printf("%lf\n",DoubleFunc());
    printf("%c\n",CharFunc());
    printf("%s\n",StringFunc());
    VoidFunc();
    printf("\n");
    return 0;
}
