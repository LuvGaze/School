package T8_interface2;

import T5_abstract2.Animal;
import T5_abstract2.Cat;

interface Driver {
    void drive();
}

interface Singer {
    void sing();
}

public class Test {
    public static void main(String[] args) {
        Driver s = new A();
        s.drive();

        Driver d = new A();
        d.drive();

        Animal a = new Cat();   // 或Dog();
        a.cry();
    }
}

class B implements Driver {
    @Override
    public void drive() {

    }
}

class A extends Student implements Driver, Singer {

    @Override
    public void drive() {

    }

    @Override
    public void sing() {

    }
}

class Student {

}

