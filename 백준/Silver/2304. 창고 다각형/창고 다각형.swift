let n = Int(readLine()!)!


var colums:[(x:Int,y:Int)] = []

var maxHeight: Int = 0

for _ in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (l,h) = (input[0],input[1])
    
    maxHeight = max(maxHeight,h)
    colums.append((x:l,y:h))
    
}

colums.sort(by: {$0.x < $1.x})

var heightX: Int = 0

for i in 0..<n {
    
    if colums[i].y == maxHeight {
        heightX = i
    }
    
}

var result: Int = maxHeight // 최고 기둥 막대

//왼쪽부터 가장 높은 곳 까지

var height: Int = colums[0].y

for i in 0..<heightX {
    
    
    if height < colums[i+1].y {
        
        result += (height) * (colums[i+1].x - colums[i].x)
        
        height = colums[i+1].y
        
    } else {
        
        result += (height) * (colums[i+1].x - colums[i].x)
        
    }
    
}

height = colums.last!.y

for i in stride(from:n-1, to:heightX, by:-1) {
    
    
    if height < colums[i-1].y {
        
        result += (height) * (colums[i].x - colums[i-1].x)
        
        height = colums[i-1].y
        
    } else {
        
        result += (height) * (colums[i].x - colums[i-1].x)
        
    }
    
}

print(result)

