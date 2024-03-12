let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (nm[0],nm[1])

var lab: [[Int]] = []

var virus: [(Int,Int)] = []

for i in 0..<n {
    
    let row = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    lab.append(row)
    
    for j in 0..<m {
        if row[j] == 2 {
            virus.append((i, j))
        }
    }
}






let dx = [-1,0,1,0]
let dy = [0,-1,0,1]

func spreadVirus() {
    
    var map = lab
    var index = 0
    var queue = virus
    

    while index < queue.count {
        let head = queue[index]
        
        let (x,y) = (head.0,head.1)
      
                
        for i in 0..<4 {
            let (nx,ny) = (x+dx[i],y+dy[i])
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            
            if map[nx][ny] == 0 {
                map[nx][ny] = 2
                queue.append((nx, ny))
            }
            
        }

        index += 1
    }
    
    func countSafeArea() -> Int {
        
        var count: Int = 0
        
        for i in 0..<n {
            for j in 0..<m {
                if map[i][j] == 0 {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    ans = max(ans,countSafeArea())
    
}

var ans = -1

func dfs(_ depth: Int) {
    
    if depth == 3 {
        
        spreadVirus()
        
        return
    }
    
    for i in 0..<n {
        for j in 0..<m {
            
            if lab[i][j] == 0 {
                lab[i][j] = 1
                dfs(depth+1)
                lab[i][j] = 0
            }
            
        }
    }
    
    
}

dfs(0)

print(ans)
