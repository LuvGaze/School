package oop.Demo7;

public class Test {
    public static void main(String[] args) {
        A a = new A();
        B b = new B();

        a.pr1();
        System.out.println("------------");

        System.out.println(b.i);
        System.out.println(b.k);
        System.out.println("------------");

        a.pr1();
        System.out.println("------------");

        b.pr1();
        b.pr3();
    }
}
