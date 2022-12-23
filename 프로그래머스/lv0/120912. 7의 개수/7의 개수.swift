import Foundation

func solution(_ array:[Int]) -> Int {
    
   var tmp = array.compactMap{
        String($0)
    }
    

    
    
    return tmp.reduce(0,{ 
        $0 + $1.filter{String($0) == "7"}.count
    })
}