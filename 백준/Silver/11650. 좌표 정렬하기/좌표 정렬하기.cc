#include <iostream>
#include <vector>
#include <cstdio>
#include <algorithm>
using namespace std;

bool comp(const pair<int,int> & a,const pair<int,int> &b)
{
  if(a.first<b.first)
  {
    return true;
  }
  else if(a.first==b.first)
  {
    return(a.second<b.second);
  }
  return false;
}

int main() {
  int tc=0;
  vector<pair<int,int>> v;
  int a,b=0;
  scanf("%d",&tc);
  for(int i=0;i<tc;i++)
    {
      scanf("%d %d",&a,&b);
      pair<int,int> p(a,b);
      v.push_back(p);
    }
  sort(v.begin(),v.end(),comp);
  for(auto k=v.begin();k!=v.end();k++)
    {
      printf("%d %d\n",k->first,k->second);
    }
  
}