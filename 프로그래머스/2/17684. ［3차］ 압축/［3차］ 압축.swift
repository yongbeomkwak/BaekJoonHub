func solution(_ msg:String) -> [Int] {
    
    var dict: [String:Int] = [:]
    
    // "A" ~ "Z"
    for i in 0...25 {
        dict[String(Character(UnicodeScalar(65+i)!))] = i+1
    }
    
    var arr = Array(msg).map{String($0)}

    
    var now: String = arr[0]

    
    var ans: [Int] = []
    
    
    for i in 1..<arr.count {

        if dict[now,default:0] != 0 { // 현재 값 존재 
            if dict[now+arr[i],default:0] == 0 { // 다음 글자와 조합한 것이 존재하지 않을 때 
                ans.append(dict[now]!) // 현재 값 출력 
                dict[now+arr[i]] = dict.count+1 // 다음 번호 부여 
                now = arr[i] // 현재 글자이동 
            } else { // 다음 글자와 조합한 것이 존재할 때 
                now += arr[i]
            }
        }
        
        
    }
    
    if !now.isEmpty { // 마지막 글자 출력
        ans.append(dict[now,default:0])
    }
    
    
    return ans
}