import Foundation

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    var width = 3
    var height = 3
    var result = [Int]()

    let total = brown + yellow

    for height in 1...total {
        width = total / height
        if (width-2) * (height-2) == yellow {
            result = [width, height]
            break
        }
    }

    return result
}