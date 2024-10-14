import Foundation



struct Heap <T> {
    var nodes: [T] = []
    
    var count: Int {
        return nodes.count
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var comparer: (T, T) -> Bool
    
    init(_ comparer: @escaping (T,T) -> Bool ) {
        self.comparer = comparer
    }
    
    
    mutating func push(_ element: T) {
        nodes.append(element)
        
        var index: Int = nodes.count - 1
        var parent = (index-1) / 2
        
        while 0 < index && !comparer(nodes[index], nodes[parent]) {
            nodes.swapAt(index, parent)
            index = parent
            parent = (index-1) / 2
        }
        
    }
    
    mutating func pop() -> T? {
        if nodes.count <= 1 {
            return nodes.popLast()
        }
        
        nodes.swapAt(0, nodes.count-1)
        
        let result = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let left = index*2 + 1
            let right = left + 1
            
            if right < nodes.count {
                
                if comparer(nodes[left], nodes[right]) && !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(index, left)
                    index = left
                }  else {
                    break
                }
                
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(index, left)
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

let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n, k) = (nk[0], nk[1])

var jewels: [(Int, Int)] = []

for _ in 0..<n {
    let mv = readLine()!.split{$0 == " "}.map{Int($0)!}

    let (m, v) = (mv[0], mv[1])
    
    jewels.append((m, v))
}

var bags: [Int] = [] //

for _ in 0..<k {
    let c = Int(readLine()!)!
    bags.append(c)
}

jewels.sort(by: { $0.0 < $1.0 }) // 무게 기준 오름 차순
bags.sort() // 가벼운 가방부터

var now: Int = 0 // 현재 보석을 가르키는 변수

var heap = Heap<Int>(<) // 내림차순

var answer: Int = 0

for bag in bags {
    
    //현재 보석 무게가 , 현재 가방의 제한 무게보다 낮거나 같으면 담을 수 있음
    while (now < n && jewels[now].0 <= bag ) { // 현재 보석을 담을 가방 찾기
        heap.push(jewels[now].1) // 가치를 우선순위 큐에 담음
        now += 1
    }
    
    if !heap.isEmpty { // 비어있지 않으면 가방에 있는 것 중 가장 가치가 큰 것 더함
        answer += heap.pop()!
    }
    
}

print(answer)
