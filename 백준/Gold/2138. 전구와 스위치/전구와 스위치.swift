let n = Int(readLine()!)!
var bulb = Array(readLine()!).map{Int(String($0))!}
var target = Array(readLine()!).map{Int(String($0))!}

let MAX = 10000000

func switchBulb(_ a: [Int], _ b: [Int]) -> Int {
    
    var a = a
    var press = 0
    
    for i in 1..<n {
        
        if a[i-1] == b[i-1] {
            continue
        }
        
        //직전 것이 다르면 i-1 i i+1 switch
        
        press += 1
        for j in i-1...i+1 { //
            if j < n {
                a[j] = 1 - a[j] // 1이면 0, 0이면 1
            }
            
        }
        
    }
    
    if a == b { // 같으면
        return press
    } else {
        return MAX
    }
    
}

var res = switchBulb(bulb, target) // 첫번째 스위치를 건드리지 않고

// 첫번째 스위치를 올리고
bulb[0] = 1 - bulb[0]
bulb[1] = 1 - bulb[1]

res = min(res, switchBulb(bulb, target)+1) // +1은 첫번째 스위치를 먼저 켰으므로

if res == MAX || res == MAX+1 {
    print(-1)
} else {
    print(res)
}
