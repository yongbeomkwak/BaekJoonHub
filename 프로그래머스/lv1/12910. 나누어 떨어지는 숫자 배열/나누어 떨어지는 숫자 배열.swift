func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let ans = arr.filter({$0 % divisor == 0}).sorted()
    return  ans.count == 0 ? [-1] : ans
}