func solution(_ seoul:[String]) -> String {
    var result = ""
    for (x, i) in seoul.enumerated() where i == "Kim"{
        result = "김서방은 \(x)에 있다"
    }
    return result
}