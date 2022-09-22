#include <iostream>
#include <algorithm>

using namespace std;

#define MAX 100000000
int N=0;
int max_num,min_num;
int operatorArr[4]={0};
int num_Arr[100]={0};
int final_max=MAX*-1 -1;
int final_min=MAX+1;
void back(int plus,int minus,int multiple,int divide,int n,int result)
{
 if(n==N)
 {
  
   final_max=max(final_max,result);
   final_min=min(final_min,result);
   return;
 }
 if(plus>0)
 {
   back(plus-1,minus,multiple,divide,n+1,result+num_Arr[n]);
 }
  if(minus>0)
 {
   back(plus,minus-1,multiple,divide,n+1,result-num_Arr[n]);
 }
  if(multiple>0)
 {
   back(plus,minus,multiple-1,divide,n+1,result*num_Arr[n]);
 }
  if(divide>0)
 {
   back(plus,minus,multiple,divide-1,n+1,result/num_Arr[n]);
 }
}
int main() {
    
    scanf("%d",&N);
    
    for(int i=0;i<N;i++)
      {
        scanf("%d",&num_Arr[i]);
      }
    for(int i=0;i<4;i++)
      {
        scanf("%d",&operatorArr[i]);
      }
    back(operatorArr[0],operatorArr[1],operatorArr[2],operatorArr[3],1,num_Arr[0]);
   printf("%d\n%d",final_max,final_min);
  }