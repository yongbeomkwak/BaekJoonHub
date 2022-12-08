import Foundation

func solution(_ array:[Int], _ height:Int) -> Int {
    return array.filter{ $0 > height}.count
}