package T2_ploymorphism;

//  子类
public class Student extends People {
    public String name = "子类Student";

    @Override
    public void run() {
        System.out.println("学生跑得快");
    }

    public void test() {
        System.out.println("学生考试");
    }
}
