import Foundation

func solution(_ numbers:[Int], _ k:Int) -> Int {
    
    var cnt:Int = 0
    var now:Int = 0
    let end = numbers.count 
    var ans:Int = 0
    while cnt != k {
        ans = now 
        cnt += 1
        now += 2
        if(now > end)
        {
            now -= end
        }
       // print("cnt: \(cnt) ans:\(ans) now:\(now) ")
        
    }
    
    return numbers[ans]
}