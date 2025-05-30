package demo;

import java.util.Scanner;

public class demo7 {
    public static void main(String[] args) {
        int[][] arr = new int[2][3];
        int[] arr1 = {1, 2};
        int[] arr2 = {4, 5, 6};
        arr[0] = arr1;
        arr[1] = arr2;
        Scanner r = new Scanner(System.in);
        System.out.println(arr[0][1]);
        System.out.println(arr[1]);
    }
}
