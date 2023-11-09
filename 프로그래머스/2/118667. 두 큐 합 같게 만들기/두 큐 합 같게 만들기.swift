import Foundation
// 1. 큐 두개를 합쳐 하나의 배열로 만든다. => 원소의 합이 더 큰 큐를 뒤로 보낸다.
// 2. 초기 큐의 시작점과 끝점을 지정해 투포인터를 사용한다.
// 3. 두 포인터 내 원소 합이 전체 합 / 2 보다 크면 시작점을 이동, 작으면 끝점을 이동시킨다.
// 4. 두 포인터 내 원소 합 == 전체 합 / 2 될 때까지 찾는다.
// 5. 4n 이상 수행했음에도 같아지지 않는다면 -1 리턴한다.
// [1, 1, 1, 5]
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let sumQ = queue1 + queue2
    let half = sumQ.reduce(0, +) / 2
    var pointer = (0, queue1.count-1)
    var current = sumQ[pointer.0...pointer.1].reduce(0, +)
    var result = 0
    while true {
        
        if current == half { return result }
        
        if current > half && pointer.0 + 1 <= pointer.1 {
            current -= sumQ[pointer.0]
            pointer.0 += 1
        }else if pointer.1 + 1 < sumQ.count{
            pointer.1 += 1
            current += sumQ[pointer.1]
        }else {
            return -1
        }
        
        result += 1
    }
    return result
}