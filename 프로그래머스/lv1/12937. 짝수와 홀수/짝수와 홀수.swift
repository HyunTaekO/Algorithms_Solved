func solution(_ num:Int) -> String {
    var str : String = "";
    if num%2 == 0{
        str = "Even"
    }else{
        str = "Odd"
    }
    return str
}