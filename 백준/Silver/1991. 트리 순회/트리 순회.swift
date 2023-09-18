import Foundation


let n = Int(readLine()!)!

var adj:[String:[String]] = .init()

for _ in 0..<n {
    let nodes = readLine()!.split{$0 == " "}.compactMap{ String($0) }
    
    adj[nodes[0]] = [nodes[1],nodes[2]]
    
}

var result:String = ""

func preOrder(_ node:String) {
    
    if node == "." {
        return
    }
    result.append(node)
    preOrder(adj[node]?[0] ?? ".") // 왼쪽
    preOrder(adj[node]?[1] ?? ".") // 오른쪽
    
}

func inOrder(_ node:String) {
    
    if node == "." {
        return
    }
    inOrder(adj[node]?[0] ?? ".") // 왼쪽
    result.append(node)
    inOrder(adj[node]?[1] ?? ".") // 오른쪽
}

func postOrder(_ node:String) {
    
    if node == "." {
        return
    }
    postOrder(adj[node]?[0] ?? ".") // 왼쪽
    postOrder(adj[node]?[1] ?? ".") // 오른쪽
    result.append(node)
}



preOrder("A")
print(result)
result = ""
inOrder("A")
print(result)
result = ""
postOrder("A")
print(result)

