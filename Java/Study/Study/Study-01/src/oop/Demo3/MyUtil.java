package oop.Demo3;

import java.util.Random;

public class MyUtil {
    private MyUtil() {

    }

    public static String creatCode(int n) {
        String code = "";
        String data = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789";

        Random r = new Random();
        for (int i = 0; i < n; i++) {
            int index = r.nextInt(data.length());
            code += data.charAt(index);
        }
        return code;
    }
}
