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

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    
    for i in 0..<n {
        var s = String(arr1[i]|arr2[i],radix:2)
        
        s = String(repeating:"0",count:n-s.count)+s
        
        let ans = s.map{return $0 == "0" ? " " : "#"}.joined()
    
        
        answer.append(ans)
    }
    
 
    
    
    return answer
}