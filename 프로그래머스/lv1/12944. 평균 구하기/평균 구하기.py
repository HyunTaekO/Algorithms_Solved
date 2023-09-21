def solution(arr):
    """
    1. 배열에 있는 모든 원소 더하기
    2. 더한 값을 배열의 길이만큼 나누기
    """
    sumValue = 0
    for item in arr:
        sumValue += item
    return sumValue / len(arr)