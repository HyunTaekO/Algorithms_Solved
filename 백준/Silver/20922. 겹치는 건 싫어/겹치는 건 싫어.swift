let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,k) = (t[0],t[1])

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var dict : [Int:Int] = [:]
var len = 0
var maxLen = 0
var start = 0, end = 0

while end < n {
    //새로 추가할 수가 그룹에 없다면 추가
    if dict[arr[end]] == nil {
        dict[arr[end]] = 1
        end += 1
        len += 1
    } else {
        let value = dict[arr[end]]!
        //새로 추가해도 개수가 k 이하라면 추가
        if value + 1 <= k {
            dict[arr[end]] = value + 1
            end += 1
            len += 1
        } else {
            //새로 추가할 수 없다면 앞쪽에서 빼줘야함
            dict[arr[start]]! -= 1
            if dict[arr[start]]! == 0 {
                dict[arr[start]] = nil
            }
            start += 1
            len -= 1
        }
    }
    maxLen = max(maxLen,len)
}

print(maxLen)