package Test2;

public class GoodTest {
    public static void main(String[] args) {
        Goods[] arr = new Goods[3];

        Goods g1 = new Goods("001","华为P40",5999.0,100);
        Goods g2 = new Goods("002","小米K70",2399.0,200);
        Goods g3 = new Goods("002","荣耀P90",3099.0,50);

        arr[0] = g1;
        arr[1] = g2;
        arr[2] = g3;

        for (int i = 0; i < arr.length; i++) {
            Goods goods = arr[i];
            System.out.println(goods.getId()+","+goods.getName()+","+goods.getPrice()+","+goods.getCount());
        }
    }
}
