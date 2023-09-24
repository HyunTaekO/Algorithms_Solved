def solution(array, commands):
    answer = []
    for command in commands:
        slice = array[command[0]-1 : command[1]]
        answer.append(sorted(slice)[command[2]-1])
    return answer