let T = Int(readLine()!)!

for _ in 1...T {
    let input = readLine()!
  
    if vps(input: input) {
        print("YES")
    }else {
        print("NO")
    }
}

func vps(input: String) -> Bool {
    var open = 0
    for i in input {
        if i == "(" {
            open += 1
            continue
        }else if i == ")"{
            open -= 1
        }
        if open < 0 {
            return false
        }
    }
    return open == 0 ? true : false
}