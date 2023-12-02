import Foundation
// 20:54
// f(x) == x < result && x와 비트가 1~2개 다른 수들중에서 제일 작은 수 
// 비트마스킹 사용
// 오른쪽에서부터 처음 0이 나오는 시점 찾기
// 찾은 0과 그 오른쪽 1 즉, 01 을 10으로 시프팅하면된닷
func solution(_ numbers:[Int64]) -> [Int64] {
    var result: [Int64] = []
    for num in numbers {
        result.append(Int64(num + ((num ^ (num+1)) >> 2) + 1))
    }
    return result
}