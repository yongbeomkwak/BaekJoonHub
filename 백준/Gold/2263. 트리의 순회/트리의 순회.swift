import Foundation



    
let n = Int(readLine()!)!

var inOrder = readLine()!.split{ $0 == " " }.compactMap{ Int(String($0))! }
let postOrder = readLine()!.split{ $0 == " " }.compactMap{ Int(String($0))! }
var result:[String] = []

var node_pos:[Int] = [Int](repeating: -1, count: n+1)

for i in 0..<n {
    node_pos[inOrder[i]] = i // 해당 노드의 index
}


/*
           1
        2     3
     4   5  6    7
 

 inOrder =   4 2 5 1 6 3 7
 postOrder = 4 5 2 6 7 3 1

 */

func preOrder(inStart:Int,inEnd:Int,postStart:Int,postEnd:Int) {

    if inStart > inEnd || postStart > postEnd {
        return
    }

    let root = postOrder[postEnd]
    let rootIndex = node_pos[root]
    
    
    let leftNode = rootIndex - inStart - 1 // 왼쪽 노드 개수,   4 2 5
    let rightNode = inEnd - rootIndex // 오른쪽 노드 개수 , 6 3 7  ,   오른쪽 시작 인덱스
    
    //
    
    result.append("\(root)")
    preOrder(inStart: inStart, inEnd: inStart + leftNode, postStart: postStart, postEnd: postStart + leftNode)
    preOrder(inStart: inEnd - rightNode + 1, inEnd: inEnd, postStart: postEnd - rightNode, postEnd: postEnd - 1)  // postEnd - 1: 위에서 root로 사용했으므로 1개 빼고
}

preOrder(inStart: 0, inEnd: n-1, postStart: 0, postEnd: n-1)


print(result.joined(separator: " "))
    







