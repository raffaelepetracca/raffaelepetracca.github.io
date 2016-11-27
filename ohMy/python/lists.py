#Lists

my_list = ['string', 2, "three", "four" ]
print(my_list)
print(my_list[0])
print(my_list[1])
print(my_list[1:3])

my_list[1] = "two"
print(my_list)

second_list = ["s1", 100]

nested = [my_list, second_list]
print( nested )
print( nested[1][1] )

second_list.append('end')
print( nested[1][2] )

my_list.remove("three")
my_list.insert(2, "Three")
print(my_list)

del my_list[2]
print(my_list)

my_list.sort()
print(my_list)

my_list.reverse()
print(my_list)

concat = my_list + ["|<-->|"] + second_list
print( concat )

print( len(concat) )
print( max([1, 3, 2]) )
print( min(['a', 'c', 'b']) )
