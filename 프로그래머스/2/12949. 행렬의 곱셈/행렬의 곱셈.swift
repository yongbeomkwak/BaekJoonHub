import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {

    // n x m  X m x k 
    
    let n = arr1.count
    let m = arr1[0].count
    let k = arr2[0].count
    
    
    
    var result: [[Int]] = [[Int]](repeating:[Int](repeating:0,count:k),count:n)
    
    for t in 0..<k {
        
        for i in 0..<n {
            
            for j in 0..<m {
                
                
                result[i][t] += arr1[i][j] * arr2[j][t] 
                
            }
            
        }
        
    }
    

    
    
    
    return result
}