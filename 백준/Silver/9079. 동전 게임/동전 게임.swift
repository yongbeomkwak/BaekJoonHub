var tc = Int(readLine()!)!

 
func check(_ bit: Int) -> Bool {
    
    
    return  bit == 0 || bit == 511
}


enum HFlip: Int {
    case flip012 = 448 // "111 000 000"
    case flip345 = 56 // "000 111 000"
    case flip678 = 7 // "000 000 111"
}

enum VFlip: Int {
    case flip036 = 292 // "100 100 100"
    case flip147 = 146 // "010 010 010"
    case flip258 = 73 // "001 001 001"
}

enum XFlip: Int {
    case flip048 = 273 // "100 010 001"
    case flip246 = 84 // "001 010 100"
}



var isVisited: [Int:Int] = [:] // 상태체크  , key = 최소거리(Value), , 111 111 000 ,

let hflips = [HFlip.flip012,HFlip.flip345,HFlip.flip678]
let vflips = [VFlip.flip036,VFlip.flip147,VFlip.flip258]
let xflips = [XFlip.flip048,XFlip.flip246]

func bfs(_ bit: Int) -> Int {
    
    var queue : [(Int,Int)] = [(bit,0)]
    
    var index = 0
    
    
    while index < queue.count {
        
        let front = queue[index]
        let now = front.0
        let nowDist = front.1
        
        if check(now) {
            return nowDist
        }
        
        
        for h in hflips {
            
            let next = now ^ h.rawValue
            if isVisited[next,default: Int.max] > nowDist+1  {
                isVisited[next] = nowDist+1
                queue.append((next, nowDist+1))

            }
            
        }
        
        for v in vflips {
            
            let next = now ^ v.rawValue
            
            if isVisited[next,default: Int.max] > nowDist+1  {
                isVisited[next] = nowDist+1
                queue.append((next, nowDist+1))

            }
            
        }
        
        
        for x in xflips {
            
            let next = now ^ x.rawValue
            
            if isVisited[next,default: Int.max] > nowDist+1  {
                isVisited[next] = nowDist+1
                queue.append((next, nowDist+1))

            }
            
        }
        
        index += 1
        
    }
    
return -1

    
}

repeat {
    
    var cube: Array<String> = .init()
    
    
    for _ in 0..<3 {
        let s = readLine()!.split{$0 == " "}.map{ return $0 == "T" ? "1" : "0"}.joined()
                
        cube.append(s)
        
    }
    
    let bit = Int(cube.joined(),radix: 2)!
    
    
    print(bfs(bit))

    isVisited = [:]
    tc -= 1
} while tc > 0


