import Foundation

func solution(_ my_string:String, _ k:Int) -> String {
    var str = ""
    for _ in 0..<k {
        str += my_string
    }
    return str
}