#Dictionaries

d = {
    'k1': 'v1',
    'k2': 'v2'
    }

print( d )
print( len(d) )
print( d["k2"] )
print( d.get("k2") )
print( d.keys() )
print( d.values() )

del d['k2']
print( d )

d["k1"]="v1!"
print( d )
