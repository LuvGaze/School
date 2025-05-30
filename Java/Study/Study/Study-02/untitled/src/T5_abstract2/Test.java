package T5_abstract2;

/**
 * 父类知道每个子类要做某个行为
 * 但每个子类要做的情况不一样
 * 父类就定义成抽象方法
 * 交给子类去重写实现
 */


public class Test {
    public static void main(String[] args) {
        Animal a = new Cat();
        a.setName("小花");
        a.cry();

        Animal b = new Dog();
        b.setName("大花");
        b.cry();
    }
}
