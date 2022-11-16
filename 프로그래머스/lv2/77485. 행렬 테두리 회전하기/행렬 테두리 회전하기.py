def solution(rows, cols, queries):
    
   # matrix = [[ (i*rows)+j for j in range(1,cols+1)] for i in range(rows)]
    
    matrix = [[0 for i in range(cols)] for j in range(rows)]
    num = 1
    for row in range(rows):
        for column in range(cols):
            matrix[row][column] = num
            num += 1
    result = []
    for x1,y1,x2,y2 in queries:
        x1 -= 1
        x2 -= 1
        y1 -= 1
        y2 -= 1
        now = matrix[x1][y1]
        mini = now
        
        
        for k in range(y1,y2):
            
            next = matrix[x1][k+1]
            matrix[x1][k+1] = now
            now = next
            mini = min(mini,next)
            
       
        
       
        for k in range(x1,x2):
            next = matrix[k+1][y2]
            matrix[k+1][y2] = now
            now = next
            mini = min(mini,next)
           
       
            
        for k in range(y2,y1,-1):
            next = matrix[x2][k-1]
            matrix[x2][k-1] = now
            now = next
            mini = min(mini,next)
   
        for k in range(x2,x1,-1):
            next = matrix[k-1][y1]
            matrix[k-1][y1] = now
            now = next
            mini = min(mini,next)
            
        
        

        
        result.append(mini)
        
    
        
        
     
    return result

    	   
