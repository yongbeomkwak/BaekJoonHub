import Foundation



func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var hash: [String:Bool] = [:] // 중복단어 체크 딕셔너리 
    
    var ans:[Int] = [0,0]
    
    func isPass(_ prev: String ,_ s: String) -> Bool { // 끝말잇기 판별
        
        if hash[s,default:false] { // 이미 존재하면 false
            return false 
        }
        
        if  prev.isEmpty || prev.last! == s.first! { // 이전 값이 비어있거나(첫 단어), 끝말잇기 규칙이 맞으면 통과
            hash[s] = true // 단어 사용 추가
            return true 
        }
        
        return false // 끝말잇기 규칙위배되면 false
    }
    
    var prev: String = ""
    
    for i in 0..<words.count{
        
        if !isPass(prev,words[i]){
            print("\(i) Check")
            let num = (i+1)%n == 0 ? n : (i+1)%n // 번호가 0이면 n번째 사람 
            ans = [num,(i/n)+1] // 순서 = index/n)+1
            break
        }
        
        prev = words[i]
    }
    
    return ans
}