def solution(numbers):
    numbers = list(map(str,numbers))
    
    numbers.sort(key = lambda n: (n*3),reverse = True)
    
            
    return str(int(''.join(numbers)))