package demo;

/**
 * 作者：张国斌
 * 描述：永无BUG
 */
public class demo2 {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int[] copyArr = add(arr, 2, 7);
        extracted(copyArr);
    }

    private static void extracted(int[] copyArr) {
        for (int j : copyArr) {
            System.out.print(j);
        }
    }

    public static int[] add(int[] arr, int from, int to) {
        int[] newArr = new int[to - from];
        int index = 0;
        for (int i = from; i < to; i++) {
            newArr[index] = arr[i];
            index++;

        }
        return newArr;
    }
}
