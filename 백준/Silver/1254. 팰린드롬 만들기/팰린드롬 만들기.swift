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

var s = readLine()!

var result : Int = 0

for i in 0..<s.count {
    
    let left = s[i..<s.count]
    let right = String(s[i..<s.count].reversed())
    
    if left == right {
        result = s.count + i
        break
    }
    
}

print(result)
