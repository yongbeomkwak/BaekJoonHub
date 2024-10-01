func solution(_ coin:Int, _ cards:[Int]) -> Int {
    var coin = coin
    let n = cards.count
    var point = n/3
    var myCards = Array(cards[0..<point]) // n/3개 가지고 시작
    var keepCards: [Int] = []
    var round = 1
    let target = n+1
    
outer:
    while true {
        // 코인도 없고 낼 수 있는 카드도 없으면
        if (myCards.isEmpty && coin <= 1) || (point == n) {
            break
        }
        // 먼저 추가
        let card1 = cards[point]
        let card2 = cards[point+1]
        keepCards.append(card1)
        keepCards.append(card2)

        for i in 0..<myCards.count-1 {
            for j in i+1..<myCards.count {
                let myCard1 = myCards[i]
                let myCard2 = myCards[j]
                // 내 카드에서 2장을 뽑을 수 있으면
                if (myCard1+myCard2) == target {
                    round += 1
                    point += 2
                    myCards.remove(at: i)
                    myCards.remove(at: i > j ? j : j-1)
                    continue outer
                }
            }
        }
       
        // 코인이 1개 이상 남아있고 내카드+킵해둔 카드를 낼 수 있으면
        if coin >= 1 {
            for i in 0..<myCards.count {
                for j in 0..<keepCards.count {
                    let myCard = myCards[i]
                    let keepCard = keepCards[j]
                    
                    // 내카드 + 킵카드써서 코인 1개 소모
                    if myCard+keepCard == target {
                        round += 1
                        coin -= 1
                        point += 2
                        myCards.remove(at: i)
                        keepCards.remove(at: j)
                        continue outer
                    }
                }
            }
        }
        
        // 코인이 2개이상 남아있고 킵해둔 카드에서 다 낼 수 있으면
        if coin >= 2 {
            for i in 0..<keepCards.count-1 {
                for j in i+1..<keepCards.count {
                    let keepCard1 = keepCards[i]
                    let keepCard2 = keepCards[j]
                    
                    // 킵카드 2개 써서 코인 2개 소모
                    if (keepCard1+keepCard2) == target {
                        round += 1
                        coin -= 2
                        point += 2
                        keepCards.remove(at: i)
                        keepCards.remove(at: i > j ? j : j-1)
                        continue outer
                    }
                }
            }
        }
        break
    }
    return round
}
