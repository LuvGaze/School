package T7_interface;

/**
 * 接口：interface
 * 接口不能创建对象
 * 接口可以用来被类实现，称为实现类
 * 一个类可以实现多个接口(多个父类)，但必须重写全部接口的全部抽象方法，或者将实现类定义成抽象类
 */

public class Test {
    public static void main(String[] args) {
        System.out.println(A.Name);

//        A a = new A();    用接口定义时会报错
        D d = new D();  //  重写类定义可以实现接口，定义成抽象类不能实现接口
    }
}
