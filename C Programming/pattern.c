#include <stdio.h>

void Pattern1()
{
    printf("Pattern 1\n");
    int i,j,k=0;
    for(i=1;i<=5;i++)
    {
        for(k=5;k>=i;k--)
        {
            printf(" ");
        }
        for(j=1;j<=i;j++)
        {
            printf("* ");
        }
        printf("\n");
    }
}

void Pattern2()
{
    printf("Pattern 2\n");
    int i,j,k=0;
    for(i=1;i<=5;i++)
    {
        for(j=1;j<=i;j++)
        {
            printf("%d",j);
        }
        printf("\n");
    }
}

void Pattern3()
{
    printf("Pattern 3\n");
    int i,j,k=0;
    for(i=5;i>=1;i--)
    {
        for(j=1;j<=i;j++)
        {
            printf("%d",j);
        }
        printf("\n");
    }
}

void Pattern4()
{
    printf("Pattern 4\n");
    int i,j,k=0;
    for(i=1;i<=5;i++)
    {
        for(k=5;k>=i;k--)
        {
            printf(" ");
        }
        for(j=1;j<=i;j++)
        {
            printf("%d",j);
        }
        printf("\n");
    }
    for(i=4;i>=1;i--)
    {
        for(k=5;k>=i;k--)
        {
            printf(" ");
        }
        for(j=1;j<=i;j++)
        {
            printf("%d",j);
        }
        printf("\n");
    }
}

void Pattern5()
{
    printf("Pattern 5\n");
    int i,j,k=0;
    for(i=1;i<=5;i++)
    {
        for(k=5;k>=i;k--)
        {
            printf(" ");
        }
        for(j=1;j<=i;j++)
        {
            printf("* ");
        }
        printf("\n");
    }
    for(i=1;i<=4;i++)
    {
        for(k=0;k<=i;k++)
        {
            printf(" ");
        }
        for(j=4;j>=i;j--)
        {
            printf("* ");
        }
        printf("\n");
    }
}
int main()
{
    printf("\n");
    Pattern1();
    printf("\n");
    Pattern2();
    printf("\n");
    Pattern3();
    printf("\n");
    Pattern4();
    printf("\n");
    printf("\n");
    Pattern5();
    return 0;
}