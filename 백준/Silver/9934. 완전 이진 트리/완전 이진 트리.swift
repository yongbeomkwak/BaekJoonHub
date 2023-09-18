import Foundation



var k = Int(readLine()!)!

let n = pow(2, k) + 1


let arr = readLine()!.split{$0 == " "}.compactMap{ Int(String($0)) }

var tree:[[Int]] = [[Int]](repeating: [], count: k)

k -= 1


func inOrder(_ child:[Int],_ h:Int){
    
    if child.isEmpty {
        return
    }
    
    let root = child.count / 2
    
    if h > k { // 범위 벗어남  
        return
    }
    
    inOrder(Array(child[0..<root]), h+1)
    tree[h].append(child[root])
    inOrder(Array(child[root+1..<child.count]), h+1)
}

inOrder(arr, 0)

for i in 0..<tree.count {
    
    print(tree[i].map{String($0)}.joined(separator: " "))
}

