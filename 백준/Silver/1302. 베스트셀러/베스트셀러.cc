#include <bits/stdc++.h>

using namespace std;

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    
    int n;
    cin >> n;
    
    map<string,int> um;
    for(int i=0;i<n;i++)
    {
        string a;
        cin >> a;
        um[a]++;
    }
    
    vector<pair<int,string>> v;
    
    for(auto it=um.begin();it!=um.end();it++)
    {
        const int cnt=(*it).second;
        string book=(*it).first;
        v.push_back({cnt,book});
    }
    
    sort(v.begin(),v.end(),greater<pair<int,string>>());
    
    const int max=v[0].first;
    
    vector<string> ret;
    for(int i=0;i<v.size();i++)
    {
        if(max!=v[i].first) break;
        ret.push_back(v[i].second);
    }
    
    sort(ret.begin(),ret.end());
    
    cout << ret[0];
    
    
}
