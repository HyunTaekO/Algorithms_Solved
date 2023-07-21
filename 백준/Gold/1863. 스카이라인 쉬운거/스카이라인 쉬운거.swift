let n = Int(readLine()!)!
var locH: [(Int, Int)] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    locH.append((input[0], input[1]))
}
var stack: [Int] = []
var result = 0
for (_, height) in locH {
    if height == 0 {
        stack = []
        continue
    }
    if stack.isEmpty {
        stack.append(height)
        result += 1
        continue
    }
    if stack.last! < height {
        stack.append(height)
        result += 1
        continue
    }
    if stack.last! > height {
        while !stack.isEmpty {
            if stack.last! > height {
                stack.removeLast()
            }else {
                break
            }
        }
    }
    if stack.isEmpty {
        stack.append(height)
        result += 1
        continue
    }
    if stack.last! == height {
        continue
    }
    if stack.last! < height {
        stack.append(height)
        result += 1
        continue
    }
}
print(result)