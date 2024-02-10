func gcd(_ x: Int, _ y: Int) -> Int {
    var a = 0
    var b = max(x, y)
    var r = min(x, y)
    
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}


func lcm(_ x: Int, _ y: Int) -> Int {
    return x / gcd(x, y) * y
}


func solution(_ arr:[Int]) -> Int {
    
    if arr.count == 1 {
        return arr[0]
    }
    
    var arr = arr.sorted()
    
    var curr = arr[0]
    
    for i in 1..<arr.count {
        curr = lcm(curr,arr[i])
    }
    
    
    
    return curr
}