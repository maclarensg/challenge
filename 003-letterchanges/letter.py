#!/usr/bin/env python3.7
import sys

def letterChanges(str):
    buffer = bytearray(b'')

    strbytes = str.encode('utf-8')
    for i in range(0, len(strbytes)):
        c = strbytes[i]
        if (strbytes[i] >= 97 and strbytes[i] <= 122):
            c += 1
            if c == 97 or c == 101 or c == 105 or c == 111 or c == 117:
                c -= 32
            
        buffer.append(c)  
    
    return buffer.decode("utf-8") 
        
        

s = input("Enter a string: ")

print(letterChanges(s))