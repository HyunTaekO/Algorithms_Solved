import Foundation

func solution(_ land:[[Int]]) -> Int{
    var land = land
    for i in 1..<land.count {
        land[i][0] += max(land[i-1][1], land[i-1][2], land[i-1][3])
        land[i][1] += max(land[i-1][2], land[i-1][3], land[i-1][0])
        land[i][2] += max(land[i-1][3], land[i-1][0], land[i-1][1])
        land[i][3] += max(land[i-1][0], land[i-1][1], land[i-1][2])
    }
    return land[land.count-1].max()!
}