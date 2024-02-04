let n = Int(readLine()!)!
let m = Int(readLine()!)!

var parent: [Int] = [Int](repeating: 0, count: n+1)

for i in 1...n {
    parent[i] = i
}

func find(_ x:Int) -> Int {

    var r = parent[x]
    
    while r != parent[r] {
        
        r = parent[r]
    }
    
    var xx = x
    
    while xx != parent[xx] {
        
        var tmp = parent[xx]
        parent[xx] = r
        xx = tmp
    }
    
    
    return r

}

func union(_ a:Int, _ b:Int) {
    
    let pa = find(a)
    let pb = find(b)
    
    if pa < pb {
        parent[pb] = pa
    } else {
        parent[pa] = pb
    }
    
}



for i in 1...n {
    
    let link = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    for j in 1...n {
        if link[j-1] == 1 { // 연결되어있으면 합침
            union(i,j)
        }
    }
    
}

var path = readLine()!.split{$0 == " "}.map{Int($0)!}


let start = parent[path[0]] // 출발 지점의 부모를 가르키고

var canArrived: Bool = true
for i in 1..<m {
    
    if parent[path[i]] != start { // path의 모든 점이 start의 부모와 같아야함
       canArrived = false
        break
    }
    
}

print(canArrived ? "YES" : "NO")
