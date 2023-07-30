import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var result = 0
    let queue = queue1 + queue2
    var sumQ1 = queue1.reduce(0, +)
    let sumQ2 = queue2.reduce(0, +)
    if (sumQ1 + sumQ2) % 2 != 0 { return -1 } // 목표값이 정수가 아닐 때
    
    let goal = (sumQ1 + sumQ2) / 2
    
    if sumQ1 == sumQ2 { return 0 } //두 큐 합 같을 때
    if goal < queue1.max()! || goal < queue2.max()! { return -1 } // 큐의 가장 큰 원소가 목표값보다 클 때
    
    //투포인터
    var left = 0
    var right = queue1.count
    
    while right < queue.count && left <= right {
        if sumQ1 < goal {
            sumQ1 += queue[right]
            right += 1
        }else if sumQ1 > goal {
            sumQ1 -= queue[left]
            left += 1
        }else {
            break
        }
        result += 1
    }
    if sumQ1 != goal { return -1 }
    return result
}