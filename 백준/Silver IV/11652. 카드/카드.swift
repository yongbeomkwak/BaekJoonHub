let n = Int(readLine()!)!


var hash : [Int64:Int] = [:]

for _ in 0..<n {
    
    let k = Int64(readLine()!)!
    
    hash[k,default: 0] += 1
    
}


var soretd_list = hash.sorted{
    
    if $0.value == $1.value {
        return $0.key < $1.key
    }
    
    return $0.value > $1.value
}


print(soretd_list[0].key)
