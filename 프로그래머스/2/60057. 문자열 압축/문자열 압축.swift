import Foundation

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex, offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
    
}

func solution(_ s:String) -> Int {
    
    var minLength = s.count 
    
    for compress in stride(from: 1, through: s.count/2, by:1) { // 압축 길이는 1 ~ 문자열 길이의 절반까지 

        var count: Int = 1 // 압축 횟수 
        var arr: [String] = []
        var now: String = s[0..<compress] // 현재 기준 문자열 
        var lastCompressedIndex: Int = 0 // 마지막 압축된 문자열 
        
        // 압축 길이만큼 자르면서 진행 
        for i in stride(from:compress, through: s.count - compress ,by:compress) {
            
            let next = s[i..<i+compress] // 다음 문자열  
            
            if now == next  { // 현재 문자열과 다음 문자열과 같으면 압축 , count + 1
                count += 1 
            } else { // 같지 않으면 현재 문자는 압축 불가
                // 압축 횟수가 1이면 생략가능
                let compressedText =  count != 1 ? "\(count)\(now)" : now
                arr.append(compressedText)
                now = next // 현재 문자열 다음 문자열로 갱신
                count = 1  // 압축 횟수도 1로 초기화
            }
            
            lastCompressedIndex = i + compress // 마지막 압축된 인덱스를 계속 추적
        } 
        
        
        // 반복문을 빠져 나온 후 now를 처리 
        let compressedText =  count != 1 ? "\(count)\(now)" : now
        arr.append(compressedText)
        
        // 마지막 압축 인덱스가 전체 문자 길이보다 작다면 
        if lastCompressedIndex < s.count {
            // 남은 잔여 문자 처리
            arr.append(s[lastCompressedIndex..<s.count])
        }
        

        // 현재 compress를 기준으로 압축된 최종 문자열과 길이 비교 후 갱신
        minLength = min(minLength, arr.joined().count)
        
    
    }
    
    
    
    return minLength
}