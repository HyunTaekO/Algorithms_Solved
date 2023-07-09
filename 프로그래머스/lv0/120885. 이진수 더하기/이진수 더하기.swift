import Foundation

func solution(_ bin1:String, _ bin2:String) -> String {
    let one = Int(bin1, radix: 2)!
    let two = Int(bin2, radix: 2)!
    return String(one+two, radix: 2)
}