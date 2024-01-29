let tc = Int(readLine()!)!


for _ in 0..<tc {
    
    var s = Array(readLine()!)
    
    var hash: [Character: [Int]] = [:]
    
    for (i,c) in s.enumerated() {
        hash[c,default: []].append(i)
    }
    
    let k = Int(readLine()!)!
    
    var m = -1
    var M = -1
    
    for i in 97...122 { // a ~ z
        
        let c = Character(UnicodeScalar(i)!)
        
        if hash[c,default: []].count < k {
            continue
        }
        
        var arr = hash[c]!
        

        for i in  stride(from: 0, through: arr.count-k, by: 1) {
            
            var start = arr[i]
            var end = arr[i+k-1] //k번째 인덱스
            
            let l = end-start+1 // start와 end 모두 포함하므로 e-s+1
           
            m = m == -1 ? l : min(m,l) // -1이면 무조건 초반값 l
            M = max(M,l)

            
        }
    }

        print(m == -1 || M ==  -1 ? -1 : "\(m) \(M)" )
    
    

}
