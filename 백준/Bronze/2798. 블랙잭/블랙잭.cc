#include <iostream>
#include <algorithm>
#include <cstdio>
#include <vector>

using namespace std;
bool comp(int a, int b) //오름차순
{
    if (a < b)
    {
        return true;
    }
    return false;
}

int main()
{
    int N = 0;
    int total = 0;
    int prev_total = 0;
    int in = 0;
    int M = 0;
    vector<int> v1;
    using namespace std;
    scanf("%d %d", &N, &M);
    for (int i = 0; i < N; i++)
    {
        scanf("%d", &in);
        v1.push_back(in);
    }
    vector<int>::iterator begin = v1.begin();
    sort(begin, begin + N, comp);

    for (int i = N - 1; i >= 2; i--)
    {
        for (int j = i - 1; j >= 1; j--)
        {
            total = 0;
            for (int k = j - 1; k >= 0; k--)
            {

                if (v1[i] + v1[j] + v1[k] == M)
                {
                    total = M;

                    break;
                }
                else if (v1[i] + v1[j] + v1[k] < M)
                {
                    total = v1[i] + v1[j] + v1[k];
                    if (prev_total < total)
                    {
                        prev_total = total;
                    }
                }
                if (total == M)
                {
                    break;
                }
            }
            if (total == M)
            {
                break;
            }
        }
        if (total == M)
        {

            break;
        }
    }
    if (prev_total > total)
    {
        total = prev_total;
    }
    printf("%d", total);
}