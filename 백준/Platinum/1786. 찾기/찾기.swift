import Foundation

func computeLPS(_ pattern: [Character]) -> [Int] {

    let n = pattern.count
    
    var lps: [Int] = [Int](repeating: 0, count: n)
    
    var len = 0
    var pos = 1
    
    while pos < n {
        
        if pattern[len] == pattern[pos] {
            lps[pos] = len + 1
            pos += 1
            len += 1
            
        } else {
            
            if len == 0 {
                lps[pos] = 0
                pos += 1
            
            } else {
                len = lps[len-1]
            }
            
        }
        
        
    }
    
    return lps
}


func kmpSearch(_ s: [Character], _ pattern: [Character]) -> [Int] {
    
    let n = s.count
    let m = pattern.count
    
    let lps = computeLPS(pattern)
    
    var matchedStartIndex: [Int] = []
    
    var i: Int = 0
    var j: Int = 0
    
    
    while i < n {
        
        if s[i] == pattern[j] {
            i += 1
            j += 1
        } else {
            if j == 0 {
                i += 1
            } else {
                j = lps[j-1]
            }
            
        }
        
        if j == m {
            matchedStartIndex.append(i-j)
            j = lps[j-1]
        }
        
    }
    
    return matchedStartIndex
}

let s = Array(readLine()!)
let pattern = Array(readLine()!)

let answer = kmpSearch(s, pattern)
print(answer.count)
answer.forEach{
    print($0+1)
}
