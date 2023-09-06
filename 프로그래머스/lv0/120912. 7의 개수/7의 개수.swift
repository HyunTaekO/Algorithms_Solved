import Foundation

func solution(_ array:[Int]) -> Int {
    var result = 0
    array.forEach{ num in 
                    result += String(num).filter{ $0 == "7" }.count
                 }
    return result
}