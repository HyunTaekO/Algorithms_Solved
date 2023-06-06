let N = Int(readLine()!)!
var check = ""
var result = 0
var tb = true
for _ in 1...N {
    check = ""
    let str = readLine()!.map{ $0 }
    let c = str.count
    for i in 0..<c {
        if !check.contains(str[i]) {
            check += String(str[i])
            tb = true
        }else {
            if str[i] != str[i-1] {
                tb = false
                break
            }else {
                tb = true
                continue
            }
            
        }
    }
    
    if tb {
        result += 1
    }
    
}

print(result)