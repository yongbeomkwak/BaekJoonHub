let n = Int(readLine()!)!


var dict: [String:Int] = [:]

var size: Int = 0
var ans: Int = 0



for i in 0..<n {
    var diff: Int = 0
    let tmp = Array(readLine()!.map{String($0)})
    var tmpDict = dict
    
    if i == 0 {
        
        tmp.forEach {
            dict[$0,default: 0] += 1
        }
        size =  tmp.count
        continue
    }
    
    tmp.forEach{
        if  tmpDict[$0,default:0] != 0 { // 충분히 필요한 문자면
            
            tmpDict[$0,default: 0] -= 1
            
        }
        else {
            diff += 1
        }
    }
    
    if tmp.count == size && diff <= 1 {
        ans += 1
    } else if tmp.count == size+1 && diff <= 1 {
        ans += 1
    } else if tmp.count == size-1 && diff == 0 {
        ans += 1
    }

}
    
print(ans)




extension String {

    // var a:String = "123"
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }


    //let str = "abcde"
    //print(str[0..<4]) // abcd

    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }

}
