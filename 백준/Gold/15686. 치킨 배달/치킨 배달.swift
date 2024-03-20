func chickenDistance(_ x1:Int, _ y1:Int, _ x2: Int, _ y2: Int) -> Int {
    return abs(x1-x2) + abs(y1-y2)
}

let nm = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,m) = (nm[0],nm[1])


var board: [[Int]] = []

var chicken: [(Int,Int)] = []
var home: [(Int,Int)] = []

for i in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
    
    for j in 0..<n {
        if board[i][j] == 1 {
            home.append((i,j))
        } else if board[i][j] == 2 {
            chicken.append((i,j))
        }
    }
    
}

let end = chicken.count - m

var visited: [Bool] = [Bool](repeating: false, count: chicken.count)

var pickedChicken : [(Int,Int)] = []
var ans = Int.max

func getCityDistance(){
    
    var result: Int = 0
    
    for h in home {
        var dist = Int.max
        for i in 0..<pickedChicken.count {
            
            dist = min(dist,chickenDistance(pickedChicken[i].0, pickedChicken[i].1, h.0, h.1))
        }
        result += dist
    }
    
    
    ans = min(ans,result)
}

func dfs(_ depth: Int,_ start: Int) {
    
    if depth == m {
        getCityDistance()
        return
    }
    
    for i in start..<chicken.count {
        
        if visited[i] {
            continue
        }
        
        visited[i] = true
        pickedChicken.append(chicken[i])
        dfs(depth+1,i+1)
        let _ = pickedChicken.popLast()
        visited[i] = false
        
    }
    
    
}

dfs(0,0)
print(ans)
