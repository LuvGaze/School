package T1_ploymorphism;

public class Teacher extends People {
    public String name = "子类Teacher ";

    @Override
    public void run() {
        System.out.println("老师跑得快");
    }
}
