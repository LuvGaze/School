def getvalue(b, r, n):
    v = b * ((1 + r) ** n)
    return v


b = eval(input("请输入本金: "))
r = eval(input("请输入年利率: ")) / 100
n = eval(input("请输入年数: "))

result = getvalue(b, r, n)

print(f"经过 {n} 年后，本金 {b} 在年利率 {r * 100}% 下的终值为: {result:.2f}")
