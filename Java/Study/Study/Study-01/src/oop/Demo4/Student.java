package oop.Demo4;

public class Student {
    static String schoolName;
    double score;

    public static void pr() {
        System.out.println("1111");
        pr2();
    }

    public static void pr2() {

    }

    public void pr3() {
        schoolName = "莫慧琳";
        pr2();
        System.out.println(score);
    }
}
