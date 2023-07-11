import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    
    var st:[Int] = .init()
    var k:Int = k
    
    
    for n in number {
        let intN = Int(String(n))!
        
        while !st.isEmpty && st.last! < intN && k > 0 { 
            //스택이 비어있지 않고, 제거할 수가 남아있으면(k>0) 마지막 값이 현재 값보다 작으면
            st.popLast()! // 스택에서 제거
            k -= 1 // 제거 했으므로 하나 감소
        }
        st.append(intN)
        
    }
    
    while k > 0 { // 여전히 제거할 수가 남아 있으면 제거
        st.popLast()!
        k -= 1
    }
    
 
    
    
    return st.map{String($0)}.joined(separator:"")
}