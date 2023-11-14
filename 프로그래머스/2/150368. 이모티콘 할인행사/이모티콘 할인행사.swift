import Foundation



func disCount(_ price: Int, _ per:Int) -> Int {
    return (price * (100 - per)) / 100
}


func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    //user: [할인율 기준, 전환 기준값]
    //emoticons: 가격 
    
    var sale = [Int](repeating: 0, count: emoticons.count)
    let percent = [10, 20, 30, 40]
    var answer = [0, 0]
    
    func dfs(_ depth: Int) {
        
        if depth == sale.count {
            var plus: Int = 0
            var money: Int = 0
            
            users.forEach { user in 
                 // user[0] = 기준 퍼센티지
                // user[1] = 전환 기준 가격
                var total: Int = 0
                
                zip(sale,emoticons).forEach {
                    // $0 = 세일 
                    // $1 = 이모티콘 가격
                   
                    
                    if user[0] <=  $0 { // 세일이 기준 퍼센티지보다 높으면 구매
                        total += disCount($1,$0)
                    }
                    
                }
                
                if total >= user[1] { // 전환 기준을 넘으면 plus 로 전환
                    plus += 1    
                } else {
                    money += total // 전환 안하면 그냥 구매
                }
                
            }
            
            if plus > answer[0] { // plus가 한 명이라도 많으면 그것이 베스트
                answer[0] = plus
                answer[1] = money 
            } else if plus == answer[0] , money > answer[1] { // 플러스는 같은데, 많이 팔았으면
                 answer[1] = money 
            }
           
            return 
        }
        
        
        percent.forEach { // 조합 
            sale[depth] = $0
            dfs(depth+1)
        }
    }
    
    dfs(0)
    
    
    
    return answer // 가입자수, 이모티콘 매출 액 
}