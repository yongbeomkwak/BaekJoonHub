import Foundation

func solution(_ lines:[[Int]]) -> Int {
    
    var arr = Array(repeating:0,count:201)
    var ans:Int = 0
    for a in lines{
        let start = a[0] + 100
        let end = a[1] + 100
        for i in (start..<end)
        {
            arr[i] += 1
        }
    }
    
    
    for i in (0..<200)
    {
        if(arr[i] > 1)
        {
            ans += 1
        }
    }
   
    
    return ans
}