/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <bits/stdc++.h>

using namespace std;
#define INF 987654321
#define MAX 10001
#define P pair<int, int>

int main()
{
    int p, f;
    cin >> p >> f;
    int ans = 0;
    priority_queue<P,vector<P>,greater<P>> pq;
    for (int i = 0; i < p; i++)
    {
        int pump;
        cin >> pump;
        pq.push({pump, 0}); //소화전은 second 0
    }
    for (int i = 0; i < f; i++)
    {
        int fireEngine;
        cin >> fireEngine;
        pq.push({fireEngine, 1}); //소방차는 second 1을 넣어 구분한다
    }
    int pos=p+f;
    vector<P> dp[2*pos];
    
    while(!pq.empty())
    {
        pq.top().second==1 ? dp[--pos].push_back(pq.top()) : dp[pos++].push_back(pq.top());
        pq.pop();
    }

    for(int i=0;i<2*(p+f);i++)
    {
        int s=0,m;
        for(int j=1;j<dp[i].size();j+=2)
        {
            s+=dp[i][j].first-dp[i][j-1].first;
        }
        m=s;
        if(dp[i].size()%2!=0)
        {
            for(int j=dp[i].size()-1;j>1;j-=2)
            {
              m=min(m,s+=dp[i][j].first-dp[i][j-1].first*2 +dp[i][j-2].first);  
            }
        }
        ans+=m;
    }

  



    cout << ans;
}
