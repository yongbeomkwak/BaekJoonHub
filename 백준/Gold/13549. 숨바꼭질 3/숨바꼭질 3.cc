/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <bits/stdc++.h>

using namespace std;

#define MAX 100001
#define INF 987654321
int _visit[MAX];
int dist[MAX];

int main()
{
  int n,k;
  cin >> n >> k;
  fill(dist,dist+MAX,INF);
  queue<int> q;
    
    dist[n]=0;
    q.push(n);
 

    while(!q.empty())
    {
        int now=q.front();
        q.pop();
        
        
        if(_visit[now]==1) continue;
        if(now==k) break;
        _visit[now]=1;
        
        if(now*2<=MAX-1&&dist[now*2]>dist[now])
        {
            q.push(now*2);
            dist[now*2]=dist[now];
            
        }
        
        if(now-1>=0&&dist[now-1]>dist[now]+1)
        {

            q.push(now-1);
            dist[now-1]=dist[now]+1;
        }
        if(now+1<=MAX-1&&dist[now+1]>dist[now]+1)
        {
            q.push(now+1);
            dist[now+1]=dist[now]+1;
        }
        
        
    }
    
    cout << dist[k] <<endl;
    
    
  
}
