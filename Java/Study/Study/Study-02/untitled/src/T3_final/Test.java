package T3_final;

/**
 * 最终类不可被继承
 * 最终方法不能被重写
 * 变量只能被赋值一次
 */

/**
 * final修饰变量：
 * 修饰基本类型变量，数据不能被改变
 * 修饰引用类型变量，地址不能被改变，但地址指向对象的内容可以改变
 */


public class Test {
    public static final String Student_name = "name";

    private final String Student_age = "age";   //  这种用法无意义

    public static void main(String[] args) {
        //  final修饰变量，有且仅能赋值一次
        /*
            变量：
            一，局部变量
            二，成员变量
                1、静态变量
                2、实例变量
         */
        final double pi = 3.14;

        Test t = new Test();
//        t.name = "张三";    //测试19行代码

    }

    public static void buy(final double z) {

    }
}

//  final修饰类，类不可被继承
final class A {
}
// class B extends A{}

//  final修饰方法，方法不可被重写
class C {
    public final void test() {

    }
}

class D extends C {
//    @Override
//    public void test() {
//
//    }
}