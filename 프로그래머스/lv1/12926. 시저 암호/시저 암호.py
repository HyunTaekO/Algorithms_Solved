def solution(s, n):
    answer = ''
    
    for i in s:
        if i == ' ': 
            answer += ' '
            continue
        code = ord(i) + n
        if 65 <= ord(i) <= 90:
            code = ((code - 65) % 26) + 65
        if 97 <= ord(i) <= 122:
            code = ((code - 97) % 26) + 97
        answer += chr(code)
    return answer

# for i in s:
#         if i == ' ': 
#             answer += ' '
#             continue
#         code = ord(i) + n
#         if (65 <= code <= 90) or (97 <= code <= 122) :
#             answer += chr(code)
#             continue
#         elif 122 < code:
#             code = 97 + (code - 123)
#         else:
#             code = 65 + (code - 91)
#         answer += chr(code)