import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    
    var dict:[Int64:Int64] = [:] // (현재 방:다음 방)
    
    var ans:[Int64] = []
    
    for num in room_number {
        
        if dict[num] == nil { // 비어있으면 방 배정
            ans.append(num)
            dict[num] = num+1 // 다음 사람오면 바로 다음 방으로 안내
        }
        
        else {
            
            var r = num 
            
            while dict[r] != nil { //루트 찾고

                r = dict[r]!
                
            }

            
            var c = num

            while dict[c] != nil { // 패스 최적화
                    
                let nextC = dict[c]!
                dict[c] = r+1 // 위에서 찾은 부모들을 맵핑
                c = nextC
            }
        
            dict[r] = r+1 // r(가장 최근에 들어간 번호)의 다음은 r+1
            ans.append(r)
      
        }
    }
    
    
    
    return ans
}