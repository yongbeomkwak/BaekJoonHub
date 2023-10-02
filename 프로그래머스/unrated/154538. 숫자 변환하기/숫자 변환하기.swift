import Foundation

struct Queue<T> {
    
    var enque:[T]
    var deque:[T] = []
    
    init(_ enque:[T]){
        self.enque = enque
    }
    
    var isEmpty:Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    mutating func pushLast(_ element:T){        
        enque.append(element)
    }
    
    mutating func popFirst() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
     
        return deque.popLast()
    
    }
    
        
}




func solution(_ x:Int, _ y:Int, _ n:Int) -> Int{
    
    let MAX:Int = 1000001

    var dist:[Int] = [Int](repeating:Int.max,count:MAX)
    
    dist[x] = 0
    
    var q = Queue<Int>([x])
    
    var s = Set<Int>()
    
    
    while !q.isEmpty {
        
        let curr = q.popFirst()!
        
        if s.contains(curr){
            continue;
        }
        s.insert(curr)

        
        let n1 = curr + n
        let n2 = curr * 2
        let n3 = curr * 3 
        
        
        if n1 < MAX {
            dist[n1] = min(dist[n1],dist[curr]+1)
            q.pushLast(n1)
        }
        
        if n2 < MAX {
            dist[n2] = min(dist[n2],dist[curr]+1)
            q.pushLast(n2)
        }
        
        if n3 < MAX {
            dist[n3] = min(dist[n3],dist[curr]+1)
            q.pushLast(n3)
        }
        
        
    }
    
    

    return dist[y] == Int.max ? -1 : dist[y]
}