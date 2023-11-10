import Foundation


enum Command : String {
    case insert = "I"
    case delete = "D"
}

struct DoublePriorityQueue {
    
    private var _elements:[Int] = []
    
    public var elements:[Int] {
        
        if _elements.isEmpty {
            return [0,0]
        }
        
        
        return [_elements.max()!, _elements.min()!]
    }
    
    mutating func insert(_ n: Int) {
        _elements.append(n)
    }
    
    mutating func delete(_ n: Int) {
        
        if _elements.isEmpty {
            return 
        }
        
        if n == 1 {
            
            if let index = _elements.firstIndex(of: _elements.max()!) {
                _elements.remove(at: index)
            }
            
        }
        
        else {
            if let index = _elements.firstIndex(of: _elements.min()!) {
                _elements.remove(at: index)
            }
        }
        
        
    }
    
}

func solution(_ operations:[String]) -> [Int] {
    
    var oper_list:[Operation] = []
    
    var dpq = DoublePriorityQueue()
    
    for oper in operations {

        let splited_input = oper.split{$0 == " "}.map{String($0)}

        let command: Command = Command(rawValue:splited_input[0])!
        let number = Int(splited_input[1])!
        
        if command == .insert {
            dpq.insert(number)
        }
        
        else {
            dpq.delete(number)
        }
        
       
    }
    
    
    return dpq.elements
}