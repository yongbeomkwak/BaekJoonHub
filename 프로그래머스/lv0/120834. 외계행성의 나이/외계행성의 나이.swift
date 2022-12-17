import Foundation

func solution(_ age:Int) -> String {
   return String(age).reduce("") { 
       $0 + String(UnicodeScalar(97 + Int(String($1))!)!)
    }
}