import Foundation


func solution(_ jobs:[[Int]]) -> Int {
    
    var sorted_jobs = jobs.sorted{ $0[1] < $1[1] }// 작업 시간 기준으로 정렬 
    
    var current_time: Int = 0
    var answer: Int = 0 
    
    while !sorted_jobs.isEmpty {
        
        var canRemove: Bool = false  // 현재 시간으로 디스크로 컨트롤러에 넣을 작업이 없으면
        
        for i in 0..<sorted_jobs.count {
            
            let start = sorted_jobs[i][0]
            let task = sorted_jobs[i][1]
            
            if start <= current_time {
                
                current_time += task // 현재 작업 시간만큼 진행 
                answer += current_time - start // (현재 시간 - 현재 작업 시작 시간)
                sorted_jobs.remove(at: i)
                canRemove = true
                break
            }
            
        }
        
        if canRemove == false {  
                // 작업을 넣은게 없으면  
                //현재 남은 작업 중 가장 빠른 시작시간으로 현재 시간 점프
            current_time = sorted_jobs.min{ a, b in a[0] < b[0] }![0]
        }
        
    }
    
    return answer / jobs.count
    
    
    
}