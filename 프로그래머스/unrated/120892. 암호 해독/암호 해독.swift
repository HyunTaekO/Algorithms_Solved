import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    return cipher.enumerated().filter{ ($0.offset + 1) % code == 0 }.map{ String($0.element) }.joined()
}