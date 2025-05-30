package lan.qiao.bei;

import java.util.Scanner;

public class A5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        double p = sc.nextDouble();
        double min =0x3f3f3f3f;
        int m =0;
        for(int k =1;k<=N;++k) {
            if(N%k!=0)continue;
            if(min>= N/k+N*p*k) {
                min = N/k+N*p*k;
                m = k;
            }
        }
        System.out.println(m);
    }
}
