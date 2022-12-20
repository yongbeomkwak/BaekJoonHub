import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    
    var ans:[[Int]] = Array(repeating:[],count:num_list.count/n)
    var idx:Int = 0
    
    for i in num_list {
        if(ans[idx].count != n){
            ans[idx].append(i)
            continue
        }
        else
        {
            idx += 1
            ans[idx].append(i)
        }
        
    }
    
    return ans
}