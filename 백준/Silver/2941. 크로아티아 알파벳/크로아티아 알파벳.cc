#include <iostream>
#include <cstring>
#include <cstdio>
using namespace std;
int main() {
   string str;
   cin >>str;
   string::iterator str_begin=str.begin();
   int total=0;
   while(str_begin!=str.end())
     {
      
       if(*(str_begin+1)=='=')
       {
         if(*(str_begin)=='c'||*(str_begin)=='s'||*(str_begin)=='z')
         {
           total++;
           str_begin+=2;
         }  
      }
      else if(*(str_begin+1)=='-')
         {
           if((*(str_begin)=='d')||(*(str_begin)=='c'))
           {
             total++;
             str_begin+=2;
           }
         }
       else if(*(str_begin)=='d'&&*(str_begin+1)=='z'&&*(str_begin+2)=='=')
       {
         total++;
         str_begin+=3;
       }
       else if(*(str_begin+1)=='j'&&(*(str_begin)=='l' ||*(str_begin)=='n'))
       {
         total++;
         str_begin+=2;
       }
       else
       {
         total++;
         str_begin++;
       }
       
      
     }
  printf("%d",total);
}