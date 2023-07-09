import Foundation

let words = ["A","E","I","O","U"]

func dfs(_ s:String,_ n:Int,_ arr: inout [String]){
    
    
    if s.count == n{
        arr.append(s)
        return
    }
    
    for i in 0..<5 {
        dfs(s+words[i],n,&arr)
    }
    
}


func solution(_ word:String) -> Int {

    var arr: [String] = .init()
    for i in 1...5{
        dfs("",i,&arr)
    }
    
    arr.sort()
   // print(arr)
    var ans = arr.firstIndex(of:word)!
    
    return ans + 1
}