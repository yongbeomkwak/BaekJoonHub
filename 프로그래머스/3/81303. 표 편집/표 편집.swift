import Foundation

class Node {
    var data: Int 
    var isDeleted: Bool = false
    var prev: Int
    var next: Int
     
    init(_ data:Int, _ prev:Int, _ next: Int) {
        self.data = data 
        self.prev = prev
        self.next = next 
    }
    
}

struct LinkedList {
    
    var deleted_Nodes:[Node] = []
    var datas:[Node] = []
    var cursor: Int = 0 
    
    mutating func shiftUp(_ n: Int) {
                
        for _ in 0..<n {
            self.cursor = datas[cursor].prev 
        }
        
    }
    
    mutating func shiftDown(_ n: Int) {
        
        for _ in 0..<n {
            self.cursor = datas[cursor].next
        }
    }
    
    mutating func delete() {
        
        let prev = datas[cursor].prev 
        let next = datas[cursor].next 
        
        if prev != -1 {
            datas[prev].next = next
        }
        
        if next != -1 {
            datas[next].prev = prev
        }
        
        datas[cursor].isDeleted = true 
        deleted_Nodes.append(datas[cursor])
        cursor = next == -1 ? prev : next 
        
    }
    
    mutating func restore() {
        
        
        let restore_data = deleted_Nodes.removeLast().data
        
        datas[restore_data].isDeleted = false // 복원 
        let prev = datas[restore_data].prev 
        let next = datas[restore_data].next
        if prev != -1 { datas[prev].next = restore_data } // 이전 노드 연결
        if next != -1 { datas[next].prev = restore_data } // 다음 노드 연결
        
    }
    
    public mutating func insert(_ node:Node) {
        datas.append(node)
    }
    
    public func print() -> String {
    
        var result = [String](repeating:"O",count: datas.count)

        for row in deleted_Nodes { // 복원되지 않은 애들 X로 
            result[row.data] = "X"
        }

        return result.joined()
        
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

    for c in cmd {
        
        let s = c.split{$0 == " "}.map{String($0)}
        
        if s[0] == "U" {
            
            let x = Int(s[1])!
            list.shiftUp(x)
            
            
        } else if s[0] == "D" {
            
            let x = Int(s[1])!
            list.shiftDown(x)
     
            
        } else if s[0] == "C" { //제거
            
           list.delete()
            
        } else { //Z
            
            list.restore()
        }
        
    }
    
   
    
    return list.print()
}