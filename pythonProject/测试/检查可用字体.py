import matplotlib.font_manager

# 获取所有可用字体
font_list = [f.name for f in matplotlib.font_manager.fontManager.ttflist]

# 个数
n = 0

# 打印字体列表
for font_name in font_list:
    n = n+1
    print(f"第{n}个字体 : {font_name}")

print()
print(f"一共 {n} 个字体")
