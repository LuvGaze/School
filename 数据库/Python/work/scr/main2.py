import mysql.connector
from mysql.connector import Error
import random


# 创建数据库连接
def create_connection():
    """连接到数据库"""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='education_system',
            user='root',
            password='123456',
            auth_plugin='mysql_native_password',  # 使用 mysql_native_password 插件
            charset='utf8mb4'  # 指定字符集为 utf8mb4，支持中文
        )
        if connection.is_connected():
            print("成功连接到数据库")
        return connection
    except Error as e:
        print(f"连接错误：{e}")
        return None


def create_tables(connection):
    """创建用户表和学生表"""
    try:
        cursor = connection.cursor()

        # 创建用户表
        create_user_table_query = """
        CREATE TABLE IF NOT EXISTS users (
            username VARCHAR(50) PRIMARY KEY,  -- 用户名
            password VARCHAR(50),             -- 密码
            role ENUM('student', 'teacher')   -- 角色: 学生或老师
        );
        """
        cursor.execute(create_user_table_query)

        # 创建学生表
        create_student_table_query = """
        CREATE TABLE IF NOT EXISTS students (
            student_id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100),
            dob DATE,
            gender ENUM('M', 'F'),
            major VARCHAR(100),
            class_name VARCHAR(50),
            student_number VARCHAR(10) UNIQUE,
            is_published BOOLEAN DEFAULT FALSE,
            user_id VARCHAR(50),  -- 关联用户表的username
            FOREIGN KEY (user_id) REFERENCES users(username)
        );
        """
        cursor.execute(create_student_table_query)
        connection.commit()
        print("用户表和学生表已创建或已存在")
    except Error as e:
        print(f"创建表失败：{e}")


def insert_user(connection, username, password, role):
    """插入用户（老师/学生）数据"""
    try:
        cursor = connection.cursor()
        insert_user_query = """
        INSERT INTO users (username, password, role)
        VALUES (%s, %s, %s);
        """
        cursor.execute(insert_user_query, (username, password, role))
        connection.commit()
        print(f"用户 {username} 已添加")
    except Error as e:
        print(f"插入用户失败：{e}")


def insert_student(connection, name, dob, gender, major, class_name, user_id):
    """插入学生数据"""
    try:
        cursor = connection.cursor()
        student_number = generate_student_number(major, class_name)
        insert_query = """
        INSERT INTO students (name, dob, gender, major, class_name, student_number, user_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s);
        """
        cursor.execute(insert_query, (name, dob, gender, major, class_name, student_number, user_id))
        connection.commit()
        print(f"学生 {name} 数据已插入，学号: {student_number}")
    except Error as e:
        print(f"插入数据失败：{e}")


def generate_student_number(major, class_name):
    """根据专业和班级自动生成学号，学号唯一且长度为10位"""
    major_code = major[:3].upper()  # 取专业前3个字母并大写
    class_code = class_name[:2].upper()  # 取班级前2个字母并大写
    random_number = random.randint(10000, 99999)  # 生成一个5位随机数字
    student_number = f"{major_code}{class_code}{random_number}"
    return student_number


def login(connection):
    """登录功能"""
    print("请输入登录信息：")
    username = input("账号：")
    password = input("密码：")

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
    user = cursor.fetchone()

    if user:
        print(f"登录成功，欢迎 {username}！")
        return user  # 返回用户信息
    else:
        print("用户名或密码错误，请重新输入")
        return None


def change_password(connection, username):
    """修改密码"""
    new_password = input("请输入新密码：")
    cursor = connection.cursor()
    cursor.execute("UPDATE users SET password = %s WHERE username = %s", (new_password, username))
    connection.commit()
    print("密码已成功修改")


def recover_password(connection, username):
    """找回密码：学生找回密码时需要老师确认"""
    print(f"学生 {username} 请求找回密码，请等待老师确认...")

    # 模拟老师确认过程
    teacher_username = input("请输入老师账号进行确认：")
    teacher_password = input("请输入老师密码：")

    # 检查是否是有效的老师账号
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s AND role = 'teacher'",
                   (teacher_username, teacher_password))
    teacher = cursor.fetchone()

    if teacher:
        new_password = input("请输入为学生设置的新密码：")
        cursor.execute("UPDATE users SET password = %s WHERE username = %s", (new_password, username))
        connection.commit()
        print("学生密码已成功重置")
    else:
        print("教师账号或密码错误，无法重置密码")


def student_operations(connection, username):
    """学生功能操作"""
    while True:
        print("\n学生功能：")
        print("1. 查看自己的信息")
        print("2. 修改密码")
        print("3. 退出")
        choice = input("请输入操作编号：")

        if choice == '1':
            # 查看自己的信息
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM students WHERE user_id = %s", (username,))
            student = cursor.fetchone()
            if student:
                gender = '男' if student[3] == 'M' else '女'
                print(
                    f"学号: {student[6]}, 姓名: {student[1]}, 出生日期: {student[2]}, 性别: {gender}, 专业: {student[4]}, 班级: {student[5]}")
            else:
                print("没有找到该学生的信息")

        elif choice == '2':
            # 修改密码
            change_password(connection, username)

        elif choice == '3':
            # 退出
            print("退出学生模式")
            break

        else:
            print("无效操作，请重新选择")


def teacher_operations(connection):
    """教师功能操作"""
    while True:
        print("\n教师功能：")
        print("1. 查看所有学生信息")
        print("2. 添加学生")
        print("3. 删除学生")
        print("4. 修改学生信息")
        print("5. 修改学生密码")
        print("6. 修改自己密码")
        print("7. 退出")
        choice = input("请输入操作编号：")

        if choice == '1':
            # 查看所有学生
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM students")
            students = cursor.fetchall()
            for student in students:
                gender = '男' if student[3] == 'M' else '女'
                print(
                    f"学号: {student[6]}, 姓名: {student[1]}, 出生日期: {student[2]}, 性别: {gender}, 专业: {student[4]}, 班级: {student[5]}")

        elif choice == '2':
            # 添加学生
            print("\n请填写学生信息：")
            name = input("姓名：")
            dob = input("出生日期（格式：YYYY-MM-DD）：")
            gender = input("性别（M/F）：")
            major = input("专业：")
            class_name = input("班级：")
            student_username = input("学号（学生账号）：")

            # 假设老师的用户名就是 "teacher"（老师账号）
            insert_student(connection, name, dob, gender, major, class_name, student_username)

        elif choice == '3':
            # 删除学生信息
            student_id = int(input("请输入要删除的学生ID："))
            delete_student(connection, student_id)

        elif choice == '4':
            # 修改学生信息
            student_id = int(input("请输入要修改的学生ID："))
            name = input("请输入新姓名（可留空）：")
            dob = input("请输入新出生日期（格式：YYYY-MM-DD，可留空）：")
            gender = input("请输入新性别（M/F，可留空）：")
            major = input("请输入新专业（可留空）：")
            class_name = input("请输入新班级（可留空）：")
            update_student(connection, student_id, name, dob, gender, major, class_name)

        elif choice == '5':
            # 修改学生密码
            student_username = input("请输入学生的学号：")
            change_student_password(connection, student_username)

        elif choice == '6':
            # 修改自己密码
            new_password = input("请输入新密码：")
            change_password(connection, "teacher")

        elif choice == '7':
            # 退出
            print("退出教师模式")
            break

        else:
            print("无效操作，请重新选择")


def change_student_password(connection, username):
    """修改学生密码"""
    new_password = input(f"请输入为学生 {username} 设置的新密码：")
    cursor = connection.cursor()
    cursor.execute("UPDATE users SET password = %s WHERE username = %s", (new_password, username))
    connection.commit()
    print(f"学生 {username} 的密码已修改")


def delete_student(connection, student_id):
    """删除学生"""
    cursor = connection.cursor()
    cursor.execute("DELETE FROM students WHERE student_id = %s", (student_id,))
    connection.commit()
    print(f"学生 {student_id} 已删除")


def update_student(connection, student_id, name=None, dob=None, gender=None, major=None, class_name=None):
    """修改学生信息"""
    cursor = connection.cursor()
    update_query = "UPDATE students SET "
    params = []

    if name:
        update_query += "name = %s, "
        params.append(name)
    if dob:
        update_query += "dob = %s, "
        params.append(dob)
    if gender:
        update_query += "gender = %s, "
        params.append(gender)
    if major:
        update_query += "major = %s, "
        params.append(major)
    if class_name:
        update_query += "class_name = %s, "
        params.append(class_name)

    # 去掉多余的逗号和空格
    update_query = update_query.rstrip(", ")
    update_query += " WHERE student_id = %s"
    params.append(student_id)

    cursor.execute(update_query, tuple(params))
    connection.commit()
    print(f"学生 {student_id} 的信息已更新")


if __name__ == "__main__":
    conn = create_connection()
    if conn:
        create_tables(conn)

        # 添加一个默认老师用户
        insert_user(conn, 'teacher', '123456', 'teacher')

        while True:
            print("请选择：")
            print("1. 登录")
            print("2. 退出")
            choice = input("请输入操作编号：")

            if choice == '1':
                # 登录
                user = login(conn)
                if user:
                    if user[2] == 'teacher':  # 如果是老师
                        teacher_operations(conn)
                    elif user[2] == 'student':  # 如果是学生
                        student_operations(conn, user[0])

            elif choice == '2':
                break
            else:
                print("无效操作，请重新选择")

    # 关闭数据库连接
    if conn.is_connected():
        conn.close()
        print("数据库连接已关闭")
