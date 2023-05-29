func solution(_ a:Int, _ b:Int) -> Int64 {
    var result = 0
    for i in (a < b ? a...b : b...a) {
        result += i
    }
   
    return Int64(result)
}