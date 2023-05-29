import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0

    var str = "\(n)"
    answer = str.map { Int(String($0))! }.reduce(0, +)
    
    return answer
}