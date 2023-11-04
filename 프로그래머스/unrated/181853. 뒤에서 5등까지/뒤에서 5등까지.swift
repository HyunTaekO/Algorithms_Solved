import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var result = num_list.sorted(by: <)
    return Array(result[0..<5])
}