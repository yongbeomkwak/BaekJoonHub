import Foundation

let ab = readLine()!.split{$0 == " "}.map{Int($0)!}
let (a,b) = (ab[0],ab[1])

var dp = [Int](repeating: 0, count: 55)

dp[0] = 1

for i in 1...54{
    dp[i] =  1 << i + 2 * dp[i-1]
}
// 2^(i-1)+1 까지 모든 1의 개수 , 1,3,7,15 등 ..

func dfs(_ n:Int) -> Int {
    
    var n = n
    var count = n & 1 // 가장 최하단 비트 먼저 카운트
    
    
    for i in stride(from: 54, to: 0, by: -1){
        
        
        if n & (1 << i) ==  (1 << i) { // 해당 비트 자리수 비트가 1이면
            
            let diff = (n - (1<<i))+1 // diff 는 가장 최상위 비트 갯수
            
            // n == 10 이면 , (1<<i) == 8
            // 1000 최상위 비트는 (n- (1<<i))+1 = 3개
            // 1001
            // 1010
            
            
            // 최상위 비트 개수 + dp[i-1] (이전 자릿수까지 모든1)
            count += dp[i-1] + diff
            n -= 1 << i // 최상위비트 계산했으니 차감
            
 
        }
        
    }
    
    return count
}

print(dfs(b) - (dfs(a-1)))
