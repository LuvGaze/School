package T11_interface_attention;

interface I {
    void test1();
}

interface J {
    String test1();
}


interface IT {
    default void run() {
        System.out.println("接口IT的run方法");
    }
}

//  1
//interface K extends I, J {
//}

public class Test2 {
    public static void main(String[] args) {
        Zi z = new Zi();
        z.run();

        N n = new N();
        n.test();
    }
}

//  2
//class E implements I, J {
//}

//  3
class Fu {
    public void run() {
        System.out.println("父类的run方法");
    }
}

//  继承和接口同时存在，先写继承，后写接口
class Zi extends Fu implements IT {

}

interface IT1{
default void test(){
    System.out.println("IT1");
}
}

interface IT2{
default void test(){
    System.out.println("IT2");
}
}

class N implements IT1, IT2{
    @Override
    public void test() {
        System.out.println("N");
    }
}