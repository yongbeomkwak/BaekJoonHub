import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    let s = String(num).map{ Int(String($0))! }
    return (s.firstIndex(of: k) ?? -2) + 1
}