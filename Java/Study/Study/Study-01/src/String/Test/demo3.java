package String.Test;

import java.util.StringJoiner;

public class demo3 {
    public static void main(String[] args) {
        StringJoiner A = new StringJoiner(", ","[","]");
        A.add("123").add("456");
        System.out.println(A+" "+A.length());
        String str = A.toString();
        System.out.println(str+" "+str.length());
    }
}
