import Foundation

let inputNRC = readLine()!.split(separator: " ")

let N = Int(inputNRC[0])!
let row = Int(inputNRC[1])!
let column = Int(inputNRC[2])!

var count = 0

func solve(_ n: Int, _ x: Int, _ y: Int) -> Void {
    
    if n == 2 {
        if x == row, y == column {
            print(count)
            return
        }
        count += 1
        if x == row, y+1 == column {
            print(count)
            return
        }
        count += 1
        if x+1 == row, y == column {
            print(count)
            return
        }
        count += 1
        if x+1 == row, y+1 == column {
            print(count)
            return
        }
        count += 1
        return
    } else {
        if row < x + n / 2, column < y + n / 2 {
            solve(n / 2, x, y)
        } else if row < x + n / 2, column < (y + n / 2) + n / 2 {
            count += (n / 2) * (n / 2)
            solve(n / 2, x, y + n / 2)
        } else if row < (x + n / 2) + n / 2, column < y + n / 2 {
            count += (n / 2) * (n / 2) * 2
            solve(n / 2, x + n / 2, y)
        } else {
            count += (n / 2) * (n / 2) * 3
            solve(n / 2, x + n / 2, y + n / 2)
        }
    }
}

solve(Int(pow(2, Double(N))), 0, 0)
