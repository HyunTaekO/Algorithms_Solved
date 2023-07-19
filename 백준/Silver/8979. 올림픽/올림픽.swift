let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nk[0]
let k = nk[1]
var country = Array(repeating: Array(repeating: 0, count: 4), count: n)
var rank: [(Int, Int)] = []
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
        
    country[i] = input
}
country = country.sorted(by: { ($0[1], $0[2], $0[3]) > ($1[1], $1[2], $1[3])})
rank.append((country[0][0], 1))
for c in 1..<country.count {
    let now = country[c]
    let before = country[c-1]
    if now[1] == before[1] && now[2] == before[2] && now[3] == before[3] {
        rank.append((now[0], rank[c-1].1))
    }else {
        rank.append((now[0], rank[c-1].1 + 1))
    }
    if now[0] == k { print(rank[c].1); break }
}