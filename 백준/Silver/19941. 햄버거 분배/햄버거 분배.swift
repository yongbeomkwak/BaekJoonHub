let input1 = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (input1[0],input1[1])

var arr: [Int] = [Int](repeating: 0, count: n)

let str = readLine()!

for (i,c) in str.enumerated() {
    
    if c == "H" {
        arr[i] = 1
    }
    

}

var ans:Int = 0

outer: for i in 0..<n {
    
    if arr[i] == 1 || arr[i] == -1 {
        continue
    }

    for j in i-k..<i { // 왼쪽 먼쪽부터
        if j < 0 {
            continue
        }
        
        if arr[j] == 1 {
            arr[j] = -1
            ans += 1
            continue outer
        }
    }
    
    for j in i+1...i+k { //오른쪽 가까운 쪽부터
        
        if j >= n {
            break
        }
        
        if arr[j] == 1 {
            arr[j] = -1
            ans += 1
            continue outer
        }
        
    }
    
}


print(ans)
