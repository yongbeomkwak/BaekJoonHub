import Foundation



func dayToInt(_ date: String) -> Int {
    
    let date = date.split{$0 == "."}.map{Int($0)!}
    
    return (date[0] * 12 * 28) + (date[1] * 28) + date[2] // 모두 일로 치환
}



func isExpired(_ today: String, _ end:Int) -> Bool {
    
    return dayToInt(today) >= end  // 유효기간 지남
}


func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var ans: [Int] = []
    
    var termDict:[String: Int] = [:]
    
    for term in terms {
        
        var splitedTm = term.split{$0 == " "}
        
        termDict[String(splitedTm[0])] = Int(splitedTm[1])! * 28 // 약관 종류별 더해 줄 파기달 * 28 = 파기일
        
    }
    
    for i in 0..<privacies.count {
        
        let splited = privacies[i].split{$0 == " "}.map{String($0)}
        
        
        if isExpired(today,dayToInt(splited[0]) + termDict[splited[1]]!) { 
            //오늘 날짜와 시작날짜 + 약관 종류 별 가산할 파기날 
            ans.append(i+1)
        } 
        
    }
    
    
    
    
    
    return ans
}