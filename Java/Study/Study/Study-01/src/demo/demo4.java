package demo;

import java.util.Random;

public class demo4 {


    public static void main(String[] args) {
        int[] arr = {1, 20, 300, 4000, 50000};
        int[] newarr = new int[arr.length];
        Random r = new Random();
        for (int i = 0; i < arr.length; ) {
            int randomIndex = r.nextInt(arr.length);
            int prize = arr[randomIndex];
            if (!contain(newarr, prize)) {
                newarr[i] = prize;
                i++;
            }
        }
        for (int i = 0; i < newarr.length; i++) {
            System.out.println(newarr[i]);
        }
    }

    public static boolean contain(int[] arr, int prize) {
        for (int j : arr) {
            if (j == prize) {
                return true;
            }
        }
        return false;
    }

}
