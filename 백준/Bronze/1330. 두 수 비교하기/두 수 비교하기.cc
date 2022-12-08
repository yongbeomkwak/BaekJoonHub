#include <iostream>

using namespace std;

int main()
{
    int a,b;
    cin >>a;
    cin >>b;
    
    if(a>b)
    {
        cout << ">" ;
    }
    else if(b>a)
    {
        cout <<"<";
    }
    else
    {
     cout <<"==";    
    }
    
}