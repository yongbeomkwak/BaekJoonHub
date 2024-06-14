import Foundation

extension String {
    
    subscript(_ idx: Int) -> Character {
        
       self[self.index(self.startIndex, offsetBy: idx)]
        
    }
    
}

func readArr() -> [Int] {
    readLine()!.split{$0 == " "}.map{Int($0)!}
}

let nk = readArr()
let (n,k) = (nk[0], nk[1])

var a = readArr()

var count: Int = 0

var ans: Int = -1


func merge(_ start:Int, _ end:Int) {
    
    let mid = (start+end)/2
    var left = start
    var right = mid + 1
    
    var tmpArr: [Int] = []
    
    
    while left <= mid && right <= end {

        if a[left] <= a[right] {
            tmpArr.append(a[left])
            left += 1
        } else {
            tmpArr.append(a[right])
            right += 1
        }
        
    }
    
    
    var entry = left > mid ? right : left
    var exit = left > mid ? end : mid
    
    for i in entry...exit {
        tmpArr.append(a[i])
    }

    for i in 0..<tmpArr.count {
        a[start+i] = tmpArr[i]
        
        count += 1
        
        if count == k {
            ans = tmpArr[i]
        }
    }
 
    
}

func divide(_ start:Int,_ end:Int) {
    
    
    if start < end {
        
        let mid = (start+end) / 2
        divide(start, mid)
        divide(mid+1, end)
        merge(start, end)
        
    }
    
}

divide(0, n-1)

print(ans)
