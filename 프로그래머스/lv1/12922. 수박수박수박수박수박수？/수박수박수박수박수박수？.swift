func solution(_ n:Int) -> String {
    var str: String = ""
    for i in 0..<n {
       if i % 2 == 0 {
            str += "수" 
       }else {
            str += "박"
       }
    }
    return str
}