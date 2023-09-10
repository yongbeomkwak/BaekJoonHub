import Foundation

func solution(_ record:[String]) -> [String] {
    
    var hash: [String:String] = .init()
    var order: [(String,String)] = .init()
    var answer: [String] = .init()
    record.forEach {
        let map = $0.split{$0 == " "}.compactMap{String($0)}
        
        if map[0] == "Enter" {
            hash[map[1]] = map[2]
            order.append((map[1],"님이 들어왔습니다."))
        }
        else if map[0] == "Leave" {
             order.append((map[1],"님이 나갔습니다."))
        }
        else {
             hash[map[1]] = map[2]
        }
        
    }
    
    order.forEach{
        answer.append("\(hash[$0.0,default: "" ])\($0.1)")
    }
    
    
    return answer
}