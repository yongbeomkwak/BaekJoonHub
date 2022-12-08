import Foundation

func solution(_ strlist:[String]) -> [Int] {
    return strlist.map{String($0).count}
}