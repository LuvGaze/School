from sympy import symbols, solve

x = symbols('x')
y = x ** 2 - 10 * x + 16

a = solve(y, x)

print(a)
