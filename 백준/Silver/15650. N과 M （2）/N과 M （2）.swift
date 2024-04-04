let nm = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,k) = (nm[0],nm[1])

let arr = Array(1...n)

func combination<T>(_ element: [T],_ k: Int) -> [[T]] {
    var result : [[T]] = []
    
    func comb(_ index: Int, now: [T]) {
        
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in index..<n {
            comb(i+1, now: now + [element[i]])
        }
        
    }
    
    comb(0, now: [])
    
    return result
}

let result = combination(arr, k)

for r in result {
    print(r.map{String($0)}.joined(separator: " "))
}
