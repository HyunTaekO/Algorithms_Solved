let HWXY = readLine()!.split(separator: " ").map{ Int($0)! }
let H = HWXY[0], W = HWXY[1], X = HWXY[2], Y = HWXY[3]

var arrayB = Array(repeating: Array<Int>(), count: H + X)
var arrayA = Array(repeating: Array(repeating: 0, count: W), count: H)
for i in 0..<H+X {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arrayB[i] = input
}
for i in 0..<H+X{
    for j in 0..<W+Y{
        if arrayB[i][j] == 0 {continue} //둘다포함x
        if i < H && j < W {// 두 배열 모두에 포함되면
            arrayA[i][j] = arrayB[i][j]
            if i - X >= 0 && j - Y >= 0{ //
                arrayA[i][j] = abs(arrayA[i - X][j - Y] - arrayB[i][j])
            }
        }else{//b에만 포함되면
            arrayA[i - X][j - Y] = arrayB[i][j]

        }
    }
}
for i in arrayA{
    let str = i.map{ String($0) }.joined(separator: " ")
    print(str)
}