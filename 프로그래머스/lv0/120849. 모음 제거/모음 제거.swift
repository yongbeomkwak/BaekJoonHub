import Foundation

func solution(_ my_string:String) -> String {
    let a = "aeiou"
    

    
    return my_string.filter{ !a.contains($0) }
}