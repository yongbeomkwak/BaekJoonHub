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




/*
// Min Heap 세팅
var minHeap = Heap<Int>(comparer: >=)

// Max Heap 세팅
var maxHeap = Heap<Int>(comparer: <=)

// 100 삽입
minHeap.push(100)

// 삭제
let _ = minHeap.pop()

// top 반환
let top = minHeap.top()

// heap 원소 개수
let heapCount = minHeap.nodes.count


*/

let nmx = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m,x) = (nmx[0],nmx[1],nmx[2])

var graph : [[(dest:Int , cost:Int)]] = Array(repeating: [], count: n+1)



for _ in 0..<m {
    let info = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (s,d,c) = (info[0],info[1],info[2])
    
    graph[s].append((dest: d, cost: c))
}




var result: Int = 0

func dijkstra(_ start:Int, _ end: Int) -> Int {
    
    var dist: [Int] = [Int](repeating: 1000001, count: n+1)
    dist[start] = 0
    
    var heap = Heap<(dest:Int , cost:Int)>{
        $0.cost > $1.cost // 오름차순
    }
    
    heap.push((dest: start, cost: 0))
    
    
    while !heap.isEmpty {
        
        let (now,nowCost) = heap.pop()!
        
        
        for (next,nextCost) in graph[now] {
            
            if dist[next] > dist[now] + nextCost {
                dist[next] = dist[now] + nextCost
                heap.push((dest: next, cost: dist[next]))
            }
            
        }
        
    }
    
    
    return dist[end]
}

for i in 1...n {
    
    let go = dijkstra(i,x)
    let back = dijkstra(x,i)
    
    result = max(result,go+back)
}

print(result)



