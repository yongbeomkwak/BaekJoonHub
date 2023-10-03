import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    //투 포인트 
    var p1:Int = 0 
    var p2:Int = 0 
    var sum:Int = sequence.first!
    var ans:[[Int]] = .init()
    let n = sequence.count
    
    while p1 < n && p2 < n {
        
        if sum == k {
            ans.append([p1,p2])
        }
        
        if sum <= k {
            p2 += 1
            if p2 == n {
                break
            }
            sum += sequence[p2]
        }
        else {
            sum -= sequence[p1]
            p1 += 1
        }
        
    }
    
    ans = ans.sorted(by:{
        if $0[1] - $0[0] == $1[1] - $1[0] { // 길이가 같으면  
            return $0[0] < $1[0] // 시작이 빠른게
        } else {
            return $0[1] - $0[0] < $1[1] - $1[0] // 길이가 다르면 길이 짧은게 
        }
    })
    
    
    return ans.first!
}