var n = Int(readLine()!)!
var count = 0
var newN = n
func cycle() {
    let l = newN / 10
    let r = newN % 10
    let sum = l + r
    newN = r * 10 + sum % 10
    count += 1
    if newN == n {
        print(count)
        return
    }
    cycle()
}
cycle()