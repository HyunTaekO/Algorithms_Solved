var N = Int(readLine()!)!
var check = false
while N > 2 {
    N -= 3
    if check {
        check = false
    }else {
        check = true
    }
}
if N == 2 || N == 0 {
    if check {
        print("SK")
    }else {
        print("CY")
    }
}else if N == 1 {
    if check {
        print("CY")
    }else {
        print("SK")
    }
}