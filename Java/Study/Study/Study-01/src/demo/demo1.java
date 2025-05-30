package demo;

import java.util.Scanner;

/**
 * 作者：张国斌
 * 描述：永无BUG
 */
public class demo1 {
    public static void main(String[] args) {
        Scanner a = new Scanner(System.in);
        float x = a.nextFloat();
        Scanner b = new Scanner(System.in);
        float y = b.nextFloat();
        int z = (int) Sum(x, y);
        System.out.println(z);
    }

    public static float Sum(float a, float b) {
        return a * b;
    }
}
