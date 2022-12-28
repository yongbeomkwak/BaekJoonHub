import Foundation

func solution(_ numbers:String) -> Int64 {
    var ans = ""
    var now:String = ""
    
    var dict = ["zero":"0","one":"1","two":"2","three":"3","four":"4",
                "five":"5","six":"6","seven":"7","eight":"8","nine":"9"
               ]
    
    
    for s in numbers{
      now += String(s)
        if (dict.contains { $0.key == now })
        {
            ans += dict[now]!
            now = ""
        }
    
    }
    
    
    return Int64(ans)!
}