import Foundation

let n = Int(readLine()!)!


var parents = readLine()!.split{ $0 == " " }.compactMap{ Int(String($0))! }

var children:[[Int]] = Array(repeating: [], count: n)

var target = Int(readLine()!)!

for (curr,parent)  in parents.enumerated() {
    
    if parent == -1 || curr == target {
        continue
    }
    
    children[parent].append(curr)
}



var remove:[Int] = []


remove.append(target)

while !remove.isEmpty {
    
    let now = remove.popLast()!
    
    parents[now] = -2 // 해당 노드 제거
    
    
    for child in children[now] { // 그 노드의 자식들을 지우기 위해 담는다.
        
        if parents[child] != -2 {  // 이미 제거된 노드가 아니고
            remove.append(child)
        }
        
        
    }
    
}


var ans:Int = 0

for i in  0..<n {
    
    if parents[i] != -2 && children[i].isEmpty { // 제거된 노드도 아니고, 자식이 없으면 = 리프 노드
        ans += 1
    }
    
}

print(ans)
