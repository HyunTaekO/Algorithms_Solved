import Foundation

let T = Int(readLine()!)!

for i in 0..<T {
    let c = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x = c[0]
    let y = c[1]
    var n = Int(Double(y - x).squareRoot()) * 2 - 1

    if (y - x) == 1 {
        print(1)
    } else if (y - x) == (n + 1) / 2 * (n + 1) / 2 {
        print(n)
    } else if (y - x) > (n + 1) / 2 * (n + 1) / 2 , (y - x) <= ((n + 1) / 2 + 1) * (n + 1) / 2 {
        n += 1
        print(n)
    } else if (y - x) > ((n + 1) / 2 + 1) * (n + 1) / 2 {
        n += 2
        print(n)
    }
}