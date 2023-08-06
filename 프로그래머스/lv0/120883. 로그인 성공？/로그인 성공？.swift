import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    var check = false
    for idpw in db {
        if idpw[0] == id_pw[0] { 
            if idpw[1] == id_pw[1] {
                return "login"
            }else {
                check = true
            }
        }else {
            continue
        }
    }
    return check ? "wrong pw" : "fail"
}