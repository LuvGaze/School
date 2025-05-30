package T7_interface;

public interface A {
    //  成员变量(常量)
    String Name = "莫慧琳";

    //  成员方法(抽象方法)
    //  接口中的方法都是抽象方法
    //  public abstract void test();  //  正确，但多余
    void test();                    //  正合适

    //  static {}   //  接口无静态代码
}
