let input1 = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (input1[0],input1[1])

var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

var dy: [Int] = [-1,0,1]

var ans:Int = 100000

func dfs(_  x:Int,_ y:Int ,_ move:Int,_ fuel:Int) {
    
    if y < 0 || y >= m {
        return
    }
    
    if x == n {
        ans = min(ans,fuel) //달 도착 최솟값
        return
    }
    
    var fuel = fuel + board[x][y] // 현재 갔던 연료 넣어줌
    
    
    for i in 0..<3 {
        
        if move != i { // 이전과 같지 않은 방향으로 진행
            dfs(x+1,y+dy[i],i,fuel)
        }
        
    }
    
}

for i in 0..<m {
    dfs(0,i,-1,0) // 첫 시작의 움직임은 0,1,2가 아닌 -1
}

print(ans)
