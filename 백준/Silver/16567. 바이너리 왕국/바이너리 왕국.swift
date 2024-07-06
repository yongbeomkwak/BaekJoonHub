import Foundation

func readIntArray() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

let nm = readIntArray()

let (n, m) = (nm[0], nm[1])


var road = readIntArray()


var group = 0
var conti = false

for i in 0..<n {
    
    if road[i] == 1 &&  conti == false {
   
        group += 1
        conti = true
    } else if road[i] == 0 {
        conti = false
    }
    
}



for _ in 0..<m {
    let order = readLine()!.split{$0 == " "}.map{String($0)}
    

    
    if order.count == 1 {
        
        print(group)
        
    } else {
        let i = Int(order[1])! - 1
        
        
        if road[i] == 1 {
            continue
        }
        
        road[i] = 1
        
        if i == 0 {
        
            if road[i+1] == 0 {
                group += 1
            }
        
        } else if i == n - 1 {
            
            if road[i-1] == 0 {
                group += 1
            }
            
        } else {
            
            if road[i-1] == 0 && road[i+1] == 0 {
                group += 1
            } else if road[i-1] == 1 && road[i+1] == 1 {
                group -= 1
            }
            
            
            
        }
        
        
    }
    
}

