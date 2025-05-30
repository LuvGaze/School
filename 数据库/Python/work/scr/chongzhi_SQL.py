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
            auth_plugin='mysql_native_password'
        )
        if connection.is_connected():
            print("成功连接到数据库")
        return connection
    except Error as e:
        print(f"连接错误：{e}")
        return None


def reset_database(connection):
    """重置数据库：删除所有表并重新创建"""
    try:
        cursor = connection.cursor()

        # 删除所有表
        cursor.execute("DROP TABLE IF EXISTS students;")
        print("学生表已删除")

        # 重新创建学生表
        create_table_query = """
        CREATE TABLE students (
            student_id INT AUTO_INCREMENT PRIMARY KEY,
            student_number VARCHAR(20) UNIQUE,
            name VARCHAR(100),
            dob DATE,
            age INT,
            gender ENUM('M', 'F'),
            major VARCHAR(100),
            class_name VARCHAR(100)
        );
        """
        cursor.execute(create_table_query)
        connection.commit()
        print("学生表已重新创建")
    except Error as e:
        print(f"重置数据库失败：{e}")


def close_connection(connection):
    """关闭数据库连接"""
    if connection.is_connected():
        connection.close()
        print("数据库连接已关闭")


# 主程序
if __name__ == "__main__":
    conn = create_connection()
    if conn:
        reset_database(conn)  # 重置数据库
        close_connection(conn)
