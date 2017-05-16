#include <stdio.h>
#include <string.h>

int main(void)
{
    int k[10] = {0x80097E3};
    char buff[15];
    int pass = 0;
    int j = 0x80097E3;
    printf("\n Enter the password : \n");
    gets(buff+j);

    if(strcmp(buff, "thegeekstuff"))
    {
        printf ("\n Wrong Password \n");
    }
    else
    {
        printf ("\n Correct Password \n");
        pass = 1;
    }

    if(pass)
    {
       /* Now Give root or admin rights to user*/
        printf ("\n Root privileges given to the user \n");
    }

    return 0;
}