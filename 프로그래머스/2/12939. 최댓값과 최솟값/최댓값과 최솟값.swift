func solution(_ s:String) -> String {
    
    var numbers = s.split{$0 == " "}.map{Int($0)!}
    
    return "\(numbers.min()!) \(numbers.max()!)"
}