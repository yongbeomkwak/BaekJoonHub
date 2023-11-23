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
        var s1 = String(arr1[i],radix:2)
        var s2 = String(arr2[i],radix:2)
        s1 = String(repeating:"0", count: n-s1.count)+s1
        s2 = String(repeating:"0", count: n-s2.count)+s2
        
        var ans: String = ""
        
        for j in 0..<n {
            if s1[j] == "0" , s1[j] == s2[j] {
                ans += " "
            }
            else {
                ans += "#"
            }
        }
        
        answer.append(ans)
    }
    
 
    
    
    return answer
}