package T1_ploymorphism;

//  子类
public class Student extends People {
    public String name = "子类Student";

    @Override
    public void run() {
        System.out.println("跑得快");
    }
}
