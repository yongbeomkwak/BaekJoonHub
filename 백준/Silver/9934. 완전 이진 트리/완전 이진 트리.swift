let k = Int(readLine()!)!

let arr = readLine()!.split{$0 == " "}.map{Int($0)!}

let n = arr.count

var tree: [[Int]] = [[Int]](repeating: [], count: k)

func inorder(_ child: [Int],_ h: Int) {
    
    if child.isEmpty {
        return
    }
    
    let root = child.count / 2
    
    
    inorder(Array(child[0..<root]), h+1)
    tree[h].append(child[root])
    inorder(Array(child[root+1..<child.count]), h+1)
    
}


inorder(arr, 0)

for i in 0..<tree.count {
    print(tree[i].map{String($0)}.joined(separator: " "))
}
