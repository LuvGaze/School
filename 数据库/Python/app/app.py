from flask import Flask, render_template, request, redirect, url_for, flash
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # 用于 session 和 flash 消息


# 数据库连接函数
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
            return connection
    except Error as e:
        print(f"连接错误：{e}")
        return None


# 创建学生表
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
    except Error as e:
        print(f"创建表失败：{e}")


# 获取所有学生，修改性别为中文
def fetch_all_students(connection):
    """查询所有学生"""
    cursor = connection.cursor()
    select_query = "SELECT * FROM students"
    cursor.execute(select_query)
    result = cursor.fetchall()

    # 转换性别为中文
    students = []
    for row in result:
        student = list(row)
        student[3] = '男' if student[3] == 'M' else '女'  # 将 M 和 F 转为 "男" 和 "女"
        students.append(student)

    return students



# 插入学生数据
def insert_student(connection, name, dob, gender):
    """插入学生数据并生成学号"""
    # 生成学号，假设学号规则为当前年份 + 自增ID
    current_year = dob.split("-")[0]  # 从出生日期中提取年份

    # 插入学生基本信息（没有学号）
    if gender == '男':
        gender = 'M'
    elif gender == '女':
        gender = 'F'

    cursor = connection.cursor()
    insert_query = """
    INSERT INTO students (name, dob, gender)
    VALUES (%s, %s, %s);
    """
    cursor.execute(insert_query, (name, dob, gender))
    connection.commit()

    # 获取刚插入的学生 ID
    student_id = cursor.lastrowid  # 获取最后插入的学生 ID

    # 生成学号：例如 "20240001"
    student_number = f"{current_year}{student_id:04d}"

    # 更新学生表中的学号字段
    update_query = "UPDATE students SET student_number = %s WHERE student_id = %s"
    cursor.execute(update_query, (student_number, student_id))
    connection.commit()

    print(f"学生 {name} 数据已插入，学号：{student_number}")


# 删除学生数据
def delete_student(connection, student_id):
    """删除学生数据"""
    cursor = connection.cursor()
    delete_query = "DELETE FROM students WHERE student_id = %s"
    cursor.execute(delete_query, (student_id,))
    connection.commit()


# 更新学生数据
def update_student(connection, student_id, name=None, dob=None, gender=None):
    """更新学生数据"""
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


# 首页路由
@app.route('/')
def index():
    conn = create_connection()
    students = fetch_all_students(conn)
    conn.close()
    return render_template('index.html', students=students)


# 添加学生页面路由
@app.route('/add', methods=['GET', 'POST'])
def add_student():
    if request.method == 'POST':
        name = request.form['name']
        dob = request.form['dob']
        gender = request.form['gender']

        conn = create_connection()
        insert_student(conn, name, dob, gender)
        conn.close()
        flash("学生已成功添加", "success")
        return redirect(url_for('index'))

    return render_template('add_student.html')


# 删除学生路由
@app.route('/delete/<int:student_id>', methods=['GET', 'POST'])
def delete(student_id):
    conn = create_connection()
    delete_student(conn, student_id)
    conn.close()
    flash(f"学生 {student_id} 已成功删除", "success")
    return redirect(url_for('index'))


# 修改学生信息路由
@app.route('/edit/<int:student_id>', methods=['GET', 'POST'])
def edit_student(student_id):
    conn = create_connection()

    if request.method == 'POST':
        name = request.form['name']
        dob = request.form['dob']
        gender = request.form['gender']

        update_student(conn, student_id, name, dob, gender)
        conn.close()
        flash(f"学生 {student_id} 信息已成功更新", "success")
        return redirect(url_for('index'))

    cursor = conn.cursor()
    cursor.execute("SELECT * FROM students WHERE student_id = %s", (student_id,))
    student = cursor.fetchone()
    conn.close()

    return render_template('edit_student.html', student=student)


# 运行Flask应用
if __name__ == '__main__':
    app.run(debug=True)
