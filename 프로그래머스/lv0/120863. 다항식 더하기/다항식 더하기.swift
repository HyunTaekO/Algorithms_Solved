import Foundation

func solution(_ polynomial:String) -> String {
    let nom = polynomial.components(separatedBy: " ")
    var x = 0
    var n = 0
    for i in nom.filter({ $0 != "+"}) {
        if i.contains("x") {
            x += i.count == 1 ? 1 : Int(i.filter{$0.isNumber})!
        }else {
            n += Int(i)!
        }
    }
    if x <= 1 {
        if n == 0 {
            return x == 1 ? "x" : "0"
        }else {
            return x == 1 ? "x + \(n)" : "\(n)"
        }
    }
    if x > 1 {
        return n == 0 ? "\(x)x" : "\(x)x + \(n)"
    }
    return "\(x)x + \(n)"
}