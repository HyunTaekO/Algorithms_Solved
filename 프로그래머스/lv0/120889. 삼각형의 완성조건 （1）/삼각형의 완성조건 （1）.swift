import Foundation

func solution(_ sides:[Int]) -> Int {
    let m = sides.max()!
    var side = sides
    side.remove(at: side.firstIndex(of: m)!)
    let two = side.reduce(0, +)
    
    return m >= two ? 2 : 1
}