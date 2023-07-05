import Foundation

func solution(_ a:String, _ b:String) -> String {
    var long = "", short = ""
    
    // 문자열의 길이가 긴 값과 짧은 값 비교
    if a.count >= b.count {
        long = a
        short = b
    } else {
        long = b
        short = a
    }
    
    var sum = 0
    var ten = 0
    var result = ""
    
    for _ in 0..<long.count {       
        if short != "" {
            // 길이가 짧은 문자열과 긴 문자열 합
            sum = Int(String(long.last!))! + Int(String(short.last!))! + ten
            short.removeLast() // 가장 마지막 문자 삭제
        } else {
            // 길이가 긴 문자열
            sum = Int(String(long.last!))! + ten
        }
        long.removeLast() // 가장 마지막 문자 삭제
        
        // 추가 10의자리 수 초기화
        ten = 0
        
        // 문자열의 합이 10이상일 때,
        // 다음 숫자(ten) + 1,
        // 1의 자리 수(sum % 10) 만들기
        if sum >= 10 {
            ten = sum / 10
            sum = sum % 10
        }
        // 현재 자릿수의 값 + 지금까지 계산한 값 
        result = String(sum) + result
    }
    
    // 다음자릿수가 있으면 추가
    if ten != 0 {
        result = String(ten) + result
    }
    
    return result
}