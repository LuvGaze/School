package oop.Demo6;

public class Test1 {
    public static void main(String[] args) {
//        AA();
        BB();
    }

    public static void AA() {
        A a1 = A.getObject();
        A a2 = A.getObject();

        System.out.println("--------------");

        System.out.println(a1);
        System.out.println(a2);
    }

    public static void BB() {
        B.getInstance();
        B.getInstance();
        B.getInstance();
    }
}
