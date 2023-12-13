import Foundation

enum Command : String {
    
    case e = "Enter"
    case c = "Change"
    case l = "Leave"
    
    
    var result : String {
        
        switch self {
            case .e:
                return "님이 들어왔습니다."
            
            default:
                return "님이 나갔습니다."
        }
        
    }
    
}

func solution(_ record:[String]) -> [String] {
    
    var dict: [String:String] = [:]
    
    var ans: [(String,Command)] = []
   
    for r in record {
        let info = r.split{$0 == " "}.map{String($0)}
        
        let command: Command = Command(rawValue:info[0])!
        let uid = info[1]

        
        switch command {
            
            case .e:
                let name = info[2]
                dict[uid] = name
                ans.append((uid,command))
            case .c:
                let name = info[2]
                dict[uid] = name 
            
            case .l:
                ans.append((uid,command))
        }
        
    }
    
    return ans.map{ (uid,cmd) -> String in 
        
        return dict[uid]!+cmd.result
    }
}