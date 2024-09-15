import Foundation

struct File: Comparable {
    let head: String
    let number: String
    let tail: String
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        
        let lhead = lhs.head.lowercased()
        let rhead = rhs.head.lowercased()
        
        if lhead == rhead {
          
            if Int(lhs.number)! < Int(rhs.number)! { // stable sort
                return true 
            }
            
        } 
        
        return lhead < rhead
    }
    
    func toString() -> String {
        return head+number+tail
    }
    
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func convert(file name: String) -> File {
    var head: [String] = []
    var number: [String] = []
    var tail: [String] = []
    
    var headBeginFlag: Bool = true 
    var numberBeginFlag: Bool = false
    var tailBeginFlag = false 
    
    for c in name {
       if c.isNumber {
           if headBeginFlag {
               numberBeginFlag = true 
               headBeginFlag = false 
           }
       } else {
           if numberBeginFlag {
               numberBeginFlag = false
               tailBeginFlag = true 
           }
       }
    
        let s = String(c)
    
        
        if headBeginFlag {
            head.append(s)
        } else if numberBeginFlag {
            number.append(s)
        } else {
            tail.append(s)
        }
        
    }
    
     return File(head: head.joined(), number: number.joined(), tail: tail.joined())
}

func solution(_ files:[String]) -> [String] {
    
    let fileList: [File] = files.map( {convert(file: $0)}).sorted(by: <)
    
    
    return fileList.map{$0.toString()}
}