import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    
    var rooms: [Int64:Int64] = [:]
    
    var ans:[Int64] = []
    
    rooms[0] = 0
    
    for prefer_room in room_number {
        
        if rooms[prefer_room] == nil { // 방이 비어 있다면 
            ans.append(prefer_room) // 방 배정 
            rooms[prefer_room] = prefer_room+1 // 다음에 만약 해당 인원이 오면 안내할 방 
        } else { // 만약 방안에 인원이 있다면 
            
            var now_room:Int64 = prefer_room
            var empty_room:Int64 = -1 
            
            while rooms[now_room] != nil {
                now_room = rooms[now_room,default:now_room+1] // 만약에 비어있다면 , 현재 다음 번호를 배당
            } 
            
            // while을 벗어나면 now_room = 비어있는 방 
            
            empty_room = now_room 
            ans.append(empty_room) // 빈 방 배정해주고 
            
            now_room = prefer_room // 다시 처음을 
            
            let next_empty_room = empty_room+1 // 비어있을 가능성이 있는 다음 방 
            
            while now_room != next_empty_room  { // 현재 방이 비어있을 가능성이 있는 다음 방 될 때 까지 
                let tmp = now_room // 임시변수 
                now_room = rooms[now_room,default:next_empty_room] // 현재방을 다음방으로 옮김
                rooms[tmp] = next_empty_room // 현재의 다음방을 위에서 찾은 다음 비어있는 방으로 연결
               
            }
            
        }
        
    }
    
    
    return ans
}