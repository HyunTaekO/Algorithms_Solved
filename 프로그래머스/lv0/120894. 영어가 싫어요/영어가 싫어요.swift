import Foundation

func solution(_ numbers:String) -> Int64 {
    let numberString = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var number = ""
    var result = ""
    for i in numbers {
        number += String(i)
        if numberString.contains(number) {
            result += String(numberString.lastIndex(of: number)!)
            number = ""
        }
     }
    return Int64(result)!
}