package T5_enum;

/**
 * 枚举的使用
 */

public class Test {
    public static void main(String[] args) {
        A s1 = A.a;
        A s2 = A.b;
        A s3 = A.c;

        //  枚举的位置
        System.out.println(s1.ordinal());
        System.out.println(s2.ordinal());
        System.out.println(s3.ordinal());
    }
}
