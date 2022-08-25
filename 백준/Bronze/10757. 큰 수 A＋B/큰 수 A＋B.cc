#include <iostream>
#include <cstdio>
#include <cmath>
#include <vector>
#include <string>
#include <typeinfo>

using namespace std;

int main()
{
  string a;
  string b;
  string result;
  
  cin >> a >>b;
  string::reverse_iterator a_rev_iter=a.rbegin();
  string::reverse_iterator b_rev_iter=b.rbegin(); 
  int size_a = a.length();
  int size_b = b.length();
  int roop= size_a >size_b ? size_a :size_b;

  int ans=0;
  int plus =0;
  int i_a=0;
  int i_b=0;
 
  
  

  for(int i=0;i<=roop;i++)
    {
    if((a_rev_iter+i)<a.rend())
    {
      if(*(a_rev_iter+i)==NULL)
      {
        i_a=0;
      }
      else
      {
        i_a=int(*(a_rev_iter+i)) -'0';
      }
    }
    else
    {
        i_a=0;
    }
    
    if((b_rev_iter+i)<b.rend())
    {
      if(*(b_rev_iter+i)==NULL)
      {
        i_b=0;
      }
      else
      {
       
       
        i_b=int(*(b_rev_iter+i)) -'0'; // '0' =48
      }
    }
    else
    {
      i_b=0;
    }
    
      
      int c_ans=i_a+i_b+ans;
      int num=c_ans%10;
      
      ans=c_ans/10;
      if(i==roop && num==0)
      {
        break;
      }
      else
      {
         result.insert(0,to_string(num));
      }
     
      
      
      
      
    }

  cout <<result<<endl;
  
  
  
}
