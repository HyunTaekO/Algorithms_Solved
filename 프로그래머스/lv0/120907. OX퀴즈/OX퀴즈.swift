import Foundation

func solution(_ quiz:[String]) -> [String] {
    var result: [String] = []
    let qArr = quiz.map{ $0.components(separatedBy: " ")}
    for q in qArr {
        let r = Int(q.last!)!
        if q[1] == "-" {
            if Int(q[0])! - Int(q[2])! == r {
                result.append("O")
            }else {
                result.append("X")
            }
        }else if q[1] == "+" {
            if Int(q[0])! + Int(q[2])! == r {
                result.append("O")
            }else {
                result.append("X")
            }
        }
    }
    return result
}