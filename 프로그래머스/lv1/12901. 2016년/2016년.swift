func solution(_ a:Int, _ b:Int) -> String {
    var days = b - 1
    let dic:[Int: String] = [0: "FRI", 1: "SAT", 2: "SUN", 3: "MON", 4: "TUE", 5: "WED", 6: "THU"] 
    for i in 1..<a {
        if Array([1,3,5,7,8,10,12]).contains(i) {
            days += 31
        }else if Array([4,6,9,11]).contains(i) {
            days += 30
        }else {
            days += 29
        }
    }
    return dic[days % 7]!
}