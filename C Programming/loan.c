#include<stdio.h>

int main()
{
    int loan,int_amt,amt_pay,principal,month = 1;
    static int time = 3, interest = 3;
    int total_int = 0;
    printf("Enter loan amount: ");
    scanf("%d",&loan);
    int balance = loan;
    principal = (loan * 10) / 100;
    printf("Month|Monthly Fixed Principal Amount |3%% interest for remaining balance| Balance\n");
    while(month <= 10 && balance >= 0)
    {
        int_amt = (balance * interest) / 100;
        total_int += int_amt;
        balance = balance - principal;
        printf("%d    | %d                           | %d                              | %d     \n", month, principal, int_amt, balance);
        month = month + 1;
    }
    printf("Total amount payable: %d", loan + total_int);
    return 0;
}