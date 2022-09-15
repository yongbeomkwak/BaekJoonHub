import Foundation

func solution(_ new_id:String) -> String {
    let id = new_id.lowercased() // Step 1

    var new:String = id.filter({ //Step 2
        if($0 == "_" || $0 == "-" || $0 == "." || $0.isNumber || $0.isLowercase)
        {
            return true
        }
        return false
    })


    var next = new.replacingOccurrences(of: "..", with: ".")

    while(new != next )
    {
        new = next
        next = new.replacingOccurrences(of: "..", with: ".")
    }
    // Step3


    while(new.first == ".")
    {
        new.removeFirst()
    }


    while(new.last == ".")
    {
        new.removeLast()
    }

    //Step 4

    if(new.isEmpty)
    {
        new = "a"
    }

    while(new.count>15)
    {
        new.removeLast()
    }

    while(new.last == ".")
    {
        new.removeLast()
    }

    while(new.count<3)
    {
        new += String(new.last!)
    }
        return new
    /*
        var myID: String = new_id

    //1차
    myID = myID.lowercased()

    //2차
    var newID: String = ""
    for i in myID {
        if i.isLetter || i.isNumber || i == "-" || i == "_" || i == "." {
            newID.append(i)
        }
    }

    //3차
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }

    //4차
    while newID.hasPrefix(".") {
        newID.removeFirst()
    }

    while newID.hasSuffix(".") {
        newID.removeLast()
    }

    //5차
    if newID == "" {
        newID = "a"
    }

    //6차
    if newID.count >= 16 {
        let index = newID.index(newID.startIndex, offsetBy: 15)
        newID = String(newID[newID.startIndex..<index])
        if newID.hasSuffix(".") {
            newID.removeLast()
        }
    }

    //7차
    if newID.count <= 2 {
        while newID.count != 3 {
            newID = newID + String(newID.last!)
        }
    }

    return newID
    
    */
}
