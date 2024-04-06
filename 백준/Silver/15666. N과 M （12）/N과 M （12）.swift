let nm = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,m) = (nm[0],nm[1])

let arr = Set(readLine()!.split{$0 == " "}.map{Int($0)!}).sorted()

func rePermutation(_ elements:[Int],_ k: Int) -> [[Int]] {
    
    var result: [[Int]] = []
    
    
    func perm(_ index: Int,_ now: [Int]) {
        
        if now.count == k {
            result.append(now)
            return
        }
        
        
        for i in index..<elements.count {
            perm(i,now + [elements[i]])
        }
        
    }
    
    perm(0,[])
    
    
    return result
}

for result in rePermutation(arr, m) {
    print(result.map{String($0)}.joined(separator:" "))
}
