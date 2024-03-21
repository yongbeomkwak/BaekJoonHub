let n = Int(readLine()!)!

struct Node {
    let dest: Int
    let cost: Int
    
    init(_ dest:Int,_ cost:Int) {
        self.dest = dest
        self.cost = cost
    }
}

var graph: [[Node]] = Array(repeating: [], count: n+1)

for _ in 0..<n-1 {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    graph[input[0]].append(Node(input[1],input[2]))
    graph[input[1]].append(Node(input[0],input[2]))
    
}

var dist : [Int] = [Int](repeating: -1, count: n+1)

func dfs(_ now: Int, _ cost:Int) {
    
    for node in graph[now] {
        
        if dist[node.dest] == -1 {
            dist[node.dest] = cost + node.cost
            dfs(node.dest, dist[node.dest])
        }
        
    }
    
}

dist[1] = 0
dfs(1,0)

let dot1: Int = dist.distance(from: 0, to: dist.firstIndex(of: dist.max()!)!)

dist = [Int](repeating: -1, count: n+1)
dist[dot1] = 0
dfs(dot1, 0)

print(dist.max()!)
