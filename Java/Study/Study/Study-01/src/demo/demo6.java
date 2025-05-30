package demo;

import java.util.Random;
import java.util.Scanner;

public class demo6 {
    public static void main(String[] args) {
        int[] arr = creatNumber();
        System.out.println("================================================================");
        for (int k : arr) {
            System.out.print(k + " ");
        }
        System.out.println("================================================================");

        int[] userInputArr = userInputNumber();
        int redCount = 0;
        int blueCount = 0;
        for (int i = 0; i < userInputArr.length - 1; i++) {
            int redNumber = userInputArr[i];
            for (int j = 0; j < arr.length - 1; j++) {
                if (redNumber == arr[j]) {
                    redCount++;
                    break;
                } else {

                }
            }
        }
        int blueNumber = userInputArr[userInputArr.length - 1];
        if (blueNumber == arr[arr.length - 1]) {
            blueCount++;
        }
        System.out.print(redCount + " ");
        System.out.println(blueCount);
    }

    public static int[] userInputNumber() {
        int[] arr = new int[7];
        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < 6; ) {
            System.out.println("请输入第" + (i + 1) + "个红球号码");
            int rednumber = sc.nextInt();
            if (rednumber <= 33 && rednumber >= 1) {
                boolean flag = contains(arr, rednumber);
                if (!flag) {
                    arr[i] = rednumber;
                    i++;
                } else {
                    System.out.println("当前红球号码已经存在，请重新输入");
                }
            } else {
                System.out.println("当前红球号码超出范围");
            }
        }
        System.out.println("请输入蓝球号码");
        while (true) {
            int blueNumber = sc.nextInt();
            if (blueNumber >= 1 && blueNumber <= 16) {
                arr[arr.length - 1] = blueNumber;
                break;
            } else {
                System.out.println("当前蓝球号码超出范围");
            }
        }
        return arr;
    }

    public static int[] creatNumber() {
        int[] arr = new int[7];
        Random r = new Random();
        for (int i = 0; i < 6; ) {
            int resNumber = r.nextInt(33) + 1;
            boolean flag = contains(arr, resNumber);
            if (!flag) {
                arr[i] = resNumber;
                i++;
            }
        }
        int blueNumber = r.nextInt(16) + 1;
        arr[arr.length - 1] = blueNumber;
        return arr;
    }

    public static boolean contains(int[] arr, int number) {
        for (int j : arr) {
            if (j == number) {
                return true;
            }
        }
        return false;
    }
}