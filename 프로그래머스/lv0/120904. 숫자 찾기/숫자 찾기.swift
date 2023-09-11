import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    if let result = String(num).map{ Int(String($0))! }.firstIndex(of: k) { return result + 1 }
    return -1
}