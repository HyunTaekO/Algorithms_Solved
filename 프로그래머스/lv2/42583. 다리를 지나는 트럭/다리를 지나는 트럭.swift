import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var ing = Array(repeating: 0, count: bridge_length)
    var w = 0
    var truck = truck_weights
    var sec = 0
    while !ing.isEmpty {
        sec += 1
        w -= ing.removeFirst()
        
        if let t = truck.first {
            if t + w <= weight {
                ing.append(t)
                w += truck.removeFirst()
            }else {
                ing.append(0)
            }
        }
    }
    return sec
}