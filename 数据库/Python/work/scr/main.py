import mysql.connector
from mysql.connector import Error


def create_connection():
    """连接到数据库"""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='education_system',
            user='root',
            password='123456',
            auth_plugin='mysql_native_password'  # 使用 mysql_native_password 插件
        )
        if connection.is_connected():
            print("成功连接到数据库")
        return connection
    except Error as e:
        print(f"连接错误：{e}")
        return None


def create_student_table(connection):
    """创建学生表"""
    try:
        cursor = connection.cursor()
        create_table_query = """
        CREATE TABLE IF NOT EXISTS students (
            student_id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100),
            dob DATE,
            gender ENUM('M', 'F')
        );
        """
        cursor.execute(create_table_query)
        connection.commit()
        print("学生表已创建或已存在")
    except Error as e:
        print(f"创建表失败：{e}")


def insert_student(connection, name, dob, gender):
    """插入学生数据"""
    try:
        cursor = connection.cursor()
        insert_query = """
        INSERT INTO students (name, dob, gender)
        VALUES (%s, %s, %s);
        """
        cursor.execute(insert_query, (name, dob, gender))
        connection.commit()
        print("学生数据已插入")
    except Error as e:
        print(f"插入数据失败：{e}")


def delete_student(connection, student_id):
    """删除学生数据"""
    try:
        cursor = connection.cursor()
        delete_query = "DELETE FROM students WHERE student_id = %s"
        cursor.execute(delete_query, (student_id,))
        connection.commit()
        print(f"学生 {student_id} 已删除")
    except Error as e:
        print(f"删除数据失败：{e}")


def update_student(connection, student_id, name=None, dob=None, gender=None):
    """更新学生数据"""
    try:
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

        # 去掉多余的逗号和空格
        update_query = update_query.rstrip(", ")
        update_query += " WHERE student_id = %s"
        params.append(student_id)

        cursor.execute(update_query, tuple(params))
        connection.commit()
        print(f"学生 {student_id} 的信息已更新")
    except Error as e:
        print(f"更新数据失败：{e}")


def fetch_all_students(connection):
    """查询所有学生"""
    try:
        cursor = connection.cursor()
        select_query = "SELECT * FROM students"
        cursor.execute(select_query)
        result = cursor.fetchall()
        print("所有学生数据：")
        for row in result:
            print(f"ID: {row[0]}, 姓名: {row[1]}, 出生日期: {row[2]}, 性别: {row[3]}")
    except Error as e:
        print(f"查询失败：{e}")


def close_connection(connection):
    """关闭数据库连接"""
    if connection.is_connected():
        connection.close()
        print("数据库连接已关闭")


# 主程序
if __name__ == "__main__":
    conn = create_connection()
    if conn:
        create_student_table(conn)

        while True:
            print("\n请选择操作：")
            print("1. 添加学生")
            print("2. 删除学生")
            print("3. 修改学生信息")
            print("4. 查询所有学生")
            print("5. 退出")
            choice = input("请输入操作编号：")

            if choice == '1':
                # 添加学生
                name = input("请输入学生姓名：")
                dob = input("请输入学生出生日期（格式：YYYY-MM-DD）：")
                gender = input("请输入学生性别（M/F）：")
                insert_student(conn, name, dob, gender)

            elif choice == '2':
                # 删除学生
                student_id = int(input("请输入要删除的学生ID："))
                delete_student(conn, student_id)

            elif choice == '3':
                # 修改学生信息
                student_id = int(input("请输入要修改的学生ID："))
                print("请留下空白不修改某项数据")
                name = input("请输入新姓名（可留空）：")
                dob = input("请输入新出生日期（格式：YYYY-MM-DD，可留空）：")
                gender = input("请输入新性别（M/F，可留空）：")
                update_student(conn, student_id, name if name else None, dob if dob else None,
                               gender if gender else None)

            elif choice == '4':
                # 查询所有学生
                fetch_all_students(conn)

            elif choice == '5':
                # 退出
                close_connection(conn)
                break

            else:
                print("无效操作，请重新选择")
