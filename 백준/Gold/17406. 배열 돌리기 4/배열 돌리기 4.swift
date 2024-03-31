func getRowSum(_ arr: [[Int]]) -> Int {
    
    let rows = arr.count
    
    var result = Int.max
    
    for i in 0..<rows {
        result = min(result,arr[i].reduce(0, +))
    }
    
    
    return result
}

let nmk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m,k) = (nmk[0],nmk[1],nmk[2])

var board: [[Int]] = []

var result: Int = Int.max

for _ in 0..<n {
    board.append(readLine()!.split{$0 == " "}.map{Int($0)!})
}

func rotate(_ arr: inout [[Int]],_ x:Int,_ y: Int,_ h:Int,_ w:Int,_ rotateCnt: Int) {
    
    let loopCount = min(x+h,y+w)/2
    
    
    for l in 0..<loopCount {
        
        let left = y+l
        let top = x+l
        let right = y+w-l
        let bottom = x+h-l
        

        
        var tmp: [Int] = []
        
        
        for i in stride(from: left, to: right, by: 1) {
            tmp.append(arr[top][i])
        }
        
        for i in stride(from: top, to: bottom, by: 1) {
            tmp.append(arr[i][right])
        }
        
        for i in stride(from: right, to: left, by: -1) {
            tmp.append(arr[bottom][i])
        }
        
        for i in stride(from: bottom, to: top, by: -1) {
            tmp.append(arr[i][left])
        }
        
        var k = 0
        let len = tmp.count
        
        if len == 0 { // 1개짜리는 회전할 필요 없음
            break
        }
        
        let move = rotateCnt % len
        
        tmp = Array(tmp[len-move..<len])  + Array(tmp[0..<len-move])
        
        
        for i in stride(from: left, to: right, by: 1) {
            arr[top][i] = tmp[k]
            k += 1
        }
        
        for i in stride(from: top, to: bottom, by: 1) {
            arr[i][right] = tmp[k]
            k += 1
        }
        
        for i in stride(from: right, to: left, by: -1) {
           arr[bottom][i] = tmp[k]
            k += 1
        }
        
        for i in stride(from: bottom, to: top, by: -1) {
            arr[i][left] = tmp[k]
            k+=1
        }
       
    }
    
    
    
}


func permutation<T>(_ element: [T],_ r: Int) -> [[T]] {
    
    var result: [[T]] = []
    
    var visited: [Bool] = [Bool](repeating: false, count: element.count)
    
    
    func permu(_ now:[T]) {
       
        if now.count == r {
            result.append(now)
            return
        }
        
        
        for i in 0..<element.count {
            
            if visited[i] {
                continue
            }
            
            visited[i] = true
            permu(now + [element[i]])
            visited[i] = false
            
        }
    }
    
    permu([])
    
    return result
}


var rotationArr: [(Int,Int,Int)] = []

for _ in 0..<k {
    let rcs = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    let (r,c,s) = (rcs[0],rcs[1],rcs[2])
    
    rotationArr.append((r,c,s))
}

let perm = permutation(rotationArr, k)

for p in perm {
    
    var arr = board

    for pp in p {
        let (r,c,s) = (pp.0,pp.1,pp.2)
        rotate(&arr, r-s-1, c-s-1, s*2, s*2, 1)
    }

    
    result = min(result,getRowSum(arr))

}

print(result)
