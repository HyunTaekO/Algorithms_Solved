import Foundation
func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = [Int]()
    var temp: [Int] = [Int]()
    var result: Int = 0
    let list: [Int] = [1,2,3,1]
    var index: Int = 0
    
    while index != ingredient.count {
        stack.append(ingredient[index])
        index += 1
        if stack.count < 4 { continue }
        if Array(stack[stack.count-4..<stack.count]) == list {
            stack.removeLast(4)
            if stack.count < 3 {
                temp = Array(stack[0..<stack.count])
                stack.removeAll()
            } else {
                temp = Array(stack[stack.count-2..<stack.count])
                stack.removeLast(2)
            }
            result += 1
            while !temp.isEmpty {
                if index == ingredient.count {
                    break
                }
                temp.append(ingredient[index])
                if temp.count > 3 {
                    if Array(temp[temp.count-4..<temp.count]) == list {
                        result += 1
                        index += 1
                        temp.removeLast(4) //햄버거 된 부분만 없애주고
                        stack += temp //그동안 temp에 축적된 부분을 stack에 더하기
                        break
                    }
                }
                index += 1 //여기서 temp에 축적됨
            }
        }
    }
    return result
}