import Foundation

let nq = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,q) = (nq[0],nq[1])
var arr = readLine()!.split{$0 == " "}.map{Int64($0)!}

let h = Int(ceil(log2(Double(n))))

var tree : [Int64] = [Int64](repeating: 0, count: 1<<(h+1))


func makeTree(_ node: Int,_ start: Int,_ end: Int) -> Int64 {
    
    if start == end {
    
        tree[node] = arr[start]
        return tree[node]
    }
    
    let mid = (start+end)/2
    
    tree[node] =  makeTree(node*2, start, mid) + makeTree(node*2+1, mid+1, end)
    
    return tree[node]
    
}

func sum(_ node: Int,_ start: Int,_ end: Int,_ left: Int,_ right: Int)-> Int64 {
    
    if (right < start ) || (end < left) {
        return 0
    }
    
    if left <= start && end <= right {
        return tree[node]
    }
    
    
    let mid = (start+end)/2
    
    return sum(node*2,start,mid,left,right) + sum(node*2+1, mid+1, end, left, right)
}

func update(_ node: Int,_ start: Int,_ end: Int,_ index: Int,_ diff: Int64) {
    
    if index < start || index > end {
        return
    }
    
    tree[node] += diff
    
    if start != end {
        
        let mid = (start+end)/2
        
        update(node*2,start,mid, index, diff)
        update(node*2+1, mid+1, end, index, diff)
        
    }
    
}


makeTree(1, 0, n-1)

var answer: [String] = []

for _ in 0..<q {
    let xyab = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (x,y,a,b) = (min(xyab[0],xyab[1])-1,max(xyab[0],xyab[1])-1,xyab[2]-1,xyab[3])
    
    answer.append("\(sum(1, 0, n-1, x, y))")
    
    let diff = Int64(b) - Int64(arr[a])
    arr[a] = Int64(b)
    
    
    update(1, 0, n-1, a, diff)
    
}

print(answer.joined(separator: "\n"))

