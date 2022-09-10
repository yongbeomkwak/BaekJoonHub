import Foundation
func solution(_ s:String) -> String {
    
    let arr =  s.components(separatedBy: " ").map {$0.enumerated().map {$0.offset%2 == 0 ? $0.element.uppercased() : $0.element.lowercased()}}
    
    return  arr.map{$0.map{$0}.joined()}.joined(separator:" ")
}