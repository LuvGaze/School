package extends_contructor;

class F {
    public F() {
        System.out.println("F()");
    }

    public F(String a, int b) {
        System.out.println("F(String a, int b)");
    }
}

class Z extends F {
    public Z() {
        super("莫慧琳", 20);
        System.out.println("S()");
    }

    public Z(String a) {
        super("莫慧琳", 20);
        System.out.println("S(String a)");
    }
}

public class Test {
    public static void main(String[] args) {
        Z z = new Z();
        Z z2 = new Z("琳琳莫");
    }
}