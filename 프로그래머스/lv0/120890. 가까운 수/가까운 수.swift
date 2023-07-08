import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    let arr = array.sorted(by: { (f, s) in
                                if abs(f - n) == abs(s - n) {
                                    return f < s ? true : false
                                }else {
                                    return abs(f - n) < abs(s - n) ? true : false
                                } })
    return arr[0]
}