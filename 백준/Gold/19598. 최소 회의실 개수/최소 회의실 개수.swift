import Foundation

struct Heap<T> {
    
    var nodes:[T] = []
    
    let comparer:(T,T) -> Bool
    
    var top:T? {
        return nodes.first
    }
    
    var isEmpty:Bool {
        return nodes.isEmpty
    }
    
    var count:Int {
        return nodes.count
    }
    
    init(comparer: @escaping (T,T) -> Bool){
        self.comparer = comparer
    }
    
    
    mutating func push(_ element:T) {
        
        nodes.append(element)
        
        var index = nodes.count - 1
        
        while index > 0 && !comparer(nodes[index],nodes[(index-1) / 2]) {
            
            let parent = (index - 1) / 2
            
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
        
        
        
        nodes.swapAt(0, nodes.count-1)
        
        let result = nodes.popLast()
        
        var index:Int = 0
        
        while index < nodes.count {
            
            let left = index * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                
                if comparer(nodes[left],nodes[right]) && !comparer(nodes[right],nodes[index]) {
                    
                    nodes.swapAt(index, right)
                    
                    index = right
                    
                }
                
                else if !comparer(nodes[left],nodes[index]) {
                    
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

struct Time{
    
    let start:Int
    let end:Int
    
    
    public static func > (lhs:Self,rhs:Self) -> Bool { // index가 rhs(현재)
        
        return lhs.end > rhs.end // 현재 end가 작은게 맞음
    }
    
}

let n = Int(readLine()!)!

var a:[Time] = .init()

for _ in 0..<n {
    
    let time = readLine()!.split{$0 == " "}.compactMap({Int(String($0))!})
    
    a.append(Time(start: time[0], end: time[1]))
    
}

a.sort(by: { $0.start < $1.start }) // 시작 시간 기준 정렬

var heap = Heap<Time>(comparer:>)

for t in a{
    
    
    if !heap.isEmpty && heap.top!.end <= t.start {  // 현재 수업 중인 강의의 끝나는 시간이 가장 짧은 시간이 , 다음 강의시간 이전에 끝난다면
        
        let p = heap.pop() // 수업 종료
    
        heap.push(t)
    }
    
    else { // 수업 중인 강의가 없으면
        heap.push(t)
    }
    
}

print(heap.count)