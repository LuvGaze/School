package extends_override;

public class B extends A {
    @Override
    public void A1() {
        System.out.println("B.A1()");
    }

    @Override
    public void A2(int a, int b) {
        System.out.println("B.A2()");
    }
}
