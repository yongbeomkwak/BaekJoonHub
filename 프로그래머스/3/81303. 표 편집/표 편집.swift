import Foundation

class Node {
    var isDeleted: Bool = false
    let data: Int 
    var prev: Int
    var next: Int
    
    
    init(_ data:Int,_ prev: Int,_ next: Int) {
        self.data = data 
        self.prev = prev
        self.next = next 
    }
    
}

class LinkedList {
    
    var cursor:Int = 0 
    var deletedStack: [Node] = []
    var datas: [Node] = []
    
    
    func shiftUp(_ n:Int) {
        
        for _ in 0..<n {
            self.cursor = datas[cursor].prev
        }
        
    }
    
    func shiftDown(_ n:Int) {
        
        for _ in 0..<n {
            self.cursor = datas[cursor].next
        }
        
    }
    
    func remove() {
        
        let prev = datas[cursor].prev
        let next = datas[cursor].next
        
        if prev != -1 {
            datas[prev].next = next 
        }
        
        if next != -1 {
            datas[next].prev = prev
        }
        
        datas[cursor].isDeleted = true 
        deletedStack.append(datas[cursor])
        cursor = next == -1 ? prev : next
        
        
    }
    
    func restore() {
        
        let restoredData = deletedStack.popLast()!.data
        
        datas[restoredData].isDeleted = false
        let prev = datas[restoredData].prev
        let next = datas[restoredData].next
        
        if prev != -1 {
            datas[prev].next = restoredData
        }
        
        if next != -1 {
            datas[next].prev = restoredData
        }
        
        
        
    }
    
    
    func insert(_ node:Node) {

        datas.append(node)
        
    }
    
    func print() -> String {
        
        return datas.map{$0.isDeleted == false ? "O" : "X"}.joined()
    }
}


func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var list = LinkedList()
    
    list.cursor = k 
    
    for i in 0..<n {
        
        if i == n-1 {
            list.insert(Node(i,i-1,-1))
        } else {
            list.insert(Node(i,i-1,i+1))
        }
        
    }
    
    for s in cmd {
        let input = s.split{$0 == " "}.map{String($0)}
        
        if input[0] == "D" {
            list.shiftDown(Int(input[1])!)
        } else if input[0] == "U" {
            list.shiftUp(Int(input[1])!)
        } else if  input[0] == "Z" {
            list.restore()
        } else {
            list.remove()
        }
        
    }
    
    return list.print()
}