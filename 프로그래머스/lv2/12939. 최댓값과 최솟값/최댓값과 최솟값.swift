func solution(_ s:String) -> String {
    let splitStr = s.split(separator: " ")
    var numArray:[Int] = []
    
    for i in splitStr {
        guard let splitStr = Int(i) else {return " "}
        numArray.append(splitStr)
    }
    return "\(numArray.min()!) \(numArray.max()!)"
}