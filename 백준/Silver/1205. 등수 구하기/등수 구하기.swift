let NSP = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = NSP[0]
let score = NSP[1]
let scoreCnt = NSP[2]
var list: [Int] = []
if N > 0 {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    list = input
}
list = list.sorted(by: { $0 > $1 })
let big = list.filter{ $0 > score }.count
let same = list.filter{ $0 == score }.count
if big == scoreCnt || (big + same == scoreCnt && list.min()! == score){
    print("-1")
}else {
    print(big + 1)
}