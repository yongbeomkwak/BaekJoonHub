import Foundation 

func readInput() -> [String] {
	return readLine()!.split{$0 == " "}.map{String($0)}
} 

var tc = Int(readLine()!)!

var total: Int = 0

enum Oper: String {
	case plus = "+"
	case minus = "-"
	case mul = "*"
	case div = "/"
}

repeat {
	
	let input = readInput()
	
	let oper: Oper = Oper(rawValue:input[1])!
	
	let (a,b) = (Int(input[0])!, Int(input[2])!)
	
	switch oper {
		
		case .plus:
			total += (a+b)
		
		case .minus:
		
			total += (a-b)
		
		case .mul:
		
			total += (a*b)
		
		case .div:
		
			total += (a/b)
		
	}
	tc -= 1
} while tc > 0


print(total)