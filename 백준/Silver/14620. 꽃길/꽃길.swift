let n = Int(readLine()!)!

var land : [[Int]] = []

for _ in 0..<n {
    land.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating:false,count: n), count: n)

let dx: [Int] = [0,0,-1,1]
let dy: [Int] = [1,-1,0,0]

var ans = Int.max

func plantSeeds(_ depth: Int, cost:Int) {
    
    if depth == 3 {
        ans = min(ans,cost)
        return
    }
    
    for i in 0..<n {
        for j in 0..<n {
            
    
            
            if visited[i][j] {
                continue
            }
            
            var flag = false
            
            for k in 0..<4 {
                
                let nextI = i + dx[k]
                let nextJ = j + dy[k]
                
                if nextI < 0 || nextJ < 0 || nextI >= n || nextJ >= n {
                    flag = true
                    break
                }
                
                if visited[nextI][nextJ] {
                    flag = true
                    break
                }
            }
            
            
            if flag {
                continue
            }
            
            let land0 = (i,j)
            let land1 = (i+dx[0],j+dy[0])
            let land2 = (i+dx[1],j+dy[1])
            let land3 = (i+dx[2],j+dy[2])
            let land4 = (i+dx[3],j+dy[3])
            
            visited[land0.0][land0.1] = true
            visited[land1.0][land1.1] = true
            visited[land2.0][land2.1] = true
            visited[land3.0][land3.1] = true
            visited[land4.0][land4.1] = true
            
            let nextCost = cost + land[land0.0][land0.1] + land[land1.0][land1.1] + land[land2.0][land2.1] + land[land3.0][land3.1] + land[land4.0][land4.1]
            
            plantSeeds(depth+1, cost: nextCost)
            
            visited[land0.0][land0.1] = false
            visited[land1.0][land1.1] = false
            visited[land2.0][land2.1] = false
            visited[land3.0][land3.1] = false
            visited[land4.0][land4.1] = false
        }
        
    }
}
    



plantSeeds(0, cost: 0)

print(ans)
