import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    var arr = Array(l...r).filter{ String($0).filter{$0 == "0" || $0 == "5"}.count == String($0).count}.sorted()
    
    return arr.isEmpty ? [-1] : arr
}