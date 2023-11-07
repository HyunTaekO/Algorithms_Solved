import Foundation

func solution(_ my_string:String, _ alp:String) -> String {
    return my_string.map{ alp == String($0) ? String($0).uppercased() : String($0) }.joined()
}