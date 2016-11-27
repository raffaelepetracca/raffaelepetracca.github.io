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

'''
print("What ?")
name = sys.stdin.readline()
print("Hi", name)
'''

s = "1234567890"
print(s[2:3], s[3:], s[3:-2], s[:-2])
print(s[2:3]+"4")
print("%c %s %d %.5f" %
      ('C', "string", 1, .14))

print("ciao".capitalize())
print("ciao".find("ia"))      
print("ciao".find("xia"))      

