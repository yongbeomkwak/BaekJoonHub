import Foundation

let ve = readLine()!.split{$0 == " "}.compactMap({Int(String($0))!})

let v = ve[0]
let e = ve[1]

var graph:[(Int,Int,Int)] = [(Int,Int,Int)]()

var parents:[Int] = Array(0...v)

func union(_ a:Int,_ b:Int){
    
    let pa = find(a)
    let pb = find(b)
    
    // 작은게 부모가 된다
    if pa < pb  {
        parents[pb] = pa
    }
    
    else {
        parents[pa] = pb
    }
    
}

func find(_ c:Int) -> Int {
    
    var r = parents[c]
    
    // 보모를 찾음
    while r != parents[r] {
            
        r = parents[r]

    }
    
    var c = c
    
    while c != parents[c] {
        
        let nextC = parents[c]
        parents[c] = r
        c = nextC
    }
    
    
    return r
    
}


for _ in 0..<e {
    
    let info = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    
    graph.append((info[0],info[1],info[2]))

}


graph.sort(by: {
    return $0.2 < $1.2
}) // 가중치로 정렬

var lines:Int = 0
var result:Int = 0

for edge in graph {
    
    if lines == v-1 { // 더한 간선은 항상 정점-1 개이다.
        break
    }
    
    if find(edge.0) != find(edge.1){
        union(edge.0,edge.1)
        result += edge.2
        lines += 1
    }
    
}


print(result)






