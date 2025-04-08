s = [9, 7, 8, 3, 2, 1, 55, 6]

# 初始化变量
count = 0
result = 0
max_value = s[0]
min_value = s[0]

print()
print("使用for循环遍历列表")
# 使用for循环遍历列表
for num in s:
    count += 1
    result += num
    if num > max_value:
        max_value = num
    if num < min_value:
        min_value = num

average = result / count

print(f"元素个数: {count}")
print(f"最大值: {max_value}")
print(f"最小值: {min_value}")
print(f"元素之和: {result}")
print(f"平均值: {average}")

# 初始化变量
count = 0
result = 0
max_value = s[0]
min_value = s[0]
i = 0

print()
print("使用while循环遍历列表")
# 使用while循环遍历列表
while i < len(s):
    count += 1
    result += s[i]
    if s[i] > max_value:
        max_value = s[i]
    if s[i] < min_value:
        min_value = s[i]
    i += 1

average = result / count

print(f"元素个数: {count}")
print(f"最大值: {max_value}")
print(f"最小值: {min_value}")
print(f"元素之和: {result}")
print(f"平均值: {average}")

# 初始化变量
count = 0
result = 0
max_value = s[0]
min_value = s[0]

print()
print("使用for循环直接访问列表元素")
# 使用for循环直接访问列表元素
for num in s:
    count += 1
    result += num
    if num > max_value:
        max_value = num
    if num < min_value:
        min_value = num

average = result / count

print(f"元素个数: {count}")
print(f"最大值: {max_value}")
print(f"最小值: {min_value}")
print(f"元素之和: {result}")
print(f"平均值: {average}")

# 初始化变量
count = 0
result = 0
max_value = s[0]
min_value = s[0]

print()
print("使用for循环间接访问列表元素")
# 使用for循环间接访问列表元素
for i in range(len(s)):
    count += 1
    result += s[i]
    if s[i] > max_value:
        max_value = s[i]
    if s[i] < min_value:
        min_value = s[i]

average = result / count

print(f"元素个数: {count}")
print(f"最大值: {max_value}")
print(f"最小值: {min_value}")
print(f"元素之和: {result}")
print(f"平均值: {average}")

# 初始化变量
count = 0
result = 0
max_value = s[0]
min_value = s[0]
i = 0

print()
print("使用while循环正序访问列表")
# 使用while循环正序访问列表
while i < len(s):
    count += 1
    result += s[i]
    if s[i] > max_value:
        max_value = s[i]
    if s[i] < min_value:
        min_value = s[i]
    i += 1

average = result / count

print(f"元素个数: {count}")
print(f"最大值: {max_value}")
print(f"最小值: {min_value}")
print(f"元素之和: {result}")
print(f"平均值: {average}")

# 初始化变量
count = 0
result = 0
max_value = s[0]
min_value = s[0]
i = len(s) - 1

print()
print("使用while循环反序访问列表")
# 使用while循环反序访问列表
while i >= 0:
    count += 1
    result += s[i]
    if s[i] > max_value:
        max_value = s[i]
    if s[i] < min_value:
        min_value = s[i]
    i -= 1

average = result / count

print(f"元素个数: {count}")
print(f"最大值: {max_value}")
print(f"最小值: {min_value}")
print(f"元素之和: {result}")
print(f"平均值: {average}")

# 初始化变量
count = 0
result = 0
max_value = s[0]
min_value = s[0]
i = 0

print()
print("使用while True和break遍历列表")
# 使用while True和break遍历列表
while True:
    if i >= len(s):
        break
    count += 1
    result += s[i]
    if s[i] > max_value:
        max_value = s[i]
    if s[i] < min_value:
        min_value = s[i]
    i += 1

average = result / count

print(f"元素个数: {count}")
print(f"最大值: {max_value}")
print(f"最小值: {min_value}")
print(f"元素之和: {result}")
print(f"平均值: {average}")
