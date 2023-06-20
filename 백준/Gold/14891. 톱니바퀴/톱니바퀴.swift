import Foundation

var arr: [[Int]] = []
for _ in 1...4 {
    let a = readLine()!.map{ Int(String($0))! }
    arr.append(a)
}
let K = Int(readLine()!)!
var numArr: [Int] = []
var dArr: [Int] = []
for _ in 1...K {
    let state = readLine()!.split(separator: " ").map{ Int(String($0))!}
    numArr.append(state[0])
    dArr.append(state[1])
}
func antiClock(_ arr: [Int]) -> [Int] {
    var result = arr
    let first = arr[0]
    for i in 0..<arr.count-1 {
        result[i] = result[i+1]
    }
    result[arr.count-1] = first
    return result
}
func clock(_ arr: [Int]) -> [Int] {
    var result = arr
    let last = arr[arr.count-1]
    for i in stride(from: arr.count-1, to: 0, by: -1) {
        result[i] = result[i-1]
    }
    result[0] = last
    return result
}
func checkR(_ mainArr: Int,_ d: Int) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: 4)
    if mainArr == 1 {
        if arr[0][2] != arr[1][6] {
            result[1] = d == -1 ? 1 : -1
            if arr[1][2] != arr[2][6] {
                result[2] = result[1] == -1 ? 1 : -1
                if arr[2][2] != arr[3][6] {
                    result[3] = result[2] == -1 ? 1 : -1
                }
            }
        }
        return result
    }else if mainArr == 2 {
        if arr[1][6] != arr[0][2] {
            result[0] = d == -1 ? 1 : -1
        }
        if arr[1][2] != arr[2][6] {
            result[2] = d == -1 ? 1 : -1
            if arr[2][2] != arr[3][6] {
                result[3] = result[2] == -1 ? 1 : -1
            }
        }
        return result
    }else if mainArr == 3 {
        if arr[2][2] != arr[3][6] {
            result[3] = d == -1 ? 1 : -1
        }
        if arr[2][6] != arr[1][2] {
            result[1] = d == -1 ? 1 : -1
            if arr[1][6] != arr[0][2] {
                result[0] = result[1] == -1 ? 1 : -1
            }
        }
        return result
    }else {
        if arr[3][6] != arr[2][2] {
            result[2] = d == -1 ? 1 : -1
            if arr[2][6] != arr[1][2] {
                result[1] = result[2] == -1 ? 1 : -1
                if arr[1][6] != arr[0][2] {
                    result[0] = result[1] == -1 ? 1 : -1
                }
            }
        }
        return result
    }
}
for k in 0..<numArr.count {
    let check = checkR(numArr[k], dArr[k])
    
    for i in 0..<4 {
        if check[i] == 0 {
            continue
        }else {
            if check[i] == 1 {
                arr[i] = clock(arr[i])
            }else {
                arr[i] = antiClock(arr[i])
            }
        }
    }
    if dArr[k] == 1 {
        arr[numArr[k]-1] = clock(arr[numArr[k]-1])
    }else {
        arr[numArr[k]-1] = antiClock(arr[numArr[k]-1])
    }
   
}

var ans = 0

for i in 1...4 {
    if arr[i-1][0] == 1 {
        if i == 1 || i == 2 {
            ans += i
        }else if i == 3 {
            ans += 4
        }else {
            ans += 8
        }
    }
    
}
print(ans)