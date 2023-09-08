

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

func convert(_ s1:String) -> [String] {
    
    var ret:[String] = []
    
    for i in stride(from: 1, to: s1.count, by: 1){
        
        let slice = s1[i-1..<i+1]
        
        ret.append(slice)
    }
    
    return ret
    
}


func solution(_ str1:String, _ str2:String) -> Int {

    var str1 = str1.lowercased()
    var str2 = str2.lowercased()
    
    
    let arr1:[String] = convert(str1).filter({ "a" <= $0[0] && $0[0] <= "z" && "a" <= $0[1] && $0[1] <= "z" }) // 영어만 남게 필터
    let arr2:[String] = convert(str2).filter({ "a" <= $0[0] && $0[0] <= "z" && "a" <= $0[1] && $0[1] <= "z" }) // 영어만 남게 필터
    
    
      // 가중치 맵
    var weight1:[String:Int] = [:]
    var weight2:[String:Int] = [:]

    for element in arr1 {
        weight1[element] = (weight1[element] ?? 0) + 1
    }

    for element in arr2 {
        weight2[element] = (weight2[element] ?? 0) + 1
    }


    let set1 = Set(arr1)
    let set2 = Set(arr2)

    // 교집합
    let intersection = set1.intersection(set2)
    var interValue = 0
    for str in intersection {
        let minNum = min(weight1[str] ?? 0, weight2[str] ?? 0)
        interValue += minNum
    }

    // 합집합
    let union = set1.union(set2)
    var unionValue = 0
    for str in union {
        let maxNum = max(weight1[str] ?? 0, weight2[str] ?? 0)
        unionValue += maxNum
    }

    if unionValue == 0 { return 65536 }
    let answer = Double(interValue) / Double(unionValue) * 65536.0

    return Int(answer)
     
}