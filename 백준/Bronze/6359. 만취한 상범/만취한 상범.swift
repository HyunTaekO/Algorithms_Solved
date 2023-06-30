let T = Int(readLine()!)!
var room: [Int] = []
for _ in 0..<T {
    let r = Int(readLine()!)!
    room.append(r)
}

for i in room {
    var door = Array(repeating: true, count: i + 1)
    door[0] = false
    for k in 2...i {
        for d in 1..<door.count where d % k == 0 {
            door[d] = door[d] ? false : true
        }
    }
    print(door.filter({$0}).count)
}