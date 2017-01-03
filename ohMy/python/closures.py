def counter():
    i = 1
    def inc():
        nonlocal i
        print(i)
        i = i + 1

    return inc

inc = counter()

for x in range(0,5):
    print(x, end=': ')
    inc()

