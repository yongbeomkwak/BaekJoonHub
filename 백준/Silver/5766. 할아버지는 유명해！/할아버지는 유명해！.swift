import Foundation

func input() -> [Int] {
    readLine()!.split{$0 == " "}.map{Int($0)!}
}

while true {
    let nm = input()

    let (n,m) = (nm[0], nm[1])
    
    if n == 0 && m == 0 {
        break
    }
    
    var count: [Int:Int] = [:]
    
    for i in 0..<n {
        let info = input()
        
        for j in info {
            count[j,default: 0] += 1
        }
    }
    
    let sorted_list = count.sorted(by: {$0.value == $1.value  ? $0.key < $1.key : $0.value > $1.value })
    
    var firstScore = 0
    var secondScore = 0
    
    var ans: [String] = []
    
    for i  in 0..<sorted_list.count {
        let (k,v) =  sorted_list[i]
        
        if i == 0 {
            firstScore = v
            continue
        }
        
        if i == 1 {
            secondScore = v
            
            if firstScore == secondScore {
                ans.append("\(sorted_list[0].key)")
            }
            
        }
        
        if secondScore == v {
            ans.append("\(sorted_list[i].key)")
        }
        
        
        
    }
    
    print(ans.joined(separator: " "))
    
    
    
    
    
    
}




