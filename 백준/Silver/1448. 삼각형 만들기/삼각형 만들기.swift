let n = Int(readLine()!)!

var straw: [Int] = []


func canMake(_ a:Int,_ b: Int,_ c: Int) -> Bool {
    
    return c < a+b
}

for _ in 0..<n {
    straw.append(Int(readLine()!)!)
}

straw.sort()

var result : Int = -1

for i in stride(from: straw.count-1, to: 1, by: -1) {

    let a = straw[i-2]
    let b = straw[i-1]
    let c = straw[i]
    
    
    if canMake(a, b, c) {
        result = a+b+c
        break
    }
}

print(result)
