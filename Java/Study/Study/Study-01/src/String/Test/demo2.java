package String.Test;

public class demo2 {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 56, 7};
        System.out.println(arrToString(arr) + "   " + arrToString(arr).length());
    }

    public static String arrToString(int[] arr) {
        StringBuilder A = new StringBuilder();
        A.append("[");
        for (int i = 0; i < arr.length; i++) {
            if (i == arr.length - 1) {
                A.append(arr[i]);
            } else {
                A.append(arr[i]).append(", ");
            }
        }
        A.append("]");
        return A.toString();
    }
}
