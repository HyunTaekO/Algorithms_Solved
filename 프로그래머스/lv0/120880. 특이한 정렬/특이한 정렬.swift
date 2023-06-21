import Foundation

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    let arr = numlist.sorted(by: { (one, two) -> Bool in
        if abs(one - n) < abs(two - n) {
            return true
        }else if abs(one - n) == abs(two - n) {
            return one > two ? true : false
        }else {
            return false
        }
    })
    return arr
}