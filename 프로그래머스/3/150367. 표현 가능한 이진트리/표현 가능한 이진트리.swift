import Foundation

func inorder(_ r:Int , _ list:[Int]) -> Bool {

    
    if list.count == 1 { // 리프 노드 
        return true 
    }
    
    let left = Array(list[0..<r])
    let right = Array(list[r+1..<list.count])
    
    let lr = (left.count)/2
    let rr = (right.count/2)
    
    
    // 루트가 0 인데 자식이 1은 될 수가 없음 
    if (list[r] == 0) && (left[lr] == 1 || right[rr] == 1) {
        return false
    }
   
    return inorder(lr,left) && inorder(rr,right)
     
}

// 노드의 개수와 트리의 level을 비교하여 포화 이진트리 만들기
fileprivate func makeFullBinaryTree(_ number: String) -> String {
    var level: Double = 0
    var nodeCnt = 1
    
    while nodeCnt < number.count { // 레벨이 하나 증가할 때마다 2^level 만큼 차가됨
        level += 1
        nodeCnt += Int(pow(2, level)) 
    }
    
    let diff = nodeCnt - number.count // 이만큼 0을 앞에 추가해줘야 한다.
    
    return String(repeating: "0", count: diff) + number
}

func solution(_ numbers:[Int64]) -> [Int]{

    
    
    var ans:[Int] = []
    
    for n in numbers {
        if n == 1 {
            ans.append(1)
            continue
        }
        
        var s = String(n,radix:2)
        
        s = makeFullBinaryTree(s)
        
        var list = Array(s).map{Int(String($0))!}
        
        ans.append( inorder(list.count/2,list) ? 1 :  0)
        
        
    }
    
    return ans
}
