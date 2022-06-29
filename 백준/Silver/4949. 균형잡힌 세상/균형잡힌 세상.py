from sys import *
from collections import *
import heapq
if __name__ =='__main__':
    
    
    while(True):
        s=stdin.readline()[:-1]
        if(s=="."):
            break
        stack=[]
        flag:bool=True
        for c in s:
            #print(f'{c} {stack}')
            if(len(stack)==0):
                if(c=='('or c=='['):
                    stack.append(c)
                elif(c==')'or c==']'):
                    flag=False
                    break
                
            else:
                if(stack[-1]=='('):
                    if(c=='(' or c=='['):
                        stack.append(c)
                    elif(c==')'):
                        stack.pop()
                    elif(c==']'):
                        flag=False
                        break
                elif(stack[-1]=='['):
                    if(c=='(' or c=='['):
                        stack.append(c)
                    elif(c==']'):
                        stack.pop()
                    elif(c==')'):
                        flag=False
                        break
            
                    
        #print(f'Len: {len(stack)}')
        if(len(stack)!=0):
            flag=False
        
        if(flag):
            stdout.write('yes\n')
        else:
            stdout.write('no\n')

    
    
    
 
   
    
   
