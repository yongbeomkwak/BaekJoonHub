import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}


func solution(_ msg:String) -> [Int] {

    var answer: [Int] = []
    var dict: [String: Int] = [:] 
    var a: Character = "A"
    var index: Int = 1
    let length = msg.count
    
    // A ~ Z 색인번호 삽입 
    for i in 0...25 {
        let letter = String(Character(UnicodeScalar(65+i)!))
        dict[letter] = i+1
    }
    
    var w = ""
    
    for index in 0..<length {
        
        let c = msg[index] // 다음 문자열 
        
        let wc = w + c 
        
        if dict[wc] != nil { // 존재하면 w를 wc로 갱신 
            w = wc 
        } else { // 존재하지 않으면 
            answer.append(dict[w]!) // 현재 입력의 색인 출력 
            w = c // 다음 글자로 갱신 
            dict[wc] = dict.count+1 // w+c 사전추가
            
        }
        
    }

    answer.append(dict[w]!) // 마지막 현재 값 추가 
    
    return answer
}