import Foundation


func solution(_ coin:Int, _ cards:[Int]) -> Int {
    
    let n = cards.count
    let target = n+1
    var index = n/3
    var myCards = cards[0..<index]
    var tmpCards: [Int] = []
    var coin = coin
    var round: Int = 1 
    
    outer: 
    while true {
        
        if ( coin<=1 && myCards.isEmpty || index == n ) { 
            // 동전이 1개 이하 , 카드가 없다면 진행 불가 , 모든 카드를 봤으면 진행 불가 
            break
        }
        
        let card1 = cards[index]
        let card2 = cards[index+1]
        tmpCards.append(card1)
        tmpCards.append(card2)
        
        // 이미 있는 카드로 다음라운드 갈 수 있는 경우
        for i in 0..<myCards.count-1{
            for j in i+1..<myCards.count {
                
                let myCard1 = myCards[i]
                let myCard2 = myCards[j]
                
                if myCard1 + myCard2 == target {
                    index+=2 // 다음라운드로 갈 때 뽑은 2개 카드는 넘어가야함
                    round+=1
                    myCards = myCards.filter {$0 != myCard1 && $0 != myCard2} // 여기서 2장 사용 
                    continue outer
                }
            }
        }
        
        // 있는 카드 + 뽑은 카드 
        if coin >= 1 {
            for i in 0..<myCards.count {
                for j in 0..<tmpCards.count {

                    let myCard1 = myCards[i]
                    let myCard2 = tmpCards[j]

                    if myCard1 + myCard2 == target {
                        index+=2 // 다음라운드로 갈 때 뽑은 2개 카드는 넘어가야함
                        round+=1
                        coin-=1
                        myCards.remove(at:i)
                        tmpCards.remove(at:j)
                        continue outer
                    }
                }

            }
        }
        
        if coin >= 2 {
            for i in 0..<tmpCards.count-1{
                for j in i+1..<tmpCards.count{

                    let myCard1 = tmpCards[i]
                    let myCard2 = tmpCards[j]

                    if myCard1 + myCard2 == target {
                        index+=2 // 다음라운드로 갈 때 뽑은 2개 카드는 넘어가야함
                        round+=1
                        tmpCards = tmpCards.filter {$0 != myCard1 && $0 != myCard2} // 여기서 2장 사용 
                        coin-=2 
                        continue outer
                    }
                }
        }
        }
        
        break // 위 모든 3가지 방법으로 진행안되면 답없음
    }
    
    return round
}