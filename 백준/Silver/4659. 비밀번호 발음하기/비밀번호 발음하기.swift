let moArr: [Character] = ["a", "e", "i", "o", "u"]
while true {
    let str = readLine()!
    guard str != "end" else{ break }
    var mo = 0
    var ja = 0
    var before: Character = "!"
    var cnt = 0
    var contain = false
    for s in str {
        if moArr.contains(s) {
            mo += 1
            ja = 0
            contain = true
        }else {
            ja += 1
            mo = 0
        }
        if before == s && s != "e" && s != "o" {break}
        before = s
        guard ja < 3 && mo < 3 else{break}
        cnt += 1
    }
    guard contain && cnt == str.count else{ print("<\(str)> is not acceptable."); continue }
    print("<\(str)> is acceptable.")
}