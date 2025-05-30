package oop.Demo6;

/**
 * 懒汉式单例对象写法
 * <p>
 * 1.类的构造器私有化
 * 2.定义变量用于储存对象
 * 3.提供类方法，确保返回同一个对象
 */

public class B {
    //  定义类变量
    private static B b;

    //  构造器私有化
    private B() {

    }


    //  定义类方法，保证第一次调用时才会创建对象，以后调用都用同一个对象
    public static B getInstance() {
        if (b == null) {
            System.out.println("首次创建对象");
            b = new B();
            return b;
        }
        System.out.println("已创建对象");
        return b;
    }
}
