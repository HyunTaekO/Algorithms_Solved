def solution(s):
    answer = ''
    cnt = 0
    for i in s:
        if i == ' ':
            cnt = 0
            answer += i
            continue
        if cnt % 2:
            answer += i.lower()
        else:
            answer += i.upper()
        cnt += 1
    return answer