let nk = readLine()!.split{$0 == " "}.map{Int($0)!}

var (n,k) = (nk[0],nk[1])

var arr =  readLine()!.split{$0 == " "}.map{Int($0)!}

var isRobotExisted = [Bool](repeating:false,count:arr.count)


let dropRobotLoaction : Int = 0
let pickUpRobotLoaction : Int = n-1

var round : Int = 0



while arr.filter{$0 == 0}.count < k  {
    
    // 벨트 회전 및 로봇유무도 같이 회전
    arr.insert(arr.removeLast(),at: 0)
    isRobotExisted.insert(isRobotExisted.popLast()!, at: 0)
    
    if isRobotExisted[pickUpRobotLoaction]  { // 도착한 로봇 픽업
        isRobotExisted[pickUpRobotLoaction] = false
    }
    
    for i in stride(from: n-2, through: 0 , by: -1) { // 로봇 진행
        
        if isRobotExisted[i] && !isRobotExisted[i+1] && arr[i+1] >= 1 { // 현재 i에 로봇있고 , 다음꺼에 없고, 다음꺼의 내구도가 1이상이면 이동 가능
            isRobotExisted[i] = false
            arr[i+1] -= 1
            isRobotExisted[i+1] = true
        }
    }
     
    isRobotExisted[pickUpRobotLoaction] = false // 회전이후에도 내림
    
    
    if arr[dropRobotLoaction] > 0 {
        isRobotExisted[dropRobotLoaction] = true
        arr[dropRobotLoaction] -= 1
    }
    

    round += 1
}

print(round)
