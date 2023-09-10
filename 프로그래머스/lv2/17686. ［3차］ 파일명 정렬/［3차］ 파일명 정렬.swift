func solution(_ files:[String]) -> [String] {
    
    
    let customSort: ([String], [String]) -> Bool = { a, b in
        if a[0].lowercased() != b[0].lowercased() { // head 오름차순 
            return a[0].lowercased() < b[0].lowercased()
        } else {
            if let n1 = Int(a[1]), let n2 = Int(b[1]), n1 != n2 { //number 오름차순
                return n1 < n2 
            }
        }
        return false // Stable sort를 위한 false(안 바꿈)
    }
    
    // 정렬 한 후 . joined
    return splitFiles(files).sorted(by:customSort).compactMap{$0.joined()}
}

func splitFiles(_ files:[String]) -> [[String]] {
    
    let symbol = [".", "-", " "]
    var splitFiles = [[String]]()
    
    
    for file in files {
        
        var beginNumber:Bool = false
        var endNumber:Bool = false 
        var head = ""
        var num = ""
        var tail = ""
        
        for c in file {
            
            if !beginNumber && c.isNumber {
                beginNumber = true
            }
            
            
            if !beginNumber { // 숫자 부분 안 지나갔으면 Head
                
                head += String(c)
            }
            
            else { // num or tail
                
                if !c.isNumber {
                    endNumber = true 
                }
                
                if !endNumber && c.isNumber{  // endNumber가 끝나지 않았으면 아직 number
                    num += String(c)
                    continue
                }
                
                else {
                    tail += String(c)
                }
                
            }
            
        }
        
        splitFiles.append([head, num, tail]) 
        
    }
    
    return splitFiles
}