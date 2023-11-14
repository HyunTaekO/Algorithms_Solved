import Foundation

let n = Int(readLine()!)!

var paper = Array(repeating: Array<Int>(), count: n)
var count = (0, 0) // 화이트, 블루

for i in 0..<n {
    paper[i] = readLine()!.split{$0 == " "}.map{ Int(String($0))! }
}

func check(_ paper: [[Int]]) -> Bool {
    let flat = paper.flatMap({$0})
    let cnt = flat.filter{ $0 == 1 }.count
    return (cnt == 0 || cnt == flat.count) ? true : false
}

func devide(_ arr: [[Int]],_ size: Int) {
    let checked = check(arr)
    if checked {
        if arr[0][0] == 0 { count.0 += 1 }
        else{ count.1 += 1 }
        return
    }
    
    var one: [[Int]] = Array(repeating: Array<Int>(), count: size/2)
    var two: [[Int]] = Array(repeating: Array<Int>(), count: size/2)
    var three: [[Int]] = Array(repeating: Array<Int>(), count: size/2)
    var four: [[Int]] = Array(repeating: Array<Int>(), count: size/2)

    for x in 0..<size {
        for y in 0..<size {
            if 0..<size/2 ~= x {
                if 0..<size/2 ~= y {
                    one[x].append(arr[x][y])
                }else {
                    two[x].append(arr[x][y])
                }
            }else {
                if 0..<size/2 ~= y {
                    three[x-(size/2)].append(arr[x][y])
                }else {
                    four[x-(size/2)].append(arr[x][y])
                }
            }
        }
    }
    
    devide(one, size/2)
    devide(two, size/2)
    devide(three, size/2)
    devide(four, size/2)
}

devide(paper, n)

print(count.0)
print(count.1)
