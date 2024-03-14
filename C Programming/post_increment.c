#include <stdio.h>

int main()
{
    /*
    int a=2,b=5,c=0;
    c = ++a+b;
    printf("%d %d %d\n",a,b,c);
    return 0;
    */
	//post increment
    int a=5,b=-7,c=0,d;
    d=++a && ++b || c;
    printf("%d %d %d\n",a,b,c);
    printf("%d\n",++a && ++b);
    printf("%d\n",c);
    printf("%d",d);

	//for loop
	int i;
    for(i=0;i<=5;i++);
    printf("i = %d",i);

}