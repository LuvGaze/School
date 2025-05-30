package T9_interface_demo;

import java.util.ArrayList;

public class ClassManager {
    private ArrayList<Student> students = new ArrayList<>();
    private StudentOperator studentOperator = new StudentOperatorlmpl2();

    public ClassManager() {
        students.add(new Student("莫慧琳", '女', 100));
        students.add(new Student("琳琳莫", '女', 96));
        students.add(new Student("张国斌", '男', 99));
        students.add(new Student("斌国张", '男', 90));
    }

    //  打印全班全部学生的信息
    public void printInfo() {
        studentOperator.printAllInfo(students);
    }

    //  打印全班全部学生的平均分
    public void printScore() {
        studentOperator.printAverageScore(students);
    }
}
