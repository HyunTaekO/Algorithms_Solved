import Foundation

func solution(_ price:Int) -> Int {
    var pr = Double(price)
    var pay = 0.0
    if price >= 500000 {
        pay = pr - (pr/100 * 20)
    }else if price >= 300000 {
        pay = pr - (pr/100 * 10)
    }else if price >= 100000 {
        pay = pr - (pr/100 * 5)
    }else {
        pay = pr
    }
    return Int(pay)
}