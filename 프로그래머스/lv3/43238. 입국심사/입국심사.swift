import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    var times:[Int] = times.sorted()
    let cnt = times.count
    var _left:Int64 = 0
    var _right:Int64 = Int64(times[cnt-1]) * Int64(n)

    var ans:Int64 = 0
    while _left <= _right {

        let mid:Int64 = (_left+_right) / 2
        
        var success:Int = 0
        
        for time in times{
            success += (Int(mid)/time)
        }
        
        
        if success < n {
            _left = mid + 1 
        }
        
        else {
            ans = mid
            _right = mid - 1 
        }
        
    }
    
    return ans
}