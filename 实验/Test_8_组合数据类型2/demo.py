# 猜单词游戏
import random

words = ['apple', 'pear', 'while', 'tuple', 'banana', 'cherry', 'good', 'better', 'best', 'python', 'dictionary',
         'jumble', 'difficult', 'aesthetic', 'stereotype', 'civilization', 'anniversary']

print("欢迎参加猜单词游戏！\n请把乱序后的字母组成一个单词")
F = "Y"

while F in ("Y", "y"):
    word = random.choice(words)
    # 将字符串转换为列表
    j = list(word)
    # 随机打乱列表
    random.shuffle(j)
    print("乱序后的单词：",end='')
    for i in range(len(j)):
        print(j[i], end='')  # 将列表转换为字符串

    #   j = "".join(word)
    #  print("乱序后的单词：", j)

    print()
    guess = input("请输入您猜测的结果：")
    while guess != word:
        guess = input("结过不对，请重新猜测：")
    print("恭喜您，猜对了！")
    F = input("是否继续（Y/N）？")
    print("谢谢参与，欢迎下次再玩！")
