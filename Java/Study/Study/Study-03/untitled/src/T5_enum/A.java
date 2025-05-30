package T5_enum;

/**
 * 1、第一行罗列枚举的名称，为常量
 * 2、枚举的构造器，可以有参数，也可以没有参数，都是私有的，可不写private，所以对外不可创建对象
 * 3、枚举为最终类，不可被继承
 * 4、从第二行开始，可以定义类的其他各种成员
 */

public enum A {
    a, b, c;

    A() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    A(String s) {

    }

    private String name;
}
