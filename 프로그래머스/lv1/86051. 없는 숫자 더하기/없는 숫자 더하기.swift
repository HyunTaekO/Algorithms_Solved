import Foundation

func solution(_ numbers:[Int]) -> Int {
    var result = 0
    for i in 0...9 {
        if numbers.contains(i){
            continue
        }else {
            result += i
        }
    }
    return result
}