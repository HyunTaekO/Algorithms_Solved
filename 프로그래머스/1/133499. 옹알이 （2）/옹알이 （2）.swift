import Foundation

func solution(_ babbling:[String]) -> Int {
    var result = 0
    for bab in babbling {
        var str = bab
        str = str.replacingOccurrences(of: "aya", with: "1")
        str = str.replacingOccurrences(of: "ye", with: "2")
        str = str.replacingOccurrences(of: "woo", with: "3")
        str = str.replacingOccurrences(of: "ma", with: "4")
        var temp: Character = "0"
        var flag = true
        for s in str {
            if temp == s {
                flag = false
                break
            }else {
                temp = s
            }
        }
        if !flag { continue }
        str = str.replacingOccurrences(of: "1", with: "")
        str = str.replacingOccurrences(of: "2", with: "")
        str = str.replacingOccurrences(of: "3", with: "")
        str = str.replacingOccurrences(of: "4", with: "")
        if str.isEmpty { result += 1 }
    }
    return result
}