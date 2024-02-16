var tc = Int(readLine()!)!


repeat {
    
    let _ = Int(readLine()!)!
    
    var noteA = Set(readLine()!.split{$0 == " "}.map{Int($0)!})
    

    let _ = Int(readLine()!)!
    
    
    var arr : [String] = []
    
    readLine()!.split{$0 == " "}.map{Int($0)!}.forEach { target in
        
        noteA.contains(target) ? arr.append("1") : arr.append("0")
    }
    
        
    print(arr.joined(separator: "\n"))
    
    
    
    
    tc -= 1
} while tc > 0
