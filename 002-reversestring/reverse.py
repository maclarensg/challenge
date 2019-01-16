#!/usr/bin/env python3.7
import sys

def reverse(str):
    buffer = ""
    for i in reversed(range(len(str))):
      buffer +=str[i]
    return buffer

s = input("Enter a string: ")

print(reverse(s))