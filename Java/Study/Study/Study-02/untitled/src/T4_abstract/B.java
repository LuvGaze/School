package T4_abstract;

// 子类继承父类，必须重写父类的抽象方法，或者自己也是抽象类

// 第一种写法    父类方法全部重写
public class B extends A{
    @Override
    public void run() {
    }
}

// 第二种写法    作为抽象类，可以被继承
//public abstract class B extends A {
//
//}
