func solution(_ s:String) -> String {
    guard 1 <= s.count && s.count <= 200 else {return ""}
    var firstStr = true
    var result = ""
    
    for str in s {
        if str == " "{
            result += " "
            firstStr = true
            continue
        }
        
        if firstStr{
            if let firstStr = Int(String(str)) {
                result += String(firstStr)
            }else {
                result += String(str).uppercased()
            }
             firstStr = false
        }else{
            result += String(str).lowercased()
        }
    }
    return result
}