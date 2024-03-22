let nm = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,m) = (nm[0],nm[1])


var trees = readLine()!.split{$0 == " "}.map{Int($0)!}


var left = 0
var right = trees.max()!

func getTree(_ h:Int) -> Int {
    
    var tree: Int = 0
    
    for i in 0..<n {
        if trees[i] > h {
           tree += trees[i] - h
        }
    }
    
    return tree
}

var ans: Int = 0

while left <= right {
    
    let mid = (left+right)/2
    
    
    let h = getTree(mid)
    
    if h >= m {
        
        left = mid+1
        
        ans = max(ans,mid)
    } else {
        right = mid-1
    }
    
    
    
}

print(ans)
