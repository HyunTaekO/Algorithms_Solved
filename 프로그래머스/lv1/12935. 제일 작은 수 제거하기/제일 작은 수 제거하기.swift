
func solution(_ arr:[Int]) -> [Int] {
    var index = arr.firstIndex(of: arr.min()!)!
    var array = arr
    array.remove(at: index)
    return array == [] ? [-1] : array
}