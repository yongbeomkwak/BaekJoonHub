import Foundation

var apichResult: [Int] = []
var lionResult: [Int] = [Int](repeating:0, count:11)
var ans: [Int] = [-1]
var maxGap: Int = 0 
var duplicatedCheck: Set<[Int]> = .init()

func calcScore() {
    var lionScore = 0
    var apichScore = 0
    
    for i in 0..<11 {
        
        if apichResult[i] == 0 && lionResult[i] == 0 {
            continue
        }
        
        if apichResult[i] >= lionResult[i] {
            apichScore += i
        } else {
            lionScore += i
        }
        
    }
    
        
    if lionScore > apichScore && lionScore - apichScore >= maxGap  { 
        // 라이언이 이기고
        // 차이가 같다면 낮은 점수를 많이 맞춘 것이 우선이므로 >= 로 계속 업데이트 
        maxGap = lionScore - apichScore
        ans = lionResult
    }
    
}

func combination(_ index: Int, _ remainArrow: Int) {
    if remainArrow == 0 {
        if duplicatedCheck.contains(lionResult) { return }
        duplicatedCheck.insert(lionResult)
        calcScore()
        return
    }
    
    if index >= 11 {
        return
    }
    
    for next in index+1..<12 {
        for arrow in 0...remainArrow {
            lionResult[index] = arrow
            combination(next, remainArrow - arrow)
            lionResult[index] = 0
        }
    }
    
}


func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    apichResult = info.reversed()
    combination(0,n)
    
    
    return ans.reversed()
}