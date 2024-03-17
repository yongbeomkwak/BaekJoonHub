import Foundation



func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var parents: [Int] = [Int](repeating:0,count:n)
    
    for i in 0..<n {
        parents[i] = i 
    }
    
    func find(_ c:Int) -> Int {
        
        var r = parents[c]
    
        // 부모를 찾음
        while r != parents[r] {

            r = parents[r]

        }

        var c = c

        while c != parents[c] {

            let nextC = parents[c]
            parents[c] = r // 위에서 찾은 부모들을 맵핑
            c = nextC
        }


        return r
        
    }
    
    func union(_ a: Int,_ b: Int) {
        
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
    
    for (i,computer) in computers.enumerated() {
        
        for (j,node) in computer.enumerated() {
            if node == 1  {
                union(i,j)
            
            }
        }
        
    }
    
    var set = Set<Int>()
    
    for i in 0..<n {
        set.insert(find(i))
    }
    
    return set.count
}