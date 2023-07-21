let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,d,k,c) = (t[0], t[1], t[2], t[3])

var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.append(contentsOf: arr)

var start = 0, end = 0, result = 0
var eatDict = [c:1]

while end < k {
    if eatDict[arr[end]] == nil { eatDict[arr[end]] = 0 }
    eatDict[arr[end]]! += 1
    end += 1
}

while end < arr.count {
    result = max(result, eatDict.count)
    
    eatDict[arr[start]]! -= 1
    if eatDict[arr[start]] == 0 {
        eatDict[arr[start]] = nil
    }
    
    if eatDict[arr[end]] == nil {
        eatDict[arr[end]] = 0
    }
    eatDict[arr[end]]! += 1
    start += 1
    end += 1
}

print(result)