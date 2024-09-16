import Foundation

struct Info {
    let id: String 
    let command: String
}

func solution(_ record:[String]) -> [String] {
    
    var recordDict: [String: String] = [:]

    var infoList: [Info] = []
    
    func write(info: String) {
        
        let component = info.components(separatedBy: " ")
        let command = component[0]
        let id = component[1]
       
        if command == "Enter" || command == "Change"  {
             let nickName = component[2]
            recordDict[id] = nickName
            
            if command == "Enter" {
                 infoList.append(Info(id: id, command: "님이 들어왔습니다."))
            }
            
        } else {
             infoList.append(Info(id: id, command: "님이 나갔습니다."))
        } 
    }
    
    record.forEach { info in
          write(info: info)
    }
       
    return infoList.map({ recordDict[$0.id]! + $0.command  })
}