package T10_interface_jdk8;

public interface A {
    /**
     * 3、静态方法: 必须使用static修饰
     */
    public static void test3() {
        System.out.println("==静态方法==");
    }

    /**
     * 1、默认方法：必须使用defaul修饰，默认会被public修饰
     * 实例方法：对象的方法，必须使用实现类的对象来访问
     */
    default void test1() {
        System.out.println("==默认方法==");
        test2();
    }

    /**
     * 2、私有方法，必须使用private修饰（JDK9才开始支持使用）
     * 私有方法只能在本接口A中使用，在接口Test中无法直接用
     */
    private void test2() {
        System.out.println("==私有方法==");
    }

    void test4();

    void test5();

    default void test6() {

    }
}
