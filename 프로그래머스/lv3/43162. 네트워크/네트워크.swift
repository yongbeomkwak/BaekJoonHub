import Foundation

func find(_ a:Int,_ root: inout [Int]) -> Int {
    
    var r = root[a]
    
    while( r != root[r] ){
        r = root[r]
    }
    
    var c = a
    
    while( c != root[c] ) {
        
        let pc = root[c]
        root[c] = r
        c = pc 
    }
    
    return r
    
}

func union(_ a:Int,_ b:Int,_ root: inout [Int]) {
 
    let ra = find(a,&root)
    let rb = find(b,&root)
    
    if ra <= rb {
        root[rb] = ra
    }
    else {
        root[ra] = rb 
    }
    
}


func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var root:[Int] = [Int](0..<n)
    
    for i in (0..<n) {
        for j in (0..<n){
            
            if i == j { continue }
            
            if computers[i][j] == 1 && find(i,&root) != find(j,&root) {
                union(i,j,&root)
            } 
            
        }
        
        for k in 0..<n {
            root[k] = find(k,&root)
        }
        
    }
    
    return Set(root).count
}
