import Foundation

let lr = readLine()!.split{$0 == " "}.map{String($0)}

var  (l,r) = (Array(lr[0]),Array(lr[1]))

var result : Int = 0

if l.count != r.count {
    print(0)
} else {
    
    for i in 0..<l.count {
        
        if l[i] == r[i]  {
            
            if l[i] == "8" {
                result += 1
            }

        } else {
            break
        }
        
    }
    print(result)

}


