import random
import tkinter as tk
from tkinter import messagebox


def draw_grid(canvas):
    # 画外边框线
    canvas.create_line(2, 2, 300, 2, width=2)  # 上
    canvas.create_line(2, 2, 2, 300, width=2)  # 左
    canvas.create_line(2, 300, 300, 300, width=2)  # 下
    canvas.create_line(300, 2, 300, 300, width=2)  # 右
    # 画横线
    canvas.create_line(100, 0, 100, 300)
    canvas.create_line(200, 0, 200, 300)
    # 画竖线
    canvas.create_line(0, 100, 300, 100)
    canvas.create_line(0, 200, 300, 200)

    num = 1
    for i in range(3):
        for j in range(3):
            y = i * 100 + 50
            x = j * 100 + 50
            canvas.create_text(x, y, text=str(num), font=("Arial", 24))

            num += 1


def on_click():
    global board
    global step
    position = e1.get()

    if position.isdigit() and 1 <= int(position) <= 9:
        number = int(position)
        index = number - 1
        if board[index] == ' ':
            board[index] = 'x'
            x = ((int(position) - 1) % 3) * 100 + 50
            y = ((int(position) - 1) // 3) * 100 + 50
            canvas.create_line(x - 20, y - 20, x + 20, y + 20, fill='black', width=2)
            canvas.create_line(x + 20, y - 20, x - 20, y + 20, fill='black', width=2)
            step += 1
            iswins()
            if not gameover:
                ai_move()
        else:
            messagebox.showerror("错误", "该位置已经落子，请选择其他位置")


def ai_move():
    global board, foot
    index = random.randint(0, 8)

    while board[index] != ' ':
        index = random.randint(0, 8)

    x = (index % 3) * 100 + 50
    y = (index // 3) * 100 + 50

    canvas.create_oval(x - 20, y - 20, x + 20, y + 20, fill='red')
    board[index] = 'AI'
    foot += 1
    iswins()


def problem():
    try:
        input_value = int(e1.get())
        if input_value < 1 or input_value > 9:
            messagebox.showerror("错误", "请输入1到9之间的数字")
        else:
            print("输入正确")
    except ValueError:
        messagebox.showerror("错误", "请输入一个有效的数字")

    on_click()


def iswins():
    global gameover, step
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    for w in wins:
        if board[w[0]] != " " and board[w[0]] == board[w[1]] == board[w[2]]:
            gameover = True
            messagebox.showinfo(title="shuchu", message="赢家是" + board[w[0]])
            return
    if step > 5:
        gameover = True
        messagebox.showinfo(title="shuchu", message="都没有赢了")
    return


def again():
    global board, step, gameover
    board = [' '] * 9
    step = 0
    gameover = False
    canvas.delete('all')
    draw_grid(canvas)


def main():
    root = tk.Tk()
    root.title("九宫格")
    root.geometry("500x600")

    lb1 = tk.Label(root, text='请要输入落子的位置(1~9):')
    lb1.place(x=150, y=350)
    global e1
    e1 = tk.Entry(root, bd=5, width=20)
    e1.place(x=150, y=380)
    button1 = tk.Button(root, text="按下落子", width=10, height=2, fg='black', command=problem)
    button1.place(x=180, y=420)
    button2 = tk.Button(root, text="重新开始", width=10, height=2, fg='black', command=again)
    button2.place(x=180, y=480)

    global canvas
    canvas = tk.Canvas(root, width=350, height=350, )
    canvas.pack()

    draw_grid(canvas)

    root.mainloop()


if __name__ == "__main__":
    board = [' '] * 9
    gameover = False
    step = 0

    foot = 0
    main()
