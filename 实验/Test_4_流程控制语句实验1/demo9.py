print("上三角")
for i in range(1, 10):
    for j in range(1, i + 1):
        print(f"{i}x{j}={i * j}", end="\t")
    print()

print()

print("下三角")
for i in range(1, 10):
    for j in range(i, 10):
        print(f"{i}x{j}={i * j}", end="\t")
    print()

print()

print("矩形块")
for i in range(1, 10):
    for j in range(1, 10):
        print(f"{i}x{j}={i * j}", end="\t")
    print()
