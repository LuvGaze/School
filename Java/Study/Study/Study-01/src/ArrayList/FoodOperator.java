package ArrayList;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * *菜品上架和浏览
 */
public class FoodOperator {
    private ArrayList<Food> foodList = new ArrayList<>();

    public void addFood() {
        Food food = new Food();
        Scanner sc = new Scanner(System.in);

        System.out.println("输入添加的菜品名称：");
        String name = sc.next();
        food.setName(name);

        System.out.println("输入菜品价格：");
        double price = sc.nextDouble();
        while (price < 0) {
            System.out.println("输入的价格不合理，重新输入：");
            price = sc.nextDouble();
        }
        food.setPrice(price);

        System.out.println("输入菜品描述：");
        String desc = sc.next();
        food.setDesc(desc);

        foodList.add(food);
        System.out.println("菜品<" + name + ">上架成功!");
        start();
    }

    public void showAllFood() {
        if (foodList.size() == 0) {
            System.out.println("无菜品，请先上架");
            start();
        }
        for (int i = 0; i < foodList.size(); i++) {
            Food food = foodList.get(i);
            System.out.println("名称:" + food.getName());
            System.out.println("价格:" + food.getPrice());
            System.out.println("描述:" + food.getDesc());
            System.out.println("-----------------------");
            if (i == foodList.size() - 1) {
                System.out.println("----输入任意内容返回菜单----");
                Scanner sc = new Scanner(System.in);
                if (sc.next() != null) {
                    return;
                }
            }
        }
    }

    public void start() {
        while (true) {
            System.out.println("选择功能:");
            System.out.println("-----------------------");
            System.out.println("1.上架菜品");
            System.out.println("2.展示菜品");
            System.out.println("3.结束任务");
            System.out.println("-----------------------");
            System.out.print("选择操作:");

            Scanner sc = new Scanner(System.in);
            int num = sc.nextInt();
            System.out.println("-----------------------");
            switch (num) {
                case 1:
                    addFood();
                    break;
                case 2:
                    showAllFood();
                    break;
                case 3:
                    System.out.println("任务已结束");
                    return;
                default:
                    System.out.println("输入有误");
            }
        }

    }
}
