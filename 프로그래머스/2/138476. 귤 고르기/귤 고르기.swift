import Foundation


func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var dict: [Int:Int] = [:]
    
    for i in tangerine {
        dict[i,default:0] += 1 
    }
    
var sorted_list = dict.sorted{$0.value > $1.value}.map{$0.value}
    
var cnt: Int = 0
for (index,v) in sorted_list.enumerated() {
    if cnt < k {
        cnt += v 
        continue
    }
    
    return index
}
    
    return dict.count
}