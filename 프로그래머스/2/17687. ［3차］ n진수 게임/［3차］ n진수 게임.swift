extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var now = 0
    
    let end = (t-1)*m  + p // 필요한 길이 
    
    var numbers: [String] = []
    
    while numbers.count < end { // 헤당 길이를 채울 때 까지  진법 
        numbers += String(now, radix: n).compactMap({ String($0).uppercased() })
        now += 1
    }  
    
    

    
    return  stride(from: p - 1, to: end, by: m).reduce("", { $0 + numbers[$1] })
}