import Foundation

func solution(_ array:[Int]) -> Int {
  //  print(Dictionary(grouping: array))
    let sorted = Dictionary(grouping: array) { $0 }.sorted { $0.value.count > $1.value.count }
    return sorted.count > 1 && sorted[0].value.count == sorted[1].value.count ? -1 : sorted[0].key
}