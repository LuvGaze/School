package oop.Demo5;

public class Test {
    public static void main(String[] args) {
        System.out.println(Student.number);

        System.out.println(Student.number2);

        System.out.println("---------------------------");

        Student s = new Student();

        System.out.println("---------------------------");
        Student s2 = new Student("123");
    }
}
