import Foundation

let MAXHEIGHT: Int = 256

func input() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

var nmb = input()

let (n,m,b) = (nmb[0],nmb[1],nmb[2])

var board: [Int] = []

for _ in 0..<n {
    board += input()
}

var total = b + board.reduce(0, +)



func valid(_ height: Int) -> Bool {
    let need = n*m*height
    return need <= total
}

func time(_ height: Int) -> Int {
    var res = 0
    for t in board {
        if t < height {
            res += height - t
        } else if height < t {
            res += 2*(t - height)
        }
    }
    return res
}

var result: (Int,Int) = (Int.max,-1)

for height in 0...256 {
    if valid(height) {
        let t = time(height)
        
        if result.0 >= t {
            result.0 = t
            result.1 = height
        }
        
    }
}

print("\(result.0) \(result.1)")


