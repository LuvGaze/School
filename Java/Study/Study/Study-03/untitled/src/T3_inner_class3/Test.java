package T3_inner_class3;

/**
 * 匿名内部类
 * Animal a = new Animal(){
 *  @Override public void eat(){
 *  }
 * }
 */

public class Test {
    public static void main(String[] args) {
//        Animal a = new Cat();
//        a.eat();

        // 1、把匿名内部类编译为子类，创建子类对象
        Animal animal = new Animal() {
            @Override
            public void eat() {
                System.out.println("猫吃鱼");
            }
        };
        animal.eat();
    }
}

//class Cat extends Animal {
//    @Override
//    public void eat() {
//        System.out.println("猫吃鱼");
//    }
//}

abstract class Animal {
    public abstract void eat();
}
