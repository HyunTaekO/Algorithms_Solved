import Foundation

func solution(_ str_list:[String]) -> [String] {
    var left = Int.max
    var right = Int.max
    if let l = str_list.firstIndex(of: "l") {
        left = l
    }
    if let r = str_list.firstIndex(of: "r") {
        right = r
    }
    if left == -1 && right == -1 { return [] }
    if left < right {
        return left > 0 ? Array(str_list[0..<left]) : []
    }
    return right < str_list.count-1 ? Array(str_list[right+1..<str_list.count]) : []
}