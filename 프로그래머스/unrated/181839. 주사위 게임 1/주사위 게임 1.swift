import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    let isA = a % 2 == 0 ? false : true
    let isB = b % 2 == 0 ? false : true
    
    return isA && isB ? (a*a)+(b*b) : isA || isB ? 2 * (a + b) : abs(a - b)
}