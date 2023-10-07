def solution(phone_number):
    answer = ''
    for num in range(len(phone_number)):
        if num < len(phone_number)-4:
            answer += '*'
        else: 
            answer += phone_number[num]
    return answer