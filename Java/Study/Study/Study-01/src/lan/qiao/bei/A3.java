package lan.qiao.bei;

import java.util.Scanner;

import static java.lang.System.out;

public class A3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        long v[] = new long[n];
        while (sc.hasNext()) {
            String str = sc.next();
            if (str.equals("add")) {
                int t = sc.nextInt();
                ++v[0];
            } else if (str.equals("sync")) {
                int t = sc.nextInt();
                v[t] = v[0] < v[t] + 1 ? v[t] : v[t] + 1;
            } else if (str.equals("query")) {
                out.println(find(v));
            }
        }
        out.flush();
        out.close();
    }

    static long find(long arr[]) {
        long min = 0x3f3f3f3f;
        for (int i = 0; i < arr.length; i++) {
            min = Math.min(min, arr[i]);
        }
        return min;
    }
}
