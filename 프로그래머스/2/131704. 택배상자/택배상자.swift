import Foundation
// 주 컨테이너 벨트: 배열 / 보조: 스택
// 순서대로 못실으면 현재 실은 상자만큼 리턴
// 
func solution(_ order:[Int]) -> Int {
    var result = 0
    var main: [Int] = Array(1...order.count)
    var sub: [Int] = []
    var idx = 0
    for n in order {
        if sub.isEmpty {
            idx = n
            sub.append(contentsOf: main[0..<n-1])
            result += 1
        }else {
            let lastSub = sub.last!
            if lastSub == n {
                sub.removeLast()
                result += 1
            }else {
               if n < lastSub { break }
                sub.append(contentsOf: main[idx..<n-1])
                idx = n
                result += 1
            }
        }
         // print(main)
         // print(sub)
    }
    return result
}