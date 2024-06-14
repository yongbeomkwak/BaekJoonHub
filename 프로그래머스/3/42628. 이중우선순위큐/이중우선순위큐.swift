import Foundation

struct Heap<T> {
    
    var nodes: [T] = []
    
    var comparer:(T,T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty 
    }
    
    var count: Int {
        return nodes.count 
    }
    
    var first: T? {
        return nodes.first
    }
    
    init(_ comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ element: T) {
    
        nodes.append(element)
        
        var index = nodes.count-1 
        var parent = (index-1)/2
        
        
        while index > 0 && !comparer(nodes[index],nodes[parent]) {
            nodes.swapAt(index,parent)
            index = parent
            parent = (index-1)/2
        }
        
    }
    
    mutating func pop() -> T? {
        
        if nodes.count <= 1 {
            return nodes.popLast()
        }
        
        nodes.swapAt(0,nodes.count-1)
        
        let result = nodes.popLast()
        
        var index = 0 
        
        
         while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                    !comparer(nodes[right], nodes[index]) { //오른쪽과 index가 순서가 안 맞을 때 
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){ // left와 index가 순서가 안 맞을 때 
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
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
    
    var minHeap = Heap<Int>({$0>$1})
    var maxHeap = Heap<Int>({$0<$1})
    
    var existDict: [Int:Bool] = [:] 
    
    func clearNotExistValue(_ heap: inout Heap<Int>) {
        
         while !heap.isEmpty && existDict[heap.first!,default:false] == false {
                    
                let _ = heap.pop()!
                  
         }
        
    }

    operations.forEach { s in 
        
        let op = s.split{$0 == " "}.map{String($0)}
        
                        
        let comm = op[0] 
        let num = Int(op[1])!
                        
        if comm == "I" {
            
            minHeap.push(num)
            maxHeap.push(num)
            existDict[num] = true 
            
        } else {
            
            if num < 0 {
                
                clearNotExistValue(&minHeap)
                
                if !minHeap.isEmpty {
                    existDict[minHeap.pop()!] = false 
                }
                
                
                
            } else {
                
                  clearNotExistValue(&maxHeap)
                
                if !maxHeap.isEmpty {
                    existDict[maxHeap.pop()!] = false 
                }
                
            }
            
        }
                        
                        
    }
    
     clearNotExistValue(&minHeap)
     clearNotExistValue(&maxHeap)
    
    var result = [maxHeap.pop() ?? 0, minHeap.pop() ?? 0]
    
    
    return result
}