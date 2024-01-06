
struct Queue<T> {
    
    var enque:[T]
    
    var deque:[T] = []
    
    init(enque: [T] = []) {
        self.enque = enque
    }
    
    var first: T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return deque.last
        
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    mutating func push(_ element:T) {
        enque.append(element)
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
    }
    
}

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 35), count: 35)
var mp: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: 35), count: 35)

var arr: [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}

let (h,n) = (arr[0],arr[1])

mp[h][h] = 0
dp[h][h] = 1

if h == n {
    print(1)
} else {
    var q = Queue<(Int,Int)>()
    q.push((h,h))
    mp[h][h] = 0
    
    let dy:[Int] = [0,0,1,-1]
    let dx:[Int] = [1,-1,0,0]
    
    while !q.isEmpty {
        
        let (nowX,nowY) = q.pop()!
        
        for i in 0..<4 {
            
            let nextX = nowX + dx[i]
            let nextY = nowY + dy[i]
            
            
            if nextX < 0 || nextY < 0 || nextX < nextY || nextX > max(h,n) {
                // 0보다 작거나, 침수되어 있거나 , 범위를 벗어 났을 경우
                continue
            }
            
            if mp[nextX][nextY] < mp[nowX][nowY]+1 { // 최단 경로 확인
                continue
            }
            
            mp[nextX][nextY] = mp[nowX][nowY]+1 // 최단경로 갱신
            
            if nextX == n , nextY == n { // 피시방 도착 이후로는 더 이상 다른 경로 x
                dp[nextX][nextY] += dp[nowX][nowY]
                continue
            }
            
            if dp[nextX][nextY] == 0 { // 첫 진입
                q.push((nextX,nextY))
            }
            
            dp[nextX][nextY] += dp[nowX][nowY] 
            
        }
        
        
    }
    
    print(dp[n][n])
}




 

