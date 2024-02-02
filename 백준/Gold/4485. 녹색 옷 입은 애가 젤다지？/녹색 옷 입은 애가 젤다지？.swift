struct Heap<T> {
    
    var nodes:[T] = []
    var comparer: (T,T) -> Bool
    
    init(_ comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var top: T? {
        return nodes.first
    }
    
    mutating func push(_ element: T) {
        
        nodes.append(element)
        
        var index: Int = nodes.count-1
        
        var parent: Int = (index-1)/2
        
        while index > nodes.count , !comparer(nodes[index],nodes[parent]) {
            
            nodes.swapAt(index, parent)
            
            index = parent
            parent = (index-1)/2
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
        
        var result = nodes.popLast()
        
        var index: Int = 0
        
        while index < nodes.count {
        
            var left = index*2+1
            var right = left+1
            
            
            if right < nodes.count {
                
                if comparer(nodes[left],nodes[right]) && !comparer(nodes[right],nodes[index]) {
                    
                    nodes.swapAt(index, right)
                    
                    index = right
                    
                } else if !comparer(nodes[left],nodes[index]) {
                    
                    nodes.swapAt(left, index)
                    
                    index = left
                    
                } else {
                    break
                }
                
            } else if left < nodes.count {
                
                if !comparer(nodes[left],nodes[index]) {
                    
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


var n = Int(readLine()!)!

var pbn : Int = 1

let dx: [Int] = [0,0,1,-1]
let dy: [Int] = [1,-1,0,0]

repeat {
    
    var board : [[Int]] = []
    var cost : [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count:n), count: n)
    
    for _ in 0..<n {
        board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
    }
    
    cost[0][0] = board[0][0]
    
    var heap = Heap<(x: Int,y: Int, cost: Int)>{$0.cost >= $1.cost} // 오름차순
    
    heap.push((x: 0, y: 0, cost: cost[0][0]))
    
    
    while !heap.isEmpty {
        
        let (x,y,nowCost) = heap.pop()!
        
        
        for i in 0..<4 {
            
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue
            }
            
            if cost[nx][ny] > cost[x][y] + board[nx][ny] {
                
                cost[nx][ny] = cost[x][y] + board[nx][ny]
                
                heap.push((x: nx, y: ny, cost: cost[nx][ny]))
            }
            
        }
        
        
    }
    
    print("Problem \(pbn): \(cost[n-1][n-1])")
    
    pbn += 1
    n = Int(readLine()!)!
} while n > 0
