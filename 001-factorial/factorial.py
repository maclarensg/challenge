#!/usr/bin/env python
import sys

def factorial(n):
    if n == 1:
        return 1
    
    return n * factorial(n-1)

i = input("Enter a number? ")

print(factorial(int(i)))