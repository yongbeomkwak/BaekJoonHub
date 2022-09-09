import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).compactMap {zip($0, $1).compactMap { $0+$1
}}
}