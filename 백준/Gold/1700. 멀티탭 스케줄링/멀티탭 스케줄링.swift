import Foundation

let nk = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n,k) = (nk[0],nk[1])

let order: [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}

var plug = Set<Int>()

var result: Int = 0
for (index,i) in order.enumerated() {
    
    if plug.contains(i) { // 이미 플러그
        continue
    } else if plug.count < n {
        plug.insert(i)
    } else {
        
        var tmp = plug
        
        for j in index+1..<k {
            
            if tmp.count == 1 {
                break
            }
            
            if tmp.contains(order[j]) {
                tmp.remove(order[j])
            }
            
        }
        
        plug.remove(tmp.first!)
        plug.insert(i)
        
        
        result += 1
    }
    
}

print(result)
