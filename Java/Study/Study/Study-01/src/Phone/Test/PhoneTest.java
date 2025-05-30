package Phone.Test;

public class PhoneTest {
    public static void main(String[] args) {
        Phone p1 = new Phone();
        p1.brand = "小米";
        p1.price = 1998.98;
        System.out.println(p1.brand);
        System.out.println(p1.price);
        p1.call();
        p1.playGame();

        Phone p2 = new Phone();
        p2.brand = "苹果";
        p2.price = 9998.98;
        System.out.println(p2.brand);
        System.out.println(p2.price);
        p2.call();
        p2.playGame();
    }
}