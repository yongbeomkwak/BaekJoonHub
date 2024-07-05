import Foundation

func readIntArray() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

struct TrafficeSign {
    
    let location: Int
    
    let green: Int
    
    let red: Int
    
}


let nl = readIntArray()

let (n, l) = (nl[0], nl[1])

var pos: Int = 0
var time: Int = 0

var trafiiceSigns: [TrafficeSign] = []

for _ in 0..<n {
    let input = readIntArray()
    
    let d = input[0]
    let r = input[1]
    let g = input[2]
    
    time += (d-pos)
    pos = d
    
    let mod = time % (r+g)
    
    if mod <= r {
        time += (r-mod)
    }
    

}

time += (l-pos)

print(time)


