class Temperature:
    def __init__(self, degree):
        self.degree = degree

    def to_fahrenheit(self):
        return self.degree * 9 / 5 + 32

    def to_celsius(self):
        return (self.degree - 32) * 5 / 9


t = float(input("请输入摄氏温度："))
T = Temperature(t)
print(f'摄氏温度 = {t:.1f}，华氏温度 = {T.to_fahrenheit():.1f}')

t = float(input("请输入华氏温度："))
T = Temperature(t)
print(f'华氏温度 = {t:.1f}，摄氏温度 = {T.to_celsius():.1f}')
