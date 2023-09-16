import Foundation


let n = Int(readLine()!)!
let line = readLine()!
var stack = [Double]()
var numArray = [Double]()


for _ in 0..<n {
    let num = Double(readLine()!)!
    numArray.append(num)
}

for char in line {
    
    if char == "+" {
        stack.append(stack.removeLast()+stack.removeLast())
    } else if char == "-" {
        let f = stack.removeLast()
        let s = stack.removeLast()
        stack.append(s - f)
    } else if char == "/" {
        let first = stack.removeLast()
        let second = stack.removeLast()
        stack.append(second/first)
    } else if char == "*" {
        stack.append(stack.removeLast()*stack.removeLast())
    } else {
        let a = char.asciiValue! - 65
        stack.append(numArray[Int(a)])
    }
}

let ans = String(format: "%.2f", stack[0])
print(ans)