import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    let arr = Array(i...j).map{ String($0) }.filter{ $0.contains(String(k)) }
    var result = 0
    for n in arr {
        for i in n {
            if String(i) == "\(k)" {
                result += 1
            }
        }
    }
    return result
}