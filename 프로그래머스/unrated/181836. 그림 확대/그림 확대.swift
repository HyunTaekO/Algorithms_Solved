import Foundation

func solution(_ picture:[String], _ k:Int) -> [String] {
    var result: [String] = []
    var temp = ""
    for p in picture {
        for s in p {
            for i in 1...k {
                temp += String(s)
            }
        }
        for i in 1...k {
            result.append(temp)
        }
        temp = ""
    }
    return result
}