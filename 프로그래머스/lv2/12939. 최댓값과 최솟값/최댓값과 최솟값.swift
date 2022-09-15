func solution(_ s:String) -> String {
    let arr:[Int] = s.components(separatedBy: " ").map({Int($0) ?? 0})



 return "\(arr.min()!) \(arr.max()!)"
}