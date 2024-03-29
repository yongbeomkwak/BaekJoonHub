import Foundation

public struct Heap<T> {
    // 전체 노드
    var nodes: [T] = []
    // 비교 연산자
    let comparer: (T,T) -> Bool

    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var count:Int {
        nodes.count
    }

    // 예를 들어, Heap<Int>(comparer: >=) 는 Min Heap
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }

    // top 반환
    func top() -> T? {
        return nodes.first
    }

    // 삽입
    mutating func push(_ element: T) { 
        

        nodes.append(element)

        var index = nodes.count - 1 //마지막 원소 가르킴 (현재 들어간 원소)

        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) { // 부모와 비교 후 정렬 기준에 맞지 않으면 swap

            let parent:Int = (index-1)/2

            nodes.swapAt(index, parent)
            index = parent
        }
    }

    // 삭제
    mutating func pop() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }

        if nodes.count == 1 {
            return nodes.removeLast()
        }

      
        nodes.swapAt(0, nodes.count-1) //꺼낼 top을 마지막이랑  swap 후 
        let result = nodes.popLast() // 꺼냄 

        var index = 0

        //Heapify
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


func converToInt(_ time:String) -> Int {
    
    var s = time.split{$0 == ":"}.compactMap{Int(String($0))!}
    
    return s[0] * 60 + s[1]
}


func solution(_ book_time:[[String]]) -> Int {
    
    
    var convert_times = book_time.compactMap{$0.compactMap{converToInt($0)}}.sorted(by:{
        
        return $0[0] < $1[0]
    })
    
    var heap = Heap<(Int,Int)>(comparer:{$0.1 > $1.1})
    
    for time in convert_times {
        
        if heap.isEmpty{
            heap.push((time[0],time[1]))
            continue 
        }
        
        if heap.top()!.1 + 10 <= time[0] {
            heap.pop()
            heap.push((time[0],time[1]))
        }
        else {
            heap.push((time[0],time[1]))
        }
        
        
    }
    
    
    return heap.count
}