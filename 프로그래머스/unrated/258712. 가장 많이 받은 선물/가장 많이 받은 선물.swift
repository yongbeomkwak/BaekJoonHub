import Foundation

func combination<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func combi(_ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        for i in index..<elements.count {
            combi(i + 1, now + [elements[i]])
        }
    }
    combi(0, [])
    return result
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    var gift_score: [Int:Int] = [:] 
    var giveCount: [String:Int] = [:]
    var mappingDict: [String:Int] = [:]
    
    for f in friends {
        mappingDict[f] = mappingDict.count 
    }

    for gift in gifts {
        
        let g = gift.split{$0 == " "}.map{String($0)}
         
        let (sender,receiver) = (mappingDict[g[0]]!,mappingDict[g[1]]!)
        gift_score[sender] = gift_score[sender,default:0]+1
        gift_score[receiver] = gift_score[receiver,default:0]-1
        giveCount["a\(sender)b\(receiver)"] = giveCount["a\(sender)b\(receiver)",default:0]+1
    }
    
    var comb = combination(Array(0..<friends.count),2)

    var results: [Int] = [Int](repeating:0,count:friends.count)
    
    for c in comb {
        
        let (p1,p2) = (c[0],c[1])
        
        let (s1,s2) = (gift_score[p1,default:0], gift_score[p2,default:0])
        
        let (g1,g2) = (giveCount["a\(p1)b\(p2)",default:0], giveCount["a\(p2)b\(p1)",default:0])
        
        
        if g1 == g2 {
            
            if s1 > s2 {
                results[p1]+=1 
            } else if s2 > s1 {
                results[p2]+=1
            }
            
        } else if g1 > g2 {
            
            results[p1]+=1
        } else {
            results[p2]+=1
        }
        
    }
    
    
    return results.max()!
}