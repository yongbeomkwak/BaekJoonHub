import Foundation

func gcd(_ a: Int, _ b:Int) -> Int {
    
    if a%b == 0 { return b }
    
    return gcd(b,a%b)
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let n = arrayA.count 
    var a1: Int = arrayA[0]
    var a2: Int = arrayB[0]
    
    for i in 0..<n {
        a1 = gcd(a1,arrayA[i])
        a2 = gcd(a2,arrayB[i])
    }
    
    var result = 0 
    
    if arrayB.filter{$0 % a1 == 0 }.count == .zero {
        result = max(result, a1)
    }
    
    if arrayA.filter{$0 % a2 == 0 }.count == .zero  {
        result = max(result, a2)
    }

    return result
}