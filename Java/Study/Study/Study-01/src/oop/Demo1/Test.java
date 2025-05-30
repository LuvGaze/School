package oop.Demo1;

public class Test {
    public static void main(String[] args) {
        Student.name = "莫慧琳";

        Student s1 = new Student();
        s1.name = "琳琳莫";

        Student s2 = new Student();
        s2.name = "张国斌";

        System.out.println(s1.name);
        System.out.println(s2.name);
        System.out.println(Student.name);

        s1.age = 20;
        s2.age=21;
        System.out.println(s1.age);
        System.out.println(s2.age);
    }
}
