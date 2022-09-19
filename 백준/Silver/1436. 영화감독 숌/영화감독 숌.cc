#include <iostream>
#include <cstdio>
#include <cstring>

using namespace std;
bool checkEndNumber(const string & str)
{
  if(str.find("666")==string::npos)
  {
    return false;
  }
  return true;
}
int main() {
   string N;
   cin >>N;
   int int_N=stoi(N);
   int count=0;
   int start=665;
   while(count!=int_N)
     {
       start++;
       if(checkEndNumber(to_string(start)))
       {
         count++;
       }
       
     }
   printf("%d",start);
  
}