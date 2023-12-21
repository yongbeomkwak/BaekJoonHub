import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    let n = enroll.count
    var graph: [String:String] = [:] // parents
    var mapped_dict:[String:Int] = [:] // person to index
    var wallet = [Int](repeating:0,count:n+1) // n+1인 이유는 "-"를 대비해서
    
    mapped_dict["-"] = n // 버리는 곳 (예제의 center에 해당)
    
    for (index, info) in zip(enroll,referral).enumerated() {
        
        let child = info.0
        let parent = info.1
       
        graph[child] = parent // 부모 기억
        mapped_dict[child] = index // 인덱스 기억 
    }
    
    func dfs(_ s: String,_ income:Int) {
        
        var s = s 
        var index = mapped_dict[s]! // 현재 인원 인덱스 
        var payment = Int(Double(income) * 0.1) // 첫 상납금은 수입의 0.1
        
        while !graph[s,default:""].isEmpty {

           let p = graph[s,default:""] // 부모
           let pIndex = mapped_dict[p,default:n] // 부모 인덱스
        
            if payment >= 1 {  // 1 이상이면 
               wallet[pIndex] += payment
               wallet[index] -= payment
               payment = Int(Double(payment) * 0.1) // 그 다음 부모들은 상납급의 0.1
               s = p // 다음 부모 
               index = pIndex 
           }  else { // 올라갈 상납급임이 없으면 그만
                break
            }
        
           
        } 
        
        
    }

    for (s,a) in zip(seller,amount) {
        
        let income = (100 * a)       
        wallet[mapped_dict[s]!] += income
        dfs(s,income)
    }
    

    
    
    return  Array(wallet[0..<n])
} 