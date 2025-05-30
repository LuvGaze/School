package T11_interface_attention;

interface A {
    void test1();
}

interface B {
    void test2();
}

interface C {
}

// 接口多继承    多个接口合成一个接口
interface D extends A, B, C {
}

/**
 * 注意事项：
 * 1、一个接口继承多个接口，若多个接口中存在方法签名冲突，则此时不支持多继承
 * 2、一个类可以实现多个接口，若多个接口中存在方法签名冲突，则此时不支持多实现，必须重写冲突的方法
 * 3、一个类继承了父类，又同时实现了接口，父类中和接口中又同名的默认方法，实现类会优先用父类的
 * 4、一个类实现了多个接口，多个接口中存在同名的默认方法，可以不冲突，这个类需要重写该方法
 */

public class Test {
    public static void main(String[] args) {
    }
}

//  D --> A, B, C
class E implements D {
    @Override
    public void test1() {

    }

    @Override
    public void test2() {

    }
}