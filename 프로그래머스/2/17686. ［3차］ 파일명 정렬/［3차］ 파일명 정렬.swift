struct File {
    
    var head = ""
    var number = ""
    var tail = ""
    
    var raw: String = ""
    
    
    public init(_ head: String, _ number: String, _ tail: String = "") {
        self.head = head
        self.number = number
        self.tail = tail
        
        raw = head+number+tail
    }
    
    public static func <= (lhs:Self, rhs: Self) -> Bool {
        
        let lHead = lhs.head.uppercased()
        let rHead = rhs.head.uppercased()
        
        let lNumber = Int(lhs.number)!
        let rNumber = Int(rhs.number)!
        
        
        if lHead < rHead {
            return true 
        } else if lHead == rHead {
        
            return lNumber < rNumber // stable sort: ==  false 
        } 
        
        return false
    }
    
    
    
}

func solution(_ files:[String]) -> [String] {
    
    
    var convertedFiles: [File] = []
    
    for file in files {
        var i = 0 // 0: haed , 1: number : 2 tail 
        
        var head: String = ""
        var number: String = ""
        var tail: String = ""
        
        for c in file {
            
            if i == 0 && c.isNumber { // 현재 head인데 지금 문자가 숫자면 number로 스위칭
                i += 1
            }
            
            if i == 1 && !c.isNumber { // 현재 number인데 지금 문자가 숫자가 아니면 tail로 스위칭 
                i += 1 
            }
            
            switch i {
                case 0 :
                    head.append(String(c))
                
                case 1 :
                    number.append(String(c))
                
                default :
                    tail.append(String(c))
            }
            
        }

        
        convertedFiles.append(File(head,number,tail))
    }
    
    
    
    return convertedFiles.sorted(by:<=).map{$0.raw}
}