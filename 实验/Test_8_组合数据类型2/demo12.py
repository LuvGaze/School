list = ['Mon', 'Tues', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

order = 0
for i in list:
    order = order + 1
    print(f"({order}, '{i}')", end=' ')
