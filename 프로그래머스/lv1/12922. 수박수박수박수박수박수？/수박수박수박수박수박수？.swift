func solution(_ n:Int) -> String {
    
    var ans:String = ""
    
    for i in 0..<n{
        if(i%2 == 0)
        {
            ans += "수"
        }
        else
        {
            ans += "박"
        }
    }
    return ans
}