import Foundation

func solution(_ babbling:[String]) -> Int {
    var result = 0
    for bab in babbling {
        var str = bab
        str = str.replacingOccurrences(of: "aya", with: "1")
        str = str.replacingOccurrences(of: "ye", with: "1")
        str = str.replacingOccurrences(of: "woo", with: "1")
        str = str.replacingOccurrences(of: "ma", with: "1")
        str = str.replacingOccurrences(of: "1", with: "")
        if str.isEmpty { result += 1 }
    }
    return result
}