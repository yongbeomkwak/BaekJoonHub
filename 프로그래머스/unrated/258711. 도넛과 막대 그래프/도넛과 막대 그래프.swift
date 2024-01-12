import Foundation


struct Queue<T> {
    
    var enque:[T]
    var deque:[T] = []
    
    init(_ enque:[T] = []) {
        self.enque = enque
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty 
    }
    
    var front: T? {
        
        if deque.isEmpty {
            return enque.first
        } 
        
        return deque.last
    }
    
    mutating func push(_ element:T) {
        enque.append(element)
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        } 
        
        return deque.popLast()
        
    }
    
}

func solution(_ edges:[[Int]]) -> [Int] {
    
    var ans: [Int] = [0,0,0,0]
    
    var hash: [Int:Int] = [:]
    
    var initNode: (Int,Int) = (-1,1)
    
    var next_node = [[Int]](repeating:[],count:1000001)
    
    for edge in edges { 
        let (n1,n2) = (edge[0],edge[1])
        
        hash[n1] = hash[n1,default:0]+1 //
        
        next_node[n1].append(n2) // 인접 노드 추가 
        
        if hash[n1]! > initNode.1 {
            initNode = (n1,hash[n1]!)
        }
        
    }    
    
    ans[0] = initNode.0
    
    for start in next_node[ans[0]] {
        
        var visited: [Int:Int] = [:]
        
        var q = Queue<Int>()
        var flag: Bool = false  // 8자 그래프 검증 플래그 변수
        q.push(start)
        
        while !q.isEmpty {
            
            let now = q.pop()!
            
            if next_node[now].count > 1 { //만약 2개 이상 뻣어나가는 노드 있으면 
                flag = true 
                break 
            }
            
            if next_node[now].count == 0  { // 순환이 안되므로 막대 그래프 
                break 
            }
            
            for next in next_node[now] {

                if visited[next,default:0] == 0 {
                    q.push(next)
                    visited[next] = 1 
                }
                
            }
            
        }
        
        if flag  { // 8자 형  
            ans[3] += 1 
        } else if visited[start,default:0] == 1 { // 도넛 
            ans[1] += 1 
        } else { // 막대형 
            ans[2] += 1 
        }
        
    }

  
    
    return ans
}