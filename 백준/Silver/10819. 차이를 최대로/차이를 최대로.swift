let n = Int(readLine()!)!
var a = readLine()!.split{$0 == " "}.map{Int($0)!}

var result: Int = -1000

func calc(){
    
    var sum : Int = 0
    
    for i in 0..<n-1 {
        sum += abs(a[i]-a[i+1])
    }

    result = max(result,sum)
}

func dfs(_ index:Int) {
    
    if index >= n {
        
        calc()
        return
    }
    
    
    
    for i in index..<n {
        a.swapAt(index, i)
        dfs(index+1)
        a.swapAt(i, index)
    }
    
}

dfs(0)

print(result)


