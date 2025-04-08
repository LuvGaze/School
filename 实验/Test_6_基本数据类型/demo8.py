from sympy import symbols, Eq, solve

head = int(input("请输入总头数："))
foot = int(input("请输入总脚数(必须是偶数)："))

while foot % 2 == 1:
    foot = int(input("请输入总脚数(必须是偶数)："))

c = symbols('c')  # 鸡的数量
r = symbols('r')  # 兔的数量

# Eq(a+b,c)  -->  建立方程 c = a + b
eq1 = Eq(c + r, head)
eq2 = Eq(2 * c + 4 * r, foot)

# 求解方程组
solution = solve((eq1, eq2), (c, r))

# 输出结果
if solution:
    chicken = solution[c]
    rabbit = solution[r]
    if chicken >= 0 and rabbit >= 0:
        print(f"方法一：鸡: {chicken} 只，兔: {rabbit} 只")
    else:
        print("方法一：无解，请重新运行测试！")
else:
    print("方法一：无解，请重新运行测试！")

chicken = rabbit = 0
solution = True
for chicken in range(head):
    rabbit = head - chicken
    if foot == chicken * 2 + rabbit * 4:
        print(f"方法二：鸡: {chicken} 只，兔: {rabbit} 只")
        solution = False

if solution:
    print("方法二：无解，请重新运行测试！")
