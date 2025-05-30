package ArrayList;

import java.util.ArrayList;

public class demo1 {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<>();

        //添加
        list.add("永远最可爱的");
        list.add("莫慧琳");
        list.add("我爱你");
        list.add("永远");
        list.add("永远");
        list.add("爱你");
        System.out.println(list);
        //长度
        System.out.println(list.size());

        //删除
        list.remove("永远");
        System.out.println(list);
        System.out.println(list.size());

        list.add(2, "永远永远");
        System.out.println(list);
        System.out.println(list.size());

        String a = list.get(2);
        System.out.println(a);

        //替换
        list.set(2, "永远");
        System.out.println(list);

        for (int i = list.size() - 1; i >= 0; i--) {
            String str = list.get(i);
            if (str.contains("永远")) {
                list.remove(str);
            }
        }
        System.out.println("--------------------------");
        System.out.println(list);
    }
}
