import Foundation


enum Command : String {
    case insert = "I"
    case delete = "D"
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
    var top: T? {
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