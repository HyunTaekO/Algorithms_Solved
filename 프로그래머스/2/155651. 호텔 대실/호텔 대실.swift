import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var rooms: [[Int]] = []
    var times = book_time.map{ transTime($0[0], $0[1])}.sorted(by: {$0[0] < $1[0]})
    for time in times {
        guard !rooms.isEmpty else{
            rooms.append(time)
            continue
        }
        var num = 0
        var flag = false
        while num < rooms.count {
            let room = rooms[num]
            let (start, end) = (room[room.count-2], room[room.count-1] + 10)

            if start..<end ~= time[0] || start..<end ~= time[1] {
                num += 1
                flag = true
                continue
            }else {
                rooms[num] += time
                flag = false
                break
            }
        }
        if flag { rooms.append(time) }
    }
    return rooms.count
}

func transTime(_ start: String,_ end: String) -> [Int] {
    let spS = start.split{$0 == ":"}.map{Int(String($0))!}
    let spE = end.split{$0 == ":"}.map{Int(String($0))!}
    let s = (spS[0] * 60) + spS[1]
    let e = (spE[0] * 60) + spE[1]
    return [s, e]
}