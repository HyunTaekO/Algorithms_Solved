import Foundation

func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    var first : Int = 0
    var last : Int = arr.count
    
    for index in 0..<query.count {
        if index % 2 == 0 {
            last = first + query[index]
            // 짝수일 때 마지막 인덱스 저장
        } else {
            first += query[index]
            // 홀수일 때 마지막 인덱스 저장
        }   
    }

    return Array(arr[first...last])
}