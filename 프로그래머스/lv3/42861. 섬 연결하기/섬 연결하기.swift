import Foundation

struct Edge :Comparable {
    
    var src:Int = 0 
    var dest:Int = 0 
    var cost:Int = 0
    
    static func < (lhs:Edge,rhs:Edge) -> Bool {
        
        return lhs.cost < rhs.cost 
        
    }
    
}


var roots = (0...101).compactMap { $0 }


func find(_ a:Int) -> Int {
    
    var r = roots[a]
    
    while r != roots[r] {
        r = roots[r]
    }
    
    
    var c = a
    
    while c != roots[c] {
        
        let pc = roots[c]
        roots[c] = r
        c = pc 
    }
    
    return r
    
}


func union(_ a:Int,_ b:Int)  {
    
    let pa = find(a)
    let pb = find(b)
    
    
    if pa < pb {
        roots[pb] = pa
    }
    
    else {
        roots[pa] = pb
    }
    
    
}


func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var visited:[Bool] = Array(repeating:false,count:n+1)
    
    
    var sortedCosts = costs.sorted(by:{ $0[2] < $1[2] })
    
    
    var ans:Int = 0
    
    for conn in sortedCosts {
        
        let a = conn[0]
        let b = conn[1]
        let cost = conn[2]
        
        
        if find(a) != find (b) {
            union(a,b)
            ans += cost
        }
        
        
    }

    
    return ans
}