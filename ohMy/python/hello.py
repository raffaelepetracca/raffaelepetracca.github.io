import random
import sys
import os

#Comment

'''
multili
    line comment
'''

print("Ciao")

name = "Raf"
print( name )

#Numbers
# + - * / % ** //
print( "5 + 2 =", 5+2 )
print( "5 ** 2 =", 5**2 )
print( "5 // 2 =", 5//2 )
# division without remainder
print( "16 // 3 =", 16//3 )
print( "16 / 3 =", 16/3 )

#Strings
quote = "\" slash"
multi_line = '''just
    multi
line'''

print( quote, multi_line)

concat = quote+multi_line
print( concat )

print( "%s |<-->| %s" %(quote, multi_line))

print('No new line', end="")
print("|<-")

print("--------")
print("a\n"*5, end="++++")
print("--------")

#Lists
#Tuples
#Dictionnaies
