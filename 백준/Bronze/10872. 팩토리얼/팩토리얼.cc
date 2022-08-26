#include <iostream>
#include <cstdio>
#include <cmath>
using namespace std;

int fact(const int & num)
{
  
  if(num==1||num==0)
  {
    return 1;
  }
  else
  {
    return fact(num-1) *num;  
  }
}
int main() {
  int n=0;
  scanf("%d",&n);
  printf("%d",fact(n));
}