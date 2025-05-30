package Game;

import java.util.Random;

public class GameTest {
    public static void main(String[] args) {
        Role r1 = new Role("乔峰", 100, '男');
        Role r2 = new Role("鸠摩智", 100, '男');

        Random r = new Random();
        int F = r.nextInt(2);

        r1.showRoleInfo();
        System.out.println("=================");
        r2.showRoleInfo();
        System.out.println("=================");
        while (true) {
            if (F == 1) {
                r1.attack(r2);
                if (r2.getBlood() == 0) {
                    System.out.println("===========================");
                    System.out.println("=======" + r1.getName() + "K.O了" + r2.getName() + "=======");
                    System.out.println("===========================");
                    System.out.println("乔峰先攻击");
                    System.out.println("===========================");
                    break;
                }
                r2.attack(r1);
                if (r1.getBlood() == 0) {
                    System.out.println("===========================");
                    System.out.println("=======" + r2.getName() + "K.O了" + r1.getName() + "=======");
                    System.out.println("===========================");
                    System.out.println("乔峰先攻击");
                    System.out.println("===========================");
                    break;
                }
            } else {
                r2.attack(r1);
                if (r1.getBlood() == 0) {
                    System.out.println("===========================");
                    System.out.println("=======" + r2.getName() + "K.O了" + r1.getName() + "=======");
                    System.out.println("===========================");
                    System.out.println("鸠摩智先攻击");
                    System.out.println("===========================");
                    break;

                }
                r1.attack(r2);
                if (r2.getBlood() == 0) {
                    System.out.println("===========================");
                    System.out.println("=======" + r1.getName() + "K.O了" + r2.getName() + "=======");
                    System.out.println("===========================");
                    System.out.println("鸠摩智先攻击");
                    System.out.println("===========================");
                    break;
                }
            }
        }
    }
}