import Foundation

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    var result = my_string.prefix(s) + overwrite_string
    result += my_string.suffix(my_string.count - result.count)
    return String(result)
}