import Foundation

func readIntArray() -> [Int] {
    return readLine()!.split{$0 == " "}.map{Int($0)!}
}

// X 치킨.  , A
// Y 피자   , B
// Z 햄버거 , C

// 3치킨 = 1피자
// 3피자 = 1햄버거
// 3햄버거 = 1치킨

var abc = readIntArray()
var xyz = readIntArray()

var (a,b,c) = (abc[0], abc[1], abc[2])

var (x,y,z) = (xyz[0], xyz[1], xyz[2])

var ans: Int = 0

for _ in 0..<3 {
    
    let chicken = min(a,x)
    
    ans += chicken
    
    a -= chicken
    
    x -= chicken
    
    let pizza = min(b,y)
    
    ans += pizza
    
    b -= pizza
    
    y -= pizza
    
    let burger = min(c,z)
    
    ans += burger
    
    c -= burger
    
    z -= burger
    
    
    ( y, z, x) = (x / 3, y / 3, z / 3)
    
}


print(ans)

