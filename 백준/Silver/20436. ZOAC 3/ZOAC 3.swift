

let input = readLine()!.split{$0 == " "}.map{String($0)}

let (left,right) = (input[0],input[1])

let s = readLine()!.map{String($0)}

func press(_ x1:Int,_ y1:Int,_ x2: Int, _ y2:Int) -> Int {
    return abs(x1-x2) + abs(y1-y2) + 1 // 마지막 1은 누르는 시간
}

var leftHand : [String:(Int,Int)] = [:]
var rightHand : [String:(Int,Int)] = [:]

leftHand["q"] = (0,0)
leftHand["w"] = (0,1)
leftHand["e"] = (0,2)
leftHand["r"] = (0,3)
leftHand["t"] = (0,4)

leftHand["a"] = (1,0)
leftHand["s"] = (1,1)
leftHand["d"] = (1,2)
leftHand["f"] = (1,3)
leftHand["g"] = (1,4)

leftHand["z"] = (2,0)
leftHand["x"] = (2,1)
leftHand["c"] = (2,2)
leftHand["v"] = (2,3)

rightHand["y"] = (0,5)
rightHand["u"] = (0,6)
rightHand["i"] = (0,7)
rightHand["o"] = (0,8)
rightHand["p"] = (0,9)

rightHand["h"] = (1,5)
rightHand["j"] = (1,6)
rightHand["k"] = (1,7)
rightHand["l"] = (1,8)

rightHand["b"] = (2,4)
rightHand["n"] = (2,5)
rightHand["m"] = (2,6)

var count: Int = 0
var leftH = leftHand[left]!
var rightH = rightHand[right]!

for c in s {
    
    if leftHand[c] == nil {
      
        let next = rightHand[c]!
        
        count += press(rightH.0, rightH.1, next.0, next.1)
        rightH = next
    }
    
    else {
        
        let next = leftHand[c]!
        
        count += press(leftH.0, leftH.1, next.0, next.1)
        leftH = next
        
    }
    
}

print(count)


