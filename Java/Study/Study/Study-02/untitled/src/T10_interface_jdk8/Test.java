package T10_interface_jdk8;

/**
 * jdk8开始，接口中新增的方法：
 * 1、默认方法：使用default修饰，可以有方法体
 * 2、静态方法：使用static修饰，不许用当前接口名调用
 * 3、私有方法：使用private修饰，只能被当前接口中的其他方法调用
 */

public class Test {
    public static void main(String[] args) {
        B b = new B();
        b.test1();
//        b.test2();

        A.test3();
    }
}
