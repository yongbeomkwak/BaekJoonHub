#include <iostream>
#include <cstdio>
#include <array>

using namespace std;

bool comp(const int & w1,const int & h1,const int & w2,const int& h2)
{
 if(w2>w1&&h2>h1)
 {
   return true;
 }
  return false;
}
int main() {
    int tc=0;
    scanf("%d",&tc);
    int * w=new int [tc];
    int * h=new int [tc];
    int * result=new int [tc];
    
   
    for(int i=0;i<tc;i++)
      {
        scanf("%d %d",&w[i],&h[i]);
      }
    for(int i=0;i<tc;i++)
      {
        int rate=1;
        for(int j=0;j<tc;j++)
          {
            if(i==j)
            {
              continue;
            }
            else
            {
              if(comp(w[i],h[i],w[j],h[j]))
              {
                rate++;
              }
            }
          }
        result[i]=rate;
      }
  for(int i=0;i<tc;i++)
    {
      printf("%d ",result[i]);
    }
}