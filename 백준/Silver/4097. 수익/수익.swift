while let input = readLine() {
    
    if input == "0" {
        break
    }
    
    let n = Int(input)!
    
    var dp : [Int] = [Int](repeating: 0, count: n+1)

    var arr : [Int] = [0]
    
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    var res = Int.min
    
    for i in 1...n {
        
        dp[i] = max(dp[i-1]+arr[i],arr[i])
        res = max(res,dp[i])
 
    }
    
    print(res)
    
}


