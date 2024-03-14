#include<stdio.h>

int main()
{
    /*
    int x,y;
    x=5;
    y=++x/2;
    printf("%d",y);
    return 0;
    */


    int a=4,b,c;
    b = a-=1;
    c = a--;
    printf("%d %d %d",a,b,c);
    return 0;


}