import Foundation

func solution(_ topping:[Int]) -> Int {
    
    var dict1 = topping.reduce(into:[Int:Int]()){
        $0[$1,default:0] += 1
    }
    
    var dict2:[Int:Int] = .init()
    
    return topping.reduce(into:0){
        
        dict2[$1,default:0] += 1
        dict1[$1,default:0] -= 1
        dict1[$1] = dict1[$1] == 0 ? nil : dict1[$1] // value가 0은 nil로 바꿔 할당해제 
        
        $0 += dict1.count == dict2.count ? 1 : 0
    }
    
}