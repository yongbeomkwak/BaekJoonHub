let n = Int(readLine()!)!

var table: [[Int]] = []

for _ in 0..<n {
    
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (start,end) = (input[1],input[2])
    table.append([start,end])
}

import Foundation

//배열 저장 못함 .. 튜플을 이용해야함 Heap<[Int,Int]> (x) -> Heap<(Int,Int)>
public struct Heap<T> {
    // 전체 노드
    var nodes: [T] = []
    // 비교 연산자
    let comparer: (T,T) -> Bool

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    // 예를 들어, Heap<Int>(comparer: >=) 는 Min Heap
    init(_ comparer: @escaping (T,T) -> Bool) {
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


table.sort(by:{$0[0]<$1[0]})

var heap : Heap<Int> = .init(>)

for i in 0..<n {
    
    let start = table[i][0]
    let end = table[i][1]
    
    if heap.isEmpty {
        heap.push(table[i][1])
    } else {
        
        if heap.top()! <= start { // 현재 가장 빨리 끝나는 강의실 이제 비워주자
            heap.pop()
        }
        
        heap.push(end)
        
    }
    
}

print(heap.nodes.count)
