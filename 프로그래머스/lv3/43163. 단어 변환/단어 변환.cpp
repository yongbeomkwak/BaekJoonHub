#include <bits/stdc++.h>

using namespace std;

int diff(const string s1,const string s2)
{
    int cnt=0;
    for(int i=0;i<s1.length();i++)
    {
        if(s1[i]!=s2[i]) cnt++;
    }
    return cnt;
}


int solution(string begin, string target, vector<string> words) {
    int answer = 0;

    if(count(words.begin(),words.end(),target)==0) return 0;
    
    for(string & s:words)
    {
        if(diff(target,s)<diff(begin,target)) //타겟과 해당 words문자열 차이가, 현재 문자열과 target의 차이보다 작을 때
        {
            answer+=diff(begin,s); //현재 문자열 해당 words문자열 만큼 차이를 더한 후 
            begin=s; //현재 문자열을 바꿔준다
        }
    }
    
    return answer;
}