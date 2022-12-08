import Foundation

func solution(_ money:Int) -> [Int] {
    
    let ice = money/5500
    return [ice,money - ice * 5500]
}