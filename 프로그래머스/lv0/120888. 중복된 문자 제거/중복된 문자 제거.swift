import Foundation

func solution(_ my_string:String) -> String {
    var dic = [Character: Bool]()
    var result = ""
    for str in my_string {
        if let isStr = dic[str] {
            continue
        }else {
            result += String(str)
            dic[str] = true
        }
    }
    return result
}