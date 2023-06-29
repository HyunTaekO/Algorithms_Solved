var N = Int(readLine()!)!
var arr = Array(repeating: 5001, count: N + 1)
if N < 3 || N == 4 { print("-1") }else {
    if N > 2 {
        arr[3] = 1
        if N > 4 {
            arr[5] = 1
        }
    }
    if N > 5 {
        for i in 6...N {
            arr[i] = min(arr[i-3] + 1, arr[i-5] + 1)
        }
    }
    if arr[N] > 5001 {
        print("-1")
    }else {
        print(arr[N])
    }
    
}
