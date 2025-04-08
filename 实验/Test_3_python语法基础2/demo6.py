from datetime import datetime

time = datetime.now()

name = input("请输入您的姓名：")
year = eval(input("请输入您的出生年份："))

print(f'您好！{name}。您{time.year - year}岁')