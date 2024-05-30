import Foundation

let vowelSet = Set<Character>(["a","e","i","o","u"])

func rule1(_ s:[Character]) -> Bool {
    
    for c in s{
        if vowelSet.contains(c) {
            return true
        }
    }
    
    return false
}

func rule2(_ s: [Character]) -> Bool {
    
    let n = s.count
    
    if n < 3 {
        return true
    }
    
    for i in 0..<n-2 {
        
        let c1 = s[i]
        let c2 = s[i+1]
        let c3 = s[i+2]
        
        if (vowelSet.contains(c1) && vowelSet.contains(c2) && vowelSet.contains(c3)) ||  (!vowelSet.contains(c1) && !vowelSet.contains(c2) && !vowelSet.contains(c3)) {
            return false
        }
    }
    
    return true
}

func rule3(_ s: [Character]) -> Bool {
    
    let n = s.count
    
    if n < 2 {
        return true
    }
    
    for i in 0..<n-1 {
        let c1 = s[i]
        let c2 = s[i+1]
        
        if c1 == c2 {
            
            if c1 == "e" || c1 == "o" {
                continue
            }
            
            return false
        }
        
    }
    
    return true
    
}

while let input = readLine() {
    
    if input == "end" {
        break
    }
    
    let arr = Array(input)
    
    if rule1(arr) && rule2(arr) && rule3(arr) {
        print("<\(input)> is acceptable.")
    } else {
        print("<\(input)> is not acceptable.")
    }
    
    
}
