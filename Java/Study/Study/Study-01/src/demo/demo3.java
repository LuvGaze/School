package demo;

import java.util.Random;

/**
 * 作者：张国斌
 * 描述：永无BUG
 */
public class demo3 {
    public static void main(String[] args) {
        char[] a = new char[52];
        for (int i = 0; i < a.length; i++) {
            if (i <= 25) {
                a[i] = (char) (97 + i);
            } else {
                a[i] = (char) (39 + i);
            }
        }
        Random random = new Random();
        for (int j = 0; j < 10; j++) {
            for (int i = 0; i < 4; i++) {
                int Randoma = random.nextInt(a.length);
                System.out.print(a[Randoma]);
            }
            int Randoma = random.nextInt(10);
            System.out.println(Randoma);
        }

    }
}
