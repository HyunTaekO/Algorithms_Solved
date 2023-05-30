import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var one: [Int] = [1,2,3,4,5]
    var two: [Int] = [2,1,2,3,2,4,2,5]
    var three: [Int] = [3,3,1,1,2,2,4,4,5,5]
    var check: [Int] = [0, 0, 0]
    for (i, v) in answers.enumerated() {
        if v == one[i % 5] {
            check[0] += 1
        }
        if v == two[i % 8] {
            check[1] += 1
        }
        if v == three[i % 10]{
            check[2] += 1
        }
    }
    let max = check.max()!

    return check.enumerated().map{ index, v in
        if v == max {
            return index + 1
        }else {
            return 0
        }
    }.filter { $0 != 0 }
    
}