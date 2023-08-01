import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    let cnt = numbers.count
    var result = [Int](repeating: -1, count: cnt)
    var stack = [Int]()
    
    for i in 0..<cnt{
        while !stack.isEmpty && numbers[stack.last!] < numbers[i]{
            result[stack.popLast()!] = numbers[i]
        }
        stack.append(i)
    }

    return result
}