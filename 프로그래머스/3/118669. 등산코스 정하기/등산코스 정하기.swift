import Foundation

struct Info {
    

    let dest:Int
    let weight:Int
    
    init (_ dest:Int, _ weight:Int) {
        self.dest = dest
        self.weight = weight
    }
    
    public static func >=(lhs:Self,rhs:Self) -> Bool {
        
        lhs.weight >= rhs.weight
    } 
}

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


func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    
    var graph:[[Info]] = [[Info]](repeating:[],count:n+1) // 인접 행렬
     
    var summitsSet = Set<Int>(summits) // 산봉우리 셋 

    var dist:[Int] = [Int](repeating:Int.max, count: n+1) // 휴식 없이 이동해야 하는 시간 중 가장 긴 시간

    var heap = Heap<Info>(>=) // 최소힙 
    
    var ans:[Int] = [Int.max,Int.max] // [번호,거리]
    
    
    for path in paths {
        
        let i = path[0]
        let j = path[1]
        let w = path[2]
        
        graph[i].append(Info(j,w))
        graph[j].append(Info(i,w))
    }
    
    for gate in gates {
       heap.push(Info(gate,0)) // 입구는 임의의 정점 0에 
       dist[gate] = 0 //게이트는 0
    }

    
    while !heap.isEmpty {
        
        let now = heap.pop()!
        
        if dist[now.dest] < now.weight { // 기록일지 < 현재 가중치보다 작으면 갱신 해 줄 필요 없음
            continue 
        }
        
        
        for next in graph[now.dest] {
            
            let intensity = max(now.weight,next.weight) // 가장 쉬지 않고 간 거리
            
            let nextNode = next.dest
            
            if dist[nextNode] > intensity { // 기록일지가 더 크면
                
                dist[nextNode] = intensity // 작은 값으로 갱신
                
                if !summitsSet.contains(nextNode) {  // 오직 쉼터만 넣음
                     heap.push(Info(nextNode,dist[nextNode]))
                }
               
            
            }
            
            if summitsSet.contains(nextNode) { // 산봉우리일 경우 ,최소 intensity 갱신
                
                if dist[nextNode] < ans[1] { // 다음께 더 작으면 갱신 
                    ans[0] = nextNode
                    ans[1] = dist[nextNode]
                } else if dist[nextNode] == ans[1] { // 같을 경우 산봉우리가 낮은 값으로 
                    
                    ans[0] = min(ans[0],nextNode)
                    
                } else {
                    continue
                }
                
                
                
            }
        }
        
    }
    
    
    return ans
}