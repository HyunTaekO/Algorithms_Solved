func solution(_ s:String) -> Int {
    var result = s
    if result.first == "-" {
        result.removeFirst()
        return -Int(result)!
    }else if result.first == "+" {
        return Int(result)!
    }
    
    return Int(result)!
}