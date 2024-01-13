import Foundation

func combination(_ elements:[Int],_ k:Int) -> [([Int],[Int])] { // 주사위 n/2 개씩 나눠갖는 조합
    
    var results: [([Int],[Int])] = []

    func comb(_ now:[Int], _ index:Int) {
        
        if now.count == k {
            let `set` = Set(Array(0..<elements.count)) 
        
            let b = Array(set.subtracting(Set(now))) // 현재 갖고있는 주사위를 뺀 나머지를 b에게 줌
            
            results.append((now,b))
            return
        }
        
        for i in index..<elements.count {
            
            comb(now+[elements[i]],i+1)
        }
        
    }
    
    comb([],0)
    
    return results
    
}



func solution(_ dice:[[Int]]) -> [Int] {
    
    let n = dice.count
   
    let dices = Array(0..<n)
    
    let diceList = combination(dices,n/2) // (a,b) 형태로 모든 주사위 조합를 갖고 있는 배열
    
    var ans: ([Int],Int) = ([],0) // 주사위 조합, 승
    
    for (a,b) in diceList {
        var aSum: [Int] = [] // a 주사위 모든 합 경우의 수 
        var bSum: [Int] = [] // b 주사위 모든 합 경우의 수
        
        func rollDice(_ depth:Int, _ sum: Int,_ flag:Bool) {
            if flag { // A 주사위 
                
                if depth ==  n/2 {
                    aSum.append(sum)
                    return
                }

            } else { //B 주사위 
                if depth ==  n/2 {
                    bSum.append(sum)
                    return
                }
            }
            
            //현재 들고있는 주사위 
            let nowDice = flag ? dice[a[depth]] : dice[b[depth]]
            
            for i in 0..<6 { // 그 주사위의 함들을 더 해너감
                rollDice(depth+1,sum+nowDice[i],flag)
            }


        }
      
        
        rollDice(0,0,true) // A주사위 던지기
        rollDice(0,0,false) // B주사위 던지기
        
        
        bSum.sort()
        //오름 차순 정렬
        
        var totalWins: Int = 0
        var prevK: Int = -1
        var prevWins: Int = 0
        
        for k in aSum {
            
            var left = 0
            var right = bSum.count-1
         
            if k == prevK { // 만약 이전에 계산했던 값이면 이진 탐색 가지마
                totalWins += prevWins 
                continue
            }
            
            while left <= right { // 이진탐색
                
                let mid = (left+right)/2 
                
                
                if k > bSum[mid] {
                    left = mid+1 
                } else {
                    right = mid-1
                }
                
                
            }
            
            prevK = k 
            totalWins += left
            prevWins = left

            
            
        }
    
        if ans.1 < totalWins {
            ans = (a.map{$0+1},totalWins)
        }
        
    }
    
    
    return ans.0
}
