import Foundation




func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    //조합
    var visited = Array(repeating: false, count: 11) //조합을 위한 방문여부
    var temp = "" //문자열 조합에 사용할 프로퍼티
    var dict = [String:Int]() //문자열: 조합된 횟수
    
     //dfs를 활용한 조합
    func dfs(_ order: [String], _ depth: Int, _ start: Int){
        if depth >= 2{ //문자열이 2개이상 모이면
            let sorTemp = String(temp.sorted()) //문자열 정렬(문제의 메뉴구성이 순열이아닌 조합으로 판단해야됨)
            if dict[sorTemp] == nil{ //아직 dict의 Key가 아직없다면
                dict[sorTemp] = 1
            }else{
                dict[sorTemp]! += 1
            }
        }
        
        for i in start..<order.count{
            if !visited[i]{
                visited[i] = true
                temp += "\(order[i])"
                dfs(order, depth + 1, i)
                visited[i] = false
                temp.removeLast()
            }
        }
    }
    
    //주문목록에있는 모든경우를 dfs에서 조합해본다.
    for i in 0..<orders.count{
        let arr = orders[i].map{String($0)}
        dfs(arr, 0, 0)
    }
    var result = [String]() //결과값 저장할 프로퍼티
    var keycountValue = [Int:Int]() //키의개수 : 개수의 최대값
    
    //0으로 초기화
    for i in course{
        keycountValue[i] = 0
    }
    
      //course에서 원하는 갯수라면 키의개수당 최대값을 갱신
    for (key, value) in dict{
        if course.contains(key.count){
            
            keycountValue[key.count] = max(keycountValue[key.count]!, value) 
            // course 조합 갯수 마다 가장 많이 주문된 갯수 구하기 
        }
    }

    
    //동일한키의개수의 최대값을 가진 key이고, 문제에서 말한 최소2명이상이라면 result에추가
    for (key,value) in dict{
        if value == keycountValue[key.count] && value >= 2{  // 2이상 최대로 주문된 메뉴면
            result.append(key)
        }
    }
    
    result.sort()
    return result
}