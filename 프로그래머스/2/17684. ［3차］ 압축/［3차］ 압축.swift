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

func solution(_ msg:String) -> [Int] {
    
    var dictionary: [String:Int] = [:]
    var `set` = Set<String>()
    
     for i in 0...25 { // A~Z부터 넣어놓기 
        let alpha =  String(Character(UnicodeScalar(65+i)!))
        dictionary[alpha] = i+1 
         set.insert(alpha)
    }
    
    if msg.count == 1 { // 만약 문자열 길이가 하나면 인덱스 바로 리턴
        return [dictionary[msg]!]
    }
    
    var ans:[Int] = []
    
    var now: String = msg[0] // 현재 가르키고 있는 문자 
    
    for i in 1..<msg.count {
        let next = msg[i] // 다음 문자
        
        let comb = now+next // 둘이 더한 조합 문자열 
        
        if set.contains(comb) { // w+c가 이미 있으면 
            now = comb // now 갱신 넘어감
            continue 
        } else { // 없으면 셋과 딕셔너리에 넣어 줌
            set.insert(comb) 
            dictionary[comb] = set.count
            ans.append(dictionary[now]!) // 현재 문자 인덱스 추출
            now = next
        }

    }
    
    ans.append(dictionary[now]!) // 마지막 글자 c
    
    
    
    return ans
}