from sys import *
from collections import * 

if __name__ =="__main__":
    word = stdin.readline()[:-1]
    
    if(len(word)==1):
        stdout.write(f'{word}')
    elif(len(word)==2):
        if(word[0]==word[1]):
            stdout.write(f"{word}")
        else:
            stdout.write("I'm Sorry Hansoo")
    else:
        left=""
        mid=""
        right=""
        arr=[0]*26
        no="I'm Sorry Hansoo"
 
        
        for c in word:
           arr[ord(c)-ord("A")]+=1
            
        for i in range(26):
            if(arr[i]!=0):
                if(arr[i]%2==0):
                        
                        div=(arr[i]//2)
                        left+=(chr(65+i)*div)
                        right=(chr(65+i)*div)+right
                else:
                     div=(arr[i]//2)
                     left+=(chr(65+i)*div)
                     mid+=(chr(65+i))
                     right=(chr(65+i)*div)+right
                
                
        
        result=left+mid+right
        flag:bool=True
        l=0
        r=len(result)-1
        if(len(result)%2==0):
            while(l<r):
                if(result[l]!=result[r]):
                    flag=False
                    break
                l+=1
                r-=1
        else:
            while(l<=r):
                if(result[l]!=result[r]):
                    flag=False
                    break
                l+=1
                r-=1
        if(flag==True):
            stdout.write(f"{result}")
        else:
            stdout.write(f"{no}")
                
            
        
        
