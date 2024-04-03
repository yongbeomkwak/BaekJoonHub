func permutation<T>(_ element:[T],_ k: Int) -> [[T]] {
    
    var result: [[T]] = []
    var visited: [Bool] = [Bool](repeating: false, count: element.count)
    
    
    func permu(_ index: Int,_ now: [T]) {
        
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0..<element.count {
            
            if visited[i] {
                continue
            }
            
            visited[i] = true
            permu(i, now + [element[i]])
            visited[i] = false
        }
        
    }
    
    permu(0, [])
    
    
    return result
    
}

let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (nk[0],nk[1])

let elements = Array(1...n)

let result: [[Int]] = permutation(elements, k)

for element in result {
    print(element.map{String($0)}.joined(separator: " "))
}

