import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var dic: [String: Int] = [:]
    var players = players
    for i in 0..<players.count {
        dic[players[i]] = i
    }
    for call in callings {
        let win = dic[call]!
        dic[call] = win - 1
        dic[players[win-1]] = win
        players[win] = players[win-1]
        players[win-1] = call
    }
    return players
}
