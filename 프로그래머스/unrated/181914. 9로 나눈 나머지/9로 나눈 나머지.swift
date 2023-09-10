import Foundation

func solution(_ number:String) -> Int {
    let sum = number.map{ Int(String($0))! }.reduce(0, +)
    return sum % 9
}