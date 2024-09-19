import Foundation

func solution(_ places:[[String]]) -> [Int] {
        
    var ans: [Int] = []
    
    var places = places.map{ $0.map{ Array($0) } } // 문자열을 배열로 변경
    
    for place in places {
        
        var tmpPlace = place //
        
            func check(_ r: Int, _ c: Int, _ dist: Int) -> Bool {
                
                // 규칙을 지킴
                // 1.범위를 벗어 났거나 
                // 2. 맨해튼 거리가 2초과
                // 3. 중간에 파티션 있음
                
                if !(0..<5 ~= r) || !(0..<5 ~= c) || dist == 3 || tmpPlace[r][c] == "X" { 
                    return true 
                }  else if tmpPlace[r][c] == "P" { return false }  // 맨해튼 거리 2안에 또다른 응시자 있으면 불통 
                
                let nextDist = dist+1 

                // 모든 방향에 대하여 판단
                return check(r-1,c,nextDist) && check(r+1,c,nextDist) && check(r,c-1,nextDist) && check(r,c+1,nextDist)

                
            }
        
        // 규칙을 지켰는 . 지여부 
        var isAuthorized: Bool = true 
        
        for (row, seat) in place.enumerated() {
            for (col, p) in seat.enumerated() {   
                if p == "P" { // 응시자 발견 
                     tmpPlace[row][col] = "-" // 현재 앉은 곳을 하이픈으로 표시 
                     isAuthorized = check(row,col,0)
                }
                if !isAuthorized { break } // 지키지 않았다면 더이상 순회 붚필요
            }   
            
            if !isAuthorized { break } // 지키지 않았다면 더이상 순회 붚필요
        }
        
        if isAuthorized {
            ans.append(1)
        } else {
            ans.append(0)
        }
        
    }
    
    
    return ans
}