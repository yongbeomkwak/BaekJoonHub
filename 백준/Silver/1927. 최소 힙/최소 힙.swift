import Foundation

struct Heap<T> {
    
    var nodes:[T] = []
    var comparer:(T,T) -> Bool
    
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty:Bool {
        return nodes.isEmpty
    }
    
    var top:T? {
        return nodes.first
    }
    
    mutating func push(_ element:T) {
        
        nodes.append(element)
        
        var index = nodes.count - 1
        
        
        while index > 0 && !comparer( nodes[index], nodes[(index-1) / 2]) {
            
            let parent = (index-1) / 2
            
            nodes.swapAt(index, parent)
            
            index = parent
            
        }
        
    }
    
    mutating func pop() -> T? {
        
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.popLast()
        }
        
        
        nodes.swapAt(0, nodes.count - 1)
        let result = nodes.popLast()
        
        var index:Int = 0
        
        while index < nodes.count {
            
            let left:Int = index * 2 + 1
            let right:Int = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left],nodes[right]) && !comparer(nodes[right],nodes[index]) {
                    
                    nodes.swapAt(right, index)
                    
                    index = right
                    
                } else if !comparer(nodes[left],nodes[index]) {
                    
                    nodes.swapAt(left, index)
                    
                    index = left
                }
                
                else {
                    break
                }
            }
            
            else if left < nodes.count {
                
                if !comparer(nodes[left],nodes[index]) {
                    nodes.swapAt(left, index)
                    
                    index = left
                }
                
                else {
                    break
                }
                
            }
            
            else {
                break
            }
            
            
            
            
            
            
        }
        
        
        return result
    }
    
    
    
    
}

extension Heap  where T: Comparable {
    
    init(){
        self.init(comparer: >=) // 최소 힙
    }
}


let n = Int(readLine()!)!

var heap = Heap<Int>()

for _ in 0..<n {
    let x = Int(readLine()!)!
    
    if x == 0 {
        print( heap.pop() ?? 0 )
    }
    
    else {
        heap.push(x)
    }
}
