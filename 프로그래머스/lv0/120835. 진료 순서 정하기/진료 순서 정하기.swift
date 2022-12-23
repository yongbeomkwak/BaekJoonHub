import Foundation

func solution(_ emergency:[Int]) -> [Int] {

    let sorted = emergency.sorted(by:>)
    
   
        
    return emergency.compactMap{
        sorted.firstIndex(of:$0)! + 1
    }

}