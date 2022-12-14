import Foundation

func solution(_ my_string:String) -> String {
   
    return (my_string.compactMap{ $0.isLowercase ? $0.uppercased() : $0.lowercased() }).joined()
}