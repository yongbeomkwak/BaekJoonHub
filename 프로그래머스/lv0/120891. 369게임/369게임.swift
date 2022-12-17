import Foundation

func solution(_ order:Int) -> Int {
    let conv = String(order).compactMap{Int(String($0))!}
    var ans:Int = 0
    for i in conv {
        if(i == 3 || i == 6 || i == 9){
            ans += 1
        }
    }
    
    return ans
}