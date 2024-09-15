import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var numbers: [String] = [] 
    
    var now: Int = 0 // 현재 숫자 
    
    var count: Int = 0 // 현재 담은 숫자 갯수 
    
    while count < t * m  {
        let number = String(now, radix:n).uppercased() // 진법 변환된 숫자
        numbers.append(number) 
        now += 1 // 다음 숫자 
        count += number.count // 해당 숫자만큼 길이 증가
    }
    
    var ans: [String] = []
    
    var index: Int = p-1
    
    let joinedNumbers = numbers.joined() // 문자열 
    
    while ans.count < t {
        ans.append(joinedNumbers[index])
        index += m
    }

    
    
    return ans.joined()
}