var colors: [String] = []
var nums: [Int] = []
var score = 0
for _ in 1...5 {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    colors.append(input[0])
    nums.append(Int(input[1])!)
}

func sameColor() -> Bool { // 5장 같은 색인지 판단 후 Bool 리턴
    let c = colors[0]
    for i in colors {
        if i == c {
            continue
        }else {
            return false
        }
    }
    return true
}
func sameNums() -> [Int]{ // 같은 수 조합
    var dic: [Int: Int] = [1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0]
    var sameArray: [Int] = [] // 같은 숫자, 몇장 같은지
    
    for i in nums {
        dic[i]! += 1
    }
    for d in dic.keys {
        if dic[d]! > 1 {
            sameArray.append(d)
            sameArray.append(dic[d]!)
        }
    }
    return sameArray.isEmpty ? [0, 0] : sameArray
}
func consecutive() -> Bool { //5개의 수가 연속되는지
    let sorted = nums.sorted()
    for i in 0..<sorted.count-1 {
        if sorted[i]+1 != sorted[i+1] {
            return false
        }
    }
    return true
}

if sameColor() && consecutive() { // 1번
    
    print(nums.max()! + 900)
    
}else if sameNums()[1] == 4 { // 2번
    
    print(sameNums()[0] + 800)
    
}else if sameNums().count > 2 , (sameNums()[1] == 3 && sameNums()[3] == 2) || (sameNums()[1] == 2 && sameNums()[3] == 3) { // 3번
    
    if sameNums()[1] == 3 {
        print(sameNums()[0] * 10 + sameNums()[2] + 700)
    }else {
        print(sameNums()[2] * 10 + sameNums()[0] + 700)
    }
    
}else if sameColor() { // 4번
    
    print(nums.max()! + 600)
    
}else if consecutive() { // 5번
    
    print(nums.max()! + 500)
    
}else if sameNums().count == 2 && sameNums()[1] == 3 { // 6번
    
    print(sameNums()[0] + 400)
    
}else if sameNums().count > 2 && sameNums()[1] == 2 && sameNums()[3] == 2 { // 7번
    
    print(max(sameNums()[0], sameNums()[2]) * 10 + min(sameNums()[0], sameNums()[2]) + 300)
    
}else if sameNums().count == 2 && sameNums()[1] == 2 { // 8번
    
    print(sameNums()[0] + 200)
    
}else { // 9번
    print(nums.max()! + 100)
}