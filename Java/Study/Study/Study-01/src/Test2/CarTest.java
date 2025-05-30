package Test2;

import java.util.Scanner;

public class CarTest {
    public static void main(String[] args) {
        Car[] car = new Car[3];

        for (int i = 0; i < 3; i++) {
            Scanner scanner = new Scanner(System.in);

            System.out.printf("请输入第%s辆汽车的品牌:", i + 1);
//            System.out.println();
            String brand = scanner.next();
            System.out.printf("请输入第%s辆汽车的价格:", i + 1);
//            System.out.println();
            double price = scanner.nextDouble();
            System.out.printf("请输入第%s辆汽车的颜色:", i + 1);
//            System.out.println();
            String color = scanner.next();

            Car c = new Car(brand, price, color);
            car[i] = c;
        }
        System.out.println("===================================");
        for (int i = 0; i < 3; i++) {
            System.out.printf("第%s辆汽车的信息为：",i+1);
            System.out.println(car[i].brand + " " + car[i].price + " " + car[i].color);
            System.out.println("===================================");
        }
    }
}
