import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = n
    let c = String(n, radix: 2).filter{$0 == "1"}.count
    
    while true {
        answer += 1
        let cnt = String(answer, radix: 2).filter{$0 == "1"}.count
        if cnt == c { break }
    }
    return answer
}