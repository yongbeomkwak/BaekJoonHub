import Foundation


enum Command : String {
    case insert = "I"
    case delete = "D"
}

struct Heap<T> {
    var nodes: [T] = []
    
    var top: T? {
        return nodes.first
    }

    var count: Int {
        return nodes.count
    }
    
    var comparer: (T,T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ element: T) {
        nodes.append(element)
        
        var index = nodes.count-1
        
        var parent = (index-1) / 2
        
        while 0 < index && !comparer(nodes[index], nodes[parent]) {
            nodes.swapAt(parent, index)
            index = parent
            parent = (index-1)/2
        }
    }
    
    mutating func pop() -> T? {
        
        guard !nodes.isEmpty else {
            return nil
        }
        
        guard nodes.count > 1 else {
            return nodes.removeLast()
        }
        
        nodes.swapAt(0, nodes.count-1)
        
        let result = nodes.removeLast()
        
        var index: Int = 0
        
        let n = nodes.count
        
        while index < n  {
            
            var left = index * 2 + 1
            var right = left+1
            
            if right < n {
                
                if comparer(nodes[left], nodes[right]) && !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(index, right)
                   index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                   index = left
                } else {
                    break
                }
                
            } else if left < n {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
    
        }
    
        return result
    }
}

func solution(_ operations:[String]) -> [Int] {
    
    var oper_list:[Operation] = []
    
    var minHeap = Heap<Int> { $0 >= $1 }
    var maxHeap = Heap<Int> { $0 <= $1 }
    var isExisted: [Int: Int] = [:]
    
    for oper in operations {

        let splited_input = oper.split{$0 == " "}.map{String($0)}

        let command: Command = Command(rawValue:splited_input[0])!
        let number = Int(splited_input[1])!
       
        if command == .insert {
            minHeap.push(number)
            maxHeap.push(number)
            isExisted[number, default: 0] += 1 
        }
        
        else {
            
            if number == 1 {
                while !maxHeap.isEmpty && isExisted[maxHeap.top!, default:0] == 0 {
                    let _ = maxHeap.pop()!
                }
                
                if !maxHeap.isEmpty {
                    let top = maxHeap.pop()!
                    isExisted[top, default: 0] -= 1 
                }
                
                
            } else {
                while !minHeap.isEmpty && isExisted[minHeap.top!, default:0] == 0 {
                    let _ = minHeap.pop()!
                }
                
                if !minHeap.isEmpty {
                    let top = minHeap.pop()!
                    isExisted[top, default: 0] -= 1 
                }
            }
            
          
        }
        
    }
    

    while !maxHeap.isEmpty && isExisted[maxHeap.top!, default:0] == 0 {
        let _ = maxHeap.pop()!
    }
                

    while !minHeap.isEmpty && isExisted[minHeap.top!, default:0] == 0 {
        let _ = minHeap.pop()!
    }

    
    return [maxHeap.pop() ?? 0 , minHeap.pop() ?? 0]
}