import Foundation


func solution(_ s:String) -> String {
    if(s.count == 1 )
    {
        return s
    }
    return String(s.sorted(by: {  $0.asciiValue ?? 0 > $1.asciiValue ?? 0}))
}