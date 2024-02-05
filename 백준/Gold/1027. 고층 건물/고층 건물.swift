let n = Int(readLine()!)!

let height: [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}

func slope(_ x1: Int, _ y1:Int ,_ x2: Int,_ y2: Int) -> Double {
    return Double(y2-y1) / Double(x2-x1)
}

var result : Int = 0

for (i1 , y1) in height.enumerated() {
    
    let x1 = i1+1
    
    var curr_slope_right : Double? = nil
    var visible_right : Int = 0
    
    for i2 in stride(from:i1+1,to:n+1,by:1) {
        
        if i2 == n {
            break
        }
        
        let x2 = i2 + 1
        let y2 = height[i2]
        
        let slope_right = slope(x1, y1, x2, y2)
        
        if curr_slope_right == nil{
            
            curr_slope_right  = slope_right
            visible_right += 1
            continue
            
        }
        
        if curr_slope_right! < slope_right {
            
            //오른쪽에 있는 최초 건물이거나 , 이전 건물보다 높으면  볼수 있음
    
            curr_slope_right  = slope_right
            visible_right += 1
        }
        
        
    }
    
    var cur_slop_left : Double? = nil
    var visible_left : Int = 0
    
    
    for i3 in stride(from:i1-1,to:-1,by:-1) {
        
        if i3 == -1 {
            break
        }
        
        let x3 = i3 + 1
        let y3 = height[i3]
        
        let slope_left = slope(x1, y1, x3, y3)
        
        if cur_slop_left == nil{
            cur_slop_left  = slope_left
            visible_left += 1
            continue
        }
        
        if cur_slop_left! > slope_left {
            
            //왼쪽에 있는 최초 건물이거나 , 이전 건물보다 높으면  볼수 있음
            cur_slop_left  = slope_left
            visible_left += 1
        }
        
        
    }
    
    
    result = max(result,visible_left+visible_right)
}

print(result)
