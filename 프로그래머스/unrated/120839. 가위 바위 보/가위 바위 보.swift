import Foundation

func solution(_ rsp:String) -> String {
    return rsp.map{ switch $0 {
                    case "0":
                        return "5"
                    case "2":
                        return "0"
                    case "5":
                        return "2"
                    default:
                        return "2"
                    }
                  }.joined()
}