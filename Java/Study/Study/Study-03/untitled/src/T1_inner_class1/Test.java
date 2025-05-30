package T1_inner_class1;

/**
 * 成员内部类
 */

public class Test {
    public static void main(String[] args) {
        Outer.Inner in = new Outer().new Inner();
        in.test();
    }
}
