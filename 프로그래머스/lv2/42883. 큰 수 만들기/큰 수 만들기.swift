import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    
    var st:[Int] = .init()
    var k:Int = k
    
    
    for n in number {
        let intN = Int(String(n))!
        
        while !st.isEmpty && st.last! < intN && k > 0 {
            st.popLast()!
            k -= 1
        }
        st.append(intN)
        
    }
    
    while k > 0 {
        st.popLast()!
        k -= 1
    }
    
 
    
    
    return st.map{String($0)}.joined(separator:"")
}