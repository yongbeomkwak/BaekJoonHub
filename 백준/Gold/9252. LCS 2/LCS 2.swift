let s1 = Array(readLine()!)
let s2 = Array(readLine()!)

let n1 = s1.count
let n2 = s2.count

var dp = Array(repeating: Array(repeating: 0, count: n2+1), count: n1+1)


for i in 1...n1{
    for j in 1...n2 {
        dp[i][j] = max(dp[i-1][j],dp[i][j-1])
        
        if s1[i-1] == s2[j-1] {
            dp[i][j] = max(dp[i][j],dp[i-1][j-1]+1)
        }
        
    }
}

var length = dp[n1][n2]

var ansewr: [Character] = []

var x = n1 , y = n2


while length != 0 {
    
    // 대각선 방향이 아닌
    // 왼쪽과 위에서 값이 같으면 , 문자를 새로 추가한 연산이 아님 dp[i][j] = dp[i-1][j-1] +1 로 값이 할당되야 새로운 문자가 추가된거임
    if dp[x-1][y] == dp[x][y] {
         x -= 1
        continue
    }
    
    if dp[x][y-1] == dp[x][y] {
        y -= 1
        continue
    }
    
    // 여기까지 내려오면 i-1,j-1 방향을 보고 있음 새로추가한 것
    ansewr.append(s1[x-1])
    x -= 1
    y -= 1
    length -= 1
    
}

print(dp[n1][n2])
print(String(ansewr.reversed()))


