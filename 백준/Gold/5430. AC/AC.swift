import Foundation


var tc = Int(readLine()!)!

repeat {
    
    var oper = Array(readLine()!)
    var tail = Int(readLine()!)!
    let array = readLine()!.dropFirst().dropLast().split{$0 == ","}.map{String($0)}
    
    var isReversed: Bool = false // true = 앞 , 뒤
    var head: Int = 0
    
    
    for op in oper {
        if op == "R" {
            isReversed.toggle()
        } else {
        
            if !isReversed {
                head += 1
            } else {
                tail -= 1
            }
            
        }
        
        if head > tail { break }
    }
    
    if head > tail {
        print("error")
    } else {
        
        if isReversed {
            print("[\(array[head..<tail].reversed().joined(separator: ","))]")
        } else {
            print("[\(array[head..<tail].joined(separator: ","))]")
        }
        
        
        
    }
    
    tc -= 1
} while tc > 0
