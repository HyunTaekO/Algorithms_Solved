import Foundation

func solution(_ q:Int, _ r:Int, _ code:String) -> String {
    var result = ""
    let code = code.map{ String($0) }
    for i in 0..<code.count {
        if i % q == r {
            result += code[i]
        }
    }
    return result
}