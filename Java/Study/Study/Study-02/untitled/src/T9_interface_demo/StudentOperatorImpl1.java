package T9_interface_demo;

import java.util.ArrayList;

public class StudentOperatorImpl1 implements StudentOperator {
    @Override
    public void printAllInfo(ArrayList<Student> students) {
        System.out.println("--------------全班全部学生信息如下--------------");
        for (int i = 0; i < students.size(); i++) {
            Student student = students.get(i);
            System.out.println("姓名：" + student.getName() + "，性别：" + student.getSex() + "，成绩" + student.getScore());
        }
        System.out.println("--------------------------------------------------");
    }

    @Override
    public void printAverageScore(ArrayList<Student> students) {
        double allscore = 0;
        for (int i = 0; i < students.size(); i++) {
            Student student = students.get(i);
            allscore += student.getScore();
        }
        System.out.println("全班学生平均成绩为：" + allscore / students.size());
    }
}
