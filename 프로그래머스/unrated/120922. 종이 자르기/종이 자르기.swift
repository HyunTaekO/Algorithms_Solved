import Foundation

func solution(_ M:Int, _ N:Int) -> Int {
    if M == 1 && N == 1 { return 0 }
    return (min(M, N) - 1) + (max(M, N) * (min(M, N)) - min(M, N))
}