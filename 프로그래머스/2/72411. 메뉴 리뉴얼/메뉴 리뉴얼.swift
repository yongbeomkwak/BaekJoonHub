import Foundation

extension String {
    subscript(_ index: Int) -> String {
        String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

func combination(_ elements: String, _ k: Int) -> [String] {
    var result = [String]()
    
    func combi(_ index: Int, _ now: String) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in index..<elements.count {
            combi(i + 1, now + elements[i])
        }
    }
    combi(0, "")
    
    return result
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    var allCase: [String] = []
    
    for order in orders {
        for limit in course {
            let cases =  combination(order, limit)
            allCase.append(contentsOf:cases)
        }
    }

    // cource 개수에 맞게 모든 조합을 뽑아낸다. 
    
    var countDict: [String: Int] = [:] // 메뉴조합 : 주문한 수 
    
    allCase.forEach {
        let key = String($0.sorted()) // AB == BA 같아야하므로 키를 사용하기전에 정렬 후 사용
        countDict[key, default:0] += 1 // 메뉴 주문 횟수를 카운팅한다.
    }
    
   let sortedArray  = (countDict.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value })) // 메뉴 언급 횟수를 최우선으로 정렬하고 만약 같다면 메뉴이름을 오름차순으로 정렬 

    var maxLengthDict: [Int: Int] = [:] // 단품메뉴 개수 : 가장 높은 주문 횟수 

    var ans: [String] = []

    for info in sortedArray {
        let key = info.key
        let value = info.value
        
        if value < 2 { // 최소주문은 2번 이상이므로 
            continue
        }
        
        if let max =  maxLengthDict[key.count] { //단품메뉴 개수의 주문횟수가 이미 있다면
            if max == info.value { // 주문횟수가 같아야만 추가가능
                ans.append(key)
            }

        } else { // 해당 단품 메뉴 최대 주문횟수 초기화 
            maxLengthDict[key.count] = info.value
            ans.append(key)
        }
    }    
    
    return ans.sorted() // 문자열 오름차순
}