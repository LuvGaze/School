package String.Test;

import java.util.Scanner;

public class demo1 {
    public static void main(String[] args) {
        StringBuilder A = new StringBuilder(getString());
        A.append("qwe");
        String B = A.append(getString()).reverse().toString();
        System.out.println(B + "   " + B.length());

    }

    public static String getString() {
        Scanner sc = new Scanner(System.in);
        System.out.println("输入一个字符串");
        return sc.next();
    }
}
