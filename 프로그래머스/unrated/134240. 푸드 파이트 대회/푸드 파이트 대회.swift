import Foundation

func solution(_ food:[Int]) -> String {
    var r = ""

    for v in 1..<food.count where food[v] > 1 {
        for _ in 0..<food[v]/2 {
            r += String(v)
        }

    }
    r += "0" + r.reversed()
    return r
}