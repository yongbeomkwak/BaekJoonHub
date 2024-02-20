let input = readLine()!.split{$0 == " "}.map{Int($0)!}

let (a,b,c,d,e,f) = (input[0],input[1],input[2],input[3],input[4],input[5])


var result : (x:Int ,y:Int) = (x:0,y:0)


    
outer: for x in -999...999 {
    for y in -999...999 {
        if a*x + b*y == c && d*x + e*y == f {
            result = (x:x,y:y)
            break outer
        }
    }
}


print("\(result.x) \(result.y)")
