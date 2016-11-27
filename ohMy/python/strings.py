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
