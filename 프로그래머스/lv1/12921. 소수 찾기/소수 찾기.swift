import Foundation 

func solution(_ n:Int) -> Int {
var arr = Array(repeating: true, count: n+1)


arr[1] = false
arr[0] = false

for i  in (2...n)
{
    if(arr[i])
    {
        var j:Int = i*i
        while(j<=n){
            arr[j]=false
            j+=i
        }
    }
}


    
    return arr.filter{$0}.count
}