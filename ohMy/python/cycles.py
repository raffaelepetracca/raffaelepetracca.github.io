import random

for x in range(0, 10) : print(x)

print("-----------")
l = ['l1', 'l2', 'l3' ]
for i in l :print(i)

print("-----------")
for x in (0, 3, 10) : print(x)

print("-----------")
d = {0: 1, 3: 10}
for x in d : print(x, '->', d[x])

print("-----------")
ll = [ [0, 1], [3, 4, 5] ]
for l in ll :
    print("+++ ", l, end=" : ")
    for k in l: print( k, end=" - " )
    print()

print("-----------")
r = random.randrange(0, 100)
while r != 15 :
    print(r)
    r = random.randrange(0, 100)

print("-----------")
i = 0
while True :
    if i == 10 : break
    if i == 3 :
        i += 1
        continue
    print(i)
    i += 1
