#include <iostream>
#include <cstdio>
#include <cstring>

using namespace std;

int main() {
  int roop=0; //TestCase
  int cnt=0; // 그룹단어 갯수
  string str; 

  
  scanf("%d",&roop);

  for(int i=0;i<roop;i++)
    {
      bool check=true;// 그룹단어인지 판단하기 위한변수
      bool roop_esc=false;
      cin >> str;
      if(str.length()==1) //만약 문자열의 길이가 1이면 무조건 그룹단어
      {
        check=true;
      }
      else
      {
        for(int j=0;j<str.length();j++) 
          {
              for(int k=j;k<str.length();k++)
                {
                  if(str[j]!=str[k])
                  {
                    for(int q=k;q<str.length();q++)
                      {
                        if(str[j]==str[q])
                        {
                         roop_esc=true;
                         check=false;
                          break;
                        }
                      }
                  }
                  else
                  {
                    check=true;
                  }
                   if(roop_esc)
                   {
                     break;
                   }
                  
                }
               if(roop_esc)
               {
                 break;
               }
        
          }
      }
      if(check)
      {
        cnt++;
      }
      else
      {
        continue;
      }
      
    }
   printf("%d",cnt);
}