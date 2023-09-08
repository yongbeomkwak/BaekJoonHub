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
    
    var hash:[String:Int] = .init()
    
    for i in 65...90{
       let s = String(Character(UnicodeScalar(i)!))
        hash[s] = i - 64
    }
    
    if msg.count == 1 {
        return [hash[msg]!]
    }
    
    
    var answer:[Int] = .init()
    var now:String = String(msg[0])
    
    for i in 1..<msg.count{
        
        if let index = hash[ now + msg[i]] { // 현재 값이 존재하면 
            
            now += msg[i] // 합친 후 다음 
            continue 
        }
        
        // 없을 경우 현재 합친 문자에 인덱스 번호 부여 
        hash[now + msg[i]] = hash.count + 1 
        answer.append(hash[now] ?? 0 ) // 이후 현재까지의 단어의 인덱스 추가 
        now = msg[i] // 
        
    } 
    
    answer.append(hash[now] ?? 0 ) //마지막 값 

    return answer
}