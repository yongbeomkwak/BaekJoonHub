
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

let n = Int(readLine()!)!

var words: [String] = []

for _ in 0..<n {
    words.append(readLine()!)
}

let sorted_words = words.enumerated().sorted(by:{
    if $0.element == $1.element {
        return $0.offset < $1.offset
    }
    
    return $0.element < $1.element
}) // 문자열 오름차순 이후 같을경우는 인덱스로

func comp(_ s1:String, _ s2: String) -> Int {
    
    let loop = min(s1.count,s2.count)
    var cnt: Int = 0
    
    
    for i in 0..<loop {
        if s1[i] == s2[i] {
            cnt += 1
        } else {
            break
        }
    }
    
    return cnt
}

var length = Array(repeating: 0, count: n+1)
var maxLength = 0

for i in 0..<n-1 {
    
    let cnt = comp(sorted_words[i].element, sorted_words[i+1].element)
    
    length[sorted_words[i].offset] = max(length[sorted_words[i].offset],cnt)
    length[sorted_words[i+1].offset] = max(length[sorted_words[i+1].offset],cnt) // 원래 자리에 넣음
    
    maxLength = max(maxLength,cnt)
}

// 가장 긴 접두사의 길이 알아냄

var pre : String = ""

for i in 0..<n {
    
    if length[i] == maxLength {

        if pre == "" {
            pre = String(words[i].prefix(maxLength))
            print(words[i])
        } else if pre == words[i].prefix(maxLength) {
            print(words[i])
            break
        }
        
    }
    
}




