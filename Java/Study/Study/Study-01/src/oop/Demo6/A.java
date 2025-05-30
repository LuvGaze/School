package oop.Demo6;

public class A {
    private static A a = new A();

    private A() {
        System.out.println("0000");
    }


    //  优先执行
    {
        System.out.println("1111");
    }


    public static A getObject() {
        System.out.println("执行单例对象，避免浪费内存");
        return a;
    }
}
