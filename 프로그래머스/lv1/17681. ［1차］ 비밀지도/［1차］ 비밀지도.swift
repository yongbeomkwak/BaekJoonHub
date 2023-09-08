func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
        var arr1 = arr1.map{  i -> String in
        let encode = String(Int(i),radix: 2)
        let extrea = String(repeating: "0", count: n-encode.count)


        return extrea + encode
    }
    
    var arr2 = arr2.map{  i -> String in
        let encode = String(Int(i),radix: 2)
        let extrea = String(repeating: "0", count: n-encode.count)


        return extrea + encode
    }

    let result = zip(arr1,arr2).map { zip($0,$1).compactMap { s1,s2 -> String in
        if(s1 == "1" || s2 == "1")
        {
            return "#"
        }
        else{
            return " "
        }
    }}.map{$0.joined()}


        return result
    
}