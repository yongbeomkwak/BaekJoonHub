let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m) = (input[0],input[1])

var dict: [String:Int] = [:]


for _ in 0..<n {
    
    let str = readLine()!
    
    if str.count < m {
        continue
    }
    

    
    dict[str,default: 0] += 1

}

var sorted_list =  dict.sorted(by: {

    if $0.value == $1.value {
        if $0.key.count == $1.key.count {
                return $0.key < $1.key
            }
            return $0.key.count > $1.key.count
    }
    
    return $0.value > $1.value
})


for eng in sorted_list {
    print(eng.key)
}
