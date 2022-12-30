import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    let score_sorted =  score.map{ ($0[0]+$0[1])  }.sorted(by: >)
    
    return score.map{ score_sorted.firstIndex(of:($0[0]+$0[1]) )! + 1  } 
}