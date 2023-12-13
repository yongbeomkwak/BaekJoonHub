import Foundation


enum DIR: String {
    case L = "L"
    case U = "U"
    case R = "R"
    case D = "D"
    
    var tuple: (Int,Int) {
        
        switch self {
            case .L:
                return (0,-1)
            
            case .U:
                return (-1,0)
            
            case .R:
                return (0,1)
            
            case .D:
                return (1,0)
        }
        
    }

}


func solution(_ dirs:String) -> Int {
    
    var now: [Int] = [5,5] 
    
    var ans:Int = 0
    
    var record: [[Int]] = []
    
    for dir in dirs {
 
        let dir = DIR(rawValue:String(dir))!
        
        let nextX = now[0] + dir.tuple.0
        let nextY = now[1] + dir.tuple.1

        
        if nextX < 0 || nextX > 10 || nextY < 0 ||  nextY > 10 {
            continue
        }
     

        record.append([now[0],now[1],nextX,nextY]) // 현재 -> 다음
        record.append([nextX,nextY,now[0],now[1]]) // 다음 -> 현재   2개 모두 1길
        
        now[0] = nextX
        now[1] = nextY
        
    }
    
    let remove_duplicated = Set(record) // 셋으로 중복제거 한 후
    
    return remove_duplicated.count/2 //  1 -> 2 , 2 -> 1 같은 길이므로 나누기 2
}