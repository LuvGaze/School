package T4_abstract;

public abstract class A {
    public static String SchoolName;
    private String name;

    public A() {

    }

    public A(String name) {
        this.name = name;
    }

    // 抽象方法:必须用abstract关键字修饰，只有方法签名，没有方法体
    public abstract void run();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
