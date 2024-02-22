var tc = Int(readLine()!)!

repeat {
    
    var n = Int(readLine()!)!
    
    var graph = readLine()!.split{$0 == " "}.map{Int64($0)!}
    
    var highest: Int64 = 0
    var income: Int64 = 0
    
    for i in stride(from: n-1, to: -1, by: -1) {
        
        if graph[i] > highest {
            highest = graph[i]
        } else {
            
            income += (highest-graph[i])
        }
        
    }

    print(income)
    
    tc -= 1
} while tc > 0
