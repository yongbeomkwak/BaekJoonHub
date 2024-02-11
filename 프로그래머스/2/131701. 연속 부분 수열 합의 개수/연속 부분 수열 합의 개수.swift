import Foundation

func solution(_ elements:[Int]) -> Int {
    
    let k = elements.count
    var answer: Int = 0
    var elements = elements + elements
    

    var set = Set<Int>()
    
    for start in 0..<k {
        
        var sum : Int = 0 
        for l in 0..<k {
            sum += elements[start+l]
            set.insert(sum)
        }
        
    }
    
    return set.count
}