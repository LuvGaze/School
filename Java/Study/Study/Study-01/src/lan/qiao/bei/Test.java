package lan.qiao.bei;

public class Test {
    public static void main(String[] args) {
        String input = "qwe 123";
        // 使用split方法根据空格分割字符串
        String[] parts = input.split(" ");

        // 分离后的结果
        String part1 = parts[0]; // 这里是 "qwe"
        String part2 = parts[1]; // 这里是 "123"

        // 输出结果
        System.out.println("第一部分: " + part1);
        System.out.println("第二部分: " + part2);
    }
}
