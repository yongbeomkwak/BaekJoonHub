import Foundation

struct Node {
    var data,x,y: Int
    
    init(_ data: Int,_ x: Int,_ y:Int){
        self.data = data
        self.x = x
        self.y = y
    }
}




func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    
    var tree: [Node] = []
  
    
    for (i,info) in nodeinfo.enumerated() {
        
        let data = i+1
        let x = info[0]
        let y = info[1]
        
        tree.append(Node(data,x,y))
    }
    
    tree.sort(by:{ (n1,n2) in 
        
        return n1.x < n2.x

    })
    
    let n = tree.count
    
    var result: [[Int]] = [[],[]] // (root,left,right) , (left,right,root)
    
    func travel(_ lTree: [Node]) {

        if lTree.isEmpty {
            return 
        }

        var root_node = Node(-1,-1,-1) // 처음에 말도 안되는 노드 
        var index: Int = 0 

        for (i,node) in lTree.enumerated() { // 루트노드 찾기
            if root_node.y < node.y { // y좌표가 가장 높은게 루트 노드 
                root_node = node
                index = i 
            }
        }

        let left = Array(lTree[0..<index]) // 왼쪽 서브 틔리
        let right = Array(lTree[index+1..<lTree.count]) // 오른쪽 서브 트리 
        
        //전위
        result[0].append(root_node.data)
        travel(left)
        travel(right)
        result[1].append(root_node.data) // 후위 

    }
    
    travel(tree)

    
    return result
}