a = "qwe"
b = "rty"
c = "a"
print(a + b)

# 输出ASCII对应的字符
print(chr(21834))

# 输出字符对应的ASCII值
print(ord('啊'))

# 打开/创建文件
fp = open('note.txt', 'w')

# 将内容写入文件
print("啊啊啊", file=fp)

# 关闭文件
fp.close()

# 多个print输出在一行
print("123", end='')  # end后可添加连接内容
print("456", end='-->')
print("789")

# 输入内容
name = input("输入内容:")
print("你输入的是：" + name)
