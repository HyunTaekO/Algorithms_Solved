func solution(_ s:String) -> String {
    var arr = s.map { String($0) }
    let index = s.count / 2
    var result = ""
    if s.count % 2 == 0 {
        result += arr[index - 1] + arr[index] 
        return result
    }else {
        result += arr[index]
    }
    return result
}