let nmlk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (N,M,L,K) = (nmlk[0],nmlk[1],nmlk[2],nmlk[3])

var meteo : [(Int,Int)] = []


for _ in 0..<K {
    
    let xy = readLine()!.split{$0 == " "}.map{Int($0)!}
    
    meteo.append((xy[0],xy[1]))
}

var result : Int = 0


for i in 0..<K {
    for j in 0..<K{
        var cnt : Int = 0
        
        for k in 0..<K {
            
            if (meteo[i].0 <= meteo[k].0 && meteo[k].0 <= meteo[i].0+L) &&
                ( meteo[j].1 <= meteo[k].1 && meteo[k].1 <= meteo[j].1+L) {
                
                // x1 <= x3 <= x1+l , y2 <= y3 <= y2+L
                
                cnt += 1
            }
 
        }
        
        result = max(result,cnt)
    }
}

print(K-result)
