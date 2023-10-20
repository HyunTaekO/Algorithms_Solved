import Foundation

func solution(_ order:[String]) -> Int {
    var latte = order.filter{ $0.contains("latte") }.count
    var ame = order.count - latte
 
    return (ame * 4500) + (latte * 5000)
}