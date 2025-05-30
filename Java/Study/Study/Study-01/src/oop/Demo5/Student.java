package oop.Demo5;

public class Student {
    static int number = 80;
    static int number2;

    //  静态代码块
    static {
        System.out.println("静态代码块");
        number2 = 10;
    }

    //  实例代码块
    {
        System.out.println("实例代码块");
        System.out.println("创建对象" + this);
    }

    //  无参构造
    public Student() {
        System.out.println("无参构造器");
    }

    //  有参构造
    public Student(String name) {
        System.out.println("有参构造器");
    }
}
