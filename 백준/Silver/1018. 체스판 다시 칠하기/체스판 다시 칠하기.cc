#include <iostream>
#include <cstdio>
#include <cstring>

using namespace std;

int main() {
   char B[][8]={
  {'B','W','B','W','B','W','B','W'},
  {'W','B','W','B','W','B','W','B'},
  {'B','W','B','W','B','W','B','W'},
  {'W','B','W','B','W','B','W','B'},
  {'B','W','B','W','B','W','B','W'},
  {'W','B','W','B','W','B','W','B'},
  {'B','W','B','W','B','W','B','W'},
  {'W','B','W','B','W','B','W','B'}
  };
  char W[][8]={
  {'W','B','W','B','W','B','W','B'},
  {'B','W','B','W','B','W','B','W'},
  {'W','B','W','B','W','B','W','B'},
  {'B','W','B','W','B','W','B','W'},
  {'W','B','W','B','W','B','W','B'},
  {'B','W','B','W','B','W','B','W'},
  {'W','B','W','B','W','B','W','B'},
  {'B','W','B','W','B','W','B','W'},
  };
    int M,N=0;
  scanf("%d %d",&M,&N);
  char **in=new char*[M];
  for(int i=0;i<M;i++)
    {
      in[i]=new char[N];
    }
  for(int i=0;i<M;i++)
    {
      string a;
      cin >> a;
      
      for(int j=0;j<N;j++)
        {
           in[i][j]=*(a.begin()+j);
         
        }
    }
  int end_row=M-8;
  int end_col=N-8;
  int count=9999;

  for(int i=0;i<=end_row;i++)
    {
      int j=0;
      while(j<=end_col)
        {
        int prev_count=0;
        int prev_count_black=0;
        int prev_count_white=0;
          for(int p=i;p<i+8;p++)
            {
              for(int k=j;k<j+8;k++)
                {
                  if(in[p][k]!=B[p-i][k-j])
                  {
                    prev_count_black++;
                  }
                }
            
              }
            for(int p=i;p<i+8;p++)
            {
              for(int k=j;k<j+8;k++)
                {
              
                  if(in[p][k]!=W[p-i][k-j])
                  {
                    prev_count_white++;
                  }
                }
            
              }

          if(prev_count_black>prev_count_white)
          {
            prev_count=prev_count_white;
          }
          else
          {
            prev_count=prev_count_black;
          }
          if(count>prev_count)
          {
            count=prev_count;
          }
          j++;
        }
    }
  printf("%d",count);
  
  
}