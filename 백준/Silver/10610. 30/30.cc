#include <bits/stdc++.h>

using namespace std;

#define MAX 100001

int cnt[10];

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    string a;
    bool error=false;
    string ret;
    cin >> a;
    
    for(int i=0;i<=9;i++)
    {
       cnt[i]=count(a.begin(),a.end(),(char)(i+ 48)); 
    }
    
    if(cnt[0]==0) error=true;
    else
    {
        int sum=0;
        for(int i=0;i<=9;i++)
        {
            sum+=i*cnt[i];
        }
        if(sum%3!=0) error=true;
        else
        {
            for(int i=9;i>=0;i--)
            {
                for(int j=0;j<cnt[i];j++)
                {
                    ret+=(char)(i+48);
                }
            }
        }
    }
    if(error) cout << -1;
    else cout << ret;
    
    
}
