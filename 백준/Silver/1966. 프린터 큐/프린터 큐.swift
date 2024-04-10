import Foundation

var tc = Int(readLine()!)!

repeat {
    
    let nt = readLine()!.split{$0 == " "}.map{Int($0)!}
    let (n,target) = (nt[0],nt[1])
    
    let input =  readLine()!.split{$0 == " "}.map{Int($0)!}
    var queue: [(Int,Int)] = []
    
    for (i,j) in input.enumerated() {
        queue.append((i,j))
    }
    
    var index: Int = 0
    var order: Int = 0
    
    while index < queue.count {
        
        let front = queue[index]
        
        
        if Array(queue[index+1..<queue.count]).filter{front.1 < $0.1}.count > 0  {
            queue.append(front)
        } else {
            order += 1
            if front.0 == target {
                print(order)
                break
            }
        }
        
        index += 1
    }
    
    
    tc -= 1
} while tc > 0
