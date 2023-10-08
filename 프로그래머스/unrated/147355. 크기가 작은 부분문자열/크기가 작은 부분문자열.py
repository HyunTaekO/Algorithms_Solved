def solution(t, p):
    answer = 0
    for i in range(len(t)):
        if len(t) - len(p) < i: break
        if int(t[i:i+len(p)]) <= int(p):
            answer += 1
        
     
    return answer