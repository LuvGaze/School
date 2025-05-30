package T9_interface_demo;

import java.util.ArrayList;

public class StudentOperatorlmpl2 implements StudentOperator {
    @Override
    public void printAllInfo(ArrayList<Student> students) {
        System.out.println("--------------全班全部学生信息如下--------------");
        int count1 = 0;
        int count2 = 0;
        for (int i = 0; i < students.size(); i++) {
            Student student = students.get(i);
            System.out.println("姓名：" + student.getName() + "，性别：" + student.getSex() + "，成绩" + student.getScore());
            if (student.getSex() == '男') {
                count1++;
            } else {
                count2++;
            }
        }
        System.out.println("全班学生中，男学生有：" + count1 + "人，女学生有：" + count2 + "人");
        System.out.println("班级总人数是：" + students.size());
        System.out.println("--------------------------------------------------");
    }

    @Override
    public void printAverageScore(ArrayList<Student> students) {
        double allscore = 0;
        double max = students.get(0).getScore();
        double min = students.get(0).getScore();
        for (int i = 0; i < students.size(); i++) {
            Student student = students.get(i);
            if (student.getScore() > max) {
                max = student.getScore();
            } else if (student.getScore() < min) {
                min = student.getScore();
            }
            allscore += student.getScore();
        }

        System.out.println("全班学生成绩的最高分是：" + max);
        System.out.println("全班学生成绩的最低分是：" + min);
        System.out.println("全班学生成绩的平均分是：" + ((allscore - max - min) / (students.size() - 2)));
    }
}
