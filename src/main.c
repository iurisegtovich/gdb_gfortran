#include <stdio.h>
#include <stdlib.h>

int main(void){
// two variables, we will test i and modify j
int i;
int j;
// i is 1
i=1;
// j is zero for default
j=0;
// let the tests begin
  if ((i != 2) && (i != 3))
  {
    j=1; // if #1a triggered
    if (i == 1)
    {
      j=11; // if #1a1a triggered
    }
    else
    {//i .ne. 1
      j=2; // if #1a1b not triggered
    }
  }
  else
  {//i .eq. 2 .or. i .eq. 3 .or. isnan(i)
    j=3; //if #1b not triggered
  }

switch(i){
  case 1 :
    j=111; //case #1 triggered
    break;
  default : //i .ne. 1
    j=4; //case #2 not triggered
    break;
}

void sub1(void){
//lets also see an issue with allocatables
int *k;
k = (int *)calloc(10, sizeof(int));	/* with a cast */
free(k);
}

sub1();

return(0);
}
