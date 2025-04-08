import sys


def main():
    if len(sys.argv) < 2:
        print("请提供一个文件名作为参数")
        sys.exit(1)

    filename = sys.argv[1]  # 从命令行参数中获取文件名
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            line_no = 0
            while True:
                line_no += 1
                line = f.readline()
                if line:
                    print(line_no, ":", line, end='')
                else:
                    break
    except FileNotFoundError:
        print(f"文件 '{filename}' 未找到")
    except Exception as e:
        print(f"发生错误：{e}")


if __name__ == "__main__":
    main()
