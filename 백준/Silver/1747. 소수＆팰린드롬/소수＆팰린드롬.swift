import Foundation
let n = Int(readLine()!)!
var result = n
var isPrime = [false, false] + Array(repeating: true, count: 2000000)
var nums = Array(2...2000000)

func sosu() {
    for i in 2...2000000 {
        if isPrime[i] { // 어떤 i가 소수라면,
            for j in stride(from: i*2, through: 2000000, by: i) {
                if !isPrime[j] {continue}
                isPrime[j] = false // i 의 배수는 모두 소수가 아닌 수가 된다.
            }
        }
    }
}
sosu()
nums = nums.filter{ isPrime[$0] && $0 >= n }

func pal(_ num: Int) -> Bool {
    let reversed = String(num).reversed().map{ String($0) }.joined()
    return num == Int(reversed)! ? true : false
}

for num in nums {
    if pal(num) { print(num); break }
}
