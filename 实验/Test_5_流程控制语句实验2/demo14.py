import math
import random

a = random.randint(0, 100)
b = random.randint(0, 100)

gcd = math.gcd(a, b)
print(f"{a} 和 {b} 的最大公约数是: {gcd}")

lcm = math.lcm(a, b)
print(f"{a} 和 {b} 的最小公倍数是: {lcm}")
